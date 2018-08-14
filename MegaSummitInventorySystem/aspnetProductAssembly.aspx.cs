using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MegaSummitInventorySystem
{
    public partial class aspnetProductAssembly1 : System.Web.UI.Page
    {

        private DatabaseDataContext Database = new DatabaseDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                LoadData();
            }
        }

        private void LoadData()
        {
            var data = Database._ProductAssemblySelect(0);
            repList.DataSource = data;
            repList.DataBind();
        }

        public string AutoCompleteProduct()
        {
            try
            {
                Database = new DatabaseDataContext();
                var data = Database._Products.ToList();


                List<AutoCompleteData> auto = new List<AutoCompleteData>();
                foreach (var item in data)
                {
                    auto.Add(new AutoCompleteData(item.ID, item.ProductName, item.ProductName));
                }


                return JsonConvert.SerializeObject(auto, Newtonsoft.Json.Formatting.Indented);
                //return auto;

            }
            catch (Exception)
            {

            }

            return null;
        }

        public string AutoCompleteLocation()
        {
            try
            {
                Database = new DatabaseDataContext();
                var data = Database._Locations.ToList();


                List<AutoCompleteData> auto = new List<AutoCompleteData>();
                foreach (var item in data)
                {
                    auto.Add(new AutoCompleteData(item.ID, item.LocationName, item.LocationName));
                }

                return JsonConvert.SerializeObject(auto, Newtonsoft.Json.Formatting.Indented);
                //return auto;

            }
            catch (Exception)
            {

            }

            return null;
        }
    }
}