using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MegaSummitInventorySystem
{
    public partial class aspnetSupplierInformation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public string SupplierSingleData()
        {
            try
            {
                return "=" + SupplierVM.GetSingleSupplier(long.Parse(Request["supplierID"]));
            }
            catch
            {
                return "";
            }
        }

    }
}