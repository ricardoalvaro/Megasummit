﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Newtonsoft.Json;


namespace MegaSummitInventorySystem.Webservice
{
    /// <summary>
    /// Summary description for svr_Remarks
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class svr_Remarks : System.Web.Services.WebService
    {
        private DatabaseDataContext Database = new DatabaseDataContext();

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }

        [WebMethod]
        public List<AutoCompleteData> AutoCompleteRemarks()
        {
            try
            {
                Database = new DatabaseDataContext();
                var data = Database._RemarksSelect(0, string.Empty);


                List<AutoCompleteData> auto = new List<AutoCompleteData>();
                foreach (var item in data)
                {
                    auto.Add(new AutoCompleteData(item.ID, item.RemarksName, item.RemarksName));
                }

                return auto;

            }
            catch (Exception)
            {

            }

            return null;
        }

        [WebMethod]
        public string SelectRemarks(long id, string remarks_name)
        {

            try
            {
                Database = new DatabaseDataContext();
                var data = Database._RemarksSelect(id, remarks_name);

                return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.Indented);
            }
            catch
            {

            }

            return "Error on returning data";

        }

        [WebMethod]
        public bool InsertRemarks(string remarks_name)
        {
            try
            {
                long? id = 0;
                Database = new DatabaseDataContext();
                Database._RemarksInsert(ref id, remarks_name);
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }

        [WebMethod]
        public bool UpdateRemarks(long id, string remarks_name)
        {
            try
            {
                Database = new DatabaseDataContext();
                Database._RemarksUpdate(id, remarks_name);
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }

        [WebMethod]
        public bool DeleteRemarks(long id)
        {
            try
            {
                Database = new DatabaseDataContext();
                Database._RemarksDelete(id);
                return true;
            }
            catch (Exception)
            {


            }

            return false;
        }




    }
}
