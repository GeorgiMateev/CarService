using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CarService.DataAccessLayer.AbstractModels
{
    public interface ISparePart
    {
        Guid Id { get; set; }
        string Name { get; set; }
        int Price { get; set; }
        bool Active { get; set; }
    }
}
