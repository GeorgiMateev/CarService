using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;

namespace CarService.Core.Configuration
{
    class MechanicsProviderConfiguration : ProviderConfiguration
    {
        [ConfigurationProperty("default", DefaultValue="EntityFrameworkMechanicsProvider")]
        public override string Default
        {
            get
            {
                return (string)base["default"];
            }
            set
            {
                base["default"] = value; 
            }
        }        
    }
}
