using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Newtonsoft.Json;

namespace MegaSummitInventorySystem.Webservice
{
    /// <summary>
    /// Summary description for svr_Tax
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    
    public class svr_Tax : System.Web.Services.WebService
    {
        private DatabaseDataContext Database = new DatabaseDataContext();

        [WebMethod]
        public List<AutoCompleteData> AutoCompleteTax()
        {
            try
            {
                Database = new DatabaseDataContext();
                var data = Database._TaxSelect(0, string.Empty);


                List<AutoCompleteData> auto = new List<AutoCompleteData>();
                foreach (var item in data)
                {
                    auto.Add(new AutoCompleteData(item.ID, item.TaxName, item.TaxName));
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
        public string SelectTax(long id, string tax)
        {
            try
            {

                Database = new DatabaseDataContext();
                var data = Database._TaxSelect(id, tax);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data";
        }


        [WebMethod]
        public bool InsertTax(string tax, string table_chunck)
        {
            try
            {
                long? id = 0;
                Database = new DatabaseDataContext();
                Database._TaxInsert(ref id, tax);

                string[] table = table_chunck.Split('^');

                foreach (var item in table)
                {
                    string[] sep = item.ToString().Split(',');


                    if (!string.IsNullOrEmpty(sep[0]))
                    {
                        long? range_id = 0;
                        Database._TaxBracketInsert(ref range_id, id, sep[0].ToString(), decimal.Parse(sep[1].ToString()), decimal.Parse(sep[2].ToString()));
                    }
                }


                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }

        [WebMethod]
        public bool UpdateTax(long id,string tax)
        {
            try
            {
                Database = new DatabaseDataContext();
                Database._TaxUpdate( id, tax);
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }

        [WebMethod]
        public bool DeleteTax(long id)
        {
            try
            {
                Database = new DatabaseDataContext();
                Database._TaxDelete(id);
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }


    }
}
