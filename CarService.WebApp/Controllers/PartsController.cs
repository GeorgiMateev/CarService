using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CarService.DataAccessLayer.EntityModel;
using CarService.DataAccessLayer.Managers;
using CarService.WebApp.Models;
using CarService.WebApp.Models.Parts;

namespace CarService.WebApp.Controllers
{
    [Authorize(Roles = "Administrator")]
    public class PartsController : Controller
    {
        //
        // GET: /Parts/

        public ActionResult Index(int page = 1)
        {

            var model = new PagingModel(SparePartsManager.GetInstance().Count());
            model.ItemsOnPage = 15;
            model.PageNumber = page;
            model.PageContent = SparePartsManager.GetInstance().GetAll<PartModel>().Skip(model.SkippedNumber).Take(model.ItemsOnPage);

            return View(model);
        }

        //
        // GET: /Parts/Details/5

        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /Parts/Create

        public ActionResult Create()
        {
            var model = new PartModel();

            return View(model);
        }

        //
        // POST: /Parts/Create

        [HttpPost]
        public ActionResult Create(PartModel model)
        {
            try
            {
                var part = new SparePart();
                part.Name = model.Name;
                part.Price = model.Price;
                part.Active = model.Active;

                SparePartsManager.GetInstance().AddSparePart(part);

                return RedirectToAction("Index");
            }
            catch
            {
                return View(model);
            }
        }

        //
        // GET: /Parts/Edit/5

        public ActionResult Edit(int id)
        {
            var model = SparePartsManager.GetInstance().GetPartById<PartModel>(id);

            return View(model);
        }

        //
        // POST: /Parts/Edit/5

        [HttpPost]
        public ActionResult Edit(PartModel model)
        {
            try
            {
                var part = SparePartsManager.GetInstance().GetPartById(model.Id);
                part.Name = model.Name;
                part.Price = model.Price;
                part.Active = model.Active;

                SparePartsManager.GetInstance().Edit(part);
                return RedirectToAction("Index");
            }
            catch
            {
                return View(model);
            }
        }

        //
        // GET: /Parts/Delete/5

        public ActionResult Delete(int id)
        {
            return View();
        }

        //
        // POST: /Parts/Delete/5

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
