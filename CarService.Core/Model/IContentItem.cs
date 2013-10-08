using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CarService.Core.Model
{
    public interface IContentItem
    {
        Guid Id { get; set; }
        string ProviderName { get; set;}
    }
}
