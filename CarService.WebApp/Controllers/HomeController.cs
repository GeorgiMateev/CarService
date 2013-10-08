using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CarService.Core.Managers;
using CarService.Core.Mappings;
using CarService.DataAccessLayer.EntityModel;
using CarService.DataAccessLayer.Managers;
using CarService.WebApp.Models;
using CarService.WebApp.Models.Home;
using CarService.WebApp.Models.Repairs;
using Model = CarService.Core.Model;

namespace CarService.WebApp.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            ViewBag.Message = "Car service management system.";

            var model = new SearchModel();

            return View(model);
        }

        [HttpPost]
        public ActionResult Search(SearchModel model)
        {
            try
            {
                IEnumerable<Model.RepairCard> cards = null;
                if (!string.IsNullOrEmpty(model.RegistrationNumber))
                {
                    cards = RepairsManager.GetManager().Get()
                        .Where(x => x.Car.RegistrationNumber.Contains(model.RegistrationNumber));
                    
                }
                if (!string.IsNullOrEmpty(model.FrameNumber))
                {
                    cards =  RepairsManager.GetManager().Get()
                        .Where(x => x.Car.FrameNumber.Contains(model.FrameNumber));
                }

                var cardsModel = MappingManager.Instance.Map<IEnumerable<Model.RepairCard>, IEnumerable<RepairCardModel>>(cards);

                var pageModel = new PagingModel(cardsModel.Count());
                pageModel.ItemsOnPage = 15;
                pageModel.PageNumber = 1;
                pageModel.PageContent = cardsModel;

                return View("~/Views/Repairs/Index.cshtml", pageModel);
            }
            catch (Exception ex)
            {
                return View(model);
            }
        }
    }
}
