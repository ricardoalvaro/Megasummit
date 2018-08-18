using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MegaSummitInventorySystem
{
    public partial class aspnetCustomerInformation : System.Web.UI.Page
    {
       

        protected void Page_Load(object sender, EventArgs e)
        {

        
        }

        public string CustomerSingleData()
        {
            try
            {
                return "=" + CustomerVM.GetSingleCustomer(long.Parse(Request["customerID"]));
            }
            catch
            {
                return "";
            }
        }

    
    }
}