using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Newtonsoft.Json;

namespace MegaSummitInventorySystem.Webservice
{
    /// <summary>
    /// Summary description for svr_ProductAssembly
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class svr_ProductAssembly : System.Web.Services.WebService
    {


        


        // ---------------------------------------------------------------- Initialize Database Connection
        DatabaseDataContext Database = new DatabaseDataContext();

        #region Auto Complete


        // ---------------------------------------------------- Product AutoComplete
        [WebMethod]
        public List<AutoCompleteData> AutoCompleteProduct()
        {
            try
            {
                Database = new DatabaseDataContext();
                var data = Database._Products.ToList();


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

        // ---------------------------------------------------- Location AutoComplete
        [WebMethod]
        public List<AutoCompleteData> AutoCompleteLocation()
        {
            try
            {
                Database = new DatabaseDataContext();
                var data = Database._Locations.ToList();


                List<AutoCompleteData> auto = new List<AutoCompleteData>();
                foreach (var item in data)
                {
                    auto.Add(new AutoCompleteData(item.ID, item.LocationName, item.LocationName));
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


        // ------------------------------------------------------------------ Select Product Details
        [WebMethod]
        public string SelectProductDetails(long id)
        {
            try
            {

                Database = new DatabaseDataContext();
                var data = Database._ProductSalesSelect(id);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data 3";
        }

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

        // ------------------------------------------------------------------ Load All Product Unit
        [WebMethod]
        public string SelectUnit(long id)
        {

            try
            {
                Database = new DatabaseDataContext();
                var data = Database._Units.ToList();

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data";

        }


        // ------------------------------------------------------------------ Load Product Assembly List
        [WebMethod]
        public string SelectProductAssembly(long id)
        {

            try
            {
                Database = new DatabaseDataContext();
                var data = Database._ProductAssemblySelect(id);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data";

        }

        #endregion

        #region Inserting Data

        // --------------------------------------------------------------- Purchase Insert
        [WebMethod]
        public string InsertProductAssembly(long productID, long locationID, decimal quantity, long unit, decimal average_cost, string referenceNo, DateTime date, string  batch_number, long prepared_by, string productList)
        {
            try
            {
                long? id = 0;
                Database = new DatabaseDataContext();
                Database._ProductAssemblyInsert(ref id, productID, locationID, quantity, unit, referenceNo, batch_number, prepared_by, date, average_cost);

                long? refIDStock1 = 0;
                long? refIDStockHis1 = 0;
                var dataStock1 = Database._ProductStocks.Where(x => x.ProductID == productID && x.LocationID == locationID).Count();
                if (dataStock1 > 0)
                {
                    Database._ProductStockUpdate(productID, locationID, quantity);
                }
                else
                {
                    Database._ProductStockInsert(ref refIDStock1, productID, locationID, quantity);
                }
                Database._ProductStockHistoryInsert(ref refIDStockHis1, referenceNo, DateTime.Now, "Product Assembly", "", locationID, quantity, 0, 0, "", 0, 0, productID);
                        
                string[] lines = productList.Split('^');

                foreach (var l in lines)
                {
                    if (!string.IsNullOrEmpty(l))
                    {
                        string[] p = l.Split(',');

                        string productCode = p[0];
                        string locationCode = p[1];

                        var product = Database._Products.SingleOrDefault(x => x.ProductName == productCode);
                        var location = Database._Locations.SingleOrDefault(x => x.LocationName == locationCode);

                        decimal qty = decimal.Parse(p[2]);
                        decimal amount = decimal.Parse(p[5]);

                        long? refID = 0;
                        Database._ProductAssemblyDetailsInsert(ref refID, id, product.ID, location.ID, qty, amount);
                        // ----------- details here

                        // ----------------- Insert and Update Stock, Insert Stock History
                        #region Stock Processing
                        long? refIDStock = 0;
                        long? refIDStockHis = 0;
                        var dataStock = Database._ProductStocks.Where(x => x.ProductID == product.ID && x.LocationID == location.ID).Count();
                        if (dataStock > 0)
                        {
                            Database._ProductStockUpdateDecrease(product.ID, location.ID, qty);
                        }
                        //else
                        //{
                        //    Database._ProductStockInsert(ref refIDStock, product.ID, location.ID, qty);
                        //}
                        Database._ProductStockHistoryInsert(ref refIDStockHis, referenceNo, DateTime.Now, "Product Assembly", "", location.ID, 0, qty, 0, "", 0, 0, product.ID);
                        #endregion
                    }
                }
                return id.ToString();
            }
            catch (Exception)
            {


            }

            return "0";
        }

        #endregion

        #region Updating Data

        #endregion

    }
}
