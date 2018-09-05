using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Newtonsoft.Json;

namespace MegaSummitInventorySystem.Webservice
{
    /// <summary>
    /// Summary description for svr_PurchasedMemo
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class svr_PurchasedMemo : System.Web.Services.WebService
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
        public string SelectPurchasedMemoPerSupplier(long purchase_memo_id)
        {

            try
            {
                Database = new DatabaseDataContext();

                List<PurchaseMemo> supplier_memo = new List<PurchaseMemo>();
                var data = Database._PurchasedMemoDetails.Where(x => x.ID == purchase_memo_id);

                foreach (var d in data)
                {
                    PurchaseMemo _memo = new PurchaseMemo();

                    var inv = Database._PurchasedInvoices.Where(x => x.ID == d.InvoiceID);
                    decimal invoice_amount = 0;
                    decimal _balance = 0;

                    foreach (var _i in inv)
                    {
                        _memo.RefNo = _i.RefNo + _i.RefNoSerial;
                        _memo.PurchaseDate = _i.CreatedDate.Value;
                        _memo.PurchasedType = _i.InvoiceType;
                        invoice_amount = _i.SubTotal.Value;
                    }



                    var purchase_payment = Database._PurchasedPayments.Where(x => x.PurchasedID == d.InvoiceID);

                    foreach (var bal in purchase_payment)
                    {
                        _balance += (bal.Amount.Value);
                    }


                    var sales_return = Database._PurchasedPaymentReturns.Where(x => x.PurchasedID == d.InvoiceID);

                    foreach (var ret in sales_return)
                    {
                        _balance += ret.Amount.Value;
                    }

                    var supplier_memo_payment = Database._PurchasedMemoDetails.Where(x => x.InvoiceID == d.InvoiceID);
                    foreach (var memo in supplier_memo_payment)
                    {
                        if (memo.AccountType == "Debit") //minus
                        {
                            _balance -= memo.ApplyAmount.Value;
                        }
                        else
                        {
                            _balance += memo.ApplyAmount.Value;
                        }
                    }


                    _memo.Balance = (invoice_amount + _balance);
                    _memo.ApplyAmount = d.ApplyAmount.Value;


                    supplier_memo.Add(_memo);
                }




                return JsonConvert.SerializeObject(supplier_memo, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "";
        }

        [WebMethod]
        public bool InsertPurchasedMemo(long supplierID,string refNo,string refNoSerial,DateTime createdDate,long accountID,string accountName,decimal debit,decimal credit, string invoiceList)
        {
            try
            {
                long? id = 0;
                Database = new DatabaseDataContext();
                Database._PurchasedMemoInsert(ref id, supplierID, refNo, refNoSerial, createdDate, accountID, accountName, debit, credit);


                string[] _list = invoiceList.Split('|');


                foreach (var i in _list)
                {
                    string[] col = i.Split('^');


                    if (!string.IsNullOrEmpty(col[0]))
                    {
                        long? d_id = 0;

                        var isDebit = Database._Accounts.SingleOrDefault(x => x.ID == accountID).isDebit.Value;
                        var type = (isDebit) ? "Debit" : "Credit";

                        Database._PurchasedMemoDetailInsert(ref d_id, id, supplierID, refNo, refNoSerial, createdDate, accountID, type, long.Parse(col[0]), decimal.Parse(col[1]));
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
        public bool UpdatePurchasedMemo(long id, long supplierID, long accountName, decimal debit, decimal credit, string refNo, string refNoSerial, DateTime createdDate)
        {
            try
            {
                Database = new DatabaseDataContext();
                Database._PurchasedMemoUpdate(id, supplierID, accountName, debit, credit, refNo, refNoSerial, createdDate);
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }

        [WebMethod]
        public bool DeletePurchasedMemo(long id)
        {
            try
            {
                Database = new DatabaseDataContext();
                Database._PurchasedMemoDelete(id);
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }

       
    }

    public class PurchaseMemo
    {
        public string RefNo { get; set; }
        public DateTime PurchaseDate { get; set; }
        public string PurchasedType { get; set; }
        public decimal Balance { get; set; }
        public decimal ApplyAmount { get; set; }

    }
}
