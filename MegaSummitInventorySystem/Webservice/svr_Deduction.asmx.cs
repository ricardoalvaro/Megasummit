using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Newtonsoft.Json;

namespace MegaSummitInventorySystem.Webservice
{
    /// <summary>
    /// Summary description for svr_Deduction
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class svr_Deduction : System.Web.Services.WebService
    {
        private DatabaseDataContext Database = new DatabaseDataContext();

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }

        [WebMethod]
        public List<AutoCompleteData> AutoCompleteDeduction()
        {
            try
            {
                Database = new DatabaseDataContext();
                var data = Database._DeductionSelect(0, string.Empty);


                List<AutoCompleteData> auto = new List<AutoCompleteData>();
                foreach (var item in data)
                {
                    auto.Add(new AutoCompleteData(item.ID, item.DeductionName, item.DeductionName));
                }

                return auto;

            }
            catch (Exception)
            {

            }

            return null;
        }


        [WebMethod]
        public string SelectDeduction(long id, string deduction_name)
        {
            try
            {

                Database = new DatabaseDataContext();
                var data = Database._DeductionSelect(id, deduction_name);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data";
        }

        [WebMethod]
        public bool InsertDeduction(string deduction_name, string table_chunck)
        {
            try
            {
                long? id = 0;
                Database = new DatabaseDataContext();
                var data = Database._DeductionInsert(ref id, deduction_name);

                string[] table = table_chunck.Split('^');

                foreach (var item in table)
                {
                    string[] sep = item.ToString().Split(',');

                    
                    if (!string.IsNullOrEmpty(sep[0]))
                    {
                        long? range_id = 0;
                        Database._DeductionSalaryRangeInsert(ref range_id, id, sep[0].ToString(), decimal.Parse(sep[1].ToString()), decimal.Parse(sep[2].ToString())); 
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
        public bool UpdateDeduction(long? id , string deduction_name)
        {
            try
            {
                Database = new DatabaseDataContext();
                var data = Database._DeductionUpdate( id, deduction_name);

                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }

        [WebMethod]
        public bool DeleteDeduction(long? id)
        {
            try
            {
                Database = new DatabaseDataContext();
                var data = Database._DeductionDelete(id);

                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }


    }
}
