using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Newtonsoft.Json;


namespace MegaSummitInventorySystem.Webservice
{
    /// <summary>
    /// Summary description for svr_Unit
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class svr_Unit : System.Web.Services.WebService
    {
        private DatabaseDataContext Database = new DatabaseDataContext();

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }

        [WebMethod]
        public List<AutoCompleteData> AutoCompleteUnit()
        {
            try
            {
                Database = new DatabaseDataContext();
                var data = Database._UnitSelect(0, string.Empty,string.Empty);


                List<AutoCompleteData> auto = new List<AutoCompleteData>();
                foreach (var item in data)
                {
                    auto.Add(new AutoCompleteData(item.ID, item.UnitName, item.UnitName));
                }

                return auto;

            }
            catch (Exception)
            {

            }

            return null;
        }

        [WebMethod]
        public string SelectUnit(long id, string unit, string plural)
        {
            try
            {

                Database = new DatabaseDataContext();
                var data = Database._UnitSelect(id, unit, plural);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data";
        }


        [WebMethod]
        public bool InsertUnit(string unit, string plural)
        {
            try
            {
                long? id = 0;
                Database = new DatabaseDataContext();
                Database._UnitInsert(ref id, unit, plural);
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }


        [WebMethod]
        public bool UpdateUnit(long id, string unit, string plural)
        {
            try
            {
                Database = new DatabaseDataContext();
                Database._UnitUpdate( id, unit, plural);
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }


        [WebMethod]
        public bool DeleteUnit(long id)
        {
            try
            {
                Database = new DatabaseDataContext();
                Database._UnitDelete(id);
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }

    }
}
