using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Newtonsoft.Json;

namespace MegaSummitInventorySystem.Webservice
{
    /// <summary>
    /// Summary description for svr_Terms
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class svr_Terms : System.Web.Services.WebService
    {
        private DatabaseDataContext Database = new DatabaseDataContext();

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }

        [WebMethod]
        public List<AutoCompleteData> AutoCompleteTerms()
        {
            try
            {
                Database = new DatabaseDataContext();
                var data = Database._TermSelect(0, string.Empty);


                List<AutoCompleteData> auto = new List<AutoCompleteData>();
                foreach (var item in data)
                {
                    auto.Add(new AutoCompleteData(item.ID, item.TermName, item.TermName));
                }

                return auto;

            }
            catch (Exception)
            {

            }

            return null;
        }

        [WebMethod]
        public string SelectTerm(long id, string term_name)
        {
            try
            {

                Database = new DatabaseDataContext();
                var data = Database._TermSelect(id, term_name);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data";
        }


        [WebMethod]
        public bool InsertTerm(string term_name)
        {
            try
            {
                long? id = 0;
                Database = new DatabaseDataContext();
                Database._TermInsert(ref id, term_name);
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }

        [WebMethod]
        public bool UpdateTerm(long id, string term_name)
        {
            try
            {
                Database = new DatabaseDataContext();
                Database._TermUpdate(id, term_name);
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }


        [WebMethod]
        public bool DeleteTerm(long id)
        {
            try
            {
                Database = new DatabaseDataContext();
                Database._TermDelete(id);
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }


    }
}
