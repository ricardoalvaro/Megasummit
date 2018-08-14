using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MegaSummitInventorySystem.Webservice
{
    /// <summary>
    /// Summary description for ProductUpload
    /// </summary>
    public class ProductUpload : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string FilePath = string.Empty;
            if (context.Request.Files.Count > 0)
            {
                HttpFileCollection files = context.Request.Files;
                for (int i = 0; i < files.Count; i++)
                {
                    HttpPostedFile file = files[i];
                    FilePath = Guid.NewGuid().ToString() + "_" + file.FileName;
                    string fname = context.Server.MapPath("~/image/" + FilePath);
                    file.SaveAs(fname);

                    //Database._CompanyUpdateImage(1, "image/" + FilePath);
                }
                context.Response.ContentType = "text/plain";
                context.Response.Write(FilePath);
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}