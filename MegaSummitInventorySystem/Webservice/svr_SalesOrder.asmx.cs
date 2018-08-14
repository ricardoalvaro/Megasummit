using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Newtonsoft.Json;


namespace MegaSummitInventorySystem.Webservice
{
    /// <summary>
    /// Summary description for svr_SalesOrder
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
     [System.Web.Script.Services.ScriptService]
    public class svr_SalesOrder : System.Web.Services.WebService
    {
        private DatabaseDataContext Database = new DatabaseDataContext();

        [WebMethod]
        public List<AutoCompleteData> AutoCompleteProduct()
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

                return auto;

            }
            catch (Exception)
            {

            }

            return null;
        }

        [WebMethod]
        public List<AutoCompleteData> AutoCompleteLocation()
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

                return auto;

            }
            catch (Exception)
            {

            }

            return null;
        }

        [WebMethod]
        public List<AutoCompleteData> OrderRefAutocom()
        {
            try
            {
                Database = new DatabaseDataContext();
                var data = Database._SalesOrderRefAutocom().ToList();


                List<AutoCompleteData> auto = new List<AutoCompleteData>();
                foreach (var item in data)
                {
                    auto.Add(new AutoCompleteData(item.ID, item.refNumber, item.refNumber));
                }

                return auto;

            }
            catch (Exception)
            {

            }

            return null;
        }

        [WebMethod]
        public bool InsertSalesOrder(long customer_id, string address, long delivery_to_id, long salesman_id, string po_no, long term_id, string ref_no, string ref_no_serial, DateTime created_date, DateTime cancel_date, string notes, decimal total_amount, decimal total_served, decimal balance, string productList, string orderStatus)
        {
            try
            {
                long? id = 0;
                Database = new DatabaseDataContext();
                Database._SalesOrderInsert(ref id, customer_id, address, delivery_to_id, salesman_id, po_no, term_id, ref_no, ref_no_serial, created_date, cancel_date, notes, total_amount, total_served, balance, orderStatus);

                var data = Database._Settings.SingleOrDefault(x => x.ID == 2);
                if (data.Automatic.Value)
                {
                    Database._SettingRefNoUpdate(data.ID, data.LatestNo.Value + 1);
                }

                string[] lines = productList.Split('^');

                foreach (var l in lines)
                {
                    if (!string.IsNullOrEmpty(l))
                    {
                        string[] p = l.Split(',');

                        string productCode = p[0];
                        string locationCode = p[1];

                        var product = Database._Products.SingleOrDefault(x => x.ProductName == productCode);
                        var location = Database._Locations.SingleOrDefault(x => x.LocationName == locationCode);

                        decimal qty = decimal.Parse(p[2]);
                        decimal price = decimal.Parse(p[5]);
                        string discount = p[6];
                        decimal amount = decimal.Parse(p[7]);

                        long? refID = 0;
                        Database._SalesOrderDetailsInsert(ref refID, id, product.ID, location.ID, qty, 0, product.UnitID, price, discount, amount);
                    }
                }

                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }

        [WebMethod]
        public bool UpdateSalesOrder(long id, long customer_id, string address, long delivery_to_id, long salesman_id, string po_no, long term_id, string ref_no, string ref_no_serial, DateTime created_date, DateTime cancel_date, string notes, decimal total_amount, decimal total_served, decimal balance, string productList, string orderStatus)
        {
            try
            {

                Database = new DatabaseDataContext();
                Database._SalesOrderUpdate(id, customer_id, address, delivery_to_id, salesman_id, po_no, term_id, ref_no, ref_no_serial, created_date, cancel_date, notes, total_amount, total_served, balance, orderStatus);
                Database._SalesOrderDetailsDeletebyOrder(id);
                string[] lines = productList.Split('^');

                foreach (var l in lines)
                {
                    if (!string.IsNullOrEmpty(l))
                    {
                        string[] p = l.Split(',');

                        string productCode = p[0];
                        string locationCode = p[1];

                        var product = Database._Products.SingleOrDefault(x => x.ProductName == productCode);
                        var location = Database._Locations.SingleOrDefault(x => x.LocationName == locationCode);

                        decimal qty = decimal.Parse(p[3]);
                        decimal price = decimal.Parse(p[5]);
                        string discount = p[6];
                        decimal amount = decimal.Parse(p[7]);

                        long? refID = 0;
                        Database._SalesOrderDetailsInsert(ref refID, id, product.ID, location.ID, qty, 0, product.UnitID, price, discount, amount);
                    }
                }

                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }

        [WebMethod]
        public bool DeleteSalesOrder(long id)
        {
            try
            {
                Database = new DatabaseDataContext();
                Database._SalesOrderDelete(id);
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }

        [WebMethod]
        public string SelectReferenceNo(long id, string prefix_initial, string description, int lastest, int nextno, int maximum)
        {
            try
            {

                Database = new DatabaseDataContext();
                var data = Database._SalesSettingSelect(id, 0, prefix_initial, description, lastest, nextno, maximum);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data";
        }

        [WebMethod]
        public string SelectEmployee(long id, string employeeName, string employeeType)
        {
            try
            {

                Database = new DatabaseDataContext();
                var data = Database._EmployeeSalesSelect(id, employeeName, employeeType);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data";
        }

        [WebMethod]
        public int SelectMaximumLines(long id)
        {
            try
            {

                Database = new DatabaseDataContext();
                var data = Database._SalesSettings.Where(x => x.ID == id);
                foreach (var item in data)
                {
                    return item.MaximumLine.Value;
                }
            }
            catch
            {
                return 0;
            }

            return 0;
        }

        [WebMethod]
        public string SelectProductDetails(long id)
        {
            try
            {

                Database = new DatabaseDataContext();
                var data = Database._ProductSalesSelect(id);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data";
        }

        [WebMethod]
        public string SelectSetting(long id, string setting_name)
        {
            try
            {

                Database = new DatabaseDataContext();
                var data = Database._SettingSelect(id, 0, setting_name, string.Empty, string.Empty, false, 0, 0);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data";
        }

        [WebMethod]
        public string SalesOrderSelect(long id)
        {

            try
            {
                Database = new DatabaseDataContext();
                var data = Database._SalesOrderSelect(id);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data 4";

        }

        [WebMethod]
        public string SalesOrderDetailsSelect(long id)
        {

            try
            {
                Database = new DatabaseDataContext();
                var data = Database._SalesOrderDetailsSelect(id);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data 5";

        }

    }
}
