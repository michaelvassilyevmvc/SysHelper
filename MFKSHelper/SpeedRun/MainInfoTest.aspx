<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MainInfoTest.aspx.cs" Inherits="MFKSHelper.SpeedRun.MainInfoTest" %>

<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Src="~/SpeedRun/Element/AthleteMainInfo.ascx" TagPrefix="uc1" TagName="AthleteMainInfo" %>
<%@ Register Src="~/SpeedRun/Element/AthleteTrainerList.ascx" TagPrefix="uc1" TagName="AthleteTrainerList" %>
<%@ Register Src="~/SpeedRun/Element/AthleteAdditionalKindOfSportList.ascx" TagPrefix="uc1" TagName="AthleteAdditionalKindOfSportList" %>
<%@ Register Src="~/SpeedRun/Element/AthleteFirmList.ascx" TagPrefix="uc1" TagName="AthleteFirmList" %>
<%@ Register Src="~/SpeedRun/Element/AthleteAdditionalInfo.ascx" TagPrefix="uc1" TagName="AthleteAdditionalInfo" %>
<%@ Register Src="~/SpeedRun/Element/AthleteContactInfo.ascx" TagPrefix="uc1" TagName="AthleteContactInfo" %>
<%@ Register Src="~/SpeedRun/Element/AthleteAntroInfo.ascx" TagPrefix="uc1" TagName="AthleteAntroInfo" %>
<%@ Register Src="~/SpeedRun/Element/AthleteParentsInfo.ascx" TagPrefix="uc1" TagName="AthleteParentsInfo" %>
<%@ Register Src="~/SpeedRun/Element/AthletePerformance.ascx" TagPrefix="uc1" TagName="AthletePerformance" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
     <webopt:bundlereference runat="server" path="~/Content/css" />
    <asp:PlaceHolder runat="server">
        <%: Scripts.Render("~/bundles/toast") %>
    </asp:PlaceHolder>
    <style>
        .p-10{
            padding:10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
       
        <div>
            <dx:ASPxCallbackPanel ID="cbPanel" ClientInstanceName="cbPanel" runat="server" OnCallback="cbPanel_Callback" >
                <ClientSideEvents EndCallback="Master.cp_EndCallback" />
                <PanelCollection>
                    <dx:PanelContent>
                        <div class="p-10">
                            <dx:ASPxCheckBox
                                ID="cbEditable"
                                ClientInstanceName="cbEditable"
                                runat="server"
                                Checked="true"
                                AutoPostBack="false"
                                Text="Редактируемое?">
                                <ClientSideEvents ValueChanged="function(s,e){cbPanel.PerformCallback('permissions_change');}" />
                            </dx:ASPxCheckBox>
                        </div>
                        <div class="p-10">
                            <dx:ASPxProgressBar
                                ID="pbAthleteCardPercent"
                                ClientInstanceName="pbAthleteCardPercent"
                                runat="server"
                                Width="100%"
                                DisplayFormatString="Процент заполнения карточки: {0}"
                                CssClass="text-align-center">
                            </dx:ASPxProgressBar>
                            <br />
                            <dx:ASPxRoundPanel ID="rpMainInfo" runat="server" ShowCollapseButton="true"  HeaderText="Основная информация: {0}" Width="100%">
                                <PanelCollection>
                                    <dx:PanelContent>

                                        <uc1:AthleteMainInfo runat="server" id="ucAthleteMainInfo" />

                                    </dx:PanelContent>
                                </PanelCollection>
                            </dx:ASPxRoundPanel>
                            <br />
                             <dx:ASPxRoundPanel ID="rpTrainerList" runat="server" ShowCollapseButton="true" HeaderText="Список тренеров: {0}" Width="100%" >
                                <PanelCollection>
                                    <dx:PanelContent>

                                       <uc1:AthleteTrainerList runat="server" ID="ucAthleteTrainerList" />

                                    </dx:PanelContent>
                                </PanelCollection>
                            </dx:ASPxRoundPanel>
                            <br />
                            <dx:ASPxRoundPanel ID="rpAdditionalKindOfSportList" runat="server" ShowCollapseButton="true" HeaderText="Дополнительные виды спорта" Width="100%" >
                                <PanelCollection>
                                    <dx:PanelContent>

                                        <uc1:AthleteAdditionalKindOfSportList runat="server" id="ucAthleteAdditionalKindOfSportList" />

                                    </dx:PanelContent>
                                </PanelCollection>
                            </dx:ASPxRoundPanel>
                             <br />
                            <dx:ASPxRoundPanel ID="rpFirmList" runat="server" ShowCollapseButton="true" HeaderText="Список организаций: {0}" Width="100%" >
                            <PanelCollection>
                                <dx:PanelContent>

                                    <uc1:AthleteFirmList runat="server" id="ucAthleteFirmList" />

                                </dx:PanelContent>
                            </PanelCollection>
                        </dx:ASPxRoundPanel>
                            <br />

                            <dx:ASPxRoundPanel ID="rpAdditionalInfo" runat="server" ShowCollapseButton="true" HeaderText="Дополнительная информация: {0}" Width="100%">
                                <PanelCollection>
                                    <dx:PanelContent>
                                        <uc1:AthleteAdditionalInfo runat="server" ID="ucAthleteAdditionalInfo" />
                                    </dx:PanelContent>
                                </PanelCollection>
                            </dx:ASPxRoundPanel>
                            <br />


                            <dx:ASPxRoundPanel ID="rpContactInfo" runat="server" ShowCollapseButton="true" HeaderText="Контактная информация: {0}" Width="100%">
                                <PanelCollection>
                                    <dx:PanelContent>
                                        <uc1:AthleteContactInfo runat="server" id="ucAthleteContactInfo" />
                                    </dx:PanelContent>
                                </PanelCollection>
                            </dx:ASPxRoundPanel>
                            <br />

                            <dx:ASPxRoundPanel ID="rpAntroInfo" runat="server" ShowCollapseButton="true" HeaderText="Антропометрические данные спортсмена: {0}" Width="100%">
                                <PanelCollection>
                                    <dx:PanelContent>
                                        <uc1:AthleteAntroInfo runat="server" id="ucAthleteAntroInfo" />
                                    </dx:PanelContent>
                                </PanelCollection>
                            </dx:ASPxRoundPanel>
                            <br />

                            <dx:ASPxRoundPanel ID="rpParentInfo" runat="server" ShowCollapseButton="true" HeaderText="Данные о родителях, опекунах, законных представителях: {0}" Width="100%">
                                <PanelCollection>
                                    <dx:PanelContent>
                                        <uc1:AthleteParentsInfo runat="server" id="ucAthleteParentsInfo" />
                                    </dx:PanelContent>
                                </PanelCollection>
                            </dx:ASPxRoundPanel>
                            <br />

                            <dx:ASPxRoundPanel ID="rpPerformance" runat="server" ShowCollapseButton="true" HeaderText="Выступления на областных, республиканских и международных соревнованиях и учебно-тренировочных сборах: {0}" Width="100%">
                                <PanelCollection>
                                    <dx:PanelContent>
                                        <uc1:AthletePerformance runat="server" id="ucAthletePerformance" />
                                    </dx:PanelContent>
                                </PanelCollection>
                            </dx:ASPxRoundPanel>
                            <br />

                        </div>
                        

                         </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>
        </div>
    </form>
</body>
</html>
