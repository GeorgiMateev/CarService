using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace CarService.WebApp.Models.Car
{
    public class CarModel
    {
        #region Car properties
        public Guid Id { get; set; }

        [Required]
        [Display(Name = "Registration number")]
        public string RegistrationNumber { get; set; }

        [Required]
        [Display(Name = "Frame number")]
        public string FrameNumber { get; set; }

        [Required]
        [Display(Name = "Engine number")]
        public string EngineNumber { get; set; }

        [Display(Name = "Brand")]
        public string Brand { get; set; }

        [Display(Name = "Model")]
        public string Model { get; set; }

        [DataType(DataType.DateTime)]
        [Display(Name = "Production year")]
        public System.DateTime ProductionYear { get; set; }

        [Display(Name = "Owner name")]
        public string OwnerName { get; set; }

        [DataType(DataType.PhoneNumber)]
        [Display(Name = "Owner number")]
        public int OwnerNumber { get; set; }
        #endregion
    }
}