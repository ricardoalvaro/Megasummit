using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Newtonsoft.Json;


namespace MegaSummitInventorySystem.Webservice
{
    /// <summary>
    /// Summary description for svr_EmployeeClass
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class svr_EmployeeClass : System.Web.Services.WebService
    {
        private DatabaseDataContext Database = new DatabaseDataContext();


        [WebMethod]
        public List<AutoCompleteData> AutoCompleteEmployeeClass()
        {
            try
            {
                Database = new DatabaseDataContext();
                var data = Database._EmployeeClassSelect(0, string.Empty);


                List<AutoCompleteData> auto = new List<AutoCompleteData>();
                foreach (var item in data)
                {
                    auto.Add(new AutoCompleteData(item.ID, item.EmployeeClassName, item.EmployeeClassName));
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
        public string SelectEmployeeClass(long id, string employee_class_name)
        {

            try
            {
                Database = new DatabaseDataContext();
                var data = Database._EmployeeClassSelect(id, employee_class_name);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data";

        }

        [WebMethod]
        public bool InsertEmployeeClass(string employee_class_name)
        {
            try
            {
                long? id = 0;
                Database = new DatabaseDataContext();
                Database._EmployeeClassInsert(ref id, employee_class_name);
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }


        [WebMethod]
        public bool UpdateEmployeeClass(long id , string employee_class_name)
        {
            try
            {

                Database = new DatabaseDataContext();
                Database._EmployeeClassUpdate( id, employee_class_name);
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }

        [WebMethod]
        public bool DeleteEmployeeClass(long id)
        {
            try
            {

                Database = new DatabaseDataContext();
                Database._EmployeeClassDelete(id);
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }



    }
}
