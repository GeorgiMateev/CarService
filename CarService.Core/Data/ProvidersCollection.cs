using System;
using System.Collections.Generic;
using System.Configuration.Provider;
using System.Linq;
using System.Text;
using CarService.Core.Model;

namespace CarService.Core.Data
{
    public class ProvidersCollection<TProvider, TContentItem> : ProviderCollection
        where TProvider : ContentProviderBase<TContentItem>
        where TContentItem : IContentItem
    {
        // Return an instance of TProvider
        // for a specified provider name
        new public TProvider this[string name]
        {
            get
            {
                return (TProvider)base[name];
            }
        }
    }
}
