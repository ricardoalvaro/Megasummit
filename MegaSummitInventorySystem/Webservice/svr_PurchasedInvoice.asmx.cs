using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Newtonsoft.Json;
using System.Data;


namespace MegaSummitInventorySystem.Webservice
{
    /// <summary>
    /// Summary description for svr_PurchasedInvoice
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class svr_PurchasedInvoice : System.Web.Services.WebService
    {
        
        // --------------------------------------------------------------- Initialize Database Connection
        private DatabaseDataContext Database = new DatabaseDataContext();

        #region Auto Complete

        // --------------------------------------------------------------- Purchased Invoice Reference AutoComplete
        [WebMethod]
        public List<AutoCompleteData> PurchasedInvoiceRefAutoSelect()
        {
            try
            {
                Database = new DatabaseDataContext();
                var data = Database._PurchasedInvoiceRefAutoSelect().ToList();


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

        // ---------------------------------------------------------------- Supplier AutoComplete
        [WebMethod]
        public List<AutoCompleteData> SupplierAutoComplete()
        {
            try
            {
                Database = new DatabaseDataContext();
                var data = Database._SupplierSelect(0, string.Empty);


                List<AutoCompleteData> auto = new List<AutoCompleteData>();
                foreach (var item in data)
                {
                    auto.Add(new AutoCompleteData(item.ID, item.SupplierName, item.SupplierName));
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

        // --------------------------------------------------------------- Selecting Employee
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

            return "Error on returning data 2";
        }

        // --------------------------------------------------------------- Selecting Supplier Information Details
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

        // --------------------------------------------------------------- Selecting Purchased Order By Supplier
        [WebMethod]
        public string PurchasedOrderRefSelect(long id)
        {
            try
            {

                Database = new DatabaseDataContext();
                var data = Database._PurchasedOrderRefSelect(id);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data 3";
        }

        // --------------------------------------------------------------- Selecting Purchased Order Details
        [WebMethod]
        public string PurchasedOrderDetailsInvoiceSelect(long id)
        {

            try
            {
                Database = new DatabaseDataContext();
                var data = Database._PurchasedOrderDetailsInvoiceSelect(id);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data 5";

        }

        // --------------------------------------------------------------- Selecing All Purchase Invoice 
        [WebMethod]
        public string PurchasedInvoiceSelect(long id)
        {

            try
            {
                Database = new DatabaseDataContext();
                var data = Database._PurchaseInvoiceSelect(id);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data 4";

        }

        // --------------------------------------------------------------- Selecting Purchased Details By Selected Purchased Invoice
        [WebMethod]
        public string PurchasedDetailSalesSelect(long id)
        {

            try
            {
                Database = new DatabaseDataContext();
                var data = Database._PurchasedInvoiceDetailsSelect(id);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data 5";

        }

        // --------------------------------------------------------------- Selecting Purchased Payment To Compute Balance
        [WebMethod]
        public string PurchasedPaymentSelectTotalAmount(long id)
        {
            try
            {
                Database = new DatabaseDataContext();
                var data = Database._PurchasedPaymentSelectTotalAmount(id);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data 4";
        }

        // --------------------------------------------------------------- Selecting Purchased Payment
        [WebMethod]
        public string PurchasedPaymentSelect(long id)
        {

            try
            {
                string invDate = string.Empty;
                DataTable dt = new DataTable();
                Database = new DatabaseDataContext();

                dt.Columns.Add("ID");
                dt.Columns.Add("RefNo");
                dt.Columns.Add("DatePay");
                dt.Columns.Add("TotalAmount");

                var data = Database._PurchasedPaymentSelect(id);
                foreach (var item in data)
                {
                    dt.Rows.Add(item.ID, item.ReferenceNo, item.PaymentDate.Value.ToShortDateString(), item.TotalAmount.Value.ToString("N"));
                }

                return JsonConvert.SerializeObject(dt, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data 5";

        }

        // --------------------------------------------------------------- Selecting Purchased Payment By Supplier
        [WebMethod]
        public string PurchasedPaymentSupplierSelect(long id)
        {

            try
            {
                string invDate = string.Empty;
                DataTable dt = new DataTable();
                Database = new DatabaseDataContext();

                dt.Columns.Add("ID");
                dt.Columns.Add("RefNo");
                dt.Columns.Add("DatePay");
                dt.Columns.Add("TotalAmount");

                var data = Database._PurchasedPaymentSelectBySupplier(id);
                foreach (var item in data)
                {
                    if (item.FromSystem.Value)
                    {
                        dt.Rows.Add(item.ID, item.ReferenceNo, item.PaymentDate.Value.ToShortDateString(), item.TotalAmount.Value.ToString("N"));
                    }
                }

                return JsonConvert.SerializeObject(dt, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data 5";

        }
        
        // --------------------------------------------------------------- Selecting Purchased Payment Reference
        [WebMethod]
        public string PaymentReferenceSelect(long id)
        {
            try
            {
                Database = new DatabaseDataContext();
                var data = Database._PurchasedPaymentReferences.Where(x => x.ID == id);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch (Exception)
            {
                return "0";
            }


        }

        // --------------------------------------------------------------- Selecting Cash Payment
        [WebMethod]
        public string PaymentCashSelect(long id)
        {
            try
            {
                Database = new DatabaseDataContext();
                var data = Database._PurchasedPaymentCashes.Where(x => x.PurchasedID == id);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch (Exception)
            {
                return "0";
            }


        }

        // --------------------------------------------------------------- Selecing Check Payment
        [WebMethod]
        public string PaymentCheckSelect(long id)
        {
            try
            {
                Database = new DatabaseDataContext();
                var data = Database._PurchasedPaymentChecks.Where(x => x.PurchasedID == id);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch (Exception)
            {
                return "0";
            }


        }

        // --------------------------------------------------------------- Selecting Purchased Invoice By Supplier
        [WebMethod]
        public string PurchasedInvoiceSupplierSelect(long id)
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

        // --------------------------------------------------------------- Purchase Insert
        [WebMethod]
        public string InsertPurchasedInvoice(long supplierID,string address,long deliveryToID,string salesman,string poNo,long termID,string refNo,string refNoSerial,DateTime createdDate,DateTime cancelDate,decimal subTotal,decimal paymentAmt,decimal memoAmt,string notes, string productList)
        {
            try
            {
                long? id = 0;
                Database = new DatabaseDataContext();
                Database._PurchasedInvoiceInsert(ref id, supplierID, address, deliveryToID, salesman, poNo, termID, refNo, refNoSerial, createdDate, cancelDate, subTotal, paymentAmt, memoAmt, notes, "Invoice");


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
                        decimal bonus = decimal.Parse(p[8]);

                        if (p[7] != " " && p[7] != null && p[7] != "")
                        {
                            Database._PurchasedOrderDetailsServedUpdate(long.Parse(p[7]), qty);
                        }

                        long? refID = 0;
                        Database._PurchasedInvoiceDetailsInsert(ref refID, id, product.ID, location.ID, qty, bonus, product.UnitID.Value, price, discount, amount);

                        // ----------------- Insert and Update Stock, Insert Stock History
                        #region Stock Processing 
                        long? refIDStock = 0;
                        long? refIDStockHis = 0;
                        var dataStock = Database._ProductStocks.Where(x => x.ProductID == product.ID && x.LocationID == location.ID).Count();
                        if (dataStock > 0)
                        {
                            Database._ProductStockUpdate(product.ID, location.ID, qty + bonus);
                        }
                        else
                        {
                            Database._ProductStockInsert(ref refIDStock, product.ID, location.ID, qty + bonus);
                        }
                        Database._ProductStockHistoryInsert(ref refIDStockHis, refNo + "" + refNoSerial, DateTime.Now, "Purchase Invoice", supplierName.SupplierName, location.ID, qty + bonus, 0, price, discount, 0, 0, product.ID);
                        #endregion 
                    }
                }
                return id.ToString();
            }
            catch (Exception)
            {


            }

            return "0";
        }

        // --------------------------------------------------------------- Saving Purchase Payment to Supplier
        [WebMethod]
        public string SaveInvoicePayment(long invoiceid, string refNo, decimal amount, string checkTable, decimal totalAmount)
        {
            try
            {
                long? refID = 0;
                long? refID2 = 0;
                Database = new DatabaseDataContext();
                Database._PurchasedPaymentReferenceInsert(ref refID, invoiceid, refNo, totalAmount, true);
                Database._PurchasedPaymentInsert(ref refID2, invoiceid, refID, totalAmount);
                #region Cash Payment
                if (amount != 0 && amount != null)
                {
                    long? idcash = 0;
                    Database = new DatabaseDataContext();
                    Database._PurchasedPaymentCashInsert(ref idcash, refID, amount);
                }
                #endregion
                #region Check Payment
                string[] lines = checkTable.Split('^');

                foreach (var l in lines)
                {
                    if (!string.IsNullOrEmpty(l))
                    {
                        string[] p = l.Split(',');

                        long? idcheck = 0;
                        Database = new DatabaseDataContext();
                        Database._PurchasedPaymentCheckInsert(ref idcheck, p[0], p[1], DateTime.Parse(p[2]), p[3], decimal.Parse(p[4]), refID);
                    }
                }
                #endregion
                return "";
            }
            catch (Exception)
            {

            }
            return "";
        }

        // --------------------------------------------------------------- Saving Purchased Invoice Voucher
        [WebMethod]
        public string SaveInvoicePaymentVoucher(long invoiceid, string refNo, decimal amount, string checkTable, decimal totalAmount, string salesInvoice)
        {
            try
            {
                long? refID = 0;
                long? refID2 = 0;
                Database = new DatabaseDataContext();
                Database._PurchasedPaymentReferenceInsert(ref refID, invoiceid, refNo, totalAmount, true);

                #region Apply to Invoice
                string[] lines2 = salesInvoice.Split('^');

                foreach (var l in lines2)
                {
                    if (!string.IsNullOrEmpty(l))
                    {
                        string[] p = l.Split(',');
                        Database._PurchasedPaymentInsert(ref refID2, long.Parse(p[1]), refID, long.Parse(p[0]));
                    }
                }
                #endregion

                #region Cash Payment
                if (amount != 0 && amount != null)
                {
                    long? idcash = 0;
                    Database = new DatabaseDataContext();
                    Database._PurchasedPaymentCashInsert(ref idcash, refID, amount);
                }
                #endregion
                #region Check Payment
                string[] lines = checkTable.Split('^');

                foreach (var l in lines)
                {
                    if (!string.IsNullOrEmpty(l))
                    {
                        string[] p = l.Split(',');

                        long? idcheck = 0;
                        Database = new DatabaseDataContext();
                        Database._PurchasedPaymentCheckInsert(ref idcheck, p[0], p[1], DateTime.Parse(p[2]), p[3], decimal.Parse(p[4]), refID);
                    }
                }
                #endregion
                return "";
            }
            catch (Exception)
            {

            }
            return "";
        }

        #endregion

        #region Updating Data

        // --------------------------------------------------------------- Purchased Update
        [WebMethod]
        public bool UpdatePurchasedInvoice(long id, long supplierID, string address, long deliveryToID, string salesman, string poNo, long termID, string refNo, string refNoSerial, DateTime createdDate, DateTime cancelDate, decimal subTotal, decimal paymentAmt, decimal memoAmt, string notes, string productList)
        {
            try
            {
                Database = new DatabaseDataContext();
                Database._PurchasedInvoiceUpdate( id, supplierID, address, deliveryToID, salesman, poNo, termID, refNo, refNoSerial, createdDate, cancelDate, subTotal, paymentAmt, memoAmt, notes);

                #region Decreasing Stocks
                var dataPurchaseProduct = Database._PurchasedInvoiceDetails.Where(x => x.PurchasedID == id);
                foreach (var item in dataPurchaseProduct)
                {
                    Database._ProductStockUpdateDecrease(item.ProductID.Value, item.LocationID.Value, item.Quantity.Value + item.Bonus.Value);
                }
                #endregion

                Database._PurchasedInvoiceDetailsDeleteByInvoice(id);

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
                        decimal bonus = decimal.Parse(p[8]);

                        if (p[7] != " " && p[7] != null && p[7] != "")
                        {
                            Database._PurchasedOrderDetailsServedUpdate(long.Parse(p[7]), qty);
                        }

                        long? refID = 0;
                        Database._PurchasedInvoiceDetailsInsert(ref refID, id, product.ID, location.ID, qty, bonus, product.UnitID.Value, price, discount, amount);


                        // ----------------- Insert and Update Stock, Insert Stock History
                        #region Stock Processing
                        long? refIDStock = 0;
                        long? refIDStockHis = 0;
                        var dataStock = Database._ProductStocks.Where(x => x.ProductID == product.ID && x.LocationID == location.ID).Count();
                        if (dataStock > 0)
                        {
                            Database._ProductStockUpdate(product.ID, location.ID, qty + bonus);
                        }
                        else
                        {
                            Database._ProductStockInsert(ref refIDStock, product.ID, location.ID, qty + bonus);
                        }
                        Database._ProductStockHistoryInsert(ref refIDStockHis, refNo + "" + refNoSerial, DateTime.Now, "Purchase Invoice", supplierName.SupplierName, location.ID, qty + bonus, 0, price, discount, 0, 0, product.ID);
                        #endregion 
                    }
                }

                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }

        // --------------------------------------------------------------- Updating Purchased Payment to Supplier
        [WebMethod]
        public string UpdateInvoicePayment(long invoiceid, decimal amount, string checkTable, decimal totalAmount)
        {
            try
            {
                Database = new DatabaseDataContext();
                #region Cash Payment
                if (amount != 0 && amount != null)
                {
                    Database = new DatabaseDataContext();
                    Database._PurchasedPaymentCashUpdate(invoiceid, amount);
                }
                #endregion
                #region Check Payment
                string[] lines = checkTable.Split('^');
                Database._PurchasedPaymentCheckDeletebyPayment(invoiceid);
                foreach (var l in lines)
                {
                    if (!string.IsNullOrEmpty(l))
                    {
                        string[] p = l.Split(',');

                        long? idcheck = 0;
                        Database = new DatabaseDataContext();
                        Database._PurchasedPaymentCheckInsert(ref idcheck, p[0], p[1], DateTime.Parse(p[2]), p[3], decimal.Parse(p[4]), invoiceid);
                    }
                }
                #endregion
            }
            catch (Exception)
            {

            }
            return "";
        }

        #endregion

        #region Deleting Data

        // --------------------------------------------------------------- Delete Pruchase 
        [WebMethod]
        public bool DeletePurchasedInvoice(long id)
        {
            try
            {
                Database = new DatabaseDataContext();
                Database._PurchasedInvoiceDelete(id);
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
