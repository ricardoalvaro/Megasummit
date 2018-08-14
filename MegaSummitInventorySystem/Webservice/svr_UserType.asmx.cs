using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Newtonsoft.Json;
using System.Web.Security;

namespace MegaSummitInventorySystem.Webservice
{
    /// <summary>
    /// Summary description for svr_UserType
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
     [System.Web.Script.Services.ScriptService]
    public class svr_UserType : System.Web.Services.WebService
    {

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }


        [WebMethod]
        public List<AutoCompleteData> AutoCompleteUserType()
        {
            try
            {
              
              string[] allRoles = Roles.GetAllRoles();


                List<AutoCompleteData> auto = new List<AutoCompleteData>();
                foreach (var item in allRoles)
                {
                    auto.Add(new AutoCompleteData(item, item, item));
                }

                return auto;

            }
            catch (Exception)
            {

            }

            return null;
        }

        [WebMethod]
        public string SelectUserType(string user_type)
        {
            try
            {
                string[] allRoles = Roles.GetAllRoles();
                if (string.IsNullOrEmpty(user_type))
                {
                    return JsonConvert.SerializeObject(allRoles, Newtonsoft.Json.Formatting.Indented);
                }
                else
                {
                    foreach (var item in allRoles)
                    {
                        if (item == user_type)
                        {
                            return JsonConvert.SerializeObject(item, Newtonsoft.Json.Formatting.Indented);
                        }
                    }
                }

                //return JsonConvert.SerializeObject(, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data";
        }


        [WebMethod]
        public bool InsertUserType(string role)
        {
            try
            {
                if (!Roles.RoleExists(role))
                {
                    Roles.CreateRole(role);

                }

                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }

        [WebMethod]
        public bool DeleteUserType(string role)
        {
            try
            {
                if (Roles.RoleExists(role))
                {
                    Roles.DeleteRole(role);
                }

                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }




    }
}
