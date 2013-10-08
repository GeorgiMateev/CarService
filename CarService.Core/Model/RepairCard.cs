using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CarService.Core.Model
{
    public class RepairCard : IContentItem
    {
        #region Construction
        public RepairCard()
        {
            this.spareParts = new HashSet<SparePart>();
        }
        #endregion

        #region Properties
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

        public DateTime AcceptedDate { get; set; }
        public DateTime FinishedDate { get; set; }
        public string Description { get; set; }
        public int SparePartsPrice { get; private set; }
        public int RepairPrice { get; set; }
        public Guid UserId { get; set; }
        public bool Completed { get; set; }

        public Car Car { get; set; }
        public Mechanic Mechanic { get; set; }
        public ICollection<SparePart> SpareParts {
            get
            {
                return this.spareParts;
            }
            set
            {
                foreach (var item in value)
                {
                    this.SparePartsPrice += item.Price;
                }

                this.spareParts = value;
            }
        }
        #endregion

        #region Methods
        public void AddSparePart(SparePart part)
        {
            this.SpareParts.Add(part);
            this.SparePartsPrice += part.Price;
        }
        #endregion

        #region Private fields and constants
        private ICollection<SparePart> spareParts;
        #endregion
    }
}
