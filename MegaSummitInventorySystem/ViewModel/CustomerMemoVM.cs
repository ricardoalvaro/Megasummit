using MegaSummitInventorySystem;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Newtonsoft.Json;



public class CustomerMemoVM
{
    private static DatabaseDataContext Database = new DatabaseDataContext();

    public static string CustomerMemoList
    {
        get
        {
            try
            {
                Database = new DatabaseDataContext();
                var data = Database._InvoiceMemoSelect(0, 0);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.None);

            }
            catch (Exception)
            {
                return string.Empty;
            }
        }
    }
}
