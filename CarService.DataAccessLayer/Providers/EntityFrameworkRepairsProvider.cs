using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Text;
using CarService.Core.Mappings;
using CarService.Core.Providers;
using CarService.DataAccessLayer.EntityModel;

namespace CarService.DataAccessLayer.Providers
{
    public class EntityFrameworkRepairsProvider : RepairsProviderBase
    {
        #region Initialization
        public override void Initialize(string name, NameValueCollection config)
        {
            base.Initialize(name, config);

            MappingManager.Instance.AddMapping<CarService.Core.Model.Car, Car>();
            MappingManager.Instance.AddMapping<Car, CarService.Core.Model.Car>();

            MappingManager.Instance.AddMapping<CarService.Core.Model.RepairCard, RepairCard>();
            MappingManager.Instance.AddMapping<RepairCard, CarService.Core.Model.RepairCard>();
        }
        #endregion

        #region Car methods
        public override Core.Model.Car GetCar(Guid id)
        {
            using (var dbContext = new CarServiceEntities())
            {
                var entity = dbContext.Cars.Where(x => x.Id == id).FirstOrDefault();
                var mapped = MappingManager.Instance.Map<Car, Core.Model.Car>(entity);
                return mapped;
            }
        }

        public override IEnumerable<Core.Model.Car> GetCars()
        {
            using (var context = new CarServiceEntities())
            {
                var cars = context.Cars.ToList();
                return MappingManager.Instance.Map<IEnumerable<Car>, IEnumerable<Core.Model.Car>>(cars);
            }
        }

        public override void AddCar(Core.Model.Car item)
        {
            using (var dbContext = new CarServiceEntities())
            {
                var entity = MappingManager.Instance.Map<Core.Model.Car, Car>(item);
                dbContext.Cars.Add(entity);

                dbContext.SaveChanges();
            }
        }

        public override void DeleteCar(Guid id)
        {
            throw new NotImplementedException();
        }

        public override void UpdateCar(Core.Model.Car item)
        {
            using (var dbContext = new CarServiceEntities())
            {
                var entity = MappingManager.Instance.Map<Core.Model.Car, Car>(item);
                var entry = dbContext.Entry<Car>(entity);
                entry.State = System.Data.EntityState.Modified;

                dbContext.SaveChanges();
            }
        }
        #endregion

        #region RepairCard methods
        public override Core.Model.RepairCard Get(Guid id)
        {
            using (var dbContext = new CarServiceEntities())
            {
                var entity = dbContext.RepairCards.Where(x => x.Id == id).FirstOrDefault();
                return MappingManager.Instance.Map<RepairCard, Core.Model.RepairCard>(entity);
            }
        }

        public override IEnumerable<Core.Model.RepairCard> Get()
        {
            using (var dbContext = new CarServiceEntities())
            {
                var entities = dbContext.RepairCards.OrderBy(x => x.Id);
                return MappingManager.Instance.Map<IEnumerable<RepairCard>, IEnumerable<Core.Model.RepairCard>>(entities);
            }
        }

        public override void Add(Core.Model.RepairCard item)
        {
            using (var dbContext = new CarServiceEntities())
            {
                var entity = MappingManager.Instance.Map<Core.Model.RepairCard, RepairCard>(item);
                var addedCard = dbContext.RepairCards.Add(entity);

                dbContext.SaveChanges();
            }
        }

        public override void Delete(Guid id)
        {
            throw new NotImplementedException();
        }

        public override void Update(Core.Model.RepairCard item)
        {
            using (var dbContext = new CarServiceEntities())
            {
                var entity = MappingManager.Instance.Map<Core.Model.RepairCard, RepairCard>(item);
                var entry = dbContext.Entry<RepairCard>(entity);
                entry.State = System.Data.EntityState.Modified;

                dbContext.SaveChanges();
            }
        }
        #endregion
    }
}
