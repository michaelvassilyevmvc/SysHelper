<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SpeedGrid.aspx.cs" Inherits="MFKSHelper.SpeedRun.SpeedGrid" %>

<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Src="~/SpeedRun/Element/AthleteTrainerList.ascx" TagPrefix="uc1" TagName="AthleteTrainerList" %>


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
        <div style="width:50%;padding:20px;">
            <dx:ASPxCallbackPanel ID="cbPanel" ClientInstanceName="cbPanel" runat="server" OnCallback="cbPanel_Callback">
                <PanelCollection>
                    <dx:PanelContent>


                        
                        <dx:ASPxComboBox 
                            ID="cbAthleteList" 
                            ClientInstanceName="cbAthleteList" 
                            runat="server" 
                            ValueField="ID" 
                            TextField="Name" 
                            Width="100%"  
                            AutoPostBack="false"
                            DataSourceID="dsAthleteList" 
                            ValueType="System.Int32" 
                            Caption="Спортсмены"
                            SelectedIndex="0"
                            >
                            <ClientSideEvents SelectedIndexChanged="function(s,e){ cbPanel.PerformCallback('refreshAthlete'); }" />
                        </dx:ASPxComboBox>
                        <br />
                        <dx:ASPxComboBox ID="cbAthleteKindOfSportList" 
                            ClientInstanceName="cbAthleteKindOfSportList" 
                            runat="server" 
                            ValueField="KindOfSportID" 
                            TextField="Name" 
                            Width="100%"  
                            AutoPostBack="false"
                            DataSourceID="dsAthleteKindOfSportList" 
                            SelectedIndex="0" 
                            Caption="Вид спорта"
                            >
                            <ClientSideEvents SelectedIndexChanged="function(s,e){ cbPanel.PerformCallback('refreshKindOfSport'); }" />
                        </dx:ASPxComboBox>


            <asp:SqlDataSource runat="server" ID="dsAthleteKindOfSportList" ConnectionString='<%$ ConnectionStrings:MFKSConnectionString %>' 
                SelectCommand="GetAthleteKindOfSportList" SelectCommandType="StoredProcedure" OnSelecting="dsAthleteKindOfSportList_Selecting" >
                <SelectParameters>
                    <asp:Parameter Name="AthleteID" />
                    <asp:Parameter Name="Lang" DefaultValue="Rus" />
                    <asp:Parameter Name="IsFilter" DefaultValue="1" />
                </SelectParameters>
            </asp:SqlDataSource>

            <asp:SqlDataSource runat="server" ID="dsAthleteList" ConnectionString='<%$ ConnectionStrings:MFKSConnectionString %>' 
                SelectCommand="select ID, dbo.GetFIO(Last_name, First_name, Pat_name) as Name from dbo.Athletes
where FirmID = @FirmID and year(Date_of_firm_entered) = 2021
Order by Name" OnSelecting="dsAthleteList_Selecting" >
                <SelectParameters>
                    <asp:Parameter DefaultValue="0" Name="FirmID" Type="Int32"></asp:Parameter>
                </SelectParameters>
            </asp:SqlDataSource>

            <uc1:AthleteTrainerList runat="server" ID="ucAthleteTrainerList" />

                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>
            

        </div>
    </form>
</body>
</html>
