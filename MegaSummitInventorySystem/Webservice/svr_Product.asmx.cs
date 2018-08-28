using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Newtonsoft.Json;

namespace MegaSummitInventorySystem.Webservice
{
    /// <summary>
    /// Summary description for svr_Product
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class svr_Product : System.Web.Services.WebService
    {
        // ------------------------------------------------------------------ Initialize Database Connection
        private DatabaseDataContext Database = new DatabaseDataContext();

        #region Auto Complete

        // ------------------------------------------------------------------ Load All Product (AutoComplete)
        [WebMethod]
        public List<AutoCompleteData> AutoCompleteProduct()
        {
            try
            {
                Database = new DatabaseDataContext();
                var data = Database._ProductSelect(0, string.Empty);


                List<AutoCompleteData> auto = new List<AutoCompleteData>();
                foreach (var item in data)
                {
                    auto.Add(new AutoCompleteData(item.ID, item.ProductName, item.ProductName));
                }

                return auto;

            }
            catch (Exception)
            {

            }

            return null;
        }

        #endregion

        #region Selecting Data

        // ------------------------------------------------------------------ Load Product Details By Selected Product
        [WebMethod]
        public string SelectProduct(long id, string product_name)
        {

            try
            {
                Database = new DatabaseDataContext();
                var data = Database._ProductSelect(id, product_name);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.None);
            }
            catch
            {

            }

            return "Error on returning data";

        }

        // ------------------------------------------------------------------ Load Product Stock Card By Selected Product
        [WebMethod]
        public string SelectStockCard(long productID, long locationID)
        {

            try
            {
                Database = new DatabaseDataContext();
                var data = Database._ProductStockHistorySelect(productID);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data";

        }

        // ------------------------------------------------------------------ Load Customer Item By Selected Product
        [WebMethod]
        public string SelectCustomerItem(long productID)
        {

            try
            {
                Database = new DatabaseDataContext();
                var data = Database._CustomerItemSelect(productID);
                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data";

        }

        // ------------------------------------------------------------------ Load Supplier Item By Selected Product
        [WebMethod]
        public string SelectSupplierItem(long productID)
        {

            try
            {
                Database = new DatabaseDataContext();
                var data = Database._SupplierItemSelect(productID);
                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data";

        }

        // ------------------------------------------------------------------ Load Product Pre Order
        [WebMethod]
        public string SelectProductPreOrder()
        {

            try
            {
                Database = new DatabaseDataContext();
                var data = Database._ProductPreOrderSelect();

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data";

        }

        // ------------------------------------------------------------------ Load Product Pre Order
        [WebMethod]
        public string SelectProductOpeningBalance()
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


        // ------------------------------------------------------------------ Load Product Opening Balance Reference
        [WebMethod]
        public string SelectProductOpeningBalanceRef()
        {

            try
            {
                Database = new DatabaseDataContext();
                var data = Database._Settings.Where(x => x.ID == 14).ToList();

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data";

        }

        [WebMethod]
        public List<_ProductStockSelectResult> SelectProductStock(long product_id, long location_id)
        {
            return Database._ProductStockSelect(product_id, location_id).ToList<_ProductStockSelectResult>();
        }

        #endregion

        #region Inserting Data

        // ------------------------------------------------------------------ Saving Product Information
        [WebMethod]
        public long InsertProduct(string product_picture, string product_name, string brand, string upc_sku, long product_department_id, long product_class_id,long location_id ,decimal reorder_point, decimal reorder_qty, string notes, long packing_id, long unit_id, long sub_unit_id, decimal price_a, decimal price_b, decimal price_c, decimal discount_a, decimal discount_b, decimal discount_c)
        {

            try
            {
                long? id = 0;

                Database = new DatabaseDataContext();
                Database._ProductInsert(ref id, product_picture, product_name, brand, upc_sku, product_department_id, product_class_id, location_id, reorder_point, reorder_qty, notes, packing_id, unit_id, sub_unit_id, price_a, price_b, price_c, discount_a, discount_b, discount_c);

                return id.Value;
            }
            catch
            {

            }

            return 0;

        }

        // ------------------------------------------------------------------ Saving Product Information
        [WebMethod]
        public bool InsertProductOpeningBalance(long productID, long locationID, decimal qty, string refNo, DateTime dateCreated, string price, string discount)
        {

            try
            {
                long? id = 0;

                Database = new DatabaseDataContext();
                // ----------------- Insert and Update Stock, Insert Stock History
                #region Stock Processing
                long? refIDStock = 0;
                long? refIDStockHis = 0;
                var dataStock = Database._ProductStocks.Where(x => x.ProductID == productID && x.LocationID == locationID).Count();
                if (dataStock > 0)
                {
                    Database._ProductStockUpdate(productID, locationID, qty);
                }
                else
                {
                    Database._ProductStockInsert(ref refIDStock, productID, locationID, qty);
                }
                Database._ProductStockHistoryInsert(ref refIDStockHis, refNo, DateTime.Now, "Opening Balance", string.Empty, locationID, qty, 0, decimal.Parse(price), discount, 0, 0, productID);
                #endregion 
                return true;
            }
            catch
            {

            }

            return false;

        }


        #endregion

        #region Updating Data

        // ------------------------------------------------------------------ Updating Product Information
        [WebMethod]
        public string UpdateProduct(long id,string product_picture, string product_name, string brand, string upc_sku, long product_department_id, long product_class_id, long location_id,  decimal reorder_point, decimal reorder_qty, string notes, long packing_id, long unit_id, long sub_unit_id, decimal price_a, decimal price_b, decimal price_c, decimal discount_a, decimal discount_b, decimal discount_c)
        {

            try
            {
                
                    Database = new DatabaseDataContext();
                    Database._ProductUpdate( id, product_picture, product_name, brand, upc_sku, product_department_id, product_class_id,location_id, reorder_point, reorder_qty, notes, packing_id, unit_id, sub_unit_id, price_a, price_b, price_c, discount_a, discount_b, discount_c);


                    return id.ToString();
            }
            catch
            {

            }

            return "0";

        }

        // ------------------------------------------------------------------ Updating Product Picture
        [WebMethod]
        public bool UpdateProductPicture(long id, string product_picture)
        {

            try
            {

                Database = new DatabaseDataContext();
                Database._ProductUpdatePicture(id, product_picture);


                return true;
            }
            catch
            {

            }

            return false;
        }

        #endregion

        #region Deleting Data

        // ------------------------------------------------------------------- Deleting Data
        [WebMethod]
        public bool DeleteProduct(long id)
        {

            try
            {

                Database = new DatabaseDataContext();
                Database._ProductDelete(id);

                return true;
            }
            catch
            {

            }

            return false;

        }

        #endregion
    }
}
