using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MegaSummitInventorySystem
{
    public partial class aspnetCustomer : System.Web.UI.Page
    {
        private DatabaseDataContext Database = new DatabaseDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {

        
        }


        public string SelectRegion()
        {
            try
            {
                Database = new DatabaseDataContext();
                var data = Database._RegionSelect(0, "");

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data";
        }
    }
}