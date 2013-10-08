using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CarService.Core.Data
{
    public abstract class ManagerBase<TProviderBase>
    {
        #region Construction
        protected ManagerBase()
        {
            this.Initialize();
        }

        protected ManagerBase(string providerName)
        {
            this.Initialize(providerName);
        }
        #endregion

        #region Abstract methods
        protected abstract void Initialize();

        protected abstract void Initialize(string providerName);
        #endregion
    }
}
