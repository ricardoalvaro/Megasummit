using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MegaSummitInventorySystem;
using Newtonsoft.Json;

public class ProductVM
{

    private static DatabaseDataContext Database = new DatabaseDataContext();

    public static string ReturnNetPrice(string _disc, decimal amount)
    {
        string[] textArr1 = _disc.Split('+');
        decimal discountedAmount = amount;

        for (var i = 0; i < textArr1.Length; i++)
        {
            var ss = textArr1[i].ToString();
            if (ss.IndexOf("-") != -1)
            {
                string[] textArr2 = { };
                textArr2 = textArr1[i].Split('-');

                for (var z = 0; z < textArr2.Length; z++)
                {
                    if (z == 0)
                    {
                        if (!string.IsNullOrEmpty(textArr2[z]))
                        {
                            var disPer = decimal.Parse(textArr2[z]) / 100;
                            var discount = discountedAmount * disPer;
                            discountedAmount = discountedAmount + discount;
                        }
                    }
                    else
                    {
                        if (!string.IsNullOrEmpty(textArr2[z]))
                        {
                            var disPer = decimal.Parse(textArr2[z]) / 100;
                            var discount = (discountedAmount) * (disPer);
                            discountedAmount = discountedAmount - discount;
                        }
                    }
                }
            }
            else
            {
                if (!string.IsNullOrEmpty(textArr1[i]))
                {
                    var disPer = decimal.Parse(textArr1[i]) / 100;
                    var discount = (discountedAmount) * (disPer);
                    discountedAmount = discountedAmount + discount;
                }
           
            }
        }

        return (discountedAmount).ToString("N");
    }

    public static string Units
    {
        get {
            try
            {
                Database = new DatabaseDataContext();
                var data = Database._Units.ToList<_Unit>();

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.None);
                //return auto;

            }
            catch (Exception)
            {

            }

            return null;
        }
    }

    public static string Packings
    {
        get {
            try
            {
                Database = new DatabaseDataContext();
                var data = Database._PackingSelect(0, 0, 0, 0, 0).ToList();
                
                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.None);
                //return auto;

            }
            catch (Exception)
            {

            }

            return null;
        }
    }

    public static string AutoCompleteProduct
    {
        get
        {
            try
            {
                Database = new DatabaseDataContext();
                var data = Database._Products.ToList();


                List<AutoCompleteData> auto = new List<AutoCompleteData>();
                foreach (var item in data)
                {
                    auto.Add(new AutoCompleteData(item.ID, item.ProductName, item.ProductName));
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

  

    public static string ProductDetail
    {
        get
        {
            try
            {
                Database = new DatabaseDataContext();
                var data = Database._ProductSelect(0, string.Empty).ToList();
                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.None);
                //return auto;

            }
            catch (Exception)
            {

            }

            return null;
        }
    }
}
