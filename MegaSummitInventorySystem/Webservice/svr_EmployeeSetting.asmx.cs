using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Newtonsoft.Json;


namespace MegaSummitInventorySystem.Webservice
{
    /// <summary>
    /// Summary description for svr_EmployeeSetting
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    
    
    public class svr_EmployeeSetting : System.Web.Services.WebService
    {
        private DatabaseDataContext Database = new DatabaseDataContext();


        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }


        [WebMethod]
        public string SelectEmployeeSetting(long id)
        {
            try
            {

                Database = new DatabaseDataContext();
                var data = Database._EmployeeSettingSelect(id);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data";
        }

        [WebMethod]
        public bool InsertEmployeeSetting( string company_id, string employee_type, long employee_class_id, long department_id, string status, string day_off, string payment_method, string day_start, string break_out, string break_in, string day_end, string grace_period, string time_duration)
        {
            try
            {
                long? id = 0;
                Database = new DatabaseDataContext();
                Database._EmployeeSettingInsert(ref id, company_id, employee_type, employee_class_id, department_id, status, day_off, payment_method, day_start, break_out, break_in, day_end, grace_period, time_duration);
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }

        [WebMethod]
        public bool UpdateEmployeeSetting(long id, string company_id, string employee_type, long employee_class_id, long department_id, string status, string day_off, string payment_method, string day_start, string break_out, string break_in, string day_end, string grace_period, string time_duration)
        {
            try
            {
                Database = new DatabaseDataContext();
                Database._EmployeeSettingUpdate( id, company_id, employee_type, employee_class_id, department_id, status, day_off, payment_method, day_start, break_out, break_in, day_end, grace_period, time_duration);
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }

        [WebMethod]
        public bool DeleteEmployeeSetting(long id)
        {
            try
            {
                Database = new DatabaseDataContext();
                Database._EmployeeSettingDelete(id);
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }





    }
}
