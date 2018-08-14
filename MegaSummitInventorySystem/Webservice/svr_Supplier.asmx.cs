using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Newtonsoft.Json;
using System.Data;


namespace MegaSummitInventorySystem.Webservice
{
    /// <summary>
    /// Summary description for svr_Supplier
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class svr_Supplier : System.Web.Services.WebService
    {
        private DatabaseDataContext Database = new DatabaseDataContext();

        [WebMethod]
        public bool InsertSupplier(string supplier_name, string address, string contact_person, long region_province, long municipality, string business_phone1, string business_phone2, string fax, string mobile_phone, string notes, string reference_initial, string tin_number, string vat_number, string salesman, long terms)
        {
            try
            {
                long? id = 0;
                Database = new DatabaseDataContext();
                Database._SupplierInsert(ref id, supplier_name, address, contact_person, region_province, municipality, business_phone1, business_phone2, fax, mobile_phone, notes, reference_initial, tin_number, vat_number, salesman, terms);
                return true;
            }
            catch (Exception)
            {
            }

            return false;
        }

        [WebMethod]
        public bool UpdateSupplier(long id, string supplier_name, string address, string contact_person, long region_province, long municipality, string business_phone1, string business_phone2, string fax, string mobile_phone, string notes, string reference_initial, string tin_number, string vat_number, string salesman, long terms)
        {
            try
            {
                Database = new DatabaseDataContext();
                Database._SupplierUpdate(id, supplier_name, address, contact_person, region_province, municipality, business_phone1, business_phone2, fax, mobile_phone, notes, reference_initial, tin_number, vat_number, salesman, terms);
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }

        [WebMethod]
        public bool DeleteSupplier(long id)
        {
            try
            {
                Database = new DatabaseDataContext();
                Database._SupplierDelete(id);
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }

        [WebMethod]
        public string SupplierSelect(long id)
        {
            try
            {
                Database = new DatabaseDataContext();
                var data = Database.SupplierSelect(id);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data 5";

        }

        [WebMethod]
        public List<AutoCompleteData> AutoCompleteSupplier()
        {
            try
            {
                Database = new DatabaseDataContext();
                var data = Database.SupplierSelect(0);


                List<AutoCompleteData> auto = new List<AutoCompleteData>();
                foreach (var item in data)
                {
                    auto.Add(new AutoCompleteData(item.ID, item.SupplierName, item.SupplierName));
                }

                return auto;

            }
            catch (Exception)
            {

            }

            return null;
        }


        [WebMethod]
        public string PurchasedInvoiceSupplierSelect(long id)
        {

            try
            {
                Database = new DatabaseDataContext();
                var data = Database._PurchaseInvoiceSupplierSelect(id);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data 4";

        }

        [WebMethod]
        public string PurchasedPaymentSelectTotalAmount(long id)
        {
            try
            {
                Database = new DatabaseDataContext();
                var data = Database._PurchasedPaymentSelectTotalAmount(id);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data 4";
        }


        [WebMethod]
        public string InvoicePaymentCashSelectByCustomer(long id)
        {

            try
            {
                Database = new DatabaseDataContext();
                var data = Database._InvoicePaymentCashSelectByCustomer(id);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data 4";

        }

        [WebMethod]
        public string InvoicePaymentCheckSelectByCustomer(long id)
        {

            try
            {
                Database = new DatabaseDataContext();
                var data = Database._InvoicePaymentCheckSelectByCustomer(id);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data 4";

        }


        // ---------------------------------------------------------------- Select Customer Opening Balance
        [WebMethod]
        public string InvoiceOpeningtSelectBySupplier(long id)
        {

            try
            {
                string invDate = string.Empty;
                DataTable dt = new DataTable();
                Database = new DatabaseDataContext();

                dt.Columns.Add("ID");
                dt.Columns.Add("RefNo");
                dt.Columns.Add("DatePay");
                dt.Columns.Add("TotalAmount");

                var data1 = Database._PurchaseInvoiceSelect(id);
                foreach (var item in data1)
                {
                    if (item.InvoiceType == "OpeningBalance")
                    {
                        dt.Rows.Add(item.ID, item.RefNo + "" + item.RefNoSerial, item.CreatedDate.Value.ToShortDateString(), item.SubTotal.Value.ToString("N"));
                    }
                }

                //var data = Database._InvoicePaymentSelectByCustomer(id);
                //foreach (var item in data)
                //{
                //    dt.Rows.Add(item.ID, item.RefereneNo, item.PaymentDate.Value.ToShortDateString(), item.TotalAmount.Value.ToString("N"));
                //}

                return JsonConvert.SerializeObject(dt, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data 5";

        }

        // ---------------------------------------------------------------- Select Customer Opening Balance Details
        [WebMethod]
        public string InvoiceOpeningSelectBySupplierDetails(long id)
        {

            try
            {
                string invDate = string.Empty;
                DataTable dt = new DataTable();
                Database = new DatabaseDataContext();
                var data = Database._PurchaseInvoiceSelect(id);

                //var data = Database._InvoicePaymentSelectByCustomer(id);
                //foreach (var item in data)
                //{
                //    dt.Rows.Add(item.ID, item.RefereneNo, item.PaymentDate.Value.ToShortDateString(), item.TotalAmount.Value.ToString("N"));
                //}

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data 5";

        }


        // ---------------------------------------------------------------- Select Customer Opening Balance
        [WebMethod]
        public string OpeningBalancePaymentSelectBySupplier(long id, long SupplierID)
        {

            try
            {
                string invDate = string.Empty;
                DataTable dt = new DataTable();
                Database = new DatabaseDataContext();

                dt.Columns.Add("ID");
                dt.Columns.Add("RefNo");
                dt.Columns.Add("DatePay");
                dt.Columns.Add("TotalAmount");

                var data1 = Database._OpeningBalanceSupplierCheckSelect(id, SupplierID);
                foreach (var item in data1)
                {
                    dt.Rows.Add(item.ID, item.BankName, item.CheckDate.Value.ToShortDateString(), item.CheckAmount.Value.ToString("N"));

                }

                //var data = Database._InvoicePaymentSelectByCustomer(id);
                //foreach (var item in data)
                //{
                //    dt.Rows.Add(item.ID, item.RefereneNo, item.PaymentDate.Value.ToShortDateString(), item.TotalAmount.Value.ToString("N"));
                //}

                return JsonConvert.SerializeObject(dt, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data 5";

        }

        // ---------------------------------------------------------------- Select Customer Opening Balance Details
        [WebMethod]
        public string InvoicePaymentSelectBySupplierDetails(long id, long SupplierID)
        {

            try
            {
                string invDate = string.Empty;
                DataTable dt = new DataTable();
                Database = new DatabaseDataContext();
                var data = Database._OpeningBalanceSupplierCheckSelect(id, SupplierID);

                //var data = Database._InvoicePaymentSelectByCustomer(id);
                //foreach (var item in data)
                //{
                //    dt.Rows.Add(item.ID, item.RefereneNo, item.PaymentDate.Value.ToShortDateString(), item.TotalAmount.Value.ToString("N"));
                //}

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data 5";

        }

        // --------------------------------------------------------------- Purchase Insert
        [WebMethod]
        public string InsertPurchasedInvoice(long supplierID, string address, long deliveryToID, string salesman, string poNo, long termID, string refNo, string refNoSerial, DateTime createdDate, DateTime cancelDate, decimal subTotal, decimal paymentAmt, decimal memoAmt, string notes, string balance, long bank_name, string check_number, DateTime checkDate, string checkt, decimal checkAmount, long checkID)
        {
            try
            {
                long? id = 0;
                if (subTotal != 0)
                {
                    Database = new DatabaseDataContext();
                    Database._PurchasedInvoiceInsert(ref id, supplierID, address, deliveryToID, salesman, poNo, termID, refNo, refNoSerial, createdDate, cancelDate, subTotal, paymentAmt, memoAmt, notes, "OpeningBalance");

                    if (balance != string.Empty && balance != "" && balance != " ")
                    {

                        decimal totalPaid = subTotal - decimal.Parse(balance);

                        long? refID = 0;
                        long? refID2 = 0;
                        Database = new DatabaseDataContext();
                        Database._PurchasedPaymentReferenceInsert(ref refID, id, "0", totalPaid, true);
                        Database._PurchasedPaymentInsert(ref refID2, id, refID, totalPaid);

                    }

                }

                #region Save Payment
                if (checkID == 0)
                {
                    if (checkAmount != 0)
                    {
                        long? checkrefID = 0;
                        Database._OpeningBalanceSupplierrCheckInsert(ref checkrefID, supplierID, bank_name, check_number, checkDate, checkt, checkAmount);
                    }
                }
                else
                {
                    Database._OpeningBalanceSupplierCheckUpdate(checkID, bank_name, check_number, checkDate, checkt, checkAmount);
                }
                #endregion



                return id.ToString();
            }
            catch (Exception)
            {


            }

            return "0";
        }

        // --------------------------------------------------------------- Purchased Update
        [WebMethod]
        public bool UpdatePurchasedInvoice(long id, long supplierID, string address, long deliveryToID, string salesman, string poNo, long termID, string refNo, string refNoSerial, DateTime createdDate, DateTime cancelDate, decimal subTotal, decimal paymentAmt, decimal memoAmt, string notes, string balance, long bank_name, string check_number, DateTime checkDate, string checkt, decimal checkAmount, long checkID)
        {
            try
            {
                Database = new DatabaseDataContext();
                Database._PurchasedInvoiceUpdate(id, supplierID, address, deliveryToID, salesman, poNo, termID, refNo, refNoSerial, createdDate, cancelDate, subTotal, paymentAmt, memoAmt, notes);

                if (balance != string.Empty && balance != "" && balance != " ")
                {

                    decimal totalPaid = subTotal - decimal.Parse(balance);

                    //long? refID = 0;
                    //long? refID2 = 0;
                    //Database = new DatabaseDataContext();
                    //Database._PurchasedPaymentReferenceInsert(ref refID, id, "0", totalPaid, true);
                    //Database._PurchasedPaymentInsert(ref refID2, id, refID, totalPaid);

                }

                #region Save Payment
                if (checkID == 0)
                {
                    if (checkAmount != 0)
                    {
                        long? checkrefID = 0;
                        Database._OpeningBalanceSupplierrCheckInsert(ref checkrefID, supplierID, bank_name, check_number, checkDate, checkt, checkAmount);
                    }
                }
                else
                {
                    Database._OpeningBalanceSupplierCheckUpdate(checkID, bank_name, check_number, checkDate, checkt, checkAmount);
                }
                #endregion


                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }

        

    }
}
