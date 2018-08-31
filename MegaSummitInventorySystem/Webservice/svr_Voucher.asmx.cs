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
                string _description = "Purchase";
                string _salesman = i.EmployeeName;
                decimal _totalAmount = i.SubTotal.Value;



                decimal _balance = 0;

                var purchase_payment = Database._PurchasedPayments.Where(x => x.PurchasedID == i.ID);

                foreach (var bal in purchase_payment)
                {
                    _balance += (bal.Amount.Value);
                }


                var sales_return = Database._PurchasedPaymentReturns.Where(x => x.PurchasedID == i.ID);

                foreach (var ret in sales_return)
                {
                    _balance += ret.Amount.Value;
                }


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

        [WebMethod]
        public string GetVoucherSupplier(long id, long supplier_id)
        {
            try
            {
                Database = new DatabaseDataContext();
                var data = Database._PurchaseVoucherSelect (id, supplier_id);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.None);
            }
            catch
            {

            }

            return "Error on returning data";
        }

        [WebMethod]
        public string InsertVoucher(string invoices_apply_for, long supplierID, string refNo, string refSerial, DateTime createdDate, decimal totalAmount, decimal cash_amount, long companyBankAccountID, string accountName, string check_details)
        {
            long? purchased_voucher_id = 0;

            Database._PurchasedVoucherInsert(ref purchased_voucher_id, supplierID, refNo, refSerial, createdDate, totalAmount);

            string[] apply_for = invoices_apply_for.Split('|');

            foreach (var invlist in apply_for)
            {
                if (!string.IsNullOrEmpty(invlist))
                {
                    string[] _inv = invlist.Split('^');


                    long? invoice_payment_id = 0;
                    long purchasedID = long.Parse(_inv[0].ToString());
                    decimal amount = decimal.Parse(_inv[1].ToString());
                    Database._PurchasedPaymentInsert(ref invoice_payment_id, purchased_voucher_id, purchasedID, supplierID, refNo, refSerial, createdDate, amount);

                }
            }

            //-----Cash insert
            if (cash_amount > 0)
            {
                long? cash_id = 0;
                Database._PurchasedPaymentCashInsert(ref cash_id, purchased_voucher_id, companyBankAccountID, accountName, cash_amount);
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
                        Database._PurchasedPaymentCheckInsert(ref check_id, purchased_voucher_id, bankName, checkNo, checkDate, "Check Type" ,check_amount);
                    }
                }
            }



            return supplierID.ToString();
        }

        [WebMethod]
        public string SelectVoucherDetail(long voucher_id)
        {
            List<Voucher> voucher = new List<Voucher>();

            var orList = Database._PurchaseVoucherSelect(voucher_id, 0);

            foreach (var o in orList)
            {
                Voucher or = new Voucher();
                or.ID = o.ID;
                or.SupplierID = o.SupplierID.Value;
                or.SupplierName = o.SupplierName;
                or.RefNo = o.RefNo;
                or.RefNoSerial = o.ID.ToString();// o.RefSerial;

                try { or.Cash = Database._PurchasedPaymentCashes.Where(x => x.PurchasedVoucherID == voucher_id).ToList<_PurchasedPaymentCash>(); }
                catch { }

                try { or.Checks = Database._PurchasedPaymentChecks.Where(x => x.PuchasedVoucherID == voucher_id).ToList<_PurchasedPaymentCheck>(); }
                catch { }

                //or.Payments 

                List<VoucherPayment> payment = new List<VoucherPayment>();

                var invoice_payment = Database._PurchasedPaymentSelectBySupplier(0, voucher_id, 0, 0);
                foreach (var p in invoice_payment)
                {
                    VoucherPayment _p = new VoucherPayment();
                    _p.ID = p.ID;
                    _p.VoucherID = voucher_id;
                    _p.PurchaseID = p.PurchasedID.Value;
                    _p.Description = "Purchased";


                    _p.RefNo = Database._PurchasedInvoices.SingleOrDefault(x => x.ID == p.PurchasedID.Value).RefNo + Database._PurchasedInvoices.SingleOrDefault(x => x.ID == p.PurchasedID.Value).RefNoSerial;
                    var salesman_id = Database._PurchasedInvoices.SingleOrDefault(x => x.ID == p.PurchasedID.Value).Salesman;
                    _p.Salesman = Database._Employees.SingleOrDefault(x => x.ID == salesman_id).EmployeeName;


                    _p.TotalAmount = Database._PurchasedInvoices.SingleOrDefault(x => x.ID == p.PurchasedID.Value).SubTotal.Value;
                    _p.CreatedDate = Database._PurchasedInvoices.SingleOrDefault(x => x.ID == p.PurchasedID.Value).CreatedDate.Value;

                    _p.TotalPayment = p.Amount.Value;
                    payment.Add(_p);
                }

                or.Payments = payment;




                voucher.Add(or);
            }


            return JsonConvert.SerializeObject(voucher, Newtonsoft.Json.Formatting.None);

        }
    }
}
