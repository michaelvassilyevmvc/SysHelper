<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MainInfoTest.aspx.cs" Inherits="MFKSHelper.SpeedRun.MainInfoTest" %>

<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Src="~/SpeedRun/Element/AthleteMainInfo.ascx" TagPrefix="uc1" TagName="AthleteMainInfo" %>
<%@ Register Src="~/SpeedRun/Element/AthleteTrainerList.ascx" TagPrefix="uc1" TagName="AthleteTrainerList" %>
<%@ Register Src="~/SpeedRun/Element/AthleteAdditionalKindOfSportList.ascx" TagPrefix="uc1" TagName="AthleteAdditionalKindOfSportList" %>




<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
     <webopt:bundlereference runat="server" path="~/Content/css" />
    <asp:PlaceHolder runat="server">
        <%: Scripts.Render("~/bundles/toast") %>
    </asp:PlaceHolder>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <dx:ASPxCallbackPanel ID="cbPanel" ClientInstanceName="cbPanel" runat="server" OnCallback="cbPanel_Callback" >
                <PanelCollection>
                    <dx:PanelContent>
                        <div style="margin:20px;">
                        <uc1:AthleteMainInfo runat="server" id="ucAthleteMainInfo" />
                            </div>
                        <uc1:AthleteTrainerList runat="server" ID="ucAthleteTrainerList" />
                        <br />
                        <label>Дополнительные виды спорта</label>
                        <uc1:AthleteAdditionalKindOfSportList runat="server" id="ucAthleteAdditionalKindOfSportList" />

                         </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>
        </div>
    </form>
</body>
</html>
