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
        public bool InsertPurchasedReturn(long supplier_id, string address, long delivery_to_id, long salesman_id, string po_no, long term_id, string ref_no, string ref_no_serial, DateTime created_date, string notes, decimal total_amount, decimal apply_to_invoice_amount, decimal balance, string productList, string salesInvoice)
        {
            try
            {
                long? id = 0;
                Database = new DatabaseDataContext();
                Database._PurchasedReturnInsert(ref id, supplier_id, address, delivery_to_id, salesman_id, po_no, term_id, ref_no, ref_no_serial, created_date, notes, total_amount, "Posted");
  
                string[] lines = productList.Split('|');

                foreach (var l in lines)
                {
                    if (!string.IsNullOrEmpty(l))
                    {
                        string[] p = l.Split('^');

                        string productID = p[2];
                        string locationID = p[4];

                        var product = Database._Products.SingleOrDefault(x => x.ID == long.Parse(productID));
                        var location = Database._Locations.SingleOrDefault(x => x.ID == long.Parse(locationID));

                        decimal qty = decimal.Parse(p[5]);
                        decimal price = decimal.Parse(p[7]);
                        string discount = p[8];
                        decimal amount = decimal.Parse(p[9]);

                        long? refID = 0;
                        Database._PurchasedReturnDetailsInsert(ref refID, id, product.ID, location.ID, qty, product.UnitID, price, discount, amount);

                        #region Increase Stocks
                        Database._ProductStockUpdate(product.ID, location.ID, qty);
                        #endregion

                    }
                }

                #region Apply to Invoice
                string[] lines2 = salesInvoice.Split('|');

                foreach (var l in lines2)
                {
                    if (!string.IsNullOrEmpty(l))
                    {
                        string[] p = l.Split('^');
                        long? sales_return_id = 0;
                        Database._PurchasedPaymentReturnInsert(ref sales_return_id, id, long.Parse(p[0]), supplier_id, decimal.Parse(p[1]));
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


        [WebMethod]
        public string PurchaseReturnSelect(long purchase_return_id)
        {

            try
            {

                if (purchase_return_id == 0)
                {
                    return "'Null'";
                }

                List<PurchaseReturn> _salesReturn = new List<PurchaseReturn>();

                var data = Database._PurchasedReturnSelect(purchase_return_id);

                foreach (var d in data)
                {
                    PurchaseReturn _sr = new PurchaseReturn();
                    _sr.ID = d.ID;
                    _sr.SupplierID = d.SupplierID.Value;
                    _sr.SupplierName = d.SupplierName;
                    _sr.Address = d.Address;
                    _sr.ForwarderID = d.DeliveryToID.Value;
                    _sr.SalesmanID = d.SalesmanID.Value;
                    _sr.PoNO = d.PoNo;
                    _sr.TermID = d.TermID.Value;
                    _sr.RefNo = d.RefNo;
                    _sr.RefSerial = d.RefNoSerial;
                    _sr.Date = d.CreatedDate.Value;
                    _sr.Notes = d.Notes;
                    _sr.TotalAmount = d.TotalAmount.Value;

                    var salesReturnDetails = Database._PurchasedReturnDetailsSelect(d.ID);
                    List<PurchaseReturnDetail> purchaseReturnDetail = new List<PurchaseReturnDetail>();
                    foreach (var srd in salesReturnDetails)
                    {
                        PurchaseReturnDetail _srd = new PurchaseReturnDetail();
                        _srd.ID = srd.ID;
                        _srd.ProductID = srd.ProductID.Value;
                        _srd.ProductName = srd.ProductName;
                        _srd.LocationID = srd.LocationID.Value;
                        _srd.LocationName = srd.LocationName;
                        _srd.Quantity = srd.Quantity.Value;
                        _srd.Unit = srd.UnitName;
                        _srd.UnitPrice = srd.UnitPrice.Value;
                        _srd.Discount = srd.Discount;
                        _srd.Amount = srd.Amount.Value;
                        purchaseReturnDetail.Add(_srd);
                    }

                    _sr.PurchaseReturnDetails = purchaseReturnDetail;

                    //--------------------------
                    var salesReturnPayment = Database._PurchasedPaymentReturns.Where(x => x.PurchasedReturnID == d.ID);
                    List<ReturnApplyList> ApplyLists = new List<ReturnApplyList>();
                    foreach (var srp in salesReturnPayment)
                    {
                        ReturnApplyList _al = new ReturnApplyList();
                        _al.PurchaseID = srp.PurchasedID.Value;
                        _al.RefNo = Database._PurchasedInvoices.SingleOrDefault(x => x.ID == srp.PurchasedID).RefNo + Database._PurchasedInvoices.SingleOrDefault(x => x.ID == srp.PurchasedID).RefNoSerial;
                        _al.Date = Database._PurchasedInvoices.SingleOrDefault(x => x.ID == srp.PurchasedID).CreatedDate.Value;
                        _al.Description = "Sales";
                        var salesman_id = Database._PurchasedInvoices.SingleOrDefault(x => x.ID == srp.PurchasedID.Value).Salesman;
                        _al.Salesman = Database._Employees.SingleOrDefault(x => x.ID == salesman_id).EmployeeName;
                        _al.Balance = (Database._PurchasedInvoices.SingleOrDefault(x => x.ID == srp.PurchasedID).SubTotal.Value - srp.Amount.Value);
                        _al.AppliedAmount = srp.Amount.Value;

                        ApplyLists.Add(_al);
                    }

                    _sr.ApplyLists = ApplyLists;



                    _salesReturn.Add(_sr);

                }


                if (_salesReturn.Count <= 0)
                {
                    return "'Null'";
                }
                else
                {
                    return JsonConvert.SerializeObject(_salesReturn, Newtonsoft.Json.Formatting.None);
                }

            }
            catch (Exception)
            {
                return string.Empty;
            }


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
                //Database._PurchasedReturnUpdate(id, supplierID, address, deliveryToID, salesman, poNo, termID, refNo, refNoSerial, createdDate, notes, totalAmount, applyToInvoiceAmt, balance);
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


public class PurchaseReturn
{
    public long ID { get; set; }
    public long SupplierID { get; set; }
    public string SupplierName { get; set; }
    public string Address { get; set; }
    public long ForwarderID { get; set; }
    public long SalesmanID { get; set; }
    public string PoNO { get; set; }
    public long TermID { get; set; }
    public string RefNo { get; set; }
    public string RefSerial { get; set; }
    public DateTime Date { get; set; }
    public string Notes { get; set; }
    public Decimal TotalAmount { get; set; }
    public List<PurchaseReturnDetail> PurchaseReturnDetails { get; set; }
    public List<ReturnApplyList> ApplyLists { get; set; }



}


public class PurchaseReturnDetail
{
    public long ID { get; set; }
    public long ProductID { get; set; }
    public string ProductName { get; set; }
    public long LocationID { get; set; }
    public string LocationName { get; set; }
    public decimal Quantity { get; set; }
    public string Unit { get; set; }
    public decimal UnitPrice { get; set; }
    public string Discount { get; set; }
    public decimal Amount { get; set; }

}



public class ReturnApplyList
{
    public long PurchaseID { get; set; }
    public string RefNo { get; set; }
    public DateTime Date { get; set; }
    public string Description { get; set; }
    public string Salesman { get; set; }
    public decimal Balance { get; set; }
    public decimal AppliedAmount { get; set; }

}


