using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Newtonsoft.Json;


namespace MegaSummitInventorySystem.Webservice
{
    /// <summary>
    /// Summary description for svr_SubUnit
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]


    public class svr_SubUnit : System.Web.Services.WebService
    {
        private DatabaseDataContext Database = new DatabaseDataContext();

        [WebMethod]
        public List<AutoCompleteData> AutoCompleteSubUnit()
        {
            try
            {
                Database = new DatabaseDataContext();
                var data = Database._SubUnitSelect(0, string.Empty, string.Empty);


                List<AutoCompleteData> auto = new List<AutoCompleteData>();
                foreach (var item in data)
                {
                    auto.Add(new AutoCompleteData(item.ID, item.SubUnitName, item.SubUnitName));
                }

                return auto;

            }
            catch (Exception)
            {

            }

            return null;
        }

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }

        [WebMethod]
        public string SelectSubUnit(long id, string sub_unit_name, string plural)
        {
            try
            {

                Database = new DatabaseDataContext();
                var data = Database._SubUnitSelect(id, sub_unit_name, plural);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data";
        }

        [WebMethod]
        public bool InsertSubUnit(string sub_unit_name, string plural)
        {
            try
            {
                long? id = 0;
                Database = new DatabaseDataContext();
                Database._SubUnitInsert(ref id, sub_unit_name, plural);
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }


        [WebMethod]
        public bool UpdateSubUnit(long id, string sub_unit_name, string plural)
        {
            try
            {
                Database = new DatabaseDataContext();
                Database._SubUnitUpdate( id, sub_unit_name, plural);
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }


        [WebMethod]
        public bool DeleteSubUnit(long id)
        {
            try
            {
                Database = new DatabaseDataContext();
                Database._SubUnitDelete(id);
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }

       
    }
}
