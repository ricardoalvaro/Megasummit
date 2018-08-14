using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Newtonsoft.Json;

namespace MegaSummitInventorySystem.Webservice
{
    /// <summary>
    /// Summary description for srv_CompanyTaxExemption
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class srv_CompanyTaxExemption : System.Web.Services.WebService
    {

        private DatabaseDataContext Database = new DatabaseDataContext();

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }

        [WebMethod]
        public List<AutoCompleteData> AutoCompleteTax()
        {
            try
            {
                Database = new DatabaseDataContext();
                var data = Database._CompanyTaxExemptions.ToList();


                List<AutoCompleteData> auto = new List<AutoCompleteData>();
                foreach (var item in data)
                {
                    auto.Add(new AutoCompleteData(item.ID, item.TaxCode, item.TaxCode));
                }

                return auto;

            }
            catch (Exception)
            {

            }

            return null;
        }



        [WebMethod]
        public string SelectCompanyTaxExemption(long id, long company_id, string tax_code, string description, decimal amount)
        {
            try
            {
                Database = new DatabaseDataContext();
                var data = Database._CompanyTaxExemptionSelect(id, company_id, tax_code, description, amount);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {


            }

            return "Error occur, Please contact the administrator";
        }

        [WebMethod]
        public bool InsertCompanyTaxExemption(long company_id, string tax_code, string description, decimal amount)
        {
            try
            {
                Database = new DatabaseDataContext();
                long? id = 0;
                Database._CompanyTaxExemptionInsert(ref id, company_id, tax_code, description, amount);


                return true;
            }
            catch
            {

            }

            return false;
        }

        [WebMethod]
        public bool UpdateCompanyTaxExemption(long id, long company_id, string tax_code, string description, decimal amount)
        {
            try
            {
                Database = new DatabaseDataContext();
                Database._CompanyTaxExemptionUpdate(id, company_id, tax_code, description, amount);


                return true;
            }
            catch
            {

            }

            return false;
        }

        [WebMethod]
        public bool DeleteCompanyTaxExemption(long id)
        {
            try
            {
                Database = new DatabaseDataContext();
                Database._CompanyTaxExemptionDelete(id);


                return true;
            }
            catch
            {

            }

            return false;
        }

    }
}
