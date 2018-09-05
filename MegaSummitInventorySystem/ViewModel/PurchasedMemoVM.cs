using MegaSummitInventorySystem;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Newtonsoft.Json;

public class PurchasedMemoVM
{

    private static DatabaseDataContext Database = new DatabaseDataContext();

    public static string PurchasedMemoList
    {
        get
        {
            try
            {
                Database = new DatabaseDataContext();
                var data = Database._PurchasedMemoSelect (0, 0);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.None);

            }
            catch (Exception)
            {
                return string.Empty;
            }
        }
    }

}
