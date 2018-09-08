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


    public static string CompanyBankAutoComplete
    {
        get
        {
            try
            {
                Database = new DatabaseDataContext();
                var data = Database._Banks.ToList();


                List<AutoCompleteData> auto = new List<AutoCompleteData>();
                foreach (var item in data)
                {
                    auto.Add(new AutoCompleteData(item.ID, item.BankName, item.BankName));
                }


                return JsonConvert.SerializeObject(auto, Newtonsoft.Json.Formatting.None);
                //return auto;

            }
            catch (Exception)
            {

            }

            return null;
        }
    }

    public static string CompanyBankDetails
    {
        get
        {
            try
            {
                Database = new DatabaseDataContext();
                var data = Database._CompanyBankAccounts.ToList();


                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.None);
                //return auto;

            }
            catch (Exception)
            {

            }

            return null;
        }
    }



    public static string CompanyAccountAutoComplete
    {
        get
        {
            try
            {
                Database = new DatabaseDataContext();
                var data = Database._CompanyBankAccounts.ToList();


                List<AutoCompleteData> auto = new List<AutoCompleteData>();
                foreach (var item in data)
                {
                    auto.Add(new AutoCompleteData(item.ID, item.BankName, item.BankName));
                }


                return JsonConvert.SerializeObject(auto, Newtonsoft.Json.Formatting.None);
                //return auto;

            }
            catch (Exception)
            {

            }

            return null;
        }
    }

    public static string CompanyDefaultTax
    {
        get 
        {
            return new DatabaseDataContext()._CompanySalesTaxes.FirstOrDefault().Rate.Value.ToString("#");

        }
    }


}
