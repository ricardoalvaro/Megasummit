using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Newtonsoft.Json;

namespace MegaSummitInventorySystem.Webservice
{
    /// <summary>
    /// Summary description for svr_DeductionSalaryRange
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class svr_DeductionSalaryRange : System.Web.Services.WebService
    {
        private DatabaseDataContext Database = new DatabaseDataContext();

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }

        [WebMethod]
        public string SelectDeductionSalaryRange(long id, long deduction_id)
        {
            try
            {

                Database = new DatabaseDataContext();
                var data = Database._DeductionSalaryRangeSelect(id, deduction_id, string.Empty, 0, 0);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data";
        }

        [WebMethod]
        public bool InsertDeduction( long deduction_id, string salary_range, decimal employee, decimal employer)
        {
            try
            {
                long? id = 0;
                Database = new DatabaseDataContext();
                var data = Database._DeductionSalaryRangeInsert(ref id, deduction_id, salary_range, employer, employer);

                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }

        [WebMethod]
        public bool UpdateDeduction(long id, long deduction_id, string salary_range, decimal employee, decimal employer)
        {
            try
            {

                if (id == 0)
                {
                    long? xid = 0;
                    Database = new DatabaseDataContext();
                    var data = Database._DeductionSalaryRangeInsert(ref xid, deduction_id, salary_range, employee, employer);
                }
                else
                {
                    Database = new DatabaseDataContext();
                    var data = Database._DeductionSalaryRangeUpdate(id, deduction_id, salary_range, employee, employer);
                }

                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }


        [WebMethod]
        public bool DeleteDeduction(long id)
        {
            try
            {

                Database = new DatabaseDataContext();
                var data = Database._DeductionSalaryRangeDelete(id);

                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }
    }
}
