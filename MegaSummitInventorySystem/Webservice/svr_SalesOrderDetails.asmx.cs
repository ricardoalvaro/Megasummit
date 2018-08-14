using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Newtonsoft.Json;


namespace MegaSummitInventorySystem.Webservice
{
    /// <summary>
    /// Summary description for svr_SalesOrderDetails
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class svr_SalesOrderDetails : System.Web.Services.WebService
    {

        private DatabaseDataContext Database = new DatabaseDataContext();

        //[WebMethod]
        //public List<AutoCompleteData> AutoCompleteHoliday()
        //{
        //    try
        //    {
        //        Database = new DatabaseDataContext();
        //        var data = Database._HolidaySelect(0, string.Empty);


        //        List<AutoCompleteData> auto = new List<AutoCompleteData>();
        //        foreach (var item in data)
        //        {
        //            auto.Add(new AutoCompleteData(item.ID, item.HolidayName, item.HolidayName));
        //        }

        //        return auto;

        //    }
        //    catch (Exception)
        //    {

        //    }

        //    return null;
        //}

        //[WebMethod]
        //public string SelectHoliday(long id, string holiday_name)
        //{

        //    try
        //    {
        //        Database = new DatabaseDataContext();
        //        var data = Database._HolidaySelect(id, holiday_name);

        //        return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
        //    }
        //    catch
        //    {

        //    }

        //    return "Error on returning data";

        //}

        [WebMethod]
        public bool InsertSalesOrderDetails(long sales_order_id,long product_id,long location_id,decimal quantity,decimal served,long unit_id,decimal unit_price,string discount,decimal amount)
        {
            try
            {
                long? id = 0;
                Database = new DatabaseDataContext();
                Database._SalesOrderDetailsInsert(ref id,sales_order_id,product_id,location_id,quantity,served,unit_id,unit_price,discount,amount);
                return true;
            }
            catch (Exception)
            {

            }

            return false;
        }

        [WebMethod]
        public bool UpdateSalesOrderDetails(long id, long sales_order_id, long product_id, long location_id, decimal quantity, decimal served, long unit_id, decimal unit_price, string discount, decimal amount)
        {
            try
            {
                Database = new DatabaseDataContext();
                Database._SalesOrderDetailsUpdate( id, sales_order_id, product_id, location_id, quantity, served, unit_id, unit_price, discount, amount);
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }

        [WebMethod]
        public bool DeleteSalesOrderDetails(long id)
        {
            try
            {
                Database = new DatabaseDataContext();
                Database._SalesOrderDetailsDelete(id);
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }



    }
}
