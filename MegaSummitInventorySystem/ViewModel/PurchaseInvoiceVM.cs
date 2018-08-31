using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MegaSummitInventorySystem;
using Newtonsoft.Json;

public class PurchaseInvoiceVM
{
    private static DatabaseDataContext Database = new DatabaseDataContext();


    public static string SupplierPurchaseInvoice(long supplier_id)
    {
        try
        {
            Database = new DatabaseDataContext();
            if (supplier_id == 0)
            {
                return "'Null'";
            }


            Database = new DatabaseDataContext();
            var data = Database._PurchasedInvoiceSelect(0, supplier_id);
            List<PurchaseInvoice> purchaseInvoice = new List<PurchaseInvoice>();

            foreach (var d in data)
            {
                PurchaseInvoice p = new PurchaseInvoice();
                p.ID = d.ID;
                p.RefNo = d.RefNo + d.RefNoSerial;
                p.CreatedDate = d.CreatedDate.Value;
                p.SupplierName = d.SupplierName;
                p.Amount = d.SubTotal.Value;

                p.Days = (DateTime.Now - d.CreatedDate.Value).Days;
                var bal = d.SubTotal - (d.Payment + d.PurchaseReturn);


                p.Balance = bal.Value;
                p.Status = d.Status;
                purchaseInvoice.Add(p);
            }



            if (purchaseInvoice.Count <= 0)
            {
                return "'Null'";
            }
            else
            {
                return JsonConvert.SerializeObject(purchaseInvoice, Newtonsoft.Json.Formatting.None);
            }
        }
        catch (Exception)
        {
            return string.Empty;
        }


    }

}
