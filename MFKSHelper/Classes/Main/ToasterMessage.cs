namespace MFKSHelper.Classes.Main
{
    public static class ToasterMessage
    {
        public static string Text(string message
            , string title
            , ToasterMessageType type = ToasterMessageType.Info
            , ToasterMessagePositionType positionType = ToasterMessagePositionType.BottomRight
            , int timeoutValue = 2000)
        {

            string typeMessageStr = "";
            switch (type)
            {
                case ToasterMessageType.Success:
                    typeMessageStr = "success";
                    break;
                case ToasterMessageType.Info:
                    typeMessageStr = "info";
                    break;
                case ToasterMessageType.Warning:
                    typeMessageStr = "warning";
                    break;
                case ToasterMessageType.Error:
                    typeMessageStr = "error";
                    break;
                default:
                    typeMessageStr = "success";
                    break;
            }

            string positionMessageStr = "";

            switch (positionType)
            {
                case ToasterMessagePositionType.TopRight:
                    positionMessageStr = "toast-top-right";
                    break;
                case ToasterMessagePositionType.BottomRight:
                    positionMessageStr = "toast-bottom-right";
                    break;
                case ToasterMessagePositionType.BottomLeft:
                    positionMessageStr = "toast-bottom-left";
                    break;
                case ToasterMessagePositionType.TopLeft:
                    positionMessageStr = "toast-top-left";
                    break;
                case ToasterMessagePositionType.TopFullWidth:
                    positionMessageStr = "toast-top-full-width";
                    break;
                case ToasterMessagePositionType.BottomfullWidth:
                    positionMessageStr = "toast-bottom-full-width";
                    break;
                case ToasterMessagePositionType.TopCenter:
                    positionMessageStr = "toast-top-center";
                    break;
                case ToasterMessagePositionType.BottomCenter:
                    positionMessageStr = "toast-bottom-center";
                    break;
                default:
                    break;
            }

            return $"toastr.options.preventDuplicates=false;toastr.options.positionClass='{positionMessageStr}';toastr.options.timeOut={timeoutValue};toastr.options.closeButton=true;toastr['{typeMessageStr}']('{message}','{title}');";
        }
    }
}
