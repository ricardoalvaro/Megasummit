using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Newtonsoft.Json;

namespace MegaSummitInventorySystem.Webservice
{
    /// <summary>
    /// Summary description for svr_CompanyBankAccount
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class svr_CompanyBankAccount : System.Web.Services.WebService
    {
        private DatabaseDataContext Database = new DatabaseDataContext();


        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }


        [WebMethod]
        public List<AutoCompleteData> AutoCompleteBankAccount()
        {
            try
            {
                Database = new DatabaseDataContext();
                var data = Database._CompanyBankAccountSelect(0, 0, "", "", "", "", "");


                List<AutoCompleteData> auto = new List<AutoCompleteData>();
                foreach (var item in data)
                {
                    auto.Add(new AutoCompleteData(item.ID, item.AccountName, item.AccountName));
                }

                return auto;

            }
            catch (Exception)
            {

            }

            return null;
        }

        //Select
        [WebMethod]
        public string SelectCompanyBankAccount(long id)
        {
            try
            {
                Database = new DatabaseDataContext();
                var data = Database._CompanyBankAccountSelect(id, 0, "", "", "", "", "");

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch 
            {
                
              
            }

            return "Error occur, Please contact the administrator";
        }


        [WebMethod]
        public bool InsertCompanyBankAccount(long company_id, string bank_name, string account_name, string account_type, string account_no, string branch, decimal opening_balance)
        {
            try
            {
                Database = new DatabaseDataContext();
                long? id =0;
                Database._CompanyBankAccountInsert(ref id, company_id, bank_name, account_name, account_type, account_no, branch, opening_balance);


                return true;
            }
            catch 
            {
                
            }

            return false;
        }


        [WebMethod]
        public bool UpdateCompanyBankAccount(long id, long company_id, string bank_name, string account_name, string account_type, string account_no, string branch, decimal opening_balance)
        {
            try
            {
                Database = new DatabaseDataContext();
                Database._CompanyBankAccountUpdate( id, company_id, bank_name, account_name, account_type, account_no, branch, opening_balance);
                return true;
            }
            catch (Exception)
            {
                
            }

            return false;
        }


        [WebMethod]
        public bool DeleteCompanyBankAccount(long id)
        {
            try
            {
                Database = new DatabaseDataContext();
                Database._CompanyBankAccountDelete(id);
                return true;
            }
            catch 
            {

            }

            return false;
        }



    }
}
