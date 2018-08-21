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