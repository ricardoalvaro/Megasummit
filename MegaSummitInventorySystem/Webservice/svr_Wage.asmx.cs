using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Newtonsoft.Json;


namespace MegaSummitInventorySystem.Webservice
{
    /// <summary>
    /// Summary description for svr_Wage
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class svr_Wage : System.Web.Services.WebService
    {
        private DatabaseDataContext Database = new DatabaseDataContext();

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }

        [WebMethod]
        public List<AutoCompleteData> AutoCompleteWages()
        {
            try
            {
                Database = new DatabaseDataContext();
                var data = Database._WageSelect(0, string.Empty, string.Empty, 0);


                List<AutoCompleteData> auto = new List<AutoCompleteData>();
                foreach (var item in data)
                {
                    auto.Add(new AutoCompleteData(item.ID, item.WageName, item.WageName));
                }

                return auto;

            }
            catch (Exception)
            {

            }

            return null;
        }

        [WebMethod]
        public string SelectWage(long id, string wage_name,string wage_type,decimal multiple_by)
        {
            try
            {

                Database = new DatabaseDataContext();
                var data = Database._WageSelect(id, wage_name, wage_type, multiple_by);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data";
        }

        [WebMethod]
        public bool InsertWage( string wage_name, string wage_type, decimal multiple_by)
        {
            try
            {
                long? id = 0;
                Database = new DatabaseDataContext();
                var data = Database._WageInsert(ref id, wage_name, wage_type, multiple_by);

                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }


        [WebMethod]
        public bool UpdateWage(long id, string wage_name, string wage_type, decimal multiple_by)
        {
            try
            {
                
                Database = new DatabaseDataContext();
                var data = Database._WageUpdate( id, wage_name, wage_type, multiple_by);

                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }


        [WebMethod]
        public bool DeleteWage(long id)
        {
            try
            {

                Database = new DatabaseDataContext();
                var data = Database._WageDelete(id);

                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }



    }
}
