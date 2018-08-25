using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MegaSummitInventorySystem
{
    public partial class aspnetSales : System.Web.UI.Page
    {

        private DatabaseDataContext Database = new DatabaseDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                LoadData();
            }
        }

        private void LoadData()
        {

            List<InvoiceBalance> ib = new List<InvoiceBalance>();


            var invoices = Database._InvoiceSalesCustomerSelect(0);
            var payment = Database._InvoicePaymentSelect(0, 0);


            foreach (var i in invoices)
            {
                long _id = i.ID;
                string _refNo = i.RefNo;
                DateTime _createdDate = i.CreatedDate.Value;
                string _description = i.InvoiceStatus;
                string _salesman = i.Salesman;
                decimal _totalAmount = i.TotalAmount;
                string _customerName = i.CustomerName;
                string _status = i.InvoiceStatus;


                decimal _balance = 0;

                var invoice_payment = Database._InvoicePaymentSelectCustomer(0, 0, i.ID, 0);

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


                InvoiceBalance invBal = new InvoiceBalance();
                invBal.ID = _id;
                invBal.RefNo = _refNo;
                invBal.CreatedDate = _createdDate;
                invBal.CustomerName = _customerName;
                invBal.Description = _description;
                invBal.Salesman = _salesman;
                invBal.TotalAmount = _totalAmount;
                invBal.Balance = compute;
                invBal.Status = _status;

                ib.Add(invBal);
                //if (compute > 0)
                //{
                //    ib.Add(new InvoiceBalance(_id, _refNo, _createdDate, _description, _salesman, _totalAmount, compute));
                //}

            }


            var data = ib;
            repMain.DataSource = data;
            repMain.DataBind();
        }

    }
}