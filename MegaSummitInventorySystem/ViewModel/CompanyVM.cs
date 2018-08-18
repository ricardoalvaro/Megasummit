using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MegaSummitInventorySystem;
using Newtonsoft.Json;


public class CompanyVM
{

    private static DatabaseDataContext Database = new DatabaseDataContext();


    public static string CompanySalesTax
    {
        get
        {
            try
            {
                Database = new DatabaseDataContext();
                var data = Database._CompanySalesTaxes.ToList<_CompanySalesTax>();

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.None);

            }
            catch (Exception)
            {
                return string.Empty;
            }
        }
    }


    public static string Company
    {
        get
        {
            try
            {
                Database = new DatabaseDataContext();
                var data = Database._Companies.ToList<_Company>();

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.None);

            }
            catch (Exception)
            {
                return string.Empty;
            }
        }
    }
}
