using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace MegaSummitInventorySystem.Webservice
{
    /// <summary>
    /// Summary description for svr_CustomerSales
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
     [System.Web.Script.Services.ScriptService]
    public class svr_CustomerSales : System.Web.Services.WebService
    {
        DatabaseDataContext Database = new DatabaseDataContext();

        #region AutoComplete

        // ---------------------------------------------------- Product AutoComplete
        [WebMethod]
        public List<AutoCompleteData> AutoCompleteProduct()
        {
            try
            {
                Database = new DatabaseDataContext();
                var data = Database._Products.ToList();


                List<AutoCompleteData> auto = new List<AutoCompleteData>();
                foreach (var item in data)
                {
                    auto.Add(new AutoCompleteData(item.ID, item.ProductName, item.ProductName));
                }

                return auto;

            }
            catch (Exception)
            {

            }

            return null;
        }

        // ---------------------------------------------------- Location AutoComplete
        [WebMethod]
        public List<AutoCompleteData> AutoCompleteLocation()
        {
            try
            {
                Database = new DatabaseDataContext();
                var data = Database._Locations.ToList();


                List<AutoCompleteData> auto = new List<AutoCompleteData>();
                foreach (var item in data)
                {
                    auto.Add(new AutoCompleteData(item.ID, item.LocationName, item.LocationName));
                }

                return auto;

            }
            catch (Exception)
            {

            }

            return null;
        }

        // ----------------------------------------------------- Bank AutoComplete
        [WebMethod]
        public List<AutoCompleteData> AutoCompleteBank()
        {
            try
            {
                Database = new DatabaseDataContext();
                var data = Database._Banks.ToList();


                List<AutoCompleteData> auto = new List<AutoCompleteData>();
                foreach (var item in data)
                {
                    auto.Add(new AutoCompleteData(item.ID, item.BankName, item.BankName));
                }

                return auto;

            }
            catch (Exception)
            {

            }

            return null;
        }

        // ----------------------------------------------------- Customer AutoComplete
        [WebMethod]
        public List<AutoCompleteData> AutoCompleteCustomer()
        {
            try
            {
                Database = new DatabaseDataContext();
                var data = Database._Customers.ToList();


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

        // ----------------------------------------------------- Sales Invoice Reference Number AutoComplete
        [WebMethod]
        public List<AutoCompleteData> InvoiceRefAutocom()
        {
            try
            {
                Database = new DatabaseDataContext();
                var data = Database.InvoiceRefAutocom().ToList();


                List<AutoCompleteData> auto = new List<AutoCompleteData>();
                foreach (var item in data)
                {
                    auto.Add(new AutoCompleteData(item.ID, item.refNumber, item.refNumber));
                }

                return auto;

            }
            catch (Exception)
            {

            }

            return null;
        }

        #endregion

        #region Data Selection

        // ----------------------------------------------------- Select Customer Information Details
        [WebMethod]
        public string SelectCustomerDetails(long id)
        {
            try
            {

                Database = new DatabaseDataContext();
                var data = Database._Customers.Where(x => x.ID == id).ToList();

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {
                return string.Empty;
            }

            return string.Empty;
        }

        // ----------------------------------------------------- Select Reference Latest or Manual
        [WebMethod]
        public string SelectReferenceNo(long id, string prefix_initial, string description, int lastest, int nextno, int maximum)
        {
            try
            {

                Database = new DatabaseDataContext();
                var data = Database._SalesSettingSelect(id, 0, prefix_initial, description, lastest, nextno, maximum);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {   

            }

            return "Error on returning data 1";
        }

        // ----------------------------------------------------- Select Employee (Salesman, Employee)
        [WebMethod]
        public string SelectEmployee(long id, string employeeName, string employeeType)
        {
            try
            {

                Database = new DatabaseDataContext();
                var data = Database._EmployeeSalesSelect(id, employeeName, employeeType);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data 2";
        }

        // ----------------------------------------------------- Select All Card Type
        [WebMethod]
        public string SelectCardType(long id, string CardTypeName)
        {
            try
            {

                Database = new DatabaseDataContext();
                var data = Database._CardTypeSelect(id, CardTypeName);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data 2";
        }
        
         //----------------------------------------------------- Select Reference Maximume Table Rows
        [WebMethod]
        public int SelectMaximumLines(long id)
        {
            try
            {

                Database = new DatabaseDataContext();
                var data = Database._SalesSettings.Where(x => x.ID == id);
                foreach (var item in data)
                {
                    return item.MaximumLine.Value;

                }
                
            }
            catch
            {
                return 0;
            }

            return 0;
        }

        // ----------------------------------------------------- Select Reference Details
        [WebMethod]
        public string SelectRefDetails(long id)
        {
            try
            {

                Database = new DatabaseDataContext();
                var data = Database._SalesSettings.Where(x => x.ID == id);
                
                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {
                return string.Empty;
            }

            return string.Empty;
        }

        // ----------------------------------------------------- Select Payment Reference Details
        [WebMethod]
        public string SelectPaymentRefDetails(long id)
        {
            try
            {

                Database = new DatabaseDataContext();
                var data = Database._Settings.Where(x => x.ID == id);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {
                return string.Empty;
            }

            return string.Empty;
        }

        // ----------------------------------------------------- Select Product Details
        [WebMethod]
        public string SelectProductDetails(long id)
        {
            try
            {

                Database = new DatabaseDataContext();
                var data = Database._ProductSalesSelect(id);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data 3";
        }

        // ----------------------------------------------------- Select Sales Order Details to Invoice Product List
        [WebMethod]
        public string SalesOrderDetailsSelectToIV(long id)
        {
            try
            {

                Database = new DatabaseDataContext();
                var data = Database._SalesOrderDetailsSelectToIV(id);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data 3";
        }

        // ----------------------------------------------------- Select Sales Order By Customer
        [WebMethod]
        public string SalesOrderRefSelect(long id)
        {
            try
            {

                Database = new DatabaseDataContext();
                var data = Database._SalesOrderRefSelect(id);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data 3";
        }

        // ----------------------------------------------------- Select Sales Order Details By Customer
        [WebMethod]
        public string SalesOrderDetailsInvoiceSelect(long id)
        {

            try
            {
                Database = new DatabaseDataContext();
                var data = Database._SalesOrderDetailsInvoiceSelect(id);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data 5";

        }

        // ----------------------------------------------------- Select All Sales Invoices
        [WebMethod]
        public string InvoiceSalesSelect(long id)
        {

            try
            {
                Database = new DatabaseDataContext();
                var data = Database._InvoiceSalesSelect(id);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data 4";

        }

        // ----------------------------------------------------- Select Payment By Sales Invoice
        [WebMethod]
        public string InvoicePaymentSelectTotalAmount(long id)
        {
            try
            {
                Database = new DatabaseDataContext();
                var data = Database._InvoicePaymentSelectTotalAmount(id);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data 4";
        }

        // ----------------------------------------------------- Select Sales Invoice Details
        [WebMethod]
        public string InvoiceDetailSalesSelect(long id)
        {

            try
            {
                Database = new DatabaseDataContext();
                var data = Database._InvoiceDetailsSalesSelect(id);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data 5";

        }

        // ----------------------------------------------------- Select Customer Payment By Sales Invoice
        [WebMethod]
        public string InvoicePaymentSelect(long id)
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

                //var data = Database._InvoicePaymentSelect(id);
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

        // ----------------------------------------------------- Select Customer Payment Reference 
        [WebMethod]
        public string PaymentReferenceSelect(long id)
        {
            try
            {
                Database = new DatabaseDataContext();
                var data = Database._InvoicePaymentReferences.Where(x => x.ID == id);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch (Exception)
            {
                return "0";
            }
            

        }

        // ----------------------------------------------------- Select Payment By Customer
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

                var data = Database._InvoicePaymentSelectByCustomer(id);
                foreach (var item in data)
                {
                    if (item.FromSystem.Value)
                    {
                        dt.Rows.Add(item.ID, item.RefereneNo, item.PaymentDate.Value.ToShortDateString(), item.TotalAmount.Value.ToString("N"));
                    }
                }

                return JsonConvert.SerializeObject(dt, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data 5";

        }

        // ----------------------------------------------------- Select Customer Cash Payment
        [WebMethod]
        public string PaymentCashSelect(long id)
        {
            try
            {
                Database = new DatabaseDataContext();
                var data = Database._InvoicePaymentCashes.Where(x => x.InvoicePaymentID == id);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch (Exception)
            {
                return "0";
            }


        }

         // ---------------------------------------------------- Select Cusotmer Check Payment
        [WebMethod]
        public string PaymentCheckSelect(long id)
        {
            try
            {
                Database = new DatabaseDataContext();
                var data = Database._InvoicePaymentChecks.Where(x => x.InvoicePaymentID == id);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch (Exception)
            {
                return "0";
            }


        }

        // ----------------------------------------------------- Select Customer Card Payment
        [WebMethod]
        public string PaymentCardSelect(long id)
        {
            try
            {
                Database = new DatabaseDataContext();
                var data = Database._InvoicePaymentCards.Where(x => x.InvoicePaymentID == id);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch (Exception)
            {
                return "0";
            }
        }

        // ----------------------------------------------------- Select Adjustment Details
        [WebMethod]
        public string InvoiceAdjustment(long invoiceID, string productName)
        {
            try
            {
                Database = new DatabaseDataContext();
                var product = Database._Products.SingleOrDefault(x => x.ProductName == productName);
                var data = Database._InvoiceDetailsAdjusmentSelect(invoiceID, product.ID);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch (Exception)
            {
                return "0";
            }
        }

        // ----------------------------------------------------- Load Sales Reference Default
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

        // ----------------------------------------------------- Load Product unit plural
        [WebMethod]
        public string ProductUnitPlural(string product_code)
        {
            try
            {

                Database = new DatabaseDataContext();
                var dataprod = Database._Products.SingleOrDefault(x => x.ProductName == product_code);
                var data = Database._Units.Where(x => x.ID == dataprod.UnitID).ToList();

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data 3";
        }


        #endregion

    }
}
