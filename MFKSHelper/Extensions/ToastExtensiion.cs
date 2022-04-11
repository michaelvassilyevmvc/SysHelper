using MFKSHelper.Classes.Main;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI;

namespace MFKSHelper.Extensions
{
    public static class ToastExtension
    {
        public static void ShowToastr(this Page page, string message, string title = "", ToasterMessageType type = ToasterMessageType.Info, ToasterMessagePositionType positionType = ToasterMessagePositionType.BottomRight, int timeoutValue = 4000)
        {
            page.ClientScript.RegisterStartupScript(page.GetType(), "toastr_message", ToasterMessage.Text(message, title, type, positionType, timeoutValue), addScriptTags: true);
        }

        public static void ShowToastr(this DevExpress.Web.ASPxCallbackPanel panel, string message, string title = "", ToasterMessageType type = ToasterMessageType.Info, ToasterMessagePositionType positionType = ToasterMessagePositionType.BottomRight, int timeoutValue = 4000)
        {
            panel.JSProperties["cpPanelMessage"] = ToasterMessage.Text(message, title, type, positionType, timeoutValue);
        }

        public static void ShowToastr(this DevExpress.Web.ASPxGridView grid, string message, string title = "", ToasterMessageType type = ToasterMessageType.Info, ToasterMessagePositionType positionType = ToasterMessagePositionType.BottomRight, int timeoutValue = 4000)
        {
            grid.JSProperties["cpPanelMessage"] = ToasterMessage.Text(message, title, type, positionType, timeoutValue);
        }

        public static void ShowToastr(this DevExpress.Web.ASPxCardView card, string message, string title = "", ToasterMessageType type = ToasterMessageType.Info, ToasterMessagePositionType positionType = ToasterMessagePositionType.BottomRight, int timeoutValue = 4000)
        {
            card.JSProperties["cpPanelMessage"] = ToasterMessage.Text(message, title, type, positionType, timeoutValue);
        }


    }
}
