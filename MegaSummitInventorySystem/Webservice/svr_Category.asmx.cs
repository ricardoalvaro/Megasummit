using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Newtonsoft.Json;

namespace MegaSummitInventorySystem.Webservice
{
    /// <summary>
    /// Summary description for svr_Category
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class svr_Category : System.Web.Services.WebService
    {
        private DatabaseDataContext Database = new DatabaseDataContext();

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }

        [WebMethod]
        public List<AutoCompleteData> AutoCompleteCategory()
        {
            try
            {
                Database = new DatabaseDataContext();
                var data = Database._CategorySelect(0, string.Empty);


                List<AutoCompleteData> auto = new List<AutoCompleteData>();
                foreach (var item in data)
                {
                    auto.Add(new AutoCompleteData(item.ID, item.CategoryName, item.CategoryName));
                }

                return auto;

            }
            catch (Exception)
            {

            }

            return null;
        }



        [WebMethod]
        public string SelectCategory(long id, string category_name)
        {

            try
            {
                Database = new DatabaseDataContext();
                var data = Database._CategorySelect(id, category_name);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data";

        }



        [WebMethod]
        public bool InsertCategory(string category_name)
        {
            try
            {
                long? id = 0;
                Database = new DatabaseDataContext();
                Database._CategoryInsert(ref id, category_name);
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }

        [WebMethod]
        public bool UpdateCategory(long id , string category_name)
        {
            try
            {
                Database = new DatabaseDataContext();
                Database._CategoryUpdate( id, category_name);
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }


        [WebMethod]
        public bool DeleteCategory(long id)
        {
            try
            {
                Database = new DatabaseDataContext();
                Database._CategoryDelete(id);
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }



    }
}
