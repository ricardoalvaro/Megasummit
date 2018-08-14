using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Newtonsoft.Json;


namespace MegaSummitInventorySystem.Webservice
{
    /// <summary>
    /// Summary description for svr_CompanySalesTax
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class svr_CompanySalesTax : System.Web.Services.WebService
    {
        private DatabaseDataContext Database = new DatabaseDataContext();

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }

        [WebMethod]
        public string SelectCompanySalesTax()
        {
            try
            {
                Database = new DatabaseDataContext();
                var data = Database._CompanySalesTaxSelect(0, 0, "", 0, "", "");

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch 
            {
                
            }

            return "Some error occur, Please contact the adminstrator";
        }

        [WebMethod]
        public bool InsertCompanySalesTax(long company_id, string tax_type, decimal rate, string tax_collected_amount, string tax_paid_account)
        {
            try
            {
                long? id = 0;
                Database = new DatabaseDataContext();
                Database._CompanySalesTaxInsert(ref id, company_id, tax_type, rate, tax_collected_amount, tax_paid_account);
                
                return true;

            }
            catch 
            {

            }

            return false;
        }

        [WebMethod]
        public bool UpdateCompanySalesTax(long id, long company_id, string tax_type, decimal rate, string tax_collected_amount, string tax_paid_account)
        {
            try
            {

                Database = new DatabaseDataContext();
                Database._CompanySalesTaxUpdate( id, company_id, tax_type, rate, tax_collected_amount, tax_paid_account);
                
                return true;

            }
            catch 
            {
                
            }

            return false;
        }

        [WebMethod]
        public bool DeleteCompanySalesTax(long id)
        {
            try
            {
                Database = new DatabaseDataContext();
                Database._CompanySalesTaxDelete(id);

                return true;
            }
            catch
            {
                
            }

            return false;
        }

    }
}
