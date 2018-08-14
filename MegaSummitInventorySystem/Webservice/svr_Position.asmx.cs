using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Newtonsoft.Json;


namespace MegaSummitInventorySystem.Webservice
{
    /// <summary>
    /// Summary description for svr_Position
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class svr_Position : System.Web.Services.WebService
    {
        private DatabaseDataContext Database = new DatabaseDataContext();




        [WebMethod]
        public List<AutoCompleteData> AutoCompletePosition()
        {
            try
            {
                Database = new DatabaseDataContext();
                var data = Database._PositionSelect(0, string.Empty);


                List<AutoCompleteData> auto = new List<AutoCompleteData>();
                foreach (var item in data)
                {
                    auto.Add(new AutoCompleteData(item.ID, item.PositionName, item.PositionName));
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
        public string SelectPosition(long id, string position_name)
        {

            try
            {
                Database = new DatabaseDataContext();
                var data = Database._PositionSelect(id, position_name);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data";

        }



        [WebMethod]
        public bool InsertPosition(string position_name)
        {
            try
            {
                long? id = 0;
                Database = new DatabaseDataContext();
                Database._PositionInsert(ref id, position_name);
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }

        [WebMethod]
        public bool UpdatePosition(long id , string position_name)
        {
            try
            {
                
                Database = new DatabaseDataContext();
                Database._PositionUpdate( id, position_name);
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }


        [WebMethod]
        public bool DeletePosition(long id)
        {
            try
            {

                Database = new DatabaseDataContext();
                Database._PositionDelete(id);
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }

    }
}
