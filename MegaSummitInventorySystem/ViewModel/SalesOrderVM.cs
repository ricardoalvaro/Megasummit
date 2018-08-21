using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MegaSummitInventorySystem;
using Newtonsoft.Json;


public class SalesOrderVM
{
    private static DatabaseDataContext Database = new DatabaseDataContext();

    public static string SingleSalesOrder(long sales_order_id)
    {

        try
        {
            Database = new DatabaseDataContext();
            if (sales_order_id == 0)
            {
                return "'Null'";
            }

            var data = Database._SalesOrderSelect(sales_order_id).ToList();

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


    public static string SingleSalesOrderDetails(long sales_order_id)
    {

        try
        {
            Database = new DatabaseDataContext();
            if (sales_order_id == 0)
            {
                return "'Null'";
            }

            var data = Database._SalesOrderDetailsSelect(sales_order_id).ToList();

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

    public static string CustomerSalesOrderDetails(long customer_id)
    {

        try
        {
            Database = new DatabaseDataContext();
            if (customer_id == 0)
            {
                return "'Null'";
            }

            var data = Database._SalesOrderSelectByCustomer(customer_id).ToList();

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
