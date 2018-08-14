using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Newtonsoft.Json;

namespace MegaSummitInventorySystem.Webservice
{
    /// <summary>
    /// Summary description for svr_Contribution
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class svr_Contribution : System.Web.Services.WebService
    {
        private DatabaseDataContext Database = new DatabaseDataContext();


        [WebMethod]
        public List<AutoCompleteData> AutoCompleteContribution()
        {
            try
            {
                Database = new DatabaseDataContext();
                var data = Database._ContributionSelect(0, string.Empty);


                List<AutoCompleteData> auto = new List<AutoCompleteData>();
                foreach (var item in data)
                {
                    auto.Add(new AutoCompleteData(item.ID, item.ContributionName, item.ContributionName));
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
        public string SelectContribution(long id, string contribution_name)
        {
            try
            {

                Database = new DatabaseDataContext();
                var data = Database._ContributionSelect(id, contribution_name);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data";
        }

        [WebMethod]
        public bool InsertContribution(string contribution_name, string table_chunck)
        {
            try
            {
                long? id = 0;
                Database = new DatabaseDataContext();
                var data = Database._ContributionInsert(ref id, contribution_name);


                string[] table = table_chunck.Split('^');

                foreach (var item in table)
                {
                    string[] sep = item.ToString().Split(',');


                    if (!string.IsNullOrEmpty(sep[0]))
                    {
                        long? range_id = 0;
                        Database._ContributionSalaryRangeInsert(ref range_id, id, sep[0].ToString(), decimal.Parse(sep[1].ToString()), decimal.Parse(sep[2].ToString()));
                    }
                }

                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }



        [WebMethod]
        public bool UpdateContribution(long id, string contribution_name)
        {
            try
            {
                Database = new DatabaseDataContext();
                var data = Database._ContributionUpdate( id, contribution_name);

                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }

        [WebMethod]
        public bool DeleteContribution(long id)
        {
            try
            {
                Database = new DatabaseDataContext();
                var data = Database._ContributionDelete(id);

                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }



    }
}
