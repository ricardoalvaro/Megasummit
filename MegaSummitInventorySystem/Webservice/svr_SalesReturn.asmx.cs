using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Newtonsoft.Json;


namespace MegaSummitInventorySystem.Webservice
{
    /// <summary>
    /// Summary description for svr_SalesReturn
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class svr_SalesReturn : System.Web.Services.WebService
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
        public bool InsertSalesReturn(long customer_id, string address, long delivery_to_id, long salesman_id, string po_no, long term_id, string ref_no, string ref_no_serial, DateTime created_date, string notes, decimal total_amount, decimal apply_to_invoice_amount, decimal balance, string productList, string salesInvoice)
        {
            try
            {
                long? id = 0;
                Database = new DatabaseDataContext();
                Database._SalesReturnInsert(ref id, customer_id, address, delivery_to_id, salesman_id, po_no, term_id, ref_no, ref_no_serial, created_date, notes, total_amount, apply_to_invoice_amount, balance);
                var data = Database._Settings.SingleOrDefault(x => x.ID == 1);
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
                        decimal price = decimal.Parse(p[4]);
                        string discount = p[5];
                        decimal amount = decimal.Parse(p[6]);

                        long? refID = 0;
                        Database._SalesReturnDetailsInsert(ref refID, id, product.ID, location.ID, qty, product.UnitID, price, discount, amount);

                        #region Increase Stocks
                        Database._ProductStockUpdate(product.ID, location.ID, qty);
                        #endregion

                    }
                }

                #region Apply to Invoice
                string[] lines2 = salesInvoice.Split('^');

                foreach (var l in lines2)
                {
                    if (!string.IsNullOrEmpty(l))
                    {
                        string[] p = l.Split(',');
                        Database._InvoiceReturnUpdate(long.Parse(p[1]), decimal.Parse(p[0]));
                    }
                }
                #endregion


                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }

        [WebMethod]
        public bool UpdateSalesReturn(long id, long customer_id, string address, long delivery_to_id, long salesman_id, string po_no, long term_id, string ref_no, string ref_no_serial, DateTime created_date, string notes, decimal total_amount, decimal apply_to_invoice_amount, decimal balance, string productList, string salesInvoice)
        {
            try
            {
                Database = new DatabaseDataContext();
                Database._SalesReturnUpdate(id, customer_id, address, delivery_to_id, salesman_id, po_no, term_id, ref_no, ref_no_serial, created_date, notes, total_amount, apply_to_invoice_amount, balance);
                Database._SalesReturnDetailsDeletebyReturn(id);
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
                        decimal price = decimal.Parse(p[4]);
                        string discount = p[5];
                        decimal amount = decimal.Parse(p[6]);

                        long? refID = 0;
                        Database._SalesReturnDetailsInsert(ref refID, id, product.ID, location.ID, qty, product.UnitID, price, discount, amount);
                    }
                }

                #region Apply to Invoice
                string[] lines2 = salesInvoice.Split('^');

                foreach (var l in lines2)
                {
                    if (!string.IsNullOrEmpty(l))
                    {
                        string[] p = l.Split(',');
                        Database._InvoiceReturnUpdate(long.Parse(p[1]), decimal.Parse(p[0]));
                    }
                }
                #endregion



                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }

        [WebMethod]
        public bool DeleteSalesReturn(long id)
        {
            try
            {
                Database = new DatabaseDataContext();
                Database._SalesReturnDelete(id);
                return true;
            }
            catch (Exception)
            {


            }

            return false;
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
        public string SalesReturnSelect(long id)
        {

            try
            {
                Database = new DatabaseDataContext();
                var data = Database._SalesReturnSelect(id);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data 4";

        }

        [WebMethod]
        public string SalesReturnDetailsSelect(long id)
        {

            try
            {
                Database = new DatabaseDataContext();
                var data = Database._SalesReturnDetailsSelect(id);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data 5";

        }

    }
}
