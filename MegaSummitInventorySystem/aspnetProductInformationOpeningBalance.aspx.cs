using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MegaSummitInventorySystem
{
    public partial class aspnetProductInformationOpeningBalance : System.Web.UI.Page
    {
        private DatabaseDataContext Database = new DatabaseDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (!string.IsNullOrEmpty(Request["productID"]))
                {
                    this.LoadData(long.Parse(Request["productID"]));
                }
            }
        }

        private void LoadData(long productID)
        {
            var data = Database._OpeningBalanceSelect(0, productID);
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


        public string ProductDetail()
        {
            try
            {
                Database = new DatabaseDataContext();
                var data = Database._ProductSelect(0,string.Empty).ToList();


                

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
                //return auto;

            }
            catch (Exception)
            {

            }

            return null;
        }

    }
}