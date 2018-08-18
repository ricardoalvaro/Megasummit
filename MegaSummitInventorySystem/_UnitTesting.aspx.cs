using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MegaSummitInventorySystem
{
    public partial class _UnitTesting : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string x = string.Empty;

            for (int i = 0; i < 50000; i++)
            {
                x += "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.";
            }

            Response.Write(x);


            //var total_amount = 100;
            //var discount = "-20";

            ////expected result is equals to 80

            //string result = ProductVM.ReturnNetPrice(discount, total_amount);
        }
    }
}