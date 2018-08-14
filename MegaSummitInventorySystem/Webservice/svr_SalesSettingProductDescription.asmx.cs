using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Newtonsoft.Json;

namespace MegaSummitInventorySystem.Webservice
{
    /// <summary>
    /// Summary description for svr_SalesSettingProductDescription
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class svr_SalesSettingProductDescription : System.Web.Services.WebService
    {
        private DatabaseDataContext Database = new DatabaseDataContext();

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }


        [WebMethod]
        public string SelectSalesSettingProductDescription(long id, long sale_setting_id, long product_department_id)
        {
            try
            {

                Database = new DatabaseDataContext();
                var data = Database._SalesSettingProductDepartmentSelect(id, sale_setting_id, product_department_id);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data";
        }


        [WebMethod]
        public bool InsertSalesSettingProductDescription(long sale_setting_id, long product_department_id)
        {
            try
            {
                long? id = 0;
                Database = new DatabaseDataContext();
                Database._SalesSettingProductDepartmentInsert(ref id, sale_setting_id, product_department_id);
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }


        [WebMethod]
        public bool UpdateSalesSettingProductDescription(long id, long sale_setting_id, long product_department_id)
        {
            try
            {
                Database = new DatabaseDataContext();
                Database._SalesSettingProductDepartmentUpdate( id, sale_setting_id, product_department_id);
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }

        [WebMethod]
        public bool DeleteSalesSettingProductDescription(long id)
        {
            try
            {
                Database = new DatabaseDataContext();
                Database._SalesSettingProductDepartmentDelete(id);
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }
    }
}
