<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AthleteCard.aspx.cs" Inherits="MFKSHelper.Athletes.AthleteCard" %>

<%@ Register Src="~/Athletes/Elements/AthleteTrainerList.ascx" TagPrefix="uc1" TagName="AthleteTrainerList" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <uc1:AthleteTrainerList runat="server" id="ucAthleteTrainerList" />
        </div>
    </form>
</body>
</html>
