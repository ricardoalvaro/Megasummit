using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MegaSummitInventorySystem
{
    public partial class aspnetSupplier : System.Web.UI.Page
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
            var data = Database.SupplierSelect(0);

            List<Supplier> suppliers = new List<Supplier>();

            foreach (var s in data)
            {
                Supplier _supp = new Supplier();

                _supp.ID = s.ID;
                _supp.SupplierName = s.SupplierName;
                _supp.RegionProvince = s.RegionName;
                _supp.ContactPerson = s.ContactPerson;
                _supp.Telephone = s.BusinessPhone1;
                _supp.Fax = s.Fax;
                _supp.Balance = 0;


                suppliers.Add(_supp);

            }

            repList.DataSource = suppliers;
            repList.DataBind();

        }
    }
}