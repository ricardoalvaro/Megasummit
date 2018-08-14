using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Newtonsoft.Json;


namespace MegaSummitInventorySystem.Webservice
{
    /// <summary>
    /// Summary description for svr_SupplierSetting
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    
    public class svr_SupplierSetting : System.Web.Services.WebService
    {

        private DatabaseDataContext Database = new DatabaseDataContext();

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }

        [WebMethod]
        public string SelectSupplierSetting(long id)
        {
            try
            {

                Database = new DatabaseDataContext();
                var data = Database._SupplierSettingSelect(id, 0, 0, 0, "", 0);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data";
        }


        [WebMethod]
        public bool InsertSupplierSetting( long company_id, long region_province_id, long term_id, string payment_method, int day_cancellation)
        {
            try
            {
                long? id = 0;
                Database = new DatabaseDataContext();
                Database._SupplierSettingInsert(ref id, company_id, region_province_id, term_id, payment_method, day_cancellation);
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }




        [WebMethod]
        public bool UpdateSupplierSetting(long id, long company_id, long region_province_id, long term_id, string payment_method, int day_cancellation)
        {
            try
            {
                
                Database = new DatabaseDataContext();
                Database._SupplierSettingUpdate( id, company_id, region_province_id, term_id, payment_method, day_cancellation);
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }

        [WebMethod]
        public bool DeleteSupplierSetting(long id)
        {
            try
            {

                Database = new DatabaseDataContext();
                Database._SupplierSettingDelete(id);
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }



    }
}
