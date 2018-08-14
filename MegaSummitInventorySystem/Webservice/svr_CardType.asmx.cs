using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Newtonsoft.Json;


namespace MegaSummitInventorySystem.Webservice
{
    /// <summary>
    /// Summary description for svr_CardType
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class svr_CardType : System.Web.Services.WebService
    {
        private DatabaseDataContext Database = new DatabaseDataContext();

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }


        [WebMethod]
        public List<AutoCompleteData> AutoCompleteCardType()
        {
            try
            {
                Database = new DatabaseDataContext();
                var data = Database._CardTypeSelect(0, string.Empty);


                List<AutoCompleteData> auto = new List<AutoCompleteData>();
                foreach (var item in data)
                {
                    auto.Add(new AutoCompleteData(item.ID, item.CardTypeName, item.CardTypeName));
                }

                return auto;

            }
            catch (Exception)
            {

            }

            return null;
        }

        [WebMethod]
        public string SelectCardType(long id, string card_type)
        {
            try
            {

                Database = new DatabaseDataContext();
                var data = Database._CardTypeSelect(id, card_type);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data";
        }


        [WebMethod]
        public bool InsertCardType(string card_type)
        {
            try
            {
                long? id = 0;
                Database = new DatabaseDataContext();
                Database._CardTypeInsert(ref id, card_type);
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }

        [WebMethod]
        public bool UpdateCardType(long id, string card_type)
        {
            try
            {
                Database = new DatabaseDataContext();
                Database._CardTypeUpdate(id, card_type);
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }

        [WebMethod]
        public bool DeleteCardType(long id)
        {
            try
            {
                Database = new DatabaseDataContext();
                Database._CardTypeDelete(id);
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }



    }
}
