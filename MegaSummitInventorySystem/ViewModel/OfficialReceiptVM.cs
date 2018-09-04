using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MegaSummitInventorySystem;
using Newtonsoft.Json;

public static class OfficialReceiptVM
{
    private static DatabaseDataContext Database = new DatabaseDataContext();


    //public string InvoiceBalance(long customerID)
    //{
    //    return "";

      
    //}

    public static string CashPayment(long customer_id)
    {
        //get
        //{

        List<CashPayment> cashPayment = new List<global::CashPayment>();

      
        Database = new DatabaseDataContext();
        var data = Database._InvoiceOfficialReceipts.Where(x => x.CustomerID == customer_id);

        foreach (var or in data)
        {
            var cash = Database._InvoicePaymentCashes.Where(x => x.OfficialReceiptID == or.ID);

            foreach (var c in cash)
            {
                CashPayment _cash = new CashPayment();

                _cash.ID = c.ID;
                _cash.RefNo = or.RefNo + or.ID.ToString();
                _cash.CreatedDate = or.CreatedDate.Value;
                _cash.ORAmount = or.TotalAmount.Value;
                _cash.CashAmount = c.Amount.Value;

                cashPayment.Add(_cash);

            }
            
        }
            

            
        return JsonConvert.SerializeObject(cashPayment, Newtonsoft.Json.Formatting.None);
        //}
    }

    public static string CheckPayment(long customer_id)
    {
        //get
        //{

        List<CheckPayment> checkPayment = new List<CheckPayment>();


        Database = new DatabaseDataContext();
        var data = Database._InvoiceOfficialReceipts.Where(x => x.CustomerID == customer_id);

        foreach (var or in data)
        {
            var check = Database._InvoicePaymentChecks.Where(x => x.OfficialReceiptID == or.ID);

            foreach (var c in check)
            {
                CheckPayment _check = new CheckPayment();

                _check.ID = c.ID;
                _check.RefNo = or.RefNo + or.ID.ToString();
                _check.BankName = c.BankName;
                _check.CheckNo = c.CheckNo;
                _check.CheckDate = c.CheckDate.Value;
                _check.CreatedDate = or.CreatedDate.Value;
                _check.ORAmount = or.TotalAmount.Value;
                _check.CheckAmount = c.Amount.Value;

                checkPayment.Add(_check);

            }

        }



        return JsonConvert.SerializeObject(checkPayment, Newtonsoft.Json.Formatting.None);
        //}
    }

    public static string CreditCardPayment(long customer_id)
    {

        List<CreditCardPayment> creditPayment = new List<CreditCardPayment>();


        Database = new DatabaseDataContext();
        var data = Database._InvoiceOfficialReceipts.Where(x => x.CustomerID == customer_id);

        foreach (var or in data)
        {
            var card = Database._InvoicePaymentCards.Where(x => x.OfficialReceiptID == or.ID);

            foreach (var c in card)
            {
                CreditCardPayment _card = new CreditCardPayment();

                _card.ID = c.ID;
                _card.RefNo = or.RefNo + or.ID.ToString();
                
                _card.CardType = c.CardType;
                _card.CardNumber = c.CardNumber;
                _card.NameOnCard = c.NameOnCard;
                _card.Expiration = c.ExpirationMonth + "/" + c.ExpirationYear;
                _card.ApprovalCode = c.ApprovalCode;

                _card.CreatedDate = or.CreatedDate.Value;
                _card.ORAmount = or.TotalAmount.Value;
                _card.Amount = c.Amount.Value;

                creditPayment.Add(_card);

            }

        }



        return JsonConvert.SerializeObject(creditPayment, Newtonsoft.Json.Formatting.None);
        //}
    }


}



public class CreditCardPayment
{
    public long ID { get; set; }
    public string RefNo { get; set; }
    public string CardType { get; set; }
    public string CardNumber { get; set; }
    public string NameOnCard { get; set; }
    public string Expiration { get; set; }
    public string ApprovalCode { get; set; }
    public DateTime CreatedDate { get; set; }
    public decimal ORAmount { get; set; }
    public decimal Amount { get; set; }


}

public class CheckPayment
{
    public long ID { get; set; }
    public string RefNo { get; set; }
    public string BankName { get; set; }
    public string CheckNo { get; set; }
    public DateTime CheckDate { get; set; }
    public DateTime CreatedDate { get; set; }
    public decimal ORAmount { get; set; }
    public decimal CheckAmount { get; set; }


}



public class CashPayment
{
    public long ID { get; set; }
    public string RefNo { get; set; }
    public DateTime CreatedDate { get; set; }
    public decimal ORAmount { get; set; }
    public decimal CashAmount { get; set; }


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
    public string RefSerial { get; set; }
    public DateTime CreatedDate { get; set; }
    public string CustomerName { get; set; }
    public string Description { get; set; }
    public string Salesman { get; set; }
    public decimal TotalAmount { get; set; }
    public decimal Balance { get; set; }
    public string Status { get; set; }
    public int NoOfDays { get; set; }
    public decimal CommRate { get; set; }
    public long TermID { get; set; }

    public InvoiceBalance()
    {
 
    }

    public InvoiceBalance(long _id, string _refNo, DateTime _createdDate, string _description, string _salesman, decimal _totalAmount, decimal _balance, int _noOfDays)
    {
        ID = _id;
        RefNo = _refNo;
        CreatedDate = _createdDate;
        Description = _description;
        Salesman = _salesman;
        TotalAmount = _totalAmount;
        Balance = _balance;
        NoOfDays = _noOfDays;
    }



}