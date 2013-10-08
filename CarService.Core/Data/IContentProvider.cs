using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CarService.Core.Model;

namespace CarService.Core.Data
{    
    public interface IContentProvider<TContentItem>
        where TContentItem : IContentItem
    {
        TContentItem Get(Guid id);
        IEnumerable<TContentItem> Get();
        void Add(TContentItem item);
        void Delete(Guid id);
        void Update(TContentItem item);
    }
}
