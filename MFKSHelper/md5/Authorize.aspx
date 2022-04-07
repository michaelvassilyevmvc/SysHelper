<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Authorize.aspx.cs" Inherits="MFKSHelper.md5.Authorize" %>

<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Src="~/md5/Md5Test.ascx" TagPrefix="uc1" TagName="Md5Test" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="/Content/bootstrap.min.css" rel="stylesheet" />
    <script src="/Scripts/jquery-3.4.1.min.js"></script>
    <script src="/Scripts/md5.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Server Time: <dx:ASPxLabel ID="lblTime" ClientInstanceName="lblTime" runat="server" Text=" "></dx:ASPxLabel>
            <div class="container">
                <uc1:Md5Test runat="server" ID="Md5Test" />
            </div>
        </div>
    </form>
</body>
</html>
