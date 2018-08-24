using MegaSummitInventorySystem;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


public class SalesReturnVM
{
    private static DatabaseDataContext Database = new DatabaseDataContext();

    public static string SelectSingleSalesReturn(long sales_return_id)
    {
        
        try
        {

            if (sales_return_id == 0)
            {
                return "'Null'";
            }

            List<SalesReturn> _salesReturn = new List<SalesReturn>();

            var data = Database._SalesReturnSelect(sales_return_id);

            foreach (var d in data)
            {
                SalesReturn _sr = new SalesReturn();
                _sr.ID = d.ID;
                _sr.CustomerID = d.CustomerID.Value;
                _sr.CustomerName = d.CustomerName;
                _sr.Address = d.Address;
                _sr.ForwarderID = d.DeliverToID.Value;
                _sr.SalesmanID = d.SalesmanID.Value;
                _sr.PoNO = d.PONo;
                _sr.TermID = d.TermID.Value;
                _sr.RefNo = d.RefNo;
                _sr.RefSerial = d.RefNoSerial;
                _sr.Date = d.CreatedDate.Value;
                _sr.Notes = d.Notes;
                _sr.TotalAmount = d.TotalAmount.Value;

                var salesReturnDetails = Database._SalesReturnDetailsSelect(d.ID);
                List<SalesReturnDetail> salesReturnDetail = new List<SalesReturnDetail>();
                foreach (var srd in salesReturnDetails)
                {
                    SalesReturnDetail _srd = new SalesReturnDetail();
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
                    salesReturnDetail.Add(_srd);
                }

                _sr.SalesReturnDetails = salesReturnDetail;

                //--------------------------
                var salesReturnPayment = Database._invoicePaymentSalesReturns.Where(x => x.SalesReturnID == d.ID);
                List<ApplyList> ApplyLists = new List<ApplyList>();
                foreach (var srp in salesReturnPayment)
                {
                    ApplyList _al = new ApplyList();
                    _al.InvoiceID = srp.InvoiceID.Value;
                    _al.RefNo = Database._Invoices.SingleOrDefault(x => x.ID == srp.InvoiceID).RefNo + Database._Invoices.SingleOrDefault(x => x.ID == srp.InvoiceID).RefNoSerial;
                    _al.Date = Database._Invoices.SingleOrDefault(x => x.ID == srp.InvoiceID).CreatedDate.Value;
                    _al.Description = "Invoices";
                    var salesman_id = Database._Invoices.SingleOrDefault(x => x.ID == srp.InvoiceID.Value).SalesmanID;
                    _al.Salesman = Database._Employees.SingleOrDefault(x => x.ID == salesman_id).EmployeeName;
                    _al.Balance = (Database._Invoices.SingleOrDefault(x => x.ID == srp.InvoiceID).TotalAmount.Value - srp.Amount.Value);
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

        
}

public class SalesReturn 
{
    public long ID { get; set; }
    public long CustomerID { get; set; }
    public string CustomerName { get; set; }
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
    public List<SalesReturnDetail> SalesReturnDetails { get; set; }
    public List<ApplyList> ApplyLists { get; set; }



}


public class SalesReturnDetail
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



public class ApplyList
{
    public long InvoiceID { get; set; }
    public string RefNo { get; set; }
    public DateTime Date { get; set; }
    public string Description { get; set; }
    public string Salesman { get; set; }
    public decimal Balance { get; set; }
    public decimal AppliedAmount { get; set; }

}

