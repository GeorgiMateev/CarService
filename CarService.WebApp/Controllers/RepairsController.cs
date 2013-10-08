using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using System.Web.Security;
using CarService.Core.Managers;
using CarService.Core.Mappings;
using CarService.DataAccessLayer.EntityModel;
using CarService.DataAccessLayer.Managers;
using CarService.WebApp.Models;
using CarService.WebApp.Models.Car;
using CarService.WebApp.Models.Parts;
using CarService.WebApp.Models.Repairs;
using Core = CarService.Core;

namespace CarService.WebApp.Controllers
{
    [Authorize]
    public class RepairsController : Controller
    {
        //
        // GET: /Repairs/
        
        public ActionResult Index(string status = "Personal", int page = 1)
        {
            PagingModel model = null;

            var repairCards = RepairsManager.GetManager().Get();

            switch (status)
            {
                case "All":
                    model = new PagingModel(repairCards.Count());
                    model.ItemsOnPage = RepairsController.ItemsOnPage;
                    model.PageNumber = page;
                    model.PageContent = repairCards.Skip(model.SkippedNumber).Take(model.ItemsOnPage);
                    ViewBag.Status = "All";
                    break;
                case "InProgress":
                    model = new PagingModel(repairCards.Where(c => !c.Completed).Count());
                    model.ItemsOnPage = RepairsController.ItemsOnPage;
                    model.PageNumber = page;
                    model.PageContent = repairCards.Where(x => !x.Completed).Skip(model.SkippedNumber).Take(model.ItemsOnPage);
                    ViewBag.Status = "InProgress";
                    break;
                case "Completed":
                    model = new PagingModel(repairCards.Where(c => c.Completed).Count());
                    model.ItemsOnPage = RepairsController.ItemsOnPage;
                    model.PageNumber = page;
                    model.PageContent = repairCards.Where(x => x.Completed).Skip(model.SkippedNumber).Take(model.ItemsOnPage);
                    ViewBag.Status = "Completed";
                    break;
                case "Personal":
                    var userGUID = (Guid)Membership.GetUser(User.Identity.Name).ProviderUserKey;
                    var items = repairCards.Where(x => x.UserId.Equals(userGUID));
                    model = new PagingModel(items.Count());
                    model.ItemsOnPage = RepairsController.ItemsOnPage;
                    model.PageNumber = page;
                    model.PageContent = items.Skip(model.SkippedNumber).Take(model.ItemsOnPage);
                    ViewBag.Status = "Personal";
                    break;
                default:
                    break;
            }           
            
            return View(model);
        }        

        //
        // GET: /Repairs/Create

        public ActionResult Create()
        {
            var model = new RepairCardModel();
            IEnumerable<Core.Model.Mechanic> mechanics = Core.Managers.MechanicsManager.GetManager().Get();
            model.Mechanics = MappingManager.Instance.Map<IEnumerable<Core.Model.Mechanic>, IEnumerable<Mechanic>>(mechanics);

            return View(model);
        }

        //
        // POST: /Repairs/Create

        [HttpPost]
        public ActionResult Create(RepairCardModel repairCardModel)
        {
            try
            {
                if (Core.Managers.RepairsManager.GetManager().GetCars().Any(c => c.RegistrationNumber == repairCardModel.Car.RegistrationNumber))
                {
                    ModelState.AddModelError("", "Car with this registration number already exist.");
                    return View(repairCardModel);
                }
                if (Core.Managers.RepairsManager.GetManager().GetCars().Any(c => c.FrameNumber == repairCardModel.Car.FrameNumber))
                {
                    ModelState.AddModelError("", "Car with this frame number already exist.");
                    return View(repairCardModel);
                }

                // TODO: Add insert logic here
                //var car = MappingManager.Instance.Map<CarModel, Core.Model.Car>(repairCardModel.Car);
                var repairCard = MappingManager.Instance.Map<RepairCardModel, Core.Model.RepairCard>(repairCardModel);                

                var currentUserId = (Guid)Membership.GetUser(User.Identity.Name).ProviderUserKey;
                if (currentUserId == null)
                {
                    throw new InvalidOperationException("Invalid user");
                }

                repairCard.UserId = currentUserId;

                RepairsManager.GetManager().Add(repairCard);

                return RedirectToAction("Index", "Repairs");
            }
            catch(Exception ex)
            {
                HandleErrorInfo error = new HandleErrorInfo(ex, "Repairs", "Create");
                return View("Error", error);
            }
        }

        //
        // GET: /Repairs/Edit/5

        public ActionResult Edit(Guid id)
        {
            var repairCard = RepairsManager.GetManager().Get().Where(x => x.Id == id).SingleOrDefault();
            var model = MappingManager.Instance.Map<Core.Model.RepairCard, RepairCardModel>(repairCard);
            var userGUID = (Guid)Membership.GetUser(User.Identity.Name).ProviderUserKey;
            if (model == null || (!model.UserId.Equals(userGUID) && !Roles.IsUserInRole(User.Identity.Name, "Administrator")))
            {
                return RedirectToAction("Index", "Repairs");
            }

            var mechanics = Core.Managers.MechanicsManager.GetManager().Get();
            model.Mechanics = MappingManager.Instance.Map<IEnumerable<Core.Model.Mechanic>, IEnumerable<Mechanic>>(mechanics);

            model.SpareParts = SparePartsManager.GetInstance().GetAllActive<PartModel>();

            using (var dbContext = new CarServiceEntities())
            {
                var parts = dbContext.RepairCards.Find(model.RepairCardId).SpareParts;

                for (int i = 0; i < model.SpareParts.Count; i++ )
                {
                    if (parts.Any(x => x.Id == model.SpareParts[i].Id))
                    {
                        model.SpareParts[i].IsSelected = true;
                    }
                }
            }            

            return View(model);
        }

        //
        // POST: /Repairs/Edit/5

        [HttpPost]
        public ActionResult Edit(RepairCardModel repairCardModel)
        {
            try
            {
                var originalData = RepairsManager.GetManager().Get()
                    .Where(x => x.Id == repairCardModel.RepairCardId).SingleOrDefault();
                
                var userGUID = (Guid)Membership.GetUser(User.Identity.Name).ProviderUserKey;

                if (originalData == null || (!originalData.UserId.Equals(userGUID) && !Roles.IsUserInRole(User.Identity.Name, "Administrator")))
                {
                    return RedirectToAction("Index", "Repairs");
                }

                var editedRepairCard = MappingManager.Instance.Map<RepairCardModel, Core.Model.RepairCard>(repairCardModel);
                
                var originalRepairCard = RepairsManager.GetManager().Get(repairCardModel.RepairCardId);

                if (!originalRepairCard.Completed && editedRepairCard.Completed)
                {
                    editedRepairCard.Completed = repairCardModel.Completed;
                    editedRepairCard.FinishedDate = DateTime.Now;
                }                    

                if (repairCardModel.RepairPrice < editedRepairCard.SparePartsPrice)
                {
                    ModelState.AddModelError("", "The repair cost must be greater than the price of all used parts.");
                    return View(repairCardModel);
                }

                RepairsManager.GetManager().Update(editedRepairCard);
                

                return RedirectToAction("Index", "Repairs");
            }
            catch(Exception e)
            {
                return View(repairCardModel);
            }
        }

        #region Prtivate fields and constants
        private const int ItemsOnPage = 15;
        #endregion
    }
}
