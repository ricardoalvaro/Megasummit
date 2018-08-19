using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MegaSummitInventorySystem;
using Newtonsoft.Json;

public class InvoiceVM
{
    private static DatabaseDataContext Database = new DatabaseDataContext();


    public static string SingleInvoice(long invoice_id)
    {
        
        try
        {
            Database = new DatabaseDataContext();
            if (invoice_id == 0) {
                return "'Null'";
            }
            
            var data = Database._InvoiceSalesSelect(invoice_id).ToList();

            if (data.Count <= 0)
            {
                return "'Null'";
            }
            else
            {
                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.None);
            }
        }
        catch (Exception)
        {
            return string.Empty;
        }
        
    }


    public static string SingleInvoiceDetails(long invoice_id)
    {

        try
        {
            Database = new DatabaseDataContext();
            if (invoice_id == 0)
            {
                return "'Null'";
            }

            var data = Database._InvoiceDetailsSalesSelect(invoice_id).ToList();

            if (data.Count <= 0)
            {
                return "'Null'";
            }
            else
            {
                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.None);
            }
        }
        catch (Exception)
        {
            return string.Empty;
        }

    }



}
