using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace CarService.WebApp.Models.Home
{
    public class SearchModel
    {
        [Display(Name = "Frame number")]
        public string FrameNumber { get; set; }

        [Display(Name = "Registration number")]
        public string RegistrationNumber { get; set; }
    }
}