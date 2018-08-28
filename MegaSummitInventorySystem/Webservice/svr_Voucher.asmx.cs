using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace MegaSummitInventorySystem.Webservice
{
    /// <summary>
    /// Summary description for svr_Voucher
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class svr_Voucher : System.Web.Services.WebService
    {

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }

        private DatabaseDataContext Database = new DatabaseDataContext();

        [WebMethod]
        public string GetPurchaseInvoiceBalance(long supplier_id)
        {
            List<InvoiceBalance> ib = new List<InvoiceBalance>();


            var purchase_inv = Database._PurchasedInvoiceSelect(0, supplier_id);


            foreach (var i in purchase_inv)
            {
                long _id = i.ID;
                string _refNo = i.RefNo;
                DateTime _createdDate = i.CreatedDate.Value;
                string _description = "Sales";
                string _salesman = i.EmployeeName;
                decimal _totalAmount = i.SubTotal.Value;



                decimal _balance = 0;

                var purchase_payment = Database._PurchasedPaymentReferences.Where(x => x.PurchasedID == i.ID);

                foreach (var bal in purchase_payment)
                {
                    _balance += (bal.TotalAmount.Value);
                }


                //var sales_return = Database._invoicePaymentSalesReturns.Where(x => x.InvoiceID == i.ID);

                //foreach (var ret in sales_return)
                //{
                //    _balance += ret.Amount.Value;
                //}


                decimal compute = (_totalAmount - _balance);

                if (i.Status == "Posted")
                {

                    if (compute > 0)
                    {
                        ib.Add(new InvoiceBalance(_id, _refNo, _createdDate, _description, _salesman, _totalAmount, compute, int.Parse((DateTime.Now - _createdDate).Days.ToString())));
                    }
                }

            }

            return JsonConvert.SerializeObject(ib, Newtonsoft.Json.Formatting.None); ;
        }
    }
}
