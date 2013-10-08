using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CarService.WebApp.Models
{
    public class PagingModel
    {
        public PagingModel(int itemsCount)
        {
            this.ItemsCount = itemsCount;
            this.ItemsOnPage = itemsCount;
        }

        /// <summary>
        /// Gets or sets the number of all items
        /// </summary>
        public int ItemsCount { get; set; }

        /// <summary>
        /// Gets the number of all pages
        /// </summary>
        public int PagesCount
        {
            get
            {
                return (int)Math.Ceiling((double)(this.ItemsCount /(double)this.ItemsOnPage));
            }
        }

        /// <summary>
        /// Gets or sets the number of items on one page
        /// </summary>
        public int ItemsOnPage { get; set; }

        /// <summary>
        /// Gets or sets the current page number
        /// </summary>
        public int PageNumber { get; set; }

        /// <summary>
        /// Gets the number of skipped items
        /// </summary>
        public int SkippedNumber
        {
            get { return (this.PageNumber - 1) * this.ItemsOnPage; }
        }

        /// <summary>
        /// Gets or sets the items on page
        /// </summary>
        public IEnumerable PageContent { get; set; }
    }
}