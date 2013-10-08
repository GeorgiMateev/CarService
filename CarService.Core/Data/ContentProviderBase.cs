using System;
using System.Collections.Generic;
using System.Configuration.Provider;
using System.Linq;
using CarService.Core.Model;

namespace CarService.Core.Data
{
    public abstract class ContentProviderBase<TContentItem> : ProviderBase, IContentProvider<TContentItem>
        where TContentItem : IContentItem
    { 
        #region IContentProvider implementation
        public abstract TContentItem Get(Guid id);

        public abstract IEnumerable<TContentItem> Get();

        public abstract void Add(TContentItem item);

        public abstract void Delete(Guid id);

        public abstract void Update(TContentItem item);
        #endregion
    }
}
