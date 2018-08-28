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
        public long InsertPurchasedOrder(string purchasedOrderStatus,long supplierID,string address,long deliveryToID,long salesman,string poNo,long termID,string refNo,string refNoSerial,DateTime createdDate,string cancelDate,string notes,decimal totalAmount,decimal totalServed, string productList)
        {
            try
            {
                long? id = 0;
                Database = new DatabaseDataContext();
                Database._PurchasedOrderInsert(ref id, purchasedOrderStatus, supplierID, address, deliveryToID, salesman, poNo, termID, refNo, refNoSerial, createdDate, cancelDate, notes, totalAmount, totalServed);

                string[] lines = productList.Split('^');

                foreach (var l in lines)
                {
                    if (!string.IsNullOrEmpty(l))
                    {
                        string[] p = l.Split(',');

                        string productID = p[2];
                        string locationID = p[4];

                        var product = Database._Products.SingleOrDefault(x => x.ID == long.Parse(productID));
                        var location = Database._Locations.SingleOrDefault(x => x.ID == long.Parse(locationID));


                        decimal qty = decimal.Parse(p[5]);
                        decimal bonus = decimal.Parse(p[6]);
                        decimal served = decimal.Parse(p[7]);
                        decimal price = decimal.Parse(p[9]);
                        string discount = p[10];
                        decimal amount = decimal.Parse(p[11]);

                        long? refID = 0;
                        Database._PurchasedOrderDetailsInsert(ref refID, id, product.ID, location.ID, qty, bonus, served, product.UnitID, price, discount, amount);
                    }
                }
                return id.Value;
            }
            catch (Exception)
            {


            }

            return 0;
        }

        #endregion

        #region Updating Data

        // ------------------------------------------------------------------- Updating Purchased Order
        [WebMethod]
        public long UpdatePurchasedOrder(long id, string purchasedOrderStatus, long supplierID, string address, long deliveryToID, long salesman, string poNo, long termID, string refNo, string refNoSerial, DateTime createdDate, string cancelDate, string notes, decimal totalAmount, decimal totalServed, string productList)
        {
            try
            {
                Database = new DatabaseDataContext();
                Database._PurchasedOrderUpdate(id, purchasedOrderStatus, supplierID, address, deliveryToID, salesman, poNo, termID, refNo, refNoSerial, createdDate, cancelDate, notes, totalAmount, totalServed);

                string[] lines = productList.Split('^');

                foreach (var l in lines)
                {
                    if (!string.IsNullOrEmpty(l))
                    {
                        string[] p = l.Split(',');
                      
                        string productID = p[2];
                        string locationID = p[4];

                        var product = Database._Products.SingleOrDefault(x => x.ID == long.Parse(productID));
                        var location = Database._Locations.SingleOrDefault(x => x.ID == long.Parse(locationID));


                        decimal qty = decimal.Parse(p[5]);
                        decimal bonus = decimal.Parse(p[6]);
                        decimal served = decimal.Parse(p[7]);
                        decimal price = decimal.Parse(p[9]);
                        string discount = p[10];
                        decimal amount = decimal.Parse(p[11]);

                        if (p[0] == "0")
                        {
                            long? refID = 0;
                            Database._PurchasedOrderDetailsInsert(ref refID, id, product.ID, location.ID, qty, bonus, served, product.UnitID, price, discount, amount);
                        }
                        else
                        {
                            long sale_order_id = long.Parse(p[0]);
                            Database._PurchasedOrderDetailsUpdate(sale_order_id, product.ID, location.ID, qty, bonus, served, product.UnitID, price, discount, amount);
                        }

                    }
                }

                return id;
            }
            catch (Exception)
            {


            }

            return 0;
        }

        [WebMethod]
        public long UpdatePurchasedOrderStatus(long id)
        {
            Database._PurchasedOrderClosedStatus(id);
            return id;
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
