using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MegaSummitInventorySystem
{
    public partial class aspnetCustomer1 : System.Web.UI.Page
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
            Database = new DatabaseDataContext();
            var data = Database._CustomerSelect(0, string.Empty);

            List<Customers> customer = new List<Customers>();

            foreach (var c in data)
            {
                Customers _cust = new Customers();
                _cust.ID = c.ID;
                _cust.CustomerName = c.CustomerName;
                _cust.RegionName = c.RegionName;
                _cust.Status = c.Status;
                _cust.CreditLimit = c.CreditLimit.Value;
                _cust.Salesman = c.EmployeeName;
                _cust.Balance = GetCustomerBalance(c.ID);
                customer.Add(_cust);

            }


            repList.DataSource = customer;
            repList.DataBind();
        }

        public decimal GetCustomerBalance(long customer_id)
        {
            decimal total_balance = 0;
            var invoices = Database._InvoiceSalesCustomerSelect(customer_id);
            var payment = Database._InvoicePaymentSelect(0, customer_id);


            foreach (var i in invoices)
            {
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


                total_balance += (_totalAmount - _balance);

            }

            return total_balance;
           
        }

    }
}