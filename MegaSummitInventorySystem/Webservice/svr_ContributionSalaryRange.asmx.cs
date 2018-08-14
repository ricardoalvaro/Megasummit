using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Newtonsoft.Json;


namespace MegaSummitInventorySystem.Webservice
{
    /// <summary>
    /// Summary description for svr_ContributionSalaryRange
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class svr_ContributionSalaryRange : System.Web.Services.WebService
    {
        private DatabaseDataContext Database = new DatabaseDataContext();

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }


        [WebMethod]
        public string SelectContributionSalaryRange(long id, long contribution_id)
        {
            try
            {

                Database = new DatabaseDataContext();
                var data = Database._ContributionSalaryRangeSelect(id, contribution_id, string.Empty, 0, 0);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data";
        }

        [WebMethod]
        public bool InsertContributionSalaryRange( long contribution_id, string salary_range, decimal employee, decimal employer)
        {
            try
            {
                long? id = 0;
                Database = new DatabaseDataContext();
                Database._ContributionSalaryRangeInsert(ref id, contribution_id, salary_range, employee, employer);
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }


        [WebMethod]
        public bool UpdateContributionSalaryRange(long id ,long contribution_id, string salary_range, decimal employee, decimal employer)
        {
            try
            {
                if (id == 0)
                {
                    long? xid = 0;
                    Database = new DatabaseDataContext();
                    var data = Database._ContributionSalaryRangeInsert(ref xid, contribution_id, salary_range, employee, employer);
                }
                else
                {

                    Database = new DatabaseDataContext();
                    Database._ContributionSalaryRangeUpdate(id, contribution_id, salary_range, employee, employer);
                }
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }

        [WebMethod]
        public bool DeleteContributionSalaryRange(long id)
        {
            try
            {
                Database = new DatabaseDataContext();
                Database._ContributionSalaryRangeDelete(id);
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }



    }
}
