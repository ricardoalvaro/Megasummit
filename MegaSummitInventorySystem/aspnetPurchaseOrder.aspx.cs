using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MegaSummitInventorySystem
{
    public partial class aspnetPurchaseOrder : System.Web.UI.Page
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
            var data = Database._PurchasedOrderSelect(0);
            List<PurchaseOrder> purchaseOrder = new List<PurchaseOrder>();

            foreach (var p in data)
            {
                PurchaseOrder _po = new PurchaseOrder();
                _po.ID = p.ID;
                _po.RefNo = p.RefNo + p.ID.ToString();
                _po.Date = p.CreatedDate.Value;
                _po.SupplierName = p.SupplierName;
                //_po.DeliveryDate = p.
                _po.CancelDate = p.CancelDate;
                _po.Amount = p.TotalAmount.Value;
                _po.Balance = GetBalance(p.ID);
                _po.Status = p.PurchasedOrderStatus;

                purchaseOrder.Add(_po);
            }


            repList.DataSource = purchaseOrder;
            repList.DataBind();



        }


        private decimal GetBalance(long purchase_order_id)
        {
            Database = new DatabaseDataContext();
            var data = Database._PurchasedOrderDetailsSelect(purchase_order_id);

            decimal total_balance = 0;
            foreach (var i in data)
            {
                decimal price = i.UnitPrice.Value;
                decimal serve = i.Served.Value;


                total_balance += (i.Amount.Value - Helper.GetTotalOnDiscount(i.Discount, price * serve));

            }

            return total_balance;
        }

    }
}