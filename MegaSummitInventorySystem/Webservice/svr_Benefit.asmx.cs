using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Newtonsoft.Json;


namespace MegaSummitInventorySystem.Webservice
{
    /// <summary>
    /// Summary description for svr_Benefit
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class svr_Benefit : System.Web.Services.WebService
    {
        private DatabaseDataContext Database = new DatabaseDataContext();

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }

        [WebMethod]
        public List<AutoCompleteData> AutoCompleteBenefit()
        {
            try
            {
                Database = new DatabaseDataContext();
                var data = Database._BenefitSelect(0, "", 0, 0, 0, 0, false, false);


                List<AutoCompleteData> auto = new List<AutoCompleteData>();
                foreach (var item in data)
                {
                    auto.Add(new AutoCompleteData(item.ID, item.BenefitName, item.BenefitName));
                }

                return auto;

            }
            catch (Exception)
            {

            }

            return null;
        }

        [WebMethod]
        public string SelectBenefit(long id,string benefit_name)
        {
            try
            {

                Database = new DatabaseDataContext();
                var data = Database._BenefitSelect(id, benefit_name, 0, 0, 0, 0, false, false);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data";
        }


        [WebMethod]
        public bool InsertBenefit(string benefit_name, decimal day_allocated, decimal add_to_year, decimal used_leave, decimal balance, bool accumulation, bool cash_conversion)
        {
            try
            {
                long? id = 0;
                Database = new DatabaseDataContext();
                Database._BenefitInsert(ref id, benefit_name, day_allocated, add_to_year, used_leave, balance, accumulation, cash_conversion);

                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }


        [WebMethod]
        public bool UpdateBenefit(long id, string benefit_name, decimal day_allocated, decimal add_to_year, decimal used_leave, decimal balance, bool accumulation, bool cash_conversion)
        {
            try
            {
         
                Database = new DatabaseDataContext();
                Database._BenefitUpdate( id, benefit_name, day_allocated, add_to_year, used_leave, balance, accumulation, cash_conversion);

                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }

        [WebMethod]
        public bool DeleteBenefit(long id)
        {
            try
            {
                Database = new DatabaseDataContext();
                Database._BenefitDelete(id);

                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }

    }
}
