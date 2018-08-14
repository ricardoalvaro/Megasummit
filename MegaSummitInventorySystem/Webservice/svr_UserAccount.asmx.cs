using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.Services;

namespace MegaSummitInventorySystem.Webservice
{
    /// <summary>
    /// Summary description for svr_UserAccount
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class svr_UserAccount : System.Web.Services.WebService
    {

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }

        private DatabaseDataContext Database = new DatabaseDataContext();

        [WebMethod]
        public string AllRoles()
        {
            
            try
            {
                //Database = new DatabaseDataContext();

                List<UserType> _roles = new List<UserType>();

                string[] GetAllRoles = Roles.GetAllRoles();

                foreach (var item in GetAllRoles)
                {
                    _roles.Add( new UserType(item) );
                }

                return JsonConvert.SerializeObject(_roles, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data";


        }


        [WebMethod]
        public string AllPosition()
        {
            try
            {
                Database = new DatabaseDataContext();
                var data = Database._UserPositions.ToList();

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data";
        }


        [WebMethod]
        public bool CreateAccount(string name, string position, string status, string user_name, string password, string role)
        {
            Database = new DatabaseDataContext();
            string user_id = string.Empty;

            MembershipMethod mm = new MembershipMethod();


            if (mm.CreateUser(ref user_id, user_name, password, user_name + "@justemail.com", role))
            {
                Database._UserAccountInsert(user_id, name, user_name, password, role, position, status);

                //load all access


            }
            else
            {
                return false;
            }

            return true;
        }

        [WebMethod]
        public string GetAllUsers(string userID, string name, string userName, string roles, string position, string status)
        {
            try
            {
                Database = new DatabaseDataContext();
                var data = Database._UserAccountSelect(userID, name, userName, string.Empty, roles, position, status);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data";

        }

        [WebMethod]
        public bool UpdateAccount(string user_id, string name, string position, string status, string user_name, string password, string role)
        {

            try
            {

                string Role = string.Empty;
                string[] UserRoles = Roles.GetRolesForUser(user_name);
                foreach (var item in UserRoles)
                {
                    Role = item;
                    break;
                }


                Roles.RemoveUserFromRole(user_name, Role);
                Roles.AddUserToRole(user_name, role);

                bool account_status = false;

                if (status.ToLower() == "open")
                {
                    account_status = true;
                }

                MembershipUser mu = Membership.GetUser(user_name);
                mu.IsApproved = account_status;
                bool xx = mu.UnlockUser();
                Membership.UpdateUser(mu);
                bool x = mu.ChangePassword(mu.ResetPassword(), password);



                //-- update on database ----------------------------
                Database = new DatabaseDataContext();
                Database._UserAccountUpdate(user_id, name, user_name, password, role, position, status);


                return true;
            }
            catch
            {

            }

            return false;



        }

        [WebMethod]
        public bool DeleteAccount(string user_name, string user_id, string role)
        {
            try
            {


                Membership.DeleteUser(user_name, true);

                //Roles.RemoveUserFromRole(user_name, role);

                //------------delete on database-----------------
                Database = new DatabaseDataContext();

                Database._UserAccountDelete(user_id);
                return true;

            }
            catch
            {

            }
            return false;
        }




    }

    public class UserType
    {

        public UserType(string _roles)
        {
            Roles = _roles;
        }

        public string Roles { get; set; }
    }
}
