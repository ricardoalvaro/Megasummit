using MegaSummitInventorySystem;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


public class SalesVM
{
    private static DatabaseDataContext Database = new DatabaseDataContext();

    public static string SalesSetting
    {
        get
        {
            Database = new DatabaseDataContext();
            var data = Database._SalesSettingSelect(0, 0, string.Empty, string.Empty, 0, 0, 0).ToList<_SalesSettingSelectResult>();

            return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.None);
        }
    }


    public static string Remarks
    {
        get
        {
            Database = new DatabaseDataContext();

            var data = Database._RemarksSelect(0, string.Empty);
            return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.None);
        }
    }



}
