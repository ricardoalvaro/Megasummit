using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Newtonsoft.Json;



namespace MegaSummitInventorySystem.Webservice
{
    /// <summary>
    /// Summary description for svr_InvoicePaymentCard
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class svr_InvoicePaymentCard : System.Web.Services.WebService
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
        public bool InsertInvoicePaymentCard(long invoice_id,long card_type_id,string card_number,string name_on_card,string expiration_month,string expiration_year,string approval_code,decimal amount,DateTime created_date)
        {
            try
            {
                long? id = 0;
                Database = new DatabaseDataContext();
                //Database._InvoicePaymentCardInsert(ref id, invoice_id, card_type_id, card_number, name_on_card, expiration_month, expiration_year, approval_code, amount, created_date);
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }

        [WebMethod]
        public bool UpdateInvoicePaymentCard(long id, long invoice_id, long card_type_id, string card_number, string name_on_card, string expiration_month, string expiration_year, string approval_code, decimal amount, DateTime created_date)
        {
            try
            {
                Database = new DatabaseDataContext();
                //Database._InvoicePaymentCardUpdate( id, invoice_id, card_type_id, card_number, name_on_card, expiration_month, expiration_year, approval_code, amount, created_date);
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }

        [WebMethod]
        public bool DeleteInvoicePaymentCard(long id)
        {
            try
            {
                Database = new DatabaseDataContext();
                Database._InvoicePaymentCardDelete(id);
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }
      


    }
}
