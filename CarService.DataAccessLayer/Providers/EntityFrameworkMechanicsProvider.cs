using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using CarService.Core.Mappings;
using CarService.Core.Providers;
using CarService.DataAccessLayer.EntityModel;
using Model = CarService.Core.Model;

namespace CarService.DataAccessLayer.Providers
{
    class EntityFrameworkMechanicsProvider : MechanicsProviderBase
    {
        #region Initialization
        public override void Initialize(string name, NameValueCollection config)
        {
            base.Initialize(name, config);

            MappingManager.Instance.AddMapping<CarService.Core.Model.Mechanic, Mechanic>();
            MappingManager.Instance.AddMapping<Mechanic, CarService.Core.Model.Mechanic>();
        }
        #endregion

        #region
        public override Model.Mechanic Get(Guid id)
        {
            using (var dbContext = new CarServiceEntities())
            {
                var result = dbContext.Mechanics.Where(x => x.Id == id).SingleOrDefault();
                var mapped = MappingManager.Instance.Map<Mechanic, Model.Mechanic>(result);
                mapped.ProviderName = EntityFrameworkMechanicsProvider.ProviderName;
                return mapped;
            }
        }

        public override IEnumerable<Model.Mechanic> Get()
        {
            using (var dbContext = new CarServiceEntities())
            {
                var result = dbContext.Mechanics.ToList<Mechanic>();                             

                var mapped = MappingManager.Instance.Map<IEnumerable<Mechanic>, IEnumerable<Model.Mechanic>>(result);
                mapped.All(m => { m.ProviderName = EntityFrameworkMechanicsProvider.ProviderName; return true; });

                return mapped;
            }
        }

        public override void Add(Model.Mechanic item)
        {
            if (item == null) return;

            if (Guid.Equals(item.Id, Guid.Empty))
            {
                item.Id = Guid.NewGuid();
            }

            var mapped = MappingManager.Instance.Map<Model.Mechanic, Mechanic>(item);
            using (var dbContext = new CarServiceEntities())
            {
                dbContext.Mechanics.Add(mapped);

                dbContext.SaveChanges();
            }
        }

        public override void Delete(Guid id)
        {
            using (var dbContext = new CarServiceEntities())
            {
                var mechanic = dbContext.Mechanics.FirstOrDefault(m => m.Id == id);
                dbContext.Mechanics.Remove(mechanic);

                dbContext.SaveChanges();
            }
        }

        public override void Update(Model.Mechanic item)
        {
            if (item == null) return;

            var mapped = MappingManager.Instance.Map<Model.Mechanic, Mechanic>(item);
            using (var dbContext = new CarServiceEntities())
            {
                var entry = dbContext.Entry(mapped);
                entry.State = System.Data.EntityState.Modified;

                dbContext.SaveChanges();
            }
        }
        #endregion
        
        public const string ProviderName = "EntityFrameworkMechanicsProvider";
    }
}
