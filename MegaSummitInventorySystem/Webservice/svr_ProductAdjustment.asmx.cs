using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Newtonsoft.Json;

namespace MegaSummitInventorySystem.Webservice
{
    /// <summary>
    /// Summary description for svr_ProductAdjustment
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class svr_ProductAdjustment : System.Web.Services.WebService
    {

        // ---------------------------------------------------------------- Initialize Database Connection
        DatabaseDataContext Database = new DatabaseDataContext();


        #region Selecting Data

        // ------------------------------------------------------------------ Load All Product
        [WebMethod]
        public string SelectProduct(long id)
        {

            try
            {
                Database = new DatabaseDataContext();
                var data = Database._Products.ToList();

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data";

        }

        // ------------------------------------------------------------------ Load All Location
        [WebMethod]
        public string SelectLocation(long id)
        {

            try
            {
                Database = new DatabaseDataContext();
                var data = Database._Locations.ToList();

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data";

        }

        // ------------------------------------------------------------------ Load All Reason of Adjustment
        [WebMethod]
        public string SelectReason(long id)
        {

            try
            {
                Database = new DatabaseDataContext();
                var data = Database._ReasonOfAdjustments.ToList();

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data";

        }

        // ------------------------------------------------------------------ Load Product Stock
        [WebMethod]
        public string SelectProductStock(long productID, long locationID)
        {

            try
            {
                Database = new DatabaseDataContext();
                var data = Database._ProductStocks.Where(x => x.ProductID == productID && x.LocationID == locationID).ToList();

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data";

        }

        // ------------------------------------------------------------------ Load Reference
        [WebMethod]
        public string SelectReference(long referenceID)
        {

            try
            {
                Database = new DatabaseDataContext();
                var data = Database._Settings.Where(x => x.ID == referenceID).ToList();

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data";

        }

        // ------------------------------------------------------------------ Load Inventory Adjustment List
        [WebMethod]
        public string SelectInventoryAdjustment(long id)
        {

            try
            {
                Database = new DatabaseDataContext();
                var data = Database._InventoryAdjustmentSelect(id);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data";

        }

        #endregion

        #region Inserting Data

        // ------------------------------------------------------------------ Saving Inventory Adjustment
        [WebMethod]
        public string InsertInventoryAdjustment(string refNO, string referenceNumber, long productID, long locationID, decimal CurrQty, decimal NewQty, decimal DiffQty, decimal NewPrice, long reasonID)
        {

            try
            {
                long? refID = 0;
                Database = new DatabaseDataContext();
                Database._InventoryAdjustmentInsert(ref refID, 13, referenceNumber, productID, locationID, CurrQty, NewQty, DiffQty, reasonID);

                // ----------------- Insert and Update Stock, Insert Stock History
                #region Stock Processing
                long? refIDStock = 0;
                long? refIDStockHis = 0;
                var dataStock = Database._ProductStocks.Where(x => x.ProductID == productID && x.LocationID == locationID).Count();
                if (dataStock > 0)
                {
                    Database._ProductStockAdjustmentUpdate(productID, locationID, NewQty);
                }
                else
                {
                    Database._ProductStockInsert(ref refIDStock, productID, locationID, NewQty);
                }
                Database._ProductStockHistoryInsert(ref refIDStockHis, refNO + "" + referenceNumber, DateTime.Now, "Inventory Adjustment", "", locationID, NewQty, 0, NewPrice, "0", 0, 0, productID);
                #endregion 
                return "";
            }
            catch
            {

            }

            return "Error on returning data";

        }


        #endregion

        #region Updating Data

        // ------------------------------------------------------------------ Updating Inventory Adjustment
        [WebMethod]
        public string UpdateInventoryAdjustment(long id,string refNO, string referenceNumber, long productID, long locationID, decimal CurrQty, decimal NewQty, decimal DiffQty, decimal NewPrice, long reasonID)
        {

            try
            {
                Database = new DatabaseDataContext();
                Database._InventoryAdjusmentUpdate(id, 13, referenceNumber, productID, locationID, CurrQty, NewQty, DiffQty, reasonID);

                // ----------------- Insert and Update Stock, Insert Stock History
                #region Stock Processing
                long? refIDStock = 0;
                var dataStock = Database._ProductStocks.Where(x => x.ProductID == productID && x.LocationID == locationID).Count();
                if (dataStock > 0)
                {
                    Database._ProductStockAdjustmentUpdate(productID, locationID, NewQty);
                }
                else
                {
                    Database._ProductStockInsert(ref refIDStock, productID, locationID, NewQty);
                }
                #endregion
                return "";
            }
            catch
            {

            }

            return "Error on returning data";

        }

        #endregion

    }
}
