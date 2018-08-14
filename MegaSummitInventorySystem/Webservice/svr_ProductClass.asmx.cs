using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Newtonsoft.Json;


namespace MegaSummitInventorySystem.Webservice
{
    /// <summary>
    /// Summary description for svr_ProductClass
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class svr_ProductClass : System.Web.Services.WebService
    {
        private DatabaseDataContext Database = new DatabaseDataContext();

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }


        [WebMethod]
        public string SelectProductClass(long id, long product_department_id)
        {

            try
            {
                Database = new DatabaseDataContext();
                var data = Database._ProductClassSelect(id, product_department_id);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data";

        }


        [WebMethod]
        public bool InsertProductClass(long product_department_id, string product_class_name)
        {

            try
            {
                long? id = 0;

                Database = new DatabaseDataContext();
                Database._ProductClassInsert(ref id, product_department_id, product_class_name);

                return true;
            }
            catch
            {

            }

            return false;

        }

        [WebMethod]
        public bool UpdateProductClass(long id, long product_department_id, string product_class_name)
        {

            try
            {
                if (id == 0)
                {
                    long? idx = 0;

                    Database = new DatabaseDataContext();
                    Database._ProductClassInsert(ref idx, product_department_id, product_class_name);

                }
                else
                {
                    Database = new DatabaseDataContext();
                    Database._ProductClassUpdate(id, product_department_id, product_class_name);

                }
                
                return true;
            }
            catch
            {

            }

            return false;

        }


        [WebMethod]
        public bool DeleteProductClass(long id)
        {

            try
            {

                Database = new DatabaseDataContext();
                Database._ProductClassDelete(id);

                return true;
            }
            catch
            {

            }

            return false;

        }
    }
}
