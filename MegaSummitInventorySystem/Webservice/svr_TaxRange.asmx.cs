using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Newtonsoft.Json;

namespace MegaSummitInventorySystem.Webservice
{
    /// <summary>
    /// Summary description for svr_TaxRange
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]

    public class svr_TaxRange : System.Web.Services.WebService
    {
        private DatabaseDataContext Database = new DatabaseDataContext();

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }

        [WebMethod]
        public string SelectTaxRange(long id,long tax_id)
        {
            try
            {

                Database = new DatabaseDataContext();
                var data = Database._TaxBracketSelect(id, tax_id, string.Empty, 0, 0);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data";
        }

        [WebMethod]
        public bool InsertTaxRange(long tax_id,string tax_bracket, decimal tax_based, decimal tax_rate)
        {
            try
            {
                long? id = 0;
                Database = new DatabaseDataContext();
                Database._TaxBracketInsert(ref id, tax_id, tax_bracket, tax_based, tax_rate);
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }

        [WebMethod]
        public bool UpdateTaxRange(long id, long tax_id, string tax_bracket, decimal tax_based, decimal tax_rate)
        {
            try
            {

                if (id == 0)
                {
                    long? xid = 0;
                    Database = new DatabaseDataContext();
                    var data = Database._TaxBracketInsert(ref xid, tax_id, tax_bracket, tax_based, tax_rate);
                }
                else
                {
                    Database = new DatabaseDataContext();
                    Database._TaxBracketUpdate(id, tax_id, tax_bracket, tax_based, tax_rate);
                }
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }

        [WebMethod]
        public bool DeleteTaxRange(long id)
        {
            try
            {
                Database = new DatabaseDataContext();
                Database._TaxBracketDelete(id);
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }


    }
}
