using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Newtonsoft.Json;

namespace MegaSummitInventorySystem.Webservice
{
    /// <summary>
    /// Summary description for svr_Region
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class svr_Region : System.Web.Services.WebService
    {
        private DatabaseDataContext Database = new DatabaseDataContext();

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }

        [WebMethod]
        public List<AutoCompleteData> AutoCompleteRegion()
        {
            try
            {
                Database = new DatabaseDataContext();
                var data = Database._RegionSelect(0, string.Empty);


                List<AutoCompleteData> auto = new List<AutoCompleteData>();
                foreach (var item in data)
                {
                    auto.Add(new AutoCompleteData(item.ID, item.RegionName, item.RegionName));
                }

                return auto;

            }
            catch (Exception)
            {

            }

            return null;
        }


        [WebMethod]
        public string SelectRegion(long id, string region_name)
        {
            try
            {
                Database = new DatabaseDataContext();
                var data = Database._RegionSelect(id, region_name);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data";
        }

        [WebMethod]
        public bool InsertRegion(string region_name, string table_chunk)
        {
            try
            {
                long? id = 0;
                Database = new DatabaseDataContext();
                Database._RegionInsert(ref id, region_name);

                string[] table = table_chunk.Split('^');

                foreach (var item in table)
                {


                    if (!string.IsNullOrEmpty(item))
                    {
                        long? range_id = 0;
                        Database._RegionMunicipalityInsert(ref range_id,id,item);
                    }
                }



                
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }


        [WebMethod]
        public bool UpdateRegion(long id, string region_name)
        {
            try
            {
                Database = new DatabaseDataContext();
                Database._RegionUpdate(id, region_name);
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }


        [WebMethod]
        public bool DeleteRegion(long id)
        {
            try
            {
                Database = new DatabaseDataContext();
                Database._RegionDelete( id);
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }








    }
}
