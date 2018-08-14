using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Newtonsoft.Json;


namespace MegaSummitInventorySystem.Webservice
{
    /// <summary>
    /// Summary description for svr_PurchasedOrder
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class svr_PurchasedOrder : System.Web.Services.WebService
    {
        // ------------------------------------------------------------------- Initialize Database Connection
        private DatabaseDataContext Database = new DatabaseDataContext();

        #region Auto Complete

        // ------------------------------------------------------------------- Purchased Order Reference Auto Complete
        [WebMethod]
        public List<AutoCompleteData> _PurchasedOrderRefAutoSelect()
        {
            try
            {
                Database = new DatabaseDataContext();
                var data = Database._PurchasedOrderRefAutoSelect().ToList();


                List<AutoCompleteData> auto = new List<AutoCompleteData>();
                foreach (var item in data)
                {
                    auto.Add(new AutoCompleteData(item.ID, item.refNo, item.refNo));
                }

                return auto;

            }
            catch (Exception)
            {

            }

            return null;
        }


        #endregion

        #region Selecting Data

        // ------------------------------------------------------------------- Selecting Supplier Information Details
        [WebMethod]
        public string SelectSupplier(long id, string SupplierName)
        {
            try
            {

                Database = new DatabaseDataContext();
                var data = Database._SupplierSelect(id, SupplierName);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data 2";
        }

        // -------------------------------------------------------------------- Selecting All Purchased Order
        [WebMethod]
        public string PurchasedOrderSelect(long id)
        {

            try
            {
                Database = new DatabaseDataContext();
                var data = Database._PurchasedOrderSelect(id);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data 4";

        }
        
        // -------------------------------------------------------------------- Selecting Purchased Order Details
        [WebMethod]
        public string PurchasedOrderDetailsSelect(long id)
        {

            try
            {
                Database = new DatabaseDataContext();
                var data = Database._PurchasedOrderDetailsSelect(id);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data 5";

        }

        #endregion

        #region Inserting Data

        // ------------------------------------------------------------------- Inserting Purchased Order
        [WebMethod]
        public bool InsertPurchasedOrder(string purchasedOrderStatus,long supplierID,string address,long deliveryToID,string salesman,string poNo,long termID,string refNo,string refNoSerial,DateTime createdDate,DateTime cancelDate,string notes,decimal totalAmount,decimal totalServed,decimal balance, string productList)
        {
            try
            {
                long? id = 0;
                Database = new DatabaseDataContext();
                Database._PurchasedOrderInsert(ref id, purchasedOrderStatus, supplierID, address, deliveryToID, salesman, poNo, termID, refNo, refNoSerial, createdDate, cancelDate, notes, totalAmount, totalServed, balance);

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
                        decimal bonus = decimal.Parse(p[8]);

                        long? refID = 0;
                        Database._PurchasedOrderDetailsInsert(ref refID, id, product.ID, location.ID, qty, bonus, 0, product.UnitID, price, discount, amount);
                    }
                }
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }

        #endregion

        #region Updating Data

        // ------------------------------------------------------------------- Updating Purchased Order
        [WebMethod]
        public bool UpdatePurchasedOrder(long id, string purchasedOrderStatus, long supplierID, string address, long deliveryToID, string salesman, string poNo, long termID, string refNo, string refNoSerial, DateTime createdDate, DateTime cancelDate, string notes, decimal totalAmount, decimal totalServed, decimal balance, string productList)
        {
            try
            {
                Database = new DatabaseDataContext();
                Database._PurchasedOrderUpdate(id, purchasedOrderStatus, supplierID, address, deliveryToID, salesman, poNo, termID, refNo, refNoSerial, createdDate, cancelDate, notes, totalAmount, totalServed, balance);

                Database._PurchasedOrderDetailsDeleteByPurchase(id);

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
                        decimal bonus = decimal.Parse(p[8]);

                        long? refID = 0;
                        Database._PurchasedOrderDetailsInsert(ref refID, id, product.ID, location.ID, qty, bonus, 0, product.UnitID, price, discount, amount);
                    }
                }

                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }

        #endregion

        #region Deleting Data

        // ------------------------------------------------------------------- Deleting Purchased Order
        [WebMethod]
        public bool DeletePurchasedOrder(long id)
        {
            try
            {
                Database = new DatabaseDataContext();
                Database._PurchasedOrderDelete(id);
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }

        #endregion

    }
}
