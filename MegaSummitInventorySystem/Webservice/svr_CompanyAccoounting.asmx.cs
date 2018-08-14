using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Newtonsoft.Json;


namespace MegaSummitInventorySystem.Webservice
{
    /// <summary>
    /// Summary description for svr_CompanyAccoounting
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class svr_CompanyAccoounting : System.Web.Services.WebService
    {
        private DatabaseDataContext Database = new DatabaseDataContext();

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }

        [WebMethod]
        public string SelectCompanyAccounting(long id, long company_id, string current_financial_year, string last_month_financial_year, string converstion_month)
        {
            try
            {
                Database = new DatabaseDataContext();
                var data = Database._CompanyAccountingSelect(id, company_id, current_financial_year, last_month_financial_year, converstion_month);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch 
            {
             
            }

            return "Error occur, Please contact the administrator";
        }

        [WebMethod]
        public bool InsertCompanyAccounting(long company_id, string current_financial_year, string last_month_financial_year, string converstion_month)
        {
            try
            {
                long? id = 0;
                Database = new DatabaseDataContext();
                Database._CompanyAccountingInsert(ref id, company_id, current_financial_year, last_month_financial_year, converstion_month);
                return true;
            }
            catch 
            {
                
            }

            return false;
        }

        [WebMethod]
        public bool UpdateCompanyAccounting(long id, long company_id, string current_financial_year, string last_month_financial_year, string converstion_month)
        {
            try
            {
                Database = new DatabaseDataContext();
                Database._CompanyAccountingUpdate( id, company_id, current_financial_year, last_month_financial_year, converstion_month);
                return true;
            }
            catch 
            {
                
            }

            return false;
        }

        [WebMethod]
        public bool DeleteCompanyAccounting(long id)
        {
            try
            {
                Database = new DatabaseDataContext();
                Database._CompanyAccountingDelete(id);
                return true;
            }
            catch
            {
                
            }

            return false;

        }



    }
}
