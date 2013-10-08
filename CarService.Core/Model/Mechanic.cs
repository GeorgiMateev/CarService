using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CarService.Core.Model
{
    public class Mechanic : IContentItem
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

        public string FirstName { get; set; }
        public string LastName { get; set; }
    }
}
