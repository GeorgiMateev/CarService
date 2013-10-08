using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using CarService.DataAccessLayer.AbstractModels;

namespace CarService.WebApp.Models.Parts
{
    public class PartModel : ISparePart
    {
        [Display(Name = "Id")]
        public Guid Id { get; set; }

        [Display(Name = "Name")]
        [Required]
        public string Name { get; set; }

        [Display(Name = "Price")]
        [Range(typeof(int), "1", "10000000", ErrorMessage = "The value must be between 1 and 100 000")]
        public int Price { get; set; }

        [Display(Name = "Available")]
        public bool Active { get; set; }

        [Display(Name="Select")]
        public bool IsSelected { get; set; }
    }
}