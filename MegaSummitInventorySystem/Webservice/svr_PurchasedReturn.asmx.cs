using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Newtonsoft.Json;

namespace MegaSummitInventorySystem.Webservice
{
    /// <summary>
    /// Summary description for svr_PurchasedReturn
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class svr_PurchasedReturn : System.Web.Services.WebService
    {
        // --------------------------------------------------------------- Initialize Database Connection
        private DatabaseDataContext Database = new DatabaseDataContext();

        #region Auto Complete

        #endregion

        #region Selecting Data

        // --------------------------------------------------------------- Selecting Purchased Return
        [WebMethod]
        public string PurchasedReturnSelect(long id)
        {

            try
            {
                Database = new DatabaseDataContext();
                var data = Database._PurchasedReturnSelect(id);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data 4";

        }

        // --------------------------------------------------------------- Selecting Purchased Return Details
        [WebMethod]
        public string PurchasedReturnDetailsSelect(long id)
        {

            try
            {
                Database = new DatabaseDataContext();
                var data = Database._PurchasedReturnDetailsSelect(id);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data 5";

        }

        // --------------------------------------------------------------- Selecting Purchased Invoice By Selected Supplier
        [WebMethod]
        public string PurchaseInvoiceSupplierSelect(long id)
        {

            try
            {
                Database = new DatabaseDataContext();
                var data = Database._PurchaseInvoiceSupplierSelect(id);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data 4";

        }

        #endregion

        #region Inserting Data

        // --------------------------------------------------------------- Inserting Purchased Return Data
        [WebMethod]
        public bool InsertPurchasedReturn(long supplierID, string address, long deliveryToID, string salesman, string poNo, long termID, string refNo, string refNoSerial, DateTime createdDate, string notes, decimal totalAmount, decimal applyToInvoiceAmt, decimal balance, string productList, string salesInvoice)
        {
            try
            {
                long? id = 0;
                Database = new DatabaseDataContext();
                Database._PurchasedReturnInsert(ref id, supplierID, address, deliveryToID, salesman, poNo, termID, refNo, refNoSerial, createdDate, notes, totalAmount, applyToInvoiceAmt, balance);
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
                        var supplierName = Database._Suppliers.SingleOrDefault(x => x.ID == supplierID);

                        decimal qty = decimal.Parse(p[2]);
                        decimal price = decimal.Parse(p[4]);
                        string discount = p[5];
                        decimal amount = decimal.Parse(p[6]);

                        long? refID = 0;
                        Database._PurchasedReturnDetailsInsert(ref refID, id, product.ID, location.ID, qty, product.UnitID, price, discount, amount);

                        // ----------------- Insert and Update Stock, Insert Stock History
                        #region Stock Processing
                        long? refIDStock = 0;
                        long? refIDStockHis = 0;
                        var dataStock = Database._ProductStocks.Where(x => x.ProductID == product.ID && x.LocationID == location.ID).Count();
                        if (dataStock > 0)
                        {
                            Database._ProductStockUpdate(product.ID, location.ID, qty);
                        }
                        else
                        {
                            Database._ProductStockInsert(ref refIDStock, product.ID, location.ID, qty );
                        }
                        Database._ProductStockHistoryInsert(ref refIDStockHis, refNo + "" + refNoSerial, DateTime.Now, "Purchase Invoice", supplierName.SupplierName, location.ID, qty, 0, price, discount, 0, 0, product.ID);
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
                        //Database._InvoiceReturnUpdate(long.Parse(p[1]), decimal.Parse(p[0]));
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

        #endregion

        #region Updating Data

        // --------------------------------------------------------------- Updating Purchased Return Data
        [WebMethod]
        public bool UpdatePurchasedReturn(long id, long supplierID, string address, long deliveryToID, string salesman, string poNo, long termID, string refNo, string refNoSerial, DateTime createdDate, string notes, decimal totalAmount, decimal applyToInvoiceAmt, decimal balance)
        {
            try
            {
                Database = new DatabaseDataContext();
                Database._PurchasedReturnUpdate(id, supplierID, address, deliveryToID, salesman, poNo, termID, refNo, refNoSerial, createdDate, notes, totalAmount, applyToInvoiceAmt, balance);
                return true;
            }
            catch (Exception)
            {
            }

            return false;
        }

        #endregion

        #region Deleting Data

        // --------------------------------------------------------------- Deleting Purchased Return
        [WebMethod]
        public bool DeletePurchasedReturn(long id)
        {
            try
            {
                Database = new DatabaseDataContext();
                Database._PurchasedReturnDelete(id);
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
