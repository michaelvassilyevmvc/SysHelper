<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SpeedGrid.aspx.cs" Inherits="MFKSHelper.SpeedRun.SpeedGrid" %>

<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Src="~/SpeedRun/Element/AthleteTrainerList.ascx" TagPrefix="uc1" TagName="AthleteTrainerList" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="width:50%">

            <uc1:AthleteTrainerList runat="server" ID="AthleteTrainerList" />

        </div>
    </form>
</body>
</html>
