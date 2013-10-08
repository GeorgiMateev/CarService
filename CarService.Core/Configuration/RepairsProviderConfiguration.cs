using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;

namespace CarService.Core.Configuration
{
    public class RepairsProviderConfiguration : ProviderConfiguration
    {
        [ConfigurationProperty("default", DefaultValue = "EntityFrameworkRepairsProvider")]
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
