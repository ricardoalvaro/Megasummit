using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MegaSummitInventorySystem
{
    public partial class aspnetProductAssembly1 : System.Web.UI.Page
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
            var data = Database._ProductAssemblySelect(0);
            repList.DataSource = data;
            repList.DataBind();
        }



        public string AssembleDetail()
        {
            try
            {
                Database = new DatabaseDataContext();
                var data = Database._ProductAssemblyDetails.ToList<_ProductAssemblyDetail>();
                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
                //return auto;

            }
            catch (Exception)
            {

            }

            return null;
        }

    }
}