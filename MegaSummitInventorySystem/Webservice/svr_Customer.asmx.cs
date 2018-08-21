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
    /// Summary description for svr_Customer
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class svr_Customer : System.Web.Services.WebService
    {
        // ----------------------------------------------------------------- Initialize Database Connection
        private DatabaseDataContext Database = new DatabaseDataContext();

        #region AutoComplete

        // ------------------------------------------------------------------ Customer AutoComplete
        [WebMethod]
        public List<AutoCompleteData> AutoCompleteCustomer()
        {
            try
            {
                Database = new DatabaseDataContext();
                var data = Database._CustomerSelect(0, string.Empty);


                List<AutoCompleteData> auto = new List<AutoCompleteData>();
                foreach (var item in data)
                {
                    auto.Add(new AutoCompleteData(item.ID, item.CustomerName, item.CustomerName));
                }

                return auto;

            }
            catch (Exception)
            {

            }

            return null;
        }

        #endregion

        #region Selecting Data

        // ----------------------------------------------------------------- Select Customer
        [WebMethod]
        public string SelectCustomer(long id, string customer_name)
        {
            try
            {

                Database = new DatabaseDataContext();
                var data = Database._CustomerSelect(id, customer_name);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data";
        }

        // ----------------------------------------------------------------- Select Customer Sales Order
        [WebMethod]
        public string CustomerSalesOrderSelect(long id)
        {

            try
            {
                Database = new DatabaseDataContext();
                var data = Database._SalesOrderSelectByCustomer(id);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data 4";

        }

        // ----------------------------------------------------------------- Select Customer Invoices
        [WebMethod]
        public string InvoiceSalesCustomerSelect(long id)
        {

            try
            {
                Database = new DatabaseDataContext();
                var data = Database._InvoiceSalesCustomerSelect(id);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data 4";

        }

        // ----------------------------------------------------------------- Select Customer Invoice Details
        [WebMethod]
        public string InvoiceDetailsSelect(long id)
        {

            try
            {
                Database = new DatabaseDataContext();
                var data = Database._InvoiceDetailsSelectByCustomer (id);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data 4";

        }

        // ----------------------------------------------------------------- Select Customer Cash Payment
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

        // ----------------------------------------------------------------- Select Customer Check Payment
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

        // ----------------------------------------------------------------- Select Customer Card Payment
        [WebMethod]
        public string InvoicePaymentCardSelectByCustomer(long id)
        {

            try
            {
                Database = new DatabaseDataContext();
                var data = Database._InvoicePaymentCardSelectByCustomer(id);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data 4";

        }

        // ---------------------------------------------------------------- Load Sales Reference Default
        [WebMethod]
        public string SalesReferenceDefault()
        {
            try
            {

                Database = new DatabaseDataContext();
                var data = Database._CustomerSettings.ToList();

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data 3";
        }

        // ---------------------------------------------------------------- Select Customer Opening Balance
        [WebMethod]
        public string InvoicePaymentSelectByCustomer(long id)
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

                var data1 = Database._InvoiceSalesCustomerSelect(id);
                foreach (var item in data1)
                {
                    if (item.InvoiceType == "OpeningBalance")
                    {
                        dt.Rows.Add(item.ID, "" + item.RefNoSerial, item.CreatedDate.Value.ToShortDateString(), item.SubTotalAmt.Value.ToString("N"));
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

        // ---------------------------------------------------------------- Select Customer Opening Balance
        [WebMethod]
        public string OpeningBalancePaymentSelectByCustomer(long id, long CustomerID)
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

                var data1 = Database._OpeningBalanceCustomerCheckSelect(id, CustomerID);
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

        // ---------------------------------------------------------------- Select Customer Opening Balance
        [WebMethod]
        public string OpeningBalancePaymentSelectByCustomerDetails(long id)
        {

            try
            {
                string invDate = string.Empty;
                DataTable dt = new DataTable();
                Database = new DatabaseDataContext();

                var data1 = Database._OpeningBalanceCustomerCheckSelect(id, 0).ToList();

                return JsonConvert.SerializeObject(data1, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data 5";

        }

        // ---------------------------------------------------------------- Select Customer Opening Balance Details
        [WebMethod]
        public string InvoicePaymentSelectByCustomerDetails(long id, long InvoiceID)
        {

            try
            {
                string invDate = string.Empty;
                DataTable dt = new DataTable();
                Database = new DatabaseDataContext();
                var data = Database._InvoiceSalesSelect(InvoiceID);

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

        // ----------------------------------------------------------------- Select Bank List for Opening Balance
        [WebMethod]
        public string SelectBank()
        {
            try
            {

                Database = new DatabaseDataContext();
                var data = Database._Banks.ToList();

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data";
        }

        // ----------------------------------------------------------------- Select Check Type List for Opening Balance
        [WebMethod]
        public string SelectCheckType()
        {
            try
            {

                Database = new DatabaseDataContext();
                var data = Database._CheckTypeOpens.ToList();

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data";
        }

        #endregion

        #region Inserting Data

        // ----------------------------------------------------------------- Saving Customer Data
        [WebMethod]
        public long InsertCustomer(string customer_name,string address,string contact_person,long region_id,long municipality_id,string business_phone,string home_phone,string fax,string mobile_phone,string notes,long ship_to_id,string price_level,string status,string tin_no,string vat_no,long salesman_id,long term_id,decimal credit_limit)
        {
            try
            {
                long? id = 0;
                Database = new DatabaseDataContext();
                Database._CustomerInsert(ref id, customer_name, address, contact_person, region_id, municipality_id, business_phone, home_phone, fax, mobile_phone, notes, ship_to_id, price_level, status, tin_no, vat_no, salesman_id, term_id, credit_limit);
                return id.Value;
            }
            catch (Exception)
            {


            }

            return 0;
        }

        // ----------------------------------------------------------------- Saving Customer Opening Balance for Invoice
        [WebMethod]
        public string InsertInvoice(string invoice_status, long customer_id, string address, long forwarder_to_id, long salesman_id, string po_no, long term_id, string ref_no, string ref_no_serial, DateTime created_date, DateTime delivery_date, string prepared_by, string checked_by, string delivered_by, string way_bill_no, string container_no, string bill_of_landing, decimal commission_rate, decimal commission_amt, long remarks_id, string notes, decimal sub_total_amt, decimal tax_amt, decimal total_amount, decimal shipping_amt, decimal payment_amt, decimal memo_amt, decimal adjustment_amt, string balance, long bank_name, string check_number, DateTime checkDate, string checkt, decimal checkAmount, long checkID)
        {
            try
            {
                long? id = 0;
                if (sub_total_amt != 0)
                {
                    
                    Database = new DatabaseDataContext();
                    //Database._InvoiceInsert(ref id, invoice_status, customer_id, address, forwarder_to_id, salesman_id, po_no, term_id, ref_no, ref_no_serial, created_date, delivery_date, prepared_by, checked_by, delivered_by, way_bill_no, container_no, bill_of_landing, commission_rate, commission_amt, remarks_id, notes, sub_total_amt, tax_amt, "OpeningBalance", total_amount);

                    var data = Database._SalesSettings.SingleOrDefault(x => x.ID == long.Parse(ref_no));
                    if (data.Automatic.Value)
                    {
                        Database._SalesSettingRefUpdate(data.ID, data.LatestNo.Value + 1);
                    }

                    if (balance != string.Empty && balance != "" && balance != " ")
                    {

                        decimal totalPaid = sub_total_amt - decimal.Parse(balance);

                        long? refID = 0;
                        long? refID2 = 0;
                        Database = new DatabaseDataContext();
                        Database._InvoicePaymentReferenceInsert(ref refID, id, 3, "0", totalPaid, false);
                        Database._InvoicePaymentInsert(ref refID2, id, refID, totalPaid);
                        var data2 = Database._Settings.SingleOrDefault(x => x.ID == 3);
                        if (data2.Automatic.Value)
                        {
                            Database._SettingRefUpdate(data.ID, data.LatestNo.Value + 1);
                        }
                    }

                }

                #region Save Payment
                if (checkID == 0)
                {
                    if (checkAmount != 0)
                    {
                        long? checkrefID = 0;
                        Database._OpeningBalanceCustomerCheckInsert(ref checkrefID, customer_id, bank_name, check_number, checkDate, checkt, checkAmount);
                    }
                }
                else
                {
                    Database._OpeningBalanceCustomerCheckUpdate(checkID, bank_name, check_number, checkDate, checkt, checkAmount);
                }
                #endregion

                return id.ToString();
            }
            catch (Exception)
            {
                return "0";
            }
        }

        #endregion

        #region Updating Data

        // ----------------------------------------------------------------- Updating Customer Data
        [WebMethod]
        public bool UpdateCustomer(long id, string customer_name, string address, string contact_person, long region_id, long municipality_id, string business_phone, string home_phone, string fax, string mobile_phone, string notes, long ship_to_id, string price_level, string status, string tin_no, string vat_no, long salesman_id, long term_id, decimal credit_limit)
        {
            try
            {

                Database = new DatabaseDataContext();
                Database._CustomerUpdate(id, customer_name, address, contact_person, region_id, municipality_id, business_phone, home_phone, fax, mobile_phone, notes, ship_to_id, price_level, status, tin_no, vat_no, salesman_id, term_id, credit_limit);


                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }

        // ----------------------------------------------------------------- Updatind Customer Opening Balance
        [WebMethod]
        public bool UpdateInvoice(long id, string invoice_status, long customer_id, string address, long forwarder_to_id, long salesman_id, string po_no, long term_id, string ref_no, string ref_no_serial, DateTime created_date, DateTime delivery_date, string prepared_by, string checked_by, string delivered_by, string way_bill_no, string container_no, string bill_of_landing, decimal commission_rate, decimal commission_amt, long remarks_id, string notes, decimal sub_total_amt, decimal tax_amt, decimal shipping_amt, decimal payment_amt, decimal memo_amt, decimal adjustment_amt, string balance, long bank_name, string check_number, DateTime checkDate, string checkt, decimal checkAmount, long checkID)
        {
            try
            {
                Database = new DatabaseDataContext();
                Database._InvoiceUpdate(id, invoice_status, customer_id, address, forwarder_to_id, salesman_id, po_no, term_id, ref_no, ref_no_serial, created_date, delivery_date, prepared_by, checked_by, delivered_by, way_bill_no, container_no, bill_of_landing, commission_rate, commission_amt, remarks_id, notes, sub_total_amt, tax_amt, shipping_amt, payment_amt, memo_amt, adjustment_amt);



                if (balance != string.Empty && balance != "" && balance != " ")
                {

                    decimal totalPaid = sub_total_amt - decimal.Parse(balance);

                }

                #region Save Payment
                if (checkID == 0)
                {
                    if (checkAmount != 0)
                    {
                        long? checkrefID = 0;
                        Database._OpeningBalanceCustomerCheckInsert(ref checkrefID, customer_id, bank_name, check_number, checkDate, checkt, checkAmount);
                    }
                }
                else
                {
                    Database._OpeningBalanceCustomerCheckUpdate(checkID, bank_name, check_number, checkDate, checkt, checkAmount);
                }
                #endregion

                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }

        #endregion 

        #region Deleting Data

        [WebMethod]
        public bool DeleteCustomer(long id)
        {
            try
            {

                Database = new DatabaseDataContext();
                Database._CustomerDelete(id);
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }

        #endregion

    }
}
