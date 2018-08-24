using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MegaSummitInventorySystem
{
    public partial class aspnetCustomerInformationInvoices : System.Web.UI.Page
    {
        private DatabaseDataContext Database = new DatabaseDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (!string.IsNullOrEmpty(Request["customerID"]))
                {
                    LoadData(long.Parse(Request["customerID"]));
                }
                
            }
        }

        private void LoadData(long customer_id)
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


                if (compute > 0)
                {
                    ib.Add(new InvoiceBalance(_id, _refNo, _createdDate, _description, _salesman, _totalAmount, compute));
                }

                repMain.DataSource = ib;
                repMain.DataBind();

            }
        }
    }
}