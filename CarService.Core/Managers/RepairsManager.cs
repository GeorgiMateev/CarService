using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web.Configuration;
using CarService.Core.Configuration;
using CarService.Core.Data;
using CarService.Core.Model;
using CarService.Core.Providers;

namespace CarService.Core.Managers
{
    public class RepairsManager : ContentManagerBase<RepairsProviderBase, RepairCard>
    {
        #region Construction
        protected RepairsManager()
            : base()
        {
        }

        protected RepairsManager(string providerName)
            : base(providerName)
        {
        }

        public static RepairsManager GetManager()
        {
            return new RepairsManager();
        }

        public static RepairsManager GetManager(string providerName)
        {
            return new RepairsManager(providerName);
        }
        #endregion

        protected override void Initialize()
        {
            var configuration =
                (RepairsProviderConfiguration)ConfigurationManager.GetSection("repairs");

            if (configuration == null)
                throw new ConfigurationErrorsException
                ("RepairsProviderConfiguration configuration section is not set correctly.");

            this.Initialize(configuration.Default);
        }

        protected override void Initialize(string providerName)
        {
            var configuration =
                (RepairsProviderConfiguration)ConfigurationManager.GetSection("repairs");

            if (configuration == null)
                throw new ConfigurationErrorsException
                ("RepairsProviderConfiguration configuration section is not set correctly.");

            RepairsManager.Providers = new RepairsProviderCollection();

            ProvidersHelper.InstantiateProviders(configuration.Providers, RepairsManager.Providers, typeof(RepairsProviderBase));

            RepairsManager.Providers.SetReadOnly();

            RepairsManager.DefaultProvider = RepairsManager.Providers[configuration.Default];
            this.Provider = RepairsManager.Providers[providerName];

            if (RepairsManager.DefaultProvider == null)
                throw new Exception("defaultProvider");
        }

        public IEnumerable<Car> GetCars()
        {
            return this.Provider.GetCars();
        }

        public void AddCar(Car car)
        {
            this.Provider.AddCar(car);
        }
    }
}
