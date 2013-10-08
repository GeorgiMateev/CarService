using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CarService.WebApp.Models;
using System.Web.Security;
using CarService.WebApp.Models.Users;

namespace CarService.WebApp.Controllers
{

    [Authorize(Roles="Administrator")]
    public class UsersController : Controller
    {
        //
        // GET: /Users/

        public ActionResult Index(int page = 1)
        {
            int usersCount;
            var users = Membership.GetAllUsers(page-1, UsersController.ItemsOnPage, out usersCount);

            var model = new PagingModel(usersCount);
            model.ItemsOnPage = UsersController.ItemsOnPage;
            model.PageNumber = page;
            model.PageContent = users;

            return View(model);
        }

        //
        // GET: /Users/Details/5

        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /Users/Create

        public ActionResult Create()
        {
            var model = new UserModel();
            model.Roles = Roles.GetAllRoles();
            return View(model);
        }

        //
        // POST: /Users/Create

        [HttpPost]
        public ActionResult Create(UserModel model)
        {
            try
            {
                // Attempt to register the user
                MembershipCreateStatus createStatus;
                Membership.CreateUser(model.Username, model.Password, model.Email, passwordQuestion: null, passwordAnswer: null, isApproved: true, providerUserKey: null, status: out createStatus);

                if (createStatus == MembershipCreateStatus.Success)
                {
                    Roles.AddUserToRole(model.Username, model.Role);
                }                

                return RedirectToAction("Index", "Users");
            }
            catch
            {
                return View(model);
            }
        }

        //
        // GET: /Users/Edit/5

        public ActionResult Edit(string username)
        {
            var user = Membership.GetUser(username);
            if (user == null)
            {
                RedirectToAction("Index", "Users");
            }

            var model = new UserModel();
            model.Username = user.UserName;
            model.Email = user.Email;
            model.Role = Roles.GetRolesForUser(user.UserName)[0];
            model.Roles = Roles.GetAllRoles();

            return View(model);
        }

        //
        // POST: /Users/Edit/5

        [HttpPost]
        public ActionResult Edit(UserModel model)
        {
            try
            {
                var user = Membership.GetUser(model.Username);
                if (user == null)
                {
                    RedirectToAction("Index", "Users");
                }

                user.Email = model.Email;
                
                Membership.UpdateUser(user);
                
                var role = Roles.GetRolesForUser(user.UserName)[0];

                if (role != model.Role)
                {
                    Roles.RemoveUserFromRole(user.UserName, role);
                    Roles.AddUserToRole(user.UserName, model.Role);
                }

                return RedirectToAction("Index");
            }
            catch
            {
                model.Roles = Roles.GetAllRoles();
                return View(model);
            }
        }

        //
        // GET: /Users/Delete/5

        public ActionResult Delete(int id)
        {
            return View();
        }

        //
        // POST: /Users/Delete/5

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

        #region Prtivate fields and constants
        private const int ItemsOnPage = 15;
        #endregion
    }
}
