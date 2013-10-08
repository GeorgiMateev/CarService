using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CarService.DataAccessLayer.AbstractModels;
using CarService.DataAccessLayer.EntityModel;

namespace CarService.DataAccessLayer.Managers
{
    /// <summary>
    /// This class provides all the functionality needed to manage spare parts in the database
    /// </summary>
    public class SparePartsManager
    {
        #region Singleton construction
        private SparePartsManager()
        {
        }

        /// <summary>
        /// Gets the repair cards manager manager
        /// </summary>
        /// <returns>Singleton instance</returns>
        public static SparePartsManager GetInstance()
        {
            if (SparePartsManager.instance == null)
            {
                SparePartsManager.instance = new SparePartsManager();
            }

            return SparePartsManager.instance;
        }

        private static SparePartsManager instance;
        #endregion

        #region Public methods
        public SparePart GetPartById(Guid id)
        {
            using (var dbContext = new CarServiceEntities())
            {
                var result = from part in dbContext.SpareParts
                             where part.Id.Equals(id)
                             select part;

                var selectedPart = result.SingleOrDefault();

                return selectedPart;
            }
        }

        public T GetPartById<T>(int id) where T : ISparePart, new()
        {
            using (var dbContext = new CarServiceEntities())
            {
                var result = from part in dbContext.SpareParts
                             where part.Id.Equals(id)
                             select new T()
                             {
                                 Id = part.Id,
                                 Name = part.Name,
                                 Price = part.Price,
                                 Active = part.Active
                             };

                return result.FirstOrDefault();
            }
        }

        /// <summary>
        /// Adds spare part to the database
        /// </summary>
        /// <param name="part"></param>
        public void AddSparePart(SparePart part)
        {
            using (var dbContext = new CarServiceEntities())
            {
                dbContext.SpareParts.Add(part);

                dbContext.SaveChanges();
            }
        }

        /// <summary>
        /// Removes spare part from the database
        /// </summary>
        /// <param name="part"></param>
        public void RemoveSparePart(SparePart part)
        {
            using (var dbContext = new CarServiceEntities())
            {
                dbContext.SpareParts.Remove(part);

                dbContext.SaveChanges();
            }
        }

       /// <summary>
       /// Changes the name of a selected part
       /// </summary>
       /// <param name="id">Id of the part</param>
       /// <param name="newPrice">The new name</param>
       /// <returns>Changed part</returns>
        public SparePart ChangeName(Guid id, string newName)
        {
            using (var dbContext = new CarServiceEntities())
            {
                var selectedPart = SparePartsManager.GetInstance().GetPartById(id);
                selectedPart.Name = newName;

                dbContext.SaveChanges();

                return selectedPart;
            }
        }

        /// <summary>
        /// Changes the price of a selected part
        /// </summary>
        /// <param name="id">Id of the part</param>
        /// <param name="newName">The new price</param>
        /// <returns>Changed part</returns>
        public SparePart ChangePrice(Guid id, int newPrice)
        {
            using (var dbContext = new CarServiceEntities())
            {
                var selectedPart = SparePartsManager.GetInstance().GetPartById(id);
                selectedPart.Price = newPrice;

                dbContext.SaveChanges();

                return selectedPart;
            }
        }

        /// <summary>
        /// Edits part by given already edited
        /// </summary>
        /// <param name="edited"></param>
        /// <returns></returns>
        public void Edit(SparePart edited)
        {
            using (var dbContext = new CarServiceEntities())
            {
                var entry = dbContext.Entry<SparePart>(edited);
                entry.State = System.Data.EntityState.Modified;

                dbContext.SaveChanges();
            }
        }

        /// <summary>
        /// Deactivates the part so it cannot be used in repairs
        /// </summary>
        /// <param name="id"></param>
        public void Deactivate(Guid id)
        {
            using (var dbContext = new CarServiceEntities())
            {
                var selectedPart = SparePartsManager.GetInstance().GetPartById(id);
                selectedPart.Active = false;

                dbContext.SaveChanges();
            }
        }

        /// <summary>
        /// Gets the spare parts count
        /// </summary>
        public int Count()
        {
            using (var dbContext = new CarServiceEntities())
            {
                return dbContext.SpareParts.Count();                
            }
        }

        /// <summary>
        /// Gets all spare parts
        /// </summary>
        /// <returns></returns>
        public IEnumerable<T> GetAll<T>() where T: ISparePart, new ()
        {
            using (var dbContext = new CarServiceEntities())
            {
                var result = from part in dbContext.SpareParts
                             select new T()
                             {
                                 Id = part.Id,
                                 Name = part.Name,
                                 Price = part.Price,
                                 Active = part.Active
                             };

                return result.ToList();
            }
        }

        /// <summary>
        /// Gets all active spare parts
        /// </summary>
        /// <returns></returns>
        public IList<T> GetAllActive<T>() where T : ISparePart, new()
        {
            using (var dbContext = new CarServiceEntities())
            {
                var result = from part in dbContext.SpareParts
                             where part.Active == true
                             select new T()
                             {
                                 Id = part.Id,
                                 Name = part.Name,
                                 Price = part.Price,
                                 Active = part.Active
                             };

                return result.ToList();
            }
        }

        #endregion
    }
}
