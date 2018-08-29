using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MegaSummitInventorySystem;
using Newtonsoft.Json;


public class VoucherVM
{

}


public class Voucher
{
    public long ID { get; set; }
    public long SupplierID { get; set; }
    public string SupplierName { get; set; }
    public string RefNo { get; set; }
    public string RefNoSerial { get; set; }
    public List<_PurchasedPaymentCash> Cash { get; set; }
    public List<_PurchasedPaymentCheck> Checks { get; set; }
    public List<VoucherPayment> Payments { get; set; }
}

public class VoucherPayment
{
    public long ID { get; set; }
    public long VoucherID { get; set; }
    public long PurchaseID { get; set; }
    public string RefNo { get; set; }
    public DateTime CreatedDate { get; set; }
    public string Description { get; set; }
    public string Salesman { get; set; }
    public decimal TotalAmount { get; set; }
    public decimal TotalPayment { get; set; }

}


