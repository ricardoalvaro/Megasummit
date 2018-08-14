using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Newtonsoft.Json;

namespace MegaSummitInventorySystem.Webservice
{
    /// <summary>
    /// Summary description for svr_UserAccess
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class svr_UserAccess : System.Web.Services.WebService
    {
        private DatabaseDataContext Database = new DatabaseDataContext();

        [WebMethod]
        public string SelectUserAccess(long id, string user_id)
        {
            try
            {
                
                Database = new DatabaseDataContext();
                var data = Database._UserAccessSelect( id, user_id,false,"","");

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data";
        }

         [WebMethod]
        public bool InsertUserAccess(string user_id,bool has_access, string page_name,string url)
        {
            try
            {
                long? id = 0;
                Database = new DatabaseDataContext();
                Database._UserAccessInsert(ref id,user_id,has_access ,page_name, url);
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }


         [WebMethod]
         public bool UpdateUserAccess(long id, bool has_access)
         {
             try
             {
                 Database = new DatabaseDataContext();
                 Database._UserAccessUpdate(id, has_access);
                 return true;
             }
             catch (Exception)
             {
                 
                 //throw;
             }
             return false;
         }


        [WebMethod]
        public bool DeleteUserAccess(long id)
        {
            try
            {
                Database = new DatabaseDataContext();
                Database._UserAccessDelete( id );
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }





     


    }
}
