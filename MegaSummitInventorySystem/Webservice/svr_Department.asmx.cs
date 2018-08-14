using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Newtonsoft.Json;


namespace MegaSummitInventorySystem.Webservice
{
    /// <summary>
    /// Summary description for svr_Department
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class svr_Department : System.Web.Services.WebService
    {
        private DatabaseDataContext Database = new DatabaseDataContext();


        [WebMethod]
        public List<AutoCompleteData> AutoCompleteDepartment()
        {
            try
            {
                Database = new DatabaseDataContext();
                var data = Database._DepartmentSelect(0, string.Empty);


                List<AutoCompleteData> auto = new List<AutoCompleteData>();
                foreach (var item in data)
                {
                    auto.Add(new AutoCompleteData(item.ID, item.DepartmentName, item.DepartmentName));
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
        public string SelectDepartment(long id, string department_name)
        {

            try
            {
                Database = new DatabaseDataContext();
                var data = Database._DepartmentSelect(id, department_name);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data";

        }

        [WebMethod]
        public bool InsertDepartment(string department_name)
        {
            try
            {
                long? id = 0;
                Database = new DatabaseDataContext();
                Database._DepartmentInsert(ref id, department_name);
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }



        [WebMethod]
        public bool UpdateDepartment(long id, string department_name)
        {
            try
            {
                Database = new DatabaseDataContext();
                Database._DepartmentUpdate( id, department_name);
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }

        [WebMethod]
        public bool DeleteDepartment(long id)
        {
            try
            {
                Database = new DatabaseDataContext();
                Database._DepartmentDelete(id);
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }
    }
}
