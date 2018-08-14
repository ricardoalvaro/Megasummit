using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MegaSummitInventorySystem
{
    public partial class aspnetProductInformationLocation : System.Web.UI.Page
    {
        private DatabaseDataContext Database = new DatabaseDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (!string.IsNullOrEmpty(Request["productID"]))
                {
                    LoadData(long.Parse(Request["productID"]));
                }
            }
        }

        private void LoadData(long productID)
        {
            var data = Database._ProductLocationSelect(productID);
            repMain.DataSource = data;
            repMain.DataBind();
        }
    }
}