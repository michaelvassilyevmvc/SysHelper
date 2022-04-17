using Dapper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace MFKSHelper
{
    public class Global : HttpApplication
    {
        public static int CurrentUserFirmID = 22;
        public static int CurrentUserRegionID = 1;
        public static bool CurrentUserEditable = true;
        public static string LangQuery = "Rus";

        public static int AnotherRegionFirmID
        {
            get
            {
                if (HttpContext.Current.Session["anotherRegionFirmID"] == null)
                {
                    using (IDbConnection db = new SqlConnection(Global.DefaultConnectionString))
                    {
                        string query = $"SELECT ID FROM dbo.Firms WHERE Type = 3 AND RegionID = {CurrentUserRegionID}";
                        int firmId = db.Query<int>(query).FirstOrDefault();
                        HttpContext.Current.Session["anotherRegionFirmID"] = firmId;
                    }
                }
                return Convert.ToInt32(HttpContext.Current.Session["anotherRegionFirmID"]);
            }
        }

        void Application_Start(object sender, EventArgs e)
        {
            // Код, выполняемый при запуске приложения
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }

        public static string DefaultConnectionString
        {
            get { return WebConfigurationManager.ConnectionStrings["MFKSConnectionString"].ConnectionString; }
        }
    }
}