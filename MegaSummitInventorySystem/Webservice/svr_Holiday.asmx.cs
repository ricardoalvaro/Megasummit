using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Newtonsoft.Json;


namespace MegaSummitInventorySystem.Webservice
{
    /// <summary>
    /// Summary description for svr_Holiday
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class svr_Holiday : System.Web.Services.WebService
    {
        private DatabaseDataContext Database = new DatabaseDataContext();

        [WebMethod]
        public List<AutoCompleteData> AutoCompleteHoliday()
        {
            try
            {
                Database = new DatabaseDataContext();
                var data = Database._HolidaySelect(0, string.Empty);


                List<AutoCompleteData> auto = new List<AutoCompleteData>();
                foreach (var item in data)
                {
                    auto.Add(new AutoCompleteData(item.ID, item.HolidayName, item.HolidayName));
                }

                return auto;

            }
            catch (Exception)
            {

            }

            return null;
        }

        [WebMethod]
        public string SelectHoliday(long id, string holiday_name)
        {

            try
            {
                Database = new DatabaseDataContext();
                var data = Database._HolidaySelect(id, holiday_name);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data";

        }

        [WebMethod]
        public bool InsertHoliday(string holiday_name)
        {
            try
            {
                long? id = 0;
                Database = new DatabaseDataContext();
                Database._HolidayInsert(ref id, holiday_name);
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }

        [WebMethod]
        public bool UpdateHoliday(long id, string holiday_name)
        {
            try
            {
                Database = new DatabaseDataContext();
                Database._HolidayUpdate(id, holiday_name);
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }

        [WebMethod]
        public bool DeleteHoliday(long id)
        {
            try
            {
                Database = new DatabaseDataContext();
                Database._HolidayDelete(id);
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }
    }
}
