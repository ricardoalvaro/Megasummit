using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MegaSummitInventorySystem
{
    public partial class aspnetCustomerSales : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private DatabaseDataContext Database = new DatabaseDataContext();

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
        
        public string AutoCompleteBank()
        {
            try
            {
                Database = new DatabaseDataContext();
                var data = Database._Banks.ToList();


                List<AutoCompleteData> auto = new List<AutoCompleteData>();
                foreach (var item in data)
                {
                    auto.Add(new AutoCompleteData(item.ID, item.BankName, item.BankName));
                }


                return JsonConvert.SerializeObject(auto, Newtonsoft.Json.Formatting.Indented);
                //return auto;

            }
            catch (Exception)
            {

            }

            return null;
        }


        // 

        public string InvoicePaymentSelectTotalAmountAll()
        {
            try
            {
                Database = new DatabaseDataContext();
                var data = Database._InvoicePaymentSelectTotalAmountAll().ToList();


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