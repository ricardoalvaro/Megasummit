using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Newtonsoft.Json;


namespace MegaSummitInventorySystem.Webservice
{
    /// <summary>
    /// Summary description for svr_ReasonOfReturn
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class svr_ReasonOfReturn : System.Web.Services.WebService
    {

        private DatabaseDataContext Database = new DatabaseDataContext();


        [WebMethod]
        public List<AutoCompleteData> AutoCompleteReasonOfReturn()
        {
            try
            {
                Database = new DatabaseDataContext();
                var data = Database._ReasonOfReturnSelect(0, string.Empty);


                List<AutoCompleteData> auto = new List<AutoCompleteData>();
                foreach (var item in data)
                {
                    auto.Add(new AutoCompleteData(item.ID, item.ReturnName, item.ReturnName));
                }

                return auto;

            }
            catch (Exception)
            {

            }

            return null;
        }

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }


        [WebMethod]
        public string SelectReasonOfReturn(long id, string return_name)
        {
            try
            {

                Database = new DatabaseDataContext();
                var data = Database._ReasonOfReturnSelect(id, return_name);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data";
        }

        [WebMethod]
        public bool InsertReasonOfReturn(string return_name)
        {
            try
            {
                long? id = 0;
                Database = new DatabaseDataContext();
                Database._ReasonOfReturnInsert(ref id, return_name);
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }


        [WebMethod]
        public bool UpdateReasonOfReturn(long id, string return_name)
        {
            try
            {
                Database = new DatabaseDataContext();
                Database._ReasonOfReturnUpdate( id, return_name);
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }


        [WebMethod]
        public bool DeleteReasonOfReturn(long id )
        {
            try
            {
                Database = new DatabaseDataContext();
                Database._ReasonOfReturnDelete(id);
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }

    }
}
