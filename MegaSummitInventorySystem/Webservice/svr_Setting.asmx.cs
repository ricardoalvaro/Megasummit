using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Newtonsoft.Json;


namespace MegaSummitInventorySystem.Webservice
{
    /// <summary>
    /// Summary description for svr_Setting
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class svr_Setting : System.Web.Services.WebService
    {
        private DatabaseDataContext Database = new DatabaseDataContext();
        
        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }

        [WebMethod]
        public string SelectSetting(long id,  string setting_name)
        {
            try
            {

                Database = new DatabaseDataContext();
                var data = Database._SettingSelect(id, 0, setting_name, string.Empty, string.Empty, false, 0, 0);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data";
        }

        [WebMethod]
        public bool UpdateSetting(long id, string prefix, string description, bool automatic, int latest_no, int next_no)
        {
            try
            {

                Database = new DatabaseDataContext();
                var data = Database._SettingUpdate(id, 0, string.Empty, prefix, description, automatic, latest_no, next_no);

                return true;
            }
            catch
            {

            }

            return false;
        }
    }
}
