
using MegaSummitInventorySystem;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


public static class CustomerVM
{
    private static DatabaseDataContext Database = new DatabaseDataContext();

    public static string GetSingleCustomer(long customer_id)
    {
        Database = new DatabaseDataContext();
        var data = Database._CustomerSelect(customer_id, string.Empty);

        return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.None);
    }

    public static string Forwarders
    {
        get
        {
            Database = new DatabaseDataContext();
            var data = Database._Forwardeds.ToList<_Forwarded>();

            return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.None);
        }
    }


    public static string CustomerSettings
    {
        get
        {
            Database = new DatabaseDataContext();
            var data = Database._CustomerSettings.ToList<_CustomerSetting>();

            return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.None);
        }
    }

    public static string Terms
    {
        get
        {
            Database = new DatabaseDataContext();
            var data = Database._TermSelect(0,string.Empty).ToList<_TermSelectResult>();

            return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.None);
        }
    }

}
