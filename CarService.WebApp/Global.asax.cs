using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;
using CarService.Core.Mappings;
using CarService.WebApp.Models.Car;
using CarService.WebApp.Models.Mechanics;
using CarService.WebApp.Models.Parts;
using CarService.WebApp.Models.Repairs;

namespace CarService.WebApp
{
    // Note: For instructions on enabling IIS6 or IIS7 classic mode, 
    // visit http://go.microsoft.com/?LinkId=9394801

    public class MvcApplication : System.Web.HttpApplication
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }

        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapHttpRoute(
                name: "DefaultApi",
                routeTemplate: "api/{controller}/{id}",
                defaults: new { id = RouteParameter.Optional }
            );

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
            );
        }

        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();

            RegisterGlobalFilters(GlobalFilters.Filters);
            RegisterRoutes(RouteTable.Routes);

            BundleTable.Bundles.RegisterTemplateBundles();

            MappingManager.Instance.AddMapping<Core.Model.Mechanic, MechanicModel>();

            MappingManager.Instance.AddMapping<Core.Model.Car, CarModel>();
            MappingManager.Instance.AddMapping<CarModel, Core.Model.Car>();

            MappingManager.Instance.AddMapping<Core.Model.RepairCard, RepairCardModel>();
            MappingManager.Instance.AddMapping<RepairCardModel, Core.Model.RepairCard>();

            MappingManager.Instance.AddMapping<Core.Model.SparePart, PartModel>();
            MappingManager.Instance.AddMapping<PartModel, Core.Model.SparePart>();
        }
    }
}