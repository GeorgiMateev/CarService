using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CarService.Core.Data;
using CarService.Core.Model;

namespace CarService.Core.Providers
{
    public abstract class RepairsProviderBase : ContentProviderBase<RepairCard>
    {
        public abstract Car GetCar(Guid id);

        public abstract IEnumerable<Car> GetCars();

        public abstract void AddCar(Car item);

        public abstract void DeleteCar(Guid id);

        public abstract void UpdateCar(Car item);
    }
}
