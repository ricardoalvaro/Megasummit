using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Newtonsoft.Json;

namespace MegaSummitInventorySystem.Webservice
{
    /// <summary>
    /// Summary description for svr_Location
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class svr_Location : System.Web.Services.WebService
    {
        private DatabaseDataContext Database = new DatabaseDataContext();

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }


        [WebMethod]
        public List<AutoCompleteData> AutoCompleteLocation()
        {
            try
            {
                Database = new DatabaseDataContext();
                var data = Database._LocationSelect(0, string.Empty);


                List<AutoCompleteData> auto = new List<AutoCompleteData>();
                foreach (var item in data)
                {
                    auto.Add(new AutoCompleteData(item.ID, item.LocationName, item.LocationName));
                }

                return auto;

            }
            catch (Exception)
            {
              
            }

            return null;
        }


        [WebMethod]
        public string SelectLocation(long id, string location_name)
        {

            try
            {
                Database = new DatabaseDataContext();
                var data = Database._LocationSelect(id, location_name);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data";

        }


        [WebMethod]
        public bool InsertLocation(string location_name)
        {
            try
            {
                long? id = 0;
                Database = new DatabaseDataContext();
                Database._LocationInsert(ref id, location_name);
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }


        [WebMethod]
        public bool UpdateLocation(long id, string location_name)
        {
            try
            {
                Database = new DatabaseDataContext();
                Database._LocationUpdate(id, location_name);
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }

        [WebMethod]
        public bool DeleteLocation(long id)
        {
            try
            {
                Database = new DatabaseDataContext();
                Database._LocationDelete(id);
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }
    }
}
