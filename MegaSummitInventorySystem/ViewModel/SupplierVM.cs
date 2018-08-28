using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MegaSummitInventorySystem;
using Newtonsoft.Json;


public class SupplierVM
{
    private static DatabaseDataContext Database = new DatabaseDataContext();

    public static string SinglePurchaseOrder(long purchase_order_id)
    {

        try
        {
            Database = new DatabaseDataContext();
            if (purchase_order_id == 0)
            {
                return "'Null'";
            }

            var data = Database._PurchasedOrderSelect(purchase_order_id).ToList();

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

    public static string SinglePurchaseInvoice(long purchase_invoice_id)
    {

        try
        {
            Database = new DatabaseDataContext();
            if (purchase_invoice_id == 0)
            {
                return "'Null'";
            }

            var data = Database._PurchasedInvoiceSelect(purchase_invoice_id,0).ToList();

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

    public static string SinglePurchaseInvoiceDetails(long purchase_invoice_id)
    {

        try
        {
            Database = new DatabaseDataContext();
            if (purchase_invoice_id == 0)
            {
                return "'Null'";
            }

            var data = Database._PurchasedInvoiceDetailsSelect(purchase_invoice_id).ToList();

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


    public static string SinglePurchaseOrderDetails(long purchase_order_id)
    {

        try
        {
            Database = new DatabaseDataContext();
            if (purchase_order_id == 0)
            {
                return "'Null'";
            }

            var data = Database._PurchasedOrderDetailsSelect(purchase_order_id).ToList();

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

    public static string GetSingleSupplier(long supplier_id)
    {
        Database = new DatabaseDataContext();
        var data = Database._SupplierSelect(supplier_id, string.Empty);

        return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.None);
    }
    
    public static string AutoCompleteSupplier
    {
        get
        {
            try
            {
                Database = new DatabaseDataContext();
                var data = Database.SupplierSelect(0);


                List<AutoCompleteData> auto = new List<AutoCompleteData>();
                foreach (var item in data)
                {
                    auto.Add(new AutoCompleteData(item.ID, item.SupplierName, item.SupplierName));
                }

                return JsonConvert.SerializeObject(auto, Newtonsoft.Json.Formatting.None);

            }
            catch (Exception)
            {

            }

            return string.Empty;

        }
       

    }

}

public class Supplier
{
    public long ID { get; set; }
    public string SupplierName { get; set; }
    public string RegionProvince { get; set; }
    public string ContactPerson { get; set; }
    public string Telephone { get; set; }
    public string Fax { get; set; }
    public decimal Balance { get; set; }


}

public class PurchaseInvoice
{
    public long ID { get; set; }
    public string RefNo { get; set; }
    public DateTime CreatedDate { get; set; }
    public string SupplierName { get; set; }
    public decimal Amount { get; set; }
    public decimal Balance { get; set; }
    public string Status { get; set; }

}



public class PurchaseOrder
{
    public long ID { get; set; }
    public string RefNo { get; set; }
    public DateTime Date { get; set; }
    public string SupplierName { get; set; }
    public DateTime DeliveryDate { get; set; }
    public string CancelDate { get; set; }
    public decimal Amount { get; set; }
    public decimal Balance { get; set; }
    public string Status { get; set; }

}


