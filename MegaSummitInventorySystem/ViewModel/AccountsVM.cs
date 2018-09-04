using MegaSummitInventorySystem;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Newtonsoft.Json;


public class AccountsVM
{
    private static DatabaseDataContext Database = new DatabaseDataContext();


    public static string Accounts
    {
        get
        {
            try
            {
                Database = new DatabaseDataContext();
                var data = Database._Accounts.ToList<_Account>();

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.None);

            }
            catch (Exception)
            {
                return string.Empty;
            }
        }
    }
}
