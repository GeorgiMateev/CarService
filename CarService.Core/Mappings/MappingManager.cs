using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using AutoMapper;

namespace CarService.Core.Mappings
{
    public class MappingManager
    {
        #region Construction
        private MappingManager()
        {
            this.mappings = new HashSet<string>();
        }

        public static MappingManager Instance
        {
            get
            {
                if (MappingManager.instance == null)
                {
                    MappingManager.instance = new MappingManager();
                }

                return MappingManager.instance;
            }
        }

        private static MappingManager instance;
        #endregion

        #region Properties
        public HashSet<string> Mappings
        {
            get { return this.mappings; }
            set { this.mappings = value; }
        }
        #endregion

        #region Methods
        public bool AddMapping<TSource, TDestination>()
        {
            var key = typeof(TSource).FullName + typeof(TDestination).FullName;

            if (this.mappings.Contains(key)) return false;	        

            Mapper.CreateMap<TSource, TDestination>();
            this.mappings.Add(key);
            return true;
        }

        public TDestiantion Map<TSource, TDestiantion>(TSource source)
        {
            return Mapper.Map<TSource, TDestiantion>(source);
        }
        #endregion

        #region PrivateFields
        private HashSet<string> mappings;        
        #endregion
    }
}
