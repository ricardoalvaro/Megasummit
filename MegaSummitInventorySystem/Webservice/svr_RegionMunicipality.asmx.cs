using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Newtonsoft.Json;

namespace MegaSummitInventorySystem.Webservice
{
    /// <summary>
    /// Summary description for svr_RegionMunicipality
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]


    public class svr_RegionMunicipality : System.Web.Services.WebService
    {
        private DatabaseDataContext Database = new DatabaseDataContext();

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }


        [WebMethod]
        public string SelectRegionMunicipality(long id, long region_id)
        {

            try
            {
                Database = new DatabaseDataContext();
                var data = Database._RegionMunicipalitySelect(id, region_id);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data";

        }

        [WebMethod]
        public bool InsertRegionMunicipality(long region_id, string municipality_name)
        {

            try
            {
                Database = new DatabaseDataContext();
                long? id = 0;
                var data = Database._RegionMunicipalityInsert(ref id, region_id, municipality_name);

                return true;
            }
            catch
            {

            }

            return false;

        }

        [WebMethod]
        public bool UpdateRegionMunicipality(long id, long region_id, string municipality_name)
        {

            try
            {

                if (id == 0)
                {
                    long? xid = 0;
                    Database = new DatabaseDataContext();
                    var data = Database._RegionMunicipalityInsert(ref xid, region_id, municipality_name);
                }
                else
                {
                    Database = new DatabaseDataContext();
                    var data = Database._RegionMunicipalityUpdate(id, region_id, municipality_name);
                }
                return true;
            }
            catch
            {

            }

            return false;

        }


        [WebMethod]
        public bool DeleteRegionMunicipality(long id)
        {

            try
            {
                Database = new DatabaseDataContext();
                var data = Database._RegionMunicipalityDelete(id);

                return true;
            }
            catch
            {

            }

            return false;

        }




    }
}
