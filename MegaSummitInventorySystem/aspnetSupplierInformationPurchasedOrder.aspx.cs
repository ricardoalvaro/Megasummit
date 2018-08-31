using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MegaSummitInventorySystem
{
    public partial class aspnetSupplierInformationPurchasedOrder : System.Web.UI.Page
    {
        private DatabaseDataContext Database = new DatabaseDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (!string.IsNullOrEmpty(Request["supplierID"]))
                {
                    this.LoadData(long.Parse(Request["supplierID"]));
                }
            }
        }


        private void LoadData(long supplier_id)
        {
            var data = Database._PurchasedOrderSelectSupplier(supplier_id);
            repMain.DataSource = data;
            repMain.DataBind();
        }
    }
}