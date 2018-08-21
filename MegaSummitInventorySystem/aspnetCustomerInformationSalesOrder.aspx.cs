using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MegaSummitInventorySystem
{
    public partial class aspnetCustomerInformationSalesOrder : System.Web.UI.Page
    {
        private DatabaseDataContext Database = new DatabaseDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (!string.IsNullOrEmpty(Request["customerID"]))
                {
                    this.LoadData(long.Parse(Request["customerID"]));
                }
            }
        }

        private void LoadData(long customer_id)
        {
            var data = Database._SalesOrderSelectByCustomer(customer_id);
            repMain.DataSource = data;
            repMain.DataBind();
        }
    }
}