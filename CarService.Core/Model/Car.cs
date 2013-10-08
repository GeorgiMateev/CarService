using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CarService.Core.Model
{
    public class Car : IContentItem
    {
        public Guid Id
        {
            get;
            set;
        }

        public string ProviderName
        {
            get;
            set;
        }

        public string RegistrationNumber { get; set; }
        public string FrameNumber { get; set; }
        public string EngineNumber { get; set; }
        public string Brand { get; set; }
        public string Model { get; set; }
        public System.DateTime ProductionYear { get; set; }
        public string OwnerName { get; set; }
        public int OwnerNumber { get; set; }
    }
}
