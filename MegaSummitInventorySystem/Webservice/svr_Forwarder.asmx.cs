using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Newtonsoft.Json;



namespace MegaSummitInventorySystem.Webservice
{
    /// <summary>
    /// Summary description for svr_Forwarder
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class svr_Forwarder : System.Web.Services.WebService
    {
        private DatabaseDataContext Database = new DatabaseDataContext();

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }

        [WebMethod]
        public List<AutoCompleteData> AutoCompleteForwarder()
        {
            try
            {
                Database = new DatabaseDataContext();
                var data = Database._ForwardedSelect(0, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty);


                List<AutoCompleteData> auto = new List<AutoCompleteData>();
                foreach (var item in data)
                {
                    auto.Add(new AutoCompleteData(item.ID, item.ForwardedName, item.ForwardedName));
                }

                return auto;

            }
            catch (Exception)
            {

            }

            return null;
        }




        [WebMethod]
        public string SelectForwarder(long id,string forwarder_name,string address,string contact_person,string telephone,string mobile_phone,string fax,string status,string area)
        {
            try
            {

                Database = new DatabaseDataContext();
                var data = Database._ForwardedSelect(id, forwarder_name, address, contact_person, telephone, mobile_phone, fax, status, area);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data";
        }

        [WebMethod]
        public bool InsertForwarder(string forwarder_name, string address, string contact_person, string telephone, string mobile_phone, string fax, string status, string area)
        {
            try
            {
                long? id = 0;
                Database = new DatabaseDataContext();
                Database._ForwardedInsert(ref id, forwarder_name, address, contact_person, telephone, mobile_phone, fax, status, area);
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }

        [WebMethod]
        public bool UpdateForwarder(long id, string forwarder_name, string address, string contact_person, string telephone, string mobile_phone, string fax, string status, string area)
        {
            try
            {

                Database = new DatabaseDataContext();
                Database._ForwardedUpdate( id, forwarder_name, address, contact_person, telephone, mobile_phone, fax, status, area);
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }


        [WebMethod]
        public bool DeleteForwarder(long id)
        {
            try
            {

                Database = new DatabaseDataContext();
                Database._ForwardedDelete(id);
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }
        





    }
}
