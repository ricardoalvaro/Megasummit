using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Newtonsoft.Json;


namespace MegaSummitInventorySystem.Webservice
{
    /// <summary>
    /// Summary description for svr_Invoice
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class svr_Invoice : System.Web.Services.WebService
    {
        private DatabaseDataContext Database = new DatabaseDataContext();

        [WebMethod]
        public string InsertInvoice(string invoice_status, long customer_id, string address, 
            long forwarder_to_id, long salesman_id, string po_no, long term_id, string ref_no, 
            string ref_no_serial, DateTime created_date, DateTime delivery_date, string prepared_by,
            string checked_by, string delivered_by, string way_bill_no, string container_no, 
            string bill_of_landing, decimal commission_rate, decimal commission_amt, long remarks_id, 
            string notes, decimal sub_total_amt, string tax_amt, decimal shipping_amt ,decimal total_amount, 
            string productList)
        {
            try
            {
                decimal tax_amount = 0;
                string tax_type = "Inclusive" ;
                decimal tax_rate = Database._CompanySalesTaxes.FirstOrDefault().Rate.Value;

                if (!tax_amt.Contains('%'))
                {

                    //var total = total_amount;
                    //var dis_rate = (tax_rate / 100) * total_amount;
                    tax_amount = (tax_rate / 100) * total_amount;
                    tax_type = "Exclusive";
                }

           

                long? id = 0;
                Database = new DatabaseDataContext();
                Database._InvoiceInsert(ref id, invoice_status, customer_id, address, forwarder_to_id, 
                    salesman_id, po_no, term_id, ref_no, ref_no_serial, created_date, 
                    delivery_date, prepared_by, checked_by, delivered_by, way_bill_no, 
                    container_no, bill_of_landing, commission_rate, commission_amt, 
                    remarks_id, notes, sub_total_amt, tax_type, tax_rate, tax_amount, "Posted", shipping_amt, total_amount);
    
                //var data = Database._SalesSettings.SingleOrDefault(x => x.ID == long.Parse(ref_no));
                //if (data.Automatic.Value)
                //{
                //    Database._SalesSettingRefUpdate(data.ID, data.LatestNo.Value + 1);
                //}

                #region Regural product list

                string[] lines = productList.Split('^');

                foreach (var l in lines)
                {
                    if (!string.IsNullOrEmpty(l))
                    {
                        string[] p = l.Split(',');

                        string productID = p[4];
                        string locationID = p[6];

                        var product = Database._Products.SingleOrDefault(x => x.ID == long.Parse(productID));
                        var location = Database._Locations.SingleOrDefault(x => x.ID == long.Parse(locationID));
                        var customerName = Database._Customers.SingleOrDefault(x => x.ID == customer_id);

                        decimal qty = decimal.Parse(p[7]);
                        decimal price = decimal.Parse(p[9]);
                        string discount = p[10];
                        decimal amount = decimal.Parse(p[11]);


                        if (!string.IsNullOrEmpty(p[0]))
                        {
                            Database._SalesOrderDetialsServedUpdate(long.Parse(p[0]), qty);
                        }

                        long? refID = 0;
                        Database._InvoiceDetailsInsert(ref refID, id, product.PackingID.Value, product.ID, location.ID, qty, product.UnitID.Value, price, discount, amount);

                        // ----------------- Insert and Update Stock, Insert Stock History
                        #region Stock Processing
                        long? refIDStockHis = 0;
                        var dataStock = Database._ProductStocks.Where(x => x.ProductID == product.ID && x.LocationID == location.ID).Count();
                        if (dataStock > 0)
                        {
                            Database._ProductStockUpdateDecrease(product.ID, location.ID, qty);
                        }
                        Database._ProductStockHistoryInsert(ref refIDStockHis, ref_no + id.ToString(), DateTime.Now, "Sales Invoice", customerName.CustomerName, location.ID, 0, qty, price, discount, 0, 0, product.ID);
                        #endregion 
                    }
                }
                #endregion
                #region Adjustment product list

                //string[] lines2 = productListAD.Split('^');

                //foreach (var l in lines2)
                //{
                //    if (!string.IsNullOrEmpty(l))
                //    {
                //        string[] p = l.Split(',');

                //        string productCode = p[0];
                //        string locationCode = p[1];

                //        var product = Database._Products.SingleOrDefault(x => x.ProductName == productCode);
                //        var location = Database._Locations.SingleOrDefault(x => x.LocationName == locationCode);

                //        decimal qty = decimal.Parse(p[2]);
                //        decimal price = decimal.Parse(p[4]);
                //        string discount = p[5];
                //        decimal amount = decimal.Parse(p[6]);

                //        long? refID = 0;
                //        Database._InvoiceDetailsAdjustmentInsert(ref refID, id, product.ID, location.ID, qty, product.UnitID.Value, price, discount, amount);
                //    }
                //}
                #endregion
                return id.ToString();
            }
            catch (Exception)
            {
                return "0";
            }
        }

        [WebMethod]
        public bool UpdateInvoice(long id, string invoice_status, long customer_id, string address, long forwarder_to_id, long salesman_id, string po_no, long term_id, string ref_no, string ref_no_serial, DateTime created_date, DateTime delivery_date, string prepared_by, string checked_by, string delivered_by, string way_bill_no, string container_no, string bill_of_landing, decimal commission_rate, decimal commission_amt, long remarks_id, string notes, decimal sub_total_amt, decimal tax_amt, decimal shipping_amt, decimal payment_amt, decimal memo_amt, decimal adjustment_amt, string productList, string productListAD)
        {
            try
            {
                Database = new DatabaseDataContext();
                Database._InvoiceUpdate(id, invoice_status, customer_id, address, forwarder_to_id, salesman_id, po_no, term_id, ref_no, ref_no_serial, created_date, delivery_date, prepared_by, checked_by, delivered_by, way_bill_no, container_no, bill_of_landing, commission_rate, commission_amt, remarks_id, notes, sub_total_amt, tax_amt, shipping_amt, payment_amt, memo_amt, adjustment_amt);
                
                #region Decreasing Stocks
                var dataPurchaseProduct = Database._InvoiceDetails.Where(x => x.InvoiceID == id);
                foreach (var item in dataPurchaseProduct)
                {
                    Database._ProductStockUpdate(item.ProductID.Value, item.LocationID.Value, item.Quantity.Value);
                }
                #endregion

                Database._InvoiceDetailsDeleteByInvoice(id);
                Database._InvoiceDetialsAdjustmentDeleteByInvoice(id);

                #region Regular product List
                string[] lines = productList.Split('^');

                foreach (var l in lines)
                {
                    if (!string.IsNullOrEmpty(l))
                    {
                        string[] p = l.Split(',');

                        string productCode = p[1];
                        string locationCode = p[2];

                        var product = Database._Products.SingleOrDefault(x => x.ProductName == productCode);
                        var location = Database._Locations.SingleOrDefault(x => x.LocationName == locationCode);

                        decimal qty = decimal.Parse(p[3]);
                        decimal price = decimal.Parse(p[5]);
                        string discount = p[6];
                        decimal amount = decimal.Parse(p[7]);
                        if (p[8] != string.Empty && p[8] != null && p[8] != " " && p[8] != " undefined")
                        {
                            Database._SalesOrderDetialsServedUpdate(long.Parse(p[8]), qty);
                        }
                        long? refID = 0;
                        Database._InvoiceDetailsInsert(ref refID, id, product.PackingID.Value, product.ID, location.ID, qty, product.UnitID.Value, price, discount, amount);

                        // ----------------- Insert and Update Stock, Insert Stock History
                        #region Stock Processing
                        var dataStock = Database._ProductStocks.Where(x => x.ProductID == product.ID && x.LocationID == location.ID).Count();
                        if (dataStock > 0)
                        {
                            Database._ProductStockUpdateDecrease(product.ID, location.ID, qty);
                        }
                        #endregion 
                    }
                }
                #endregion
                #region Adjustment product list

                string[] lines2 = productListAD.Split('^');

                foreach (var l in lines2)
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
                        Database._InvoiceDetailsAdjustmentInsert(ref refID, id, product.ID, location.ID, qty, product.UnitID.Value, price, discount, amount);
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
        public bool DeleteInvoice(long id)
        {
            try
            {
                Database = new DatabaseDataContext();
                Database._InvoiceDelete(id);
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }

        [WebMethod]
        public string SaveInvoicePayment(long invoiceid, string refNo, decimal amount, string checkTable, long cardID, string cardNumber, string nameCard, string expMonth, string expYear, string AppCode, decimal amountCard, decimal totalAmount)
        {
            try
            {
                long? refID = 0;
                long? refID2 = 0;
                Database = new DatabaseDataContext();
                Database._InvoicePaymentReferenceInsert(ref refID, invoiceid, 3, refNo, totalAmount, true);
                Database._InvoicePaymentInsert(ref refID2, invoiceid, refID, totalAmount);
                var data = Database._Settings.SingleOrDefault(x => x.ID == 3);
                if (data.Automatic.Value)
                {
                    Database._SettingRefUpdate(data.ID, data.LatestNo.Value + 1);
                }
                #region Cash Payment
                if (amount != 0 && amount != null)
                {
                    long? idcash = 0;
                    Database = new DatabaseDataContext();
                    Database._InvoicePaymentCashInsert(ref idcash, refID, amount, DateTime.Now);
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
                        Database._InvoicePaymentCheckInsert(ref idcheck, refID, p[0], p[1], DateTime.Parse(p[2]), p[3], decimal.Parse(p[4]));
                    }
                }
                #endregion
                #region Card Payment
                if (cardID != 0 && cardID != null)
                {
                    long? idcard = 0;
                    Database = new DatabaseDataContext();
                    Database._InvoicePaymentCardInsert(ref idcard, refID, cardID, cardNumber, nameCard, expMonth, expYear, AppCode, amountCard, DateTime.Now);
                }
                #endregion
                return "";
            }
            catch (Exception)
            {

            }
            return "";
        }

        [WebMethod]
        public string UpdateInvoicePayment(long id, decimal amount, string checkTable, long cardID, string cardNumber, string nameCard, string expMonth, string expYear, string AppCode, decimal amountCard, decimal totalAmount)
        {
            try
            {
                Database = new DatabaseDataContext();
                Database._InvoicePaymentreferenceTotalUpdate(id, totalAmount);
                Database._InvoicePaymentTotalUpdate(id, totalAmount);
                #region Cash Payment
                if (amount != 0 && amount != null)
                {
                    Database = new DatabaseDataContext();
                    Database._InvoicePaymentCashUpdate(id, amount, DateTime.Now);
                }
                #endregion
                #region Check Payment
                string[] lines = checkTable.Split('^');
                Database._InvoicePaymentcheckDeleteByRef(id);
                foreach (var l in lines)
                {
                    if (!string.IsNullOrEmpty(l))
                    {
                        string[] p = l.Split(',');

                        long? idcheck = 0;
                        Database = new DatabaseDataContext();
                        Database._InvoicePaymentCheckInsert(ref idcheck, id, p[0], p[1], DateTime.Parse(p[2]), p[3], decimal.Parse(p[4]));
                    }
                }
                #endregion
                #region Card Payment
                if (cardID != 0 && cardID != null)
                {
                    long? idcard = 0;
                    Database = new DatabaseDataContext();
                    Database._InvoicePaymentCardUpdate(id, cardID, cardNumber, nameCard, expMonth, expYear, AppCode, amountCard);
                }
                #endregion
            }
            catch (Exception)
            {

            }
            return "";
        }

        [WebMethod]
        public string SaveInvoicePaymentOfficial(long invoiceid, string refNo, decimal amount, string checkTable, long cardID, string cardNumber, string nameCard, string expMonth, string expYear, string AppCode, decimal amountCard, decimal totalAmount, string salesInvoice)
        {
            try
            {
                long? refID = 0;
                long? refID2 = 0;
                Database = new DatabaseDataContext();
                Database._InvoicePaymentReferenceInsert(ref refID, invoiceid, 3, refNo, totalAmount, true);

                #region Apply to Invoice
                string[] lines2 = salesInvoice.Split('^');

                foreach (var l in lines2)
                {
                    if (!string.IsNullOrEmpty(l))
                    {
                        string[] p = l.Split(',');
                        Database._InvoicePaymentInsert(ref refID2, long.Parse(p[1]), refID, long.Parse(p[0]));
                    }
                }
                #endregion

                var data = Database._Settings.SingleOrDefault(x => x.ID == 3);
                if (data.Automatic.Value)
                {
                    Database._SettingRefUpdate(data.ID, data.LatestNo.Value + 1);
                }
                #region Cash Payment
                if (amount != 0 && amount != null)
                {
                    long? idcash = 0;
                    Database = new DatabaseDataContext();
                    Database._InvoicePaymentCashInsert(ref idcash, refID, amount, DateTime.Now);
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
                        Database._InvoicePaymentCheckInsert(ref idcheck, refID, p[0], p[1], DateTime.Parse(p[2]), p[3], decimal.Parse(p[4]));
                    }
                }
                #endregion
                #region Card Payment
                if (cardID != 0 && cardID != null)
                {
                    long? idcard = 0;
                    Database = new DatabaseDataContext();
                    Database._InvoicePaymentCardInsert(ref idcard, refID, cardID, cardNumber, nameCard, expMonth, expYear, AppCode, amountCard, DateTime.Now);
                }
                #endregion
                return "";
            }
            catch (Exception)
            {

            }
            return "";
        }

        [WebMethod]
        public string UpdateInvoicePaymentOfficial(long id, decimal amount, string checkTable, long cardID, string cardNumber, string nameCard, string expMonth, string expYear, string AppCode, decimal amountCard, decimal totalAmount, string salesInvoice)
        {
            try
            {
                Database = new DatabaseDataContext();
                #region Cash Payment
                if (amount != 0 && amount != null)
                {
                    Database = new DatabaseDataContext();
                    Database._InvoicePaymentCashUpdate(id, amount, DateTime.Now);
                }
                #endregion
                #region Check Payment
                string[] lines = checkTable.Split('^');
                Database._InvoicePaymentcheckDeleteByRef(id);
                foreach (var l in lines)
                {
                    if (!string.IsNullOrEmpty(l))
                    {
                        string[] p = l.Split(',');

                        long? idcheck = 0;
                        Database = new DatabaseDataContext();
                        Database._InvoicePaymentCheckInsert(ref idcheck, id, p[0], p[1], DateTime.Parse(p[2]), p[3], decimal.Parse(p[4]));
                    }
                }
                #endregion
                #region Card Payment
                if (cardID != 0 && cardID != null)
                {
                    long? idcard = 0;
                    Database = new DatabaseDataContext();
                    Database._InvoicePaymentCardUpdate(id, cardID, cardNumber, nameCard, expMonth, expYear, AppCode, amountCard);
                }
                #endregion
            }
            catch (Exception)
            {

            }
            return "";
        }



        [WebMethod]
        public string InvoiceVoid(long ID )
        {

            Database._InvoiceVoid(ID);


            string CustomerName = string.Empty;
            string RefNo = string.Empty;


            var Invoice = Database._InvoiceSalesSelect(ID).ToList();
            foreach (var item in Invoice)
            {
                RefNo = item.RefNo + item.ID.ToString();
                CustomerName = item.CustomerName;
            }

            var Details = Database._InvoiceDetailsSalesSelect(ID).ToList();



            foreach (var item in Details)
            {
                string productID = item.ProductID.Value.ToString();
                string locationID = item.LocationID.Value.ToString();

                var product = Database._Products.SingleOrDefault(x => x.ID == long.Parse(productID));
                var location = Database._Locations.SingleOrDefault(x => x.ID == long.Parse(locationID));
                //var customerName = Database._Customers.SingleOrDefault(x => x.ID == customer_id);

                decimal qty = item.Quantity.Value;
                decimal price = item.UnitPrice.Value;
                string discount = item.Discount;
                decimal amount = item.Amount.Value;


                //if (!string.IsNullOrEmpty(p[0]))
                //{
                //    Database._SalesOrderDetialsServedUpdate(long.Parse(p[0]), qty);
                //}

                //long? refID = 0;
                //Database._InvoiceDetailsInsert(ref refID, id, product.PackingID.Value, product.ID, location.ID, qty, product.UnitID.Value, price, discount, amount);

                // ----------------- Insert and Update Stock, Insert Stock History
                #region Stock Processing
                long? refIDStockHis = 0;
                var dataStock = Database._ProductStocks.Where(x => x.ProductID == product.ID && x.LocationID == location.ID).Count();
                if (dataStock > 0)
                {
                    Database._ProductStockUpdate(product.ID, location.ID, qty);
                }
                Database._ProductStockHistoryInsert(ref refIDStockHis, RefNo, DateTime.Now, "Void", CustomerName, location.ID, qty, 0, price, discount, 0, 0, product.ID);
                #endregion
            }
            



          
            

            return "";
        }
    }
}