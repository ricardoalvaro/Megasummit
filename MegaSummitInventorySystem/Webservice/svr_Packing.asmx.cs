using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Newtonsoft.Json;


namespace MegaSummitInventorySystem.Webservice
{
    /// <summary>
    /// Summary description for svr_Packing
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class svr_Packing : System.Web.Services.WebService
    {

        private DatabaseDataContext Database = new DatabaseDataContext();

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }


        [WebMethod]
        public List<AutoCompleteData> AutoCompletePacking()
        {
            try
            {
                Database = new DatabaseDataContext();
                var data = Database._PackingSelect(0, 0, 0, 0, 0);


                List<AutoCompleteData> auto = new List<AutoCompleteData>();
                foreach (var item in data)
                {
                    auto.Add(new AutoCompleteData(item.ID, item.Packing + " - " + item.UnitName + " - " + item.Packing2 + " - " + item.SubUnitName, item.Packing + " - " + item.UnitName + " - " + item.Packing2 + " - " + item.SubUnitName));
                }

                return auto;

            }
            catch (Exception)
            {

            }

            return null;
        }

        [WebMethod]
        public string SelectPacking(long id, long packing,long unit_id,long packing2,long sub_unit_id)
        {
            try
            {

                Database = new DatabaseDataContext();
                var data = Database._PackingSelect(id, packing, unit_id, packing2, sub_unit_id);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data";
        }


        [WebMethod]
        public bool InsertPacking(long packing, long unit_id, long packing2, long sub_unit_id)
        {
            try
            {
                long? id = 0;
                Database = new DatabaseDataContext();
                Database._PackingInsert(ref id, packing, unit_id, packing2, sub_unit_id);
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }

        [WebMethod]
        public bool UpdatePacking(long id, long packing, long unit_id, long packing2, long sub_unit_id)
        {
            try
            {
                Database = new DatabaseDataContext();
                Database._PackingUpdate( id, packing, unit_id, packing2, sub_unit_id);
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }



        [WebMethod]
        public bool DeletePacking(long id)
        {
            try
            {
                Database = new DatabaseDataContext();
                Database._PackingDelete(id);
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }
    }
}
