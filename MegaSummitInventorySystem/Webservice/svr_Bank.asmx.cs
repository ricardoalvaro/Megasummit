using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Newtonsoft.Json;

namespace MegaSummitInventorySystem.Webservice
{
    /// <summary>
    /// Summary description for svr_Bank
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class svr_Bank : System.Web.Services.WebService
    {




        [WebMethod]
        public List<AutoCompleteData> AutoCompleteBank()
        {
            try
            {
                Database = new DatabaseDataContext();
                var data = Database._BankSelect(0, string.Empty);


                List<AutoCompleteData> auto = new List<AutoCompleteData>();
                foreach (var item in data)
                {
                    auto.Add(new AutoCompleteData(item.ID, item.BankName, item.BankName));
                }

                return auto;

            }
            catch (Exception)
            {

            }

            return null;
        }


        private DatabaseDataContext Database = new DatabaseDataContext();

        [WebMethod]
        public string SelectBank(long id, string bank_name)
        {
            try
            {
                
                Database = new DatabaseDataContext();
                var data = Database._BankSelect( id, bank_name);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data";
        }


        [WebMethod]
        public bool InsertBank(string bank_name)
        {
            try
            {
                long? id = 0;
                Database = new DatabaseDataContext();
                Database._BankInsert(ref id, bank_name);
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }



        [WebMethod]
        public bool UpdateBank(long id, string bank_name)
        {
            try
            {
                
                Database = new DatabaseDataContext();
                Database._BankUpdate( id, bank_name);
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }


        [WebMethod]
        public bool DeleteBank(long id)
        {
            try
            {

                Database = new DatabaseDataContext();
                Database._BankDelete(id);
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }


    }
}
