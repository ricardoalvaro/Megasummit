using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Newtonsoft.Json;

namespace MegaSummitInventorySystem.Webservice
{
    /// <summary>
    /// Summary description for svr_InvoiceMemo
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class svr_InvoiceMemo : System.Web.Services.WebService
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
        public bool InsertInvoiceMemo(long invoice_id, long account_name,decimal debit,decimal credit,string ref_no,string ref_no_serial,DateTime created_date)
        {
            try
            {
                long? id = 0;
                Database = new DatabaseDataContext();
                Database._InvoiceMemoInsert(ref id, invoice_id, account_name, debit, credit, ref_no, ref_no_serial, created_date);
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }

        [WebMethod]
        public bool UpdateInvoiceMemo(long id, long invoice_id, long account_name, decimal debit, decimal credit, string ref_no, string ref_no_serial, DateTime created_date)
        {
            try
            {
                Database = new DatabaseDataContext();
                Database._InvoiceMemoUpdate( id, invoice_id, account_name, debit, credit, ref_no, ref_no_serial, created_date);
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }

        [WebMethod]
        public bool DeleteInvoiceMemo(long id)
        {
            try
            {
                Database = new DatabaseDataContext();
                Database._InvoiceMemoDelete(id);
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }
       


    }
}
