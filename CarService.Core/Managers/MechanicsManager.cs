using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Web.Configuration;
using CarService.Core.Configuration;
using CarService.Core.Data;
using CarService.Core.Model;
using CarService.Core.Providers;

namespace CarService.Core.Managers
{
    public class MechanicsManager : ContentManagerBase<MechanicsProviderBase, Mechanic>
    {
        #region Construction
        protected MechanicsManager()
            : base()
        {

        }

        protected MechanicsManager(string providerName)
            : base(providerName)
        {

        }

        public static MechanicsManager GetManager()
        {
            return new MechanicsManager();
        }

        public static MechanicsManager GetManager(string providerName)
        {
            return new MechanicsManager(providerName);
        }
        #endregion

        protected override void Initialize()
        {
            MechanicsProviderConfiguration configuration =
                (MechanicsProviderConfiguration)ConfigurationManager.GetSection("mechanics");

            if (configuration == null)
                throw new ConfigurationErrorsException
                ("MechanicsProviderConfiguration configuration section is not set correctly.");

            this.Initialize(configuration.Default);
        }

        protected override void Initialize(string providerName)
        {
            MechanicsProviderConfiguration configuration =
                (MechanicsProviderConfiguration)ConfigurationManager.GetSection("mechanics");

            if (configuration == null)
                throw new ConfigurationErrorsException
                ("MechanicsProviderConfiguration configuration section is not set correctly.");

            MechanicsManager.Providers = new MechanicsProviderCollection();

            ProvidersHelper.InstantiateProviders(configuration.Providers, MechanicsManager.Providers, typeof(MechanicsProviderBase));

            MechanicsManager.Providers.SetReadOnly();

            MechanicsManager.DefaultProvider = MechanicsManager.Providers[configuration.Default];
            this.Provider = MechanicsManager.Providers[providerName];

            if (MechanicsManager.DefaultProvider == null)
                throw new Exception("defaultProvider");
        }
    }
}
