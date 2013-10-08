using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CarService.Core.Model
{
    public class SparePart : IContentItem
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

        public string Name { get; set; }
        public int Price { get; set; }
        public bool Active { get; set; }
    }
}
