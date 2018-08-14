using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Newtonsoft.Json;


namespace MegaSummitInventorySystem.Webservice
{
    /// <summary>
    /// Summary description for svr_Company
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class svr_Company : System.Web.Services.WebService
    {
        private DatabaseDataContext Database = new DatabaseDataContext();

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }


        [WebMethod]
        public string GetCompany(long company_id, string company_name)
        {

            try
            {
                Database = new DatabaseDataContext();
                var data = Database._CompanySelect(company_id, company_name);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data";

        }

        [WebMethod]
        public bool UpdateCompany(long id, string image_path, string company_name, string address, string telephone, string fax, string vat_no, string tin_no, string website, string email)
        {
            try
            {
                Database._CompanyUpdate(id, image_path, company_name, address, telephone, fax, vat_no, tin_no, website, email);
                return true;
            }
            catch (Exception)
            {
                
               
            }

            return false;
        }

    }
}
