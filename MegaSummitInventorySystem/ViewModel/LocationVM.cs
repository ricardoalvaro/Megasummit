using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MegaSummitInventorySystem;
using Newtonsoft.Json;

public class LocationVM
{
    private static DatabaseDataContext Database = new DatabaseDataContext();

    public static string AutoCompleteLocation
    {
        get
        {
            try
            {
                Database = new DatabaseDataContext();
                var data = Database._Locations.ToList();


                List<AutoCompleteData> auto = new List<AutoCompleteData>();
                foreach (var item in data)
                {
                    auto.Add(new AutoCompleteData(item.ID, item.LocationName, item.LocationName));
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

}
