using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MegaSummitInventorySystem;
using Newtonsoft.Json;



    public class PurchaseOrderVM
    {

        private static DatabaseDataContext Database = new DatabaseDataContext();

        public static string SupplierPurchaseOrderDetails(long supplier_id)
        {
            try
            {
                Database = new DatabaseDataContext();
                if (supplier_id == 0)
                {
                    return "'Null'";
                }
                //_PurchasedOrderSelectSupplier
                var data = Database._PurchasedOrderSelectSupplier(supplier_id).ToList();

                if (data.Count <= 0)
                {
                    return "'Null'";
                }
                else
                {
                    return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.None);
                }
            }
            catch (Exception)
            {
                return string.Empty;
            }
        }

    }
