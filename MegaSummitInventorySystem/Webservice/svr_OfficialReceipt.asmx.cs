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
            var payment = Database._InvoicePaymentSelect(0, customer_id);


            foreach (var i in invoices)
            {
                long _id = i.ID;
                string _refNo = i.RefNo;
                DateTime _createdDate = i.CreatedDate.Value;
                string _description = "Sales";
                string _salesman = i.Salesman;
                decimal _totalAmount = i.TotalAmount;



                decimal _balance = 0;

                var invoice_payment = Database._InvoicePaymentSelectCustomer(0, 0, i.ID, customer_id);

                foreach (var bal in invoice_payment)
                {
                    _balance += (bal.Amount.Value);
                }


                var sales_return = Database._invoicePaymentSalesReturns.Where(x => x.InvoiceID == i.ID);

                foreach (var ret in sales_return)
                {
                    _balance += ret.Amount.Value;
                }


                decimal compute = (_totalAmount - _balance);

                if (i.InvoiceStatus == "Posted")
                {

                    if (compute > 0)
                    {
                        ib.Add(new InvoiceBalance(_id, _refNo, _createdDate, _description, _salesman, _totalAmount, compute, int.Parse((DateTime.Now - _createdDate).Days.ToString())));
                    }
                }

            }

            return JsonConvert.SerializeObject(ib, Newtonsoft.Json.Formatting.None);;
        }


        [WebMethod]
        public string GetOfficialReceiptCustomer(long id, long customer_id)
        {
            try
            {
                Database = new DatabaseDataContext();
                var data = Database._InvoicePaymentSelect(id, customer_id);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data";
        }


        [WebMethod]
        public string InsertOfficialReceipt(string invoices_apply_for, decimal cash_amount, string check_details, string credi_card_detail,  long customerID,string refNo,string refSerial, DateTime createdDate, decimal total_amount)
        {

            long? official_receipt_id = 0 ;
            Database._InvoiceOfficialReceiptInsert(ref official_receipt_id, customerID, refNo, refSerial, createdDate, total_amount);

            string[] apply_for = invoices_apply_for.Split('|');
         
            foreach (var invlist in apply_for)
            {
                if (!string.IsNullOrEmpty(invlist))
                {
                    string[] _inv = invlist.Split('^');

                    
                    long? invoice_payment_id = 0;
                    long invoiceID = long.Parse(_inv[0].ToString());
                    decimal amount = decimal.Parse(_inv[1].ToString());
                    Database._InvoicePaymentInsert(ref invoice_payment_id, official_receipt_id, invoiceID, customerID, refNo, refSerial, createdDate, amount);
                    
                }
            }


            //--CC insert

            if (!string.IsNullOrEmpty(credi_card_detail))
            {
                string[] cc = credi_card_detail.Split('^');
                long? credit_id = 0;
                string cardType = (cc[0].Trim() == string.Empty) ? string.Empty : cc[0].Trim();
                string cardNumber = (cc[1].Trim() == string.Empty) ? string.Empty : cc[1].Trim();
                string nameOnCard = (cc[2].Trim() == string.Empty) ? string.Empty : cc[2].Trim();
                string expirationMonth = (cc[3].Trim() == string.Empty) ? string.Empty : cc[3].Trim();
                string expirationYear = (cc[4].Trim() == string.Empty) ? string.Empty : cc[4].Trim();
                string approvalCode = (cc[5].Trim() == string.Empty) ? string.Empty : cc[5].Trim();
                decimal credi_card_amount = (cc[6].Trim() == string.Empty) ? 0 : decimal.Parse(cc[6].Trim());

                Database._InvoicePaymentCardInsert(ref credit_id, official_receipt_id, cardType, cardNumber, nameOnCard, expirationMonth, expirationYear, approvalCode, credi_card_amount);
            }
            
            //------Cash Insert------------------
            if (cash_amount > 0)
            {
                long? cash_id = 0;
                Database._InvoicePaymentCashInsert(ref cash_id, official_receipt_id, cash_amount, (createdDate));
            }
            //-------Check Insert--------------
            string[] checkList = check_details.Split('|');

            foreach (var check in checkList)
            {
                if (!string.IsNullOrEmpty(check))
                {
                    string[] c = check.Split('^');

                 
                    long? check_id = 0;
                    string bankName = (c[0].Trim() == string.Empty) ? string.Empty : c[0].Trim();
                    string checkNo = (c[1].Trim() == string.Empty) ? string.Empty : c[1].Trim();
                    DateTime? checkDate = (c[2].Trim() == string.Empty) ? DateTime.Now : DateTime.Parse(c[2].Trim());
                    decimal check_amount = (c[3].Trim() == string.Empty) ? 0 : decimal.Parse(c[3].Trim());
                    if (check_amount > 0)
                    {
                        Database._InvoicePaymentCheckInsert(ref check_id, official_receipt_id, bankName, checkNo, checkDate, check_amount);
                    }
                }
            }

            return customerID.ToString();

        }

        [WebMethod]
        public string SelectOfficialReceiptDetail(long official_receipt_id)
        {
            List<OfficialReceipt> officialReciept = new List<OfficialReceipt>();

            var orList = Database._InvoicePaymentSelect(official_receipt_id, 0);

            foreach (var o in orList)
            {
                OfficialReceipt or = new OfficialReceipt();
                or.ID = o.ID;
                or.CustomerID = o.CustomerID.Value;
                or.CustomerName = o.CustomerName;
                or.RefNo = o.RefNo;
                or.RefNoSerial = o.ID.ToString();// o.RefSerial;

                try { or.Cash = Database._InvoicePaymentCashes.Where(x => x.OfficialReceiptID == official_receipt_id).ToList<_InvoicePaymentCash>(); } catch { }

                try { or.Checks = Database._InvoicePaymentChecks.Where(x => x.OfficialReceiptID == official_receipt_id).ToList<_InvoicePaymentCheck>(); } catch { }

                try { or.CrediCard = Database._InvoicePaymentCards.Where(x => x.OfficialReceiptID == official_receipt_id).ToList<_InvoicePaymentCard>(); } catch { }

                //or.Payments 

                List<InvoicePayment> payment = new List<InvoicePayment>();

                var invoice_payment = Database._InvoicePaymentSelectCustomer(0, official_receipt_id, 0, 0);
                foreach (var p in invoice_payment)
                {
                    InvoicePayment _p = new InvoicePayment();
                    _p.ID = p.ID;
                    _p.OfficialReceiptID = official_receipt_id;
                    _p.InvoiceID = p.InvoiceID.Value;
                    _p.Description = "Sales";
                    _p.RefNo = Database._Invoices.SingleOrDefault(x => x.ID == p.InvoiceID.Value).RefNo + Database._Invoices.SingleOrDefault(x => x.ID == p.InvoiceID.Value).RefNoSerial;
                    var salesman_id = Database._Invoices.SingleOrDefault(x => x.ID == p.InvoiceID.Value).SalesmanID;
                    _p.Salesman = Database._Employees.SingleOrDefault(x => x.ID == salesman_id).EmployeeName;
                    _p.TotalAmount = Database._Invoices.SingleOrDefault(x => x.ID == p.InvoiceID.Value).TotalAmount.Value;
                    _p.CreatedDate = Database._Invoices.SingleOrDefault(x => x.ID == p.InvoiceID.Value).CreatedDate.Value;

                    _p.TotalPayment = p.Amount.Value;
                    payment.Add(_p);
                }

                or.Payments = payment;




                officialReciept.Add(or);
            }


            return JsonConvert.SerializeObject(officialReciept, Newtonsoft.Json.Formatting.None);

        }



    }
}
