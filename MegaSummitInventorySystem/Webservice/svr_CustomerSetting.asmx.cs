using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Newtonsoft.Json;


namespace MegaSummitInventorySystem.Webservice
{
    /// <summary>
    /// Summary description for svr_CustomerSetting
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class svr_CustomerSetting : System.Web.Services.WebService
    {
        private DatabaseDataContext Database= new DatabaseDataContext();

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }

        [WebMethod]
        public string SelectCustomerSetting(long id)
        {
            try
            {

                Database = new DatabaseDataContext();
                var data = Database._CustomerSettingSelect(id, 0, "", "", 0, 0, "", "");

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data";
        }



        [WebMethod]
        public bool InsertCustomerSetting( long company_id, string price_level, string status, long term_id, decimal credit, string sales_reference, string payment_method)
        {
            try
            {
                long? id = 0;
                Database = new DatabaseDataContext();
                Database._CustomerSettingInsert(ref id, company_id, price_level, status, term_id, credit, sales_reference, payment_method);
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }

        [WebMethod]
        public bool UpdateCustomerSetting(long id, long company_id, string price_level, string status, long term_id, decimal credit, string sales_reference, string payment_method)
        {
            try
            {
                Database = new DatabaseDataContext();
                Database._CustomerSettingUpdate( id, company_id, price_level, status, term_id, credit, sales_reference, payment_method);
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }

        [WebMethod]
        public bool DeleteCustomerSetting(long id)
        {
            try
            {
                Database = new DatabaseDataContext();
                Database._CustomerSettingDelete(id);
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }

    }
}
