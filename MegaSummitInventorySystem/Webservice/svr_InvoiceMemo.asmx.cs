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
        public string SelectCustomerMemoPerCustomer(long invoice_memo_id)
        {

            try
            {
                Database = new DatabaseDataContext();

                List<CustomerMemo> customer_memo = new List<CustomerMemo>();
                var data = Database._InvoiceMemoDetails.Where(x => x.ID == invoice_memo_id);
                
                foreach (var d in data)
                {
                    CustomerMemo _memo = new CustomerMemo();

                    var inv = Database._Invoices.Where(x => x.ID == d.InvoiceID);
                    decimal invoice_amount = 0;
                    decimal _balance = 0;

                    foreach (var _i in inv)
                    {
                        _memo.RefNo = _i.RefNo + _i.RefNoSerial;
                        _memo.InvoiceDate = _i.CreatedDate.Value;
                        _memo.InvoiceType = _i.InvoiceType;
                        invoice_amount = _i.TotalAmount.Value;
                    }



                    var invoice_payment = Database._InvoicePaymentSelectCustomer(0, 0, d.InvoiceID, d.CustomerID);

                    foreach (var bal in invoice_payment)
                    {
                        _balance += (bal.Amount.Value);
                    }


                    var sales_return = Database._invoicePaymentSalesReturns.Where(x => x.InvoiceID == d.InvoiceID);

                    foreach (var ret in sales_return)
                    {
                        _balance += ret.Amount.Value;
                    }

                    var customer_memo_payment = Database._InvoiceMemoDetails.Where(x => x.InvoiceID == d.InvoiceID);
                    foreach (var memo in customer_memo_payment)
                    {
                        _balance += memo.ApplyAmount.Value;
                    }


                    _memo.Balance = (invoice_amount - _balance);
                    _memo.ApplyAmount = d.ApplyAmount.Value;


                    customer_memo.Add(_memo);
                }




                return JsonConvert.SerializeObject(customer_memo, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "";
        }



        [WebMethod]
        public bool InsertInvoiceMemo(long customerID,string refNo,string refNoSerial,DateTime createdDate,long accountID,string accountName,decimal debit,decimal credit, string invoiceList)
        {
            try
            {
                long? id = 0;
                Database = new DatabaseDataContext();
                Database._InvoiceMemoInsert(ref id, customerID, refNo, refNoSerial, createdDate, accountID, accountName, debit, credit);

                string[] _list = invoiceList.Split('|');

                foreach (var i in _list)
                {
                    string[] col = i.Split('^');

                    if (!string.IsNullOrEmpty(col[0]))
                    {
                        long? d_id = 0;
                        var isDebit = Database._Accounts.SingleOrDefault(x => x.ID == accountID).isDebit.Value;

                        var type = (isDebit) ? "Debit" : "Credit";

                        Database._InvoiceMemoDetailInsert(ref d_id, id, customerID, refNo, refNoSerial, createdDate, accountID, type, long.Parse(col[0]), decimal.Parse(col[1]));
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



    public class CustomerMemo
	{
        public string RefNo { get; set; }
        public DateTime InvoiceDate { get; set; }
        public string InvoiceType { get; set; }
        public decimal Balance { get; set; }
        public decimal ApplyAmount { get; set; }

	}

}
