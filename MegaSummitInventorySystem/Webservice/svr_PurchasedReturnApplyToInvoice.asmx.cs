using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Newtonsoft.Json;


namespace MegaSummitInventorySystem.Webservice
{
    /// <summary>
    /// Summary description for svr_PurchasedReturnApplyToInvoice
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class svr_PurchasedReturnApplyToInvoice : System.Web.Services.WebService
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
        public bool InsertPurchasedReturnApplyToInvoice(long purchasedReturnID,string referenceNo,DateTime createdDate,string description,decimal balance,decimal applyAmt)
        {
            try
            {
                long? id = 0;
                Database = new DatabaseDataContext();
                Database._PurchasedReturnApplyToInvoiceInsert(ref id, purchasedReturnID, referenceNo, createdDate, description, balance, applyAmt);
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }

        [WebMethod]
        public bool UpdatePurchasedReturnApplyToInvoice(long id, long purchasedReturnID, string referenceNo, DateTime createdDate, string description, decimal balance, decimal applyAmt)
        {
            try
            {
                Database = new DatabaseDataContext();
                Database._PurchasedReturnApplyToInvoiceUpdate( id, purchasedReturnID, referenceNo, createdDate, description, balance, applyAmt);
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }

        [WebMethod]
        public bool DeletePurchasedReturnApplyToInvoice(long id)
        {
            try
            {
                Database = new DatabaseDataContext();
                Database._PurchasedReturnApplyToInvoiceDelete(id);
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }


    }
}
