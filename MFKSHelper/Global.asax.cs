using System;
using System.Collections.Generic;
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