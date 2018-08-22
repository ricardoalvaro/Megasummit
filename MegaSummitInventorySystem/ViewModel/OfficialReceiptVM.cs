using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MegaSummitInventorySystem;
using Newtonsoft.Json;

public class OfficialReceiptVM
{
    private DatabaseDataContext Database = new DatabaseDataContext();


    public string InvoiceBalance(long customerID)
    {
        return "";

      
    }


}


public class OfficialReceipt
{
    public long ID { get; set; }
    public long CustomerID { get; set; }
    public string CustomerName { get; set; }
    public string RefNo { get; set; }
    public string RefNoSerial { get; set; }
    public List<_InvoicePaymentCash> Cash { get; set; }
    public List<_InvoicePaymentCheck> Checks { get; set; }
    public List<_InvoicePaymentCard> CrediCard { get; set; }
    public List<InvoicePayment> Payments { get; set; }

}


public class InvoicePayment
{
    public long ID { get; set; }
    public long OfficialReceiptID { get; set; }
    public long InvoiceID { get; set; }
    public string RefNo { get; set; }
    public DateTime CreatedDate { get; set; }
    public string Description { get; set; }
    public string Salesman { get; set; }
    public decimal TotalAmount { get; set; }
    public decimal TotalPayment { get; set; }

}




public class InvoiceBalance
{
    public long ID { get; set; }
    public string RefNo { get; set; }
    public DateTime CreatedDate { get; set; }
    public string Description { get; set; }
    public string Salesman { get; set; }
    public decimal TotalAmount { get; set; }
    public decimal Balance { get; set; }

    public InvoiceBalance(long _id, string _refNo, DateTime _createdDate, string _description, string _salesman, decimal _totalAmount, decimal _balance)
    {
        ID = _id;
        RefNo = _refNo;
        CreatedDate = _createdDate;
        Description = _description;
        Salesman = _salesman;
        TotalAmount = _totalAmount;
        Balance = _balance;
    }

}