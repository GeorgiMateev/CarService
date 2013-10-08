using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using CarService.DataAccessLayer.EntityModel;
using CarService.WebApp.Models.Car;
using CarService.WebApp.Models.Parts;

namespace CarService.WebApp.Models.Repairs
{
    public class RepairCardModel
    {
        public RepairCardModel()
        {
            this.SpareParts = new List<PartModel>();
        }

        #region Repair card properties
        [Display(Name="Repair card Id")]
        public Guid Id { get; set; } 
       
        public System.DateTime AcceptedDate { get; set; }
        public System.DateTime FinishedDate { get; set; }

        [Display(Name="Description")]
        public string Description { get; set; }

        public Guid MechanicId { get; set; }

        [Display(Name = "Price of all used parts")]        
        public int SparePartsPrice { get; set; }

        [Display(Name="The total repair price")]
        public int RepairPrice { get; set; }

        public System.Guid UserId { get; set; }

        [Display(Name="Completed")]
        public bool Completed { get; set; }
        #endregion

        public CarModel Car { get; set; }

        #region Additional properties
        [Required]
        [Display(Name="Mechanic in charge")]
        public IEnumerable<Mechanic> Mechanics { get; set; }

        [Display(Name = "Spare parts")]
        public IList<PartModel> SpareParts { get; set; }
        #endregion
    }
}