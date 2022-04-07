using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MFKSHelper
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Init(object sender, EventArgs e)
        {
            gvTrainersSelect.DataBind();
        }

        protected void Page_Load(object sender, EventArgs e)
        {

            //if (!IsCallback)
            //    if (Session["selectedRow"] != null)
            //        gvTrainersSelect.Selection.SelectRowByKey(Session["selectedRow"]);
            
        }

        

        
    }
}