using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace MegaSummitInventorySystem.Webservice
{
    /// <summary>
    /// Summary description for svr_ProductOpeningBalance
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class svr_ProductOpeningBalance : System.Web.Services.WebService
    {

        private DatabaseDataContext Database = new DatabaseDataContext();

        [WebMethod]
        public bool InsertOpeningBalance(string refNo,long productID,long locationID,decimal quantity,long unitID,decimal unitPrice,string discount,decimal amount,DateTime transactionDate)
        {
            Database._OpeningBalanceInsert(refNo, productID, locationID, quantity, unitID, unitPrice, discount, amount, transactionDate);

            return false;
        }

        [WebMethod]
        public List<_OpeningBalanceSelectResult> SelectOpeningBalance(long opening_id)
        {
            return Database._OpeningBalanceSelect(opening_id, 0).ToList<_OpeningBalanceSelectResult>();
        }



    }
}
