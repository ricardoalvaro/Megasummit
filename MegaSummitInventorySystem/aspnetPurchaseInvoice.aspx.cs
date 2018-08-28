using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MegaSummitInventorySystem
{
    public partial class aspnetPurchaseInvoice : System.Web.UI.Page
    {
        private DatabaseDataContext Database = new DatabaseDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                this.LoadData();
            }
        }

        private void LoadData()
        {
            Database = new DatabaseDataContext();
            var data = Database._PurchasedInvoiceSelect(0, 0);
            List<PurchaseInvoice> purchaseInvoice = new List<PurchaseInvoice>();

            foreach (var d in data)
            {
                PurchaseInvoice p = new PurchaseInvoice();
                p.ID = d.ID;
                p.RefNo = d.RefNo;
                p.CreatedDate = d.CreatedDate.Value;
                p.SupplierName = d.SupplierName;
                p.Amount = d.SubTotal.Value;
                p.Balance = 0;
                p.Status = d.Status;
                purchaseInvoice.Add(p);
            }

            repList.DataSource = purchaseInvoice;
            repList.DataBind();


        }

    }
}