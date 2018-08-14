using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Newtonsoft.Json;


namespace MegaSummitInventorySystem.Webservice
{
    /// <summary>
    /// Summary description for svr_SalesSetting
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class svr_SalesSetting : System.Web.Services.WebService
    {

        private DatabaseDataContext Database = new DatabaseDataContext();

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }

        [WebMethod]
        public List<AutoCompleteData> AutoCompleteSales()
        {
            try
            {
                Database = new DatabaseDataContext();
                var data = Database._SalesSettingSelect(0, 0, "", "", 0, 0, 0);


                List<AutoCompleteData> auto = new List<AutoCompleteData>();
                foreach (var item in data)
                {
                    auto.Add(new AutoCompleteData(item.ID, item.PrefixInitial, item.Description));
                }

                return auto;

            }
            catch (Exception)
            {

            }

            return null;
        }

        [WebMethod]
        public string SelectSalesSetting(long id)
        {
            try
            {

                Database = new DatabaseDataContext();
                var data = Database._SalesSettingSelect(id, 0, "", "", 0, 0, 0);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data";
        }

        [WebMethod]
        public bool InsertSalesSetting(long company_id, string prefix_initial, string description, bool automatic, int latest_no, int next_no, int maximum_line, string table_chunk)
        {
            try
            {
                long? id = 0;
                Database = new DatabaseDataContext();
                Database._SalesSettingInsert(ref id, company_id, prefix_initial, description, automatic, latest_no, next_no, maximum_line);


                string[] _table = table_chunk.Split(',');
                foreach (var i in _table){
                    if (!string.IsNullOrEmpty(i)){
                        long? xid = 0;
                        Database._SalesSettingProductDepartmentInsert(ref xid, id, long.Parse(i));
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
        public bool UpdateSalesSetting(long id, long company_id, string prefix_initial, string description, bool automatic, int latest_no, int next_no, int maximum_line, string table_chunk)
        {
            try
            {
                Database = new DatabaseDataContext();
                Database._SalesSettingUpdate( id, company_id, prefix_initial, description, automatic, latest_no, next_no, maximum_line);

                // delete all product department setting
                Database._SalesSettingProductDepartmentDeleteBySalesID(id);

                string[] _table = table_chunk.Split(',');
                foreach (var i in _table)
                {
                    if (!string.IsNullOrEmpty(i))
                    {
                        long? xid = 0;
                        Database._SalesSettingProductDepartmentInsert(ref xid, id, long.Parse(i));
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
        public bool DeleteSalesSetting(long id)
        {
            try
            {
                Database = new DatabaseDataContext();
                Database._SalesSettingDelete(id);
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }




    }
}
