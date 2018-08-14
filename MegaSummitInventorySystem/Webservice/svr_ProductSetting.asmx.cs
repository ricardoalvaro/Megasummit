using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Newtonsoft.Json;


namespace MegaSummitInventorySystem.Webservice
{
    /// <summary>
    /// Summary description for svr_ProductSetting
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class svr_ProductSetting : System.Web.Services.WebService
    {
        private DatabaseDataContext Database = new DatabaseDataContext();


        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }


        [WebMethod]
        public string SelectProductSetting(long id, long company_id, long product_department_id, long location_id, long reason_of_adjustment)
        {
            try
            {

                Database = new DatabaseDataContext();
                var data = Database._ProductSettingSelect(id, company_id, product_department_id, location_id, reason_of_adjustment);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data";
        }

        [WebMethod]
        public bool InsertProductSetting(long company_id, long product_department_id, long location_id, long reason_of_adjustment)
        {
            try
            {
                long? id = 0;
                Database = new DatabaseDataContext();
                Database._ProductSettingInsert(ref id, company_id, product_department_id, location_id, reason_of_adjustment);
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }

        [WebMethod]
        public bool UpdateProductSetting(long id, long company_id, long product_department_id, long location_id, long reason_of_adjustment)
        {
            try
            {
                Database = new DatabaseDataContext();
                Database._ProductSettingUpdate( id, company_id, product_department_id, location_id, reason_of_adjustment);
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }


        [WebMethod]
        public bool DeleteProductSetting(long id)
        {
            try
            {
                Database = new DatabaseDataContext();
                Database._ProductSettingDelete(id);
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }






    }
}
