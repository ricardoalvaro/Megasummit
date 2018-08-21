using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace MegaSummitInventorySystem.Webservice
{
    /// <summary>
    /// Summary description for svr_OfficialReceipt
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class svr_OfficialReceipt : System.Web.Services.WebService
    {
        private DatabaseDataContext Database = new DatabaseDataContext();

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }

        [WebMethod]
        public string GetInvoiceBalance(long customer_id)
        {
            List<InvoiceBalance> ib = new List<InvoiceBalance>();


            var invoices = Database._InvoiceSalesCustomerSelect(customer_id);

            foreach (var i in invoices)
            {
                long _id = i.ID;
                string _refNo = i.RefNo;
                DateTime _createdDate = i.CreatedDate.Value;
                string _description = "Sales";
                string _salesman = i.Salesman;
                decimal _totalAmount = i.TotalAmount;



                decimal _balance = i.TotalAmount;

                ib.Add(new InvoiceBalance(_id, _refNo, _createdDate, _description, _salesman, _totalAmount,_balance));


            }

            return JsonConvert.SerializeObject(ib, Newtonsoft.Json.Formatting.None);;
        }


        [WebMethod]
        public string GetOfficialReceiptCustomer(long id, long invoice_id, long customer_id)
        {
            try
            {
                Database = new DatabaseDataContext();
                var data = Database._InvoicePaymentSelect(id, invoice_id, customer_id);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data";
        }

    }
}
