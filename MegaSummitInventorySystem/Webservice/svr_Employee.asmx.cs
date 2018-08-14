using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Newtonsoft.Json;

namespace MegaSummitInventorySystem.Webservice
{
    /// <summary>
    /// Summary description for svr_Employee
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class svr_Employee : System.Web.Services.WebService
    {
        // -------------------------------------------------------------- Initialize Database Connectoin
        private DatabaseDataContext Database = new DatabaseDataContext();

        #region AutoComplete Data

        // -------------------------------------------------------------- Employee AutoComplete
        [WebMethod]
        public List<AutoCompleteData> AutoCompleteEmployee()
        {
            try
            {
                Database = new DatabaseDataContext();
                var data = Database._EmployeeSelect(0, string.Empty);


                List<AutoCompleteData> auto = new List<AutoCompleteData>();
                foreach (var item in data)
                {
                    auto.Add(new AutoCompleteData(item.ID, item.EmployeeName, item.EmployeeName));
                }

                return auto;

            }
            catch (Exception)
            {

            }

            return null;
        }

        #endregion

        #region Selecting Data

        // --------------------------------------------------------------- Select Employee
        [WebMethod]
        public string SelectEmployee(long id, string employee_name)
        {

            try
            {
                Database = new DatabaseDataContext();
                var data = Database._EmployeeSelect(id, employee_name);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data";

        }

        // --------------------------------------------------------------- Select Employee Class
        [WebMethod]
        public string SelectEmployeeClass()
        {

            try
            {
                Database = new DatabaseDataContext();
                var data = Database._EmployeeClasses.ToList();

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data";

        }

        // --------------------------------------------------------------- Select Department
        [WebMethod]
        public string SelectDepartment()
        {

            try
            {
                Database = new DatabaseDataContext();
                var data = Database._Departments.ToList();

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data";

        }

        #endregion

        #region Inserting Data

        // --------------------------------------------------------------- Insert Employee
        [WebMethod]
        public bool InsertEmployee(string employee_picture, string employee_name, string address, string contact_person, string spouse_name, string phone, string mobile_phone, string civil_status, DateTime birthdate, string email, string notes, string employee_type, string tax_status, long employee_class, string tin_number, long department, string sss_number, string status, string philhealth_number, decimal cash_bond, string pagibig_number)
        {

            try
            {
                long? id = 0;

                Database = new DatabaseDataContext();
                Database._EmployeeInsert(ref id, employee_picture, employee_name, address, contact_person, spouse_name, phone, mobile_phone, civil_status, birthdate, email, notes, employee_type, employee_class, department, status, cash_bond, tax_status, tin_number, sss_number, philhealth_number, pagibig_number);

                return true;
            }
            catch
            {

            }

            return false;

        }

        #endregion

        #region Updating Data

        // --------------------------------------------------------------- Updating Data
        [WebMethod]
        public bool UpdateEmployee(long id, string employee_picture, string employee_name, string address, string contact_person, string spouse_name, string phone, string mobile_phone, string civil_status, DateTime birthdate, string email, string notes, string employee_type, long employee_class, long department, string status, decimal cash_bond, string tax_status, string tin_number, string sss_number, string philhealth_number, string pagibig_number)
        {

            try
            {

                Database = new DatabaseDataContext();
                Database._EmployeeUpdate(id, employee_picture, employee_name, address, contact_person, spouse_name, phone, mobile_phone, civil_status, birthdate, email, notes, employee_type, employee_class, department, status, cash_bond, tax_status, tin_number, sss_number, philhealth_number, pagibig_number);


                return true;
            }
            catch
            {

            }

            return false;

        }

        #endregion

        #region Deleting Data

        [WebMethod]
        public bool DeleteProduct(long id)
        {

            try
            {

                Database = new DatabaseDataContext();
                Database._EmployeeDelete(id);

                return true;
            }
            catch
            {

            }

            return false;

        }

        #endregion

    }
}
