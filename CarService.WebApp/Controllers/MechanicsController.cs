using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CarService.Core.Managers;
using CarService.Core.Mappings;
using CarService.DataAccessLayer.EntityModel;
using CarService.WebApp.Models;
using CarService.WebApp.Models.Mechanics;

namespace CarService.WebApp.Controllers
{
    [Authorize(Roles = "Administrator")]
    public class MechanicsController : Controller
    {
        //
        // GET: /Mechanics/

        public ActionResult Index(int page = 1)
        {
            var items = MechanicsManager.GetManager().Get();
            var mapped = MappingManager.Instance.Map<IEnumerable<Core.Model.Mechanic>, IEnumerable<MechanicModel>>(items);

            var model = new PagingModel(items.Count());
            model.ItemsOnPage = 15;
            model.PageNumber = page;
            model.PageContent = mapped.Skip(model.SkippedNumber).Take(model.ItemsOnPage);

            return View(model);
        }

        //
        // GET: /Mechanics/Details/5

        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /Mechanics/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /Mechanics/Create

        [HttpPost]
        public ActionResult Create(MechanicModel model)
        {
            try
            {
                var mechanic = new Core.Model.Mechanic();
                mechanic.FirstName = model.FirstName;
                mechanic.LastName = model.LastName;

                MechanicsManager.GetManager().Add(mechanic);

                return RedirectToAction("Index");
            }
            catch
            {
                return View(model);
            }
        }

        //
        // GET: /Mechanics/Edit/5

        public ActionResult Edit(Guid id)
        {
            var item = MechanicsManager.GetManager().Get(id);

            var model = MappingManager.Instance.Map<Core.Model.Mechanic, MechanicModel>(item);

            return View(model);
        }

        //
        // POST: /Mechanics/Edit/5

        [HttpPost]
        public ActionResult Edit(MechanicModel model)
        {
            try
            {
                var part = MechanicsManager.GetManager().Get(model.Id);
                part.FirstName = model.FirstName;
                part.LastName = model.LastName;

                MechanicsManager.GetManager().Update(part);

                return RedirectToAction("Index");
            }
            catch
            {
                return View(model);
            }
        }

        //
        // GET: /Mechanics/Delete/5

        public ActionResult Delete(int id)
        {
            return View();
        }

        //
        // POST: /Mechanics/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
