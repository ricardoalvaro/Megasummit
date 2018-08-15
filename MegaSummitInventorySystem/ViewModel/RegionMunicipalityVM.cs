using MegaSummitInventorySystem;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


public static class RegionMunicipalityVM
    {
        private static DatabaseDataContext Database = new DatabaseDataContext();

        public static string Regions
        {
            get
            {

                Database = new DatabaseDataContext();
                var data = Database._Regions.ToList<_Region>();


                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.None);
            }


        }

        public static string Municipalities
        {
            get
            {

                Database = new DatabaseDataContext();
                var data = Database._RegionMunicipalities.ToList();

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.None);
            }


        }




    }
