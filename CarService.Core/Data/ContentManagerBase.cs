using System;
using System.Collections.Generic;
using System.Configuration.Provider;
using System.Linq;
using System.Text;
using CarService.Core.Model;

namespace CarService.Core.Data
{
    public abstract class ContentManagerBase<TContentProviderBase, TContentItem> : ManagerBase<TContentProviderBase>, IContentProvider<TContentItem>
        where TContentProviderBase : ContentProviderBase<TContentItem>
        where TContentItem : IContentItem
    {
        #region Construction
        protected ContentManagerBase()
            : base()
        {
        }

        protected ContentManagerBase(string providerName)
            : base(providerName)
        {
        }
        #endregion

        #region Properties
        public TContentProviderBase Provider { get; protected set; }

        public static TContentProviderBase DefaultProvider { get; protected set; }

        public static ProvidersCollection<TContentProviderBase, TContentItem> Providers { get; protected set; }
        #endregion

        #region IContentManager implementation
        public virtual TContentItem Get(Guid id)
        {
            return this.Provider.Get(id);
        }

        public virtual IEnumerable<TContentItem> Get()
        {
            return this.Provider.Get();
        }

        public virtual void Add(TContentItem item)
        {
            this.Provider.Add(item);
        }

        public virtual void Delete(Guid id)
        {
            this.Provider.Delete(id);
        }

        public virtual void Update(TContentItem item)
        {
            this.Provider.Update(item);
        }
        #endregion
    }
}
