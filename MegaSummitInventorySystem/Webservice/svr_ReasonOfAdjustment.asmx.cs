﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Newtonsoft.Json;


namespace MegaSummitInventorySystem.Webservice
{
    /// <summary>
    /// Summary description for svr_ReasonOfAdjustment
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class svr_ReasonOfAdjustment : System.Web.Services.WebService
    {
        private DatabaseDataContext Database = new DatabaseDataContext();


        [WebMethod]
        public List<AutoCompleteData> AutoCompleteReasonOfAdjustment()
        {
            try
            {
                Database = new DatabaseDataContext();
                var data = Database._ReasonOfAdjustmentSelect(0, string.Empty);


                List<AutoCompleteData> auto = new List<AutoCompleteData>();
                foreach (var item in data)
                {
                    auto.Add(new AutoCompleteData(item.ID, item.ReasonName, item.ReasonName));
                }

                return auto;

            }
            catch (Exception)
            {

            }

            return null;
        }


        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }

        [WebMethod]
        public string SelectReasonOfAdjustment(long id, string adjustment_name)
        {
            try
            {

                Database = new DatabaseDataContext();
                var data = Database._ReasonOfAdjustmentSelect(id, adjustment_name);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data";
        }

        [WebMethod]
        public bool InsertReasonOfAdjustment(string adjustment_name)
        {
            try
            {
                long? id = 0;
                Database = new DatabaseDataContext();
                Database._ReasonOfAdjustmentInsert(ref id, adjustment_name);
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }


        [WebMethod]
        public bool UpdateReasonOfAdjustment(long id, string adjustment_name)
        {
            try
            {
                Database = new DatabaseDataContext();
                Database._ReasonOfAdjustmentUpdate(id, adjustment_name);
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }


        [WebMethod]
        public bool DeleteReasonOfAdjustment(long id)
        {
            try
            {
                Database = new DatabaseDataContext();
                Database._ReasonOfAdjustmentDelete(id);
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }



    }
}
