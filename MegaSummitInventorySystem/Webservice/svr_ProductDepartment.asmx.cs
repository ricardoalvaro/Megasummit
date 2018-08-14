using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Newtonsoft.Json;

namespace MegaSummitInventorySystem.Webservice
{
    /// <summary>
    /// Summary description for svr_ProductDepartment
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class svr_ProductDepartment : System.Web.Services.WebService
    {

        private DatabaseDataContext Database = new DatabaseDataContext();

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }

        [WebMethod]
        public List<AutoCompleteData> AutoCompleteProduct()
        {
            try
            {
                Database = new DatabaseDataContext();
                var data = Database._ProductDepartmentSelect(0, string.Empty);


                List<AutoCompleteData> auto = new List<AutoCompleteData>();
                foreach (var item in data)
                {
                    auto.Add(new AutoCompleteData(item.ID, item.ProductDepartmentName, item.ProductDepartmentName));
                }

                return auto;

            }
            catch (Exception)
            {

            }

            return null;
        }

        [WebMethod]
        public string SelectProductDepartment(long id, string product_department_name)
        {

            try
            {
                Database = new DatabaseDataContext();
                var data = Database._ProductDepartmentSelect(id, product_department_name);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data";

        }


        [WebMethod]
        public bool InsertProductDepartment(string product_department_name, string table_chunk)
        {

            try
            {
                long? id = 0;
                Database = new DatabaseDataContext();
                var data = Database._ProductDepartmentInsert(ref id, product_department_name);


                string[] table = table_chunk.Split('^');

                foreach (var item in table)
                {
                    if (!string.IsNullOrEmpty(item))
                    {
                        long? range_id = 0;
                        Database._ProductClassInsert(ref range_id, id, item);
                    }
                }

                return true;
            }
            catch
            {

            }

            return false;

        }


        [WebMethod]
        public bool UpdateProductDepartment(long id, string product_department_name)
        {

            try
            {
                Database = new DatabaseDataContext();
                var data = Database._ProductDepartmentUpdate(id, product_department_name);

                return true;
            }
            catch
            {

            }

            return false;

        }


        [WebMethod]
        public bool DeleteProductDepartment(long id)
        {

            try
            {
                Database = new DatabaseDataContext();
                var data = Database._ProductDepartmentDelete(id);

                return true;
            }
            catch
            {

            }

            return false;

        }

    }
}
