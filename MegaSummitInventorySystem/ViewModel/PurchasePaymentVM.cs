using MegaSummitInventorySystem;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


public class PurchasePaymentVM
{
    private static DatabaseDataContext Database = new DatabaseDataContext();

    public static string CashPayment(long supplier_id)
    {
        //get
        //{

        List<CashPayment> cashPayment = new List<global::CashPayment>();


        Database = new DatabaseDataContext();
        var data = Database._PurchaseVoucherSelect(0, supplier_id);

        foreach (var or in data)
        {
            var cash = Database._PurchasedPaymentCashes.Where(x => x.PurchasedVoucherID == or.ID);

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

    public static string CheckPayment(long supplier_id)
    {
        //get
        //{

        List<CheckPayment> checkPayment = new List<CheckPayment>();


        Database = new DatabaseDataContext();
        var data = Database._PurchaseVoucherSelect(0, supplier_id);

        foreach (var or in data)
        {
            var check = Database._PurchasedPaymentChecks.Where(x => x.PuchasedVoucherID == or.ID);

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
}
