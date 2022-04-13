<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdditionalKindOfSport.aspx.cs" Inherits="MFKSHelper.SpeedRun.AdditionalKindOfSport" %>
<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

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
        .grid-row{
            padding:10px !important;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <dx:ASPxGridView
                    ID="gvAthleteAdditionKindOfSport"
                    ClientInstanceName="gvAthleteAdditionKindOfSport"
                    runat="server"
                    AutoGenerateColumns="False"
                    KeyFieldName="KindOfSportID"
                    Width="100%"
                    DataSourceID="dsAthleteKindOfSportList"
                    OnRowInserted="gvAthleteAdditionKindOfSport_RowInserted"
                    OnRowDeleted="gvAthleteAdditionKindOfSport_RowDeleted"
                    >
                    <ClientSideEvents EndCallback="Master.cp_EndCallback" />
                    <%--<ClientSideEvents EndCallback="AthletesCard.AdditionKindOfSportListUpdate" />--%>
                    <Settings
                        ShowFilterRow="True"
                        ShowColumnHeaders="false"></Settings>
                    <SettingsAdaptivity HideDataCellsAtWindowInnerWidth="700">
                        <AdaptiveDetailLayoutProperties>
                            <SettingsItemCaptions Location="Top" />
                        </AdaptiveDetailLayoutProperties>
                    </SettingsAdaptivity>
                    <SettingsPager Mode="ShowAllRecords">
                    </SettingsPager>
                    <SettingsEditing EditFormColumnCount="1">
                    </SettingsEditing>
                    <SettingsDataSecurity AllowEdit="False" AllowDelete="true" />

                    <SettingsPopup>
                        <HeaderFilter MinHeight="140px"></HeaderFilter>
                    </SettingsPopup>
                    <Columns>

                        <dx:GridViewCommandColumn
                            Name="CommandColum"
                            VisibleIndex="0"
                            ShowDeleteButton="True"
                            ShowClearFilterButton="True"
                            Width="75px">
                        </dx:GridViewCommandColumn>

                        <dx:GridViewDataComboBoxColumn FieldName="KindOfSportID" VisibleIndex="10" Caption="Вид спорта">
                                <PropertiesComboBox DataSourceID="dsAllKindOfSportData" TextField="Name" ValueField="ID"></PropertiesComboBox>
                                <EditFormSettings Visible="True" CaptionLocation="Top" />
                                <EditItemTemplate>
                                    <dx:ASPxComboBox 
										ID="cbKindOfSportList" 
										ClientInstanceName="cbKindOfSportList" 
										runat="server" DataSourceID="dsAthleteKindOfSportListForAdding"
                                        Value='<%# Bind("KindOfSportID") %>' TextField="Name" ValueField="KindOfSportID"
                                        ValueType="System.Int32" Width="100%" OnValidation="cbEditTemplate_Validation" ValidationSettings-ValidationGroup="<%# Container.ValidationGroup %>">
										<ValidationSettings
                                            Display="Dynamic"
                                            ErrorDisplayMode="ImageWithText"
                                            ErrorTextPosition="Bottom">
                                            <RequiredField ErrorText="Выберите вид спорта" IsRequired="True" />
										 </ValidationSettings>
										<CaptionSettings Position="Top" />
                                    </dx:ASPxComboBox>
								</EditItemTemplate>
                                <FilterTemplate>
							<dx:ASPxComboBox 
								ID="cbKindOfSportListFilter" 
								ClientInstanceName="cbKindOfSportListFilter"
								runat="server" 
                                DataSourceID="dsAthleteKindOfSportList"
								TextField="Name" 
                                ValueField="KindOfSportID"
								ValueType="System.Int32" 
                                Width="100%"
                                ClearButton-DisplayMode="Always"  >
								<ClientSideEvents  ValueChanged="function(s,e){ gvAthleteAdditionKindOfSport.AutoFilterByColumn('KindOfSportID',s.GetValue()); }"  />
							</dx:ASPxComboBox>

							</FilterTemplate>
                            </dx:GridViewDataComboBoxColumn>

                    </Columns>
                    <Toolbars>
                        <dx:GridViewToolbar Name="btAdd">
                            <Items>
                                <dx:GridViewToolbarItem Command="New" Name="btAdd" Text="%%Добавить%%"></dx:GridViewToolbarItem>
                            </Items>
                        </dx:GridViewToolbar>
                    </Toolbars>
                    <Styles>
                        <Header Wrap="True">
                        </Header>
                        <Cell CssClass="grid-row"></Cell>
                        <AdaptiveHeaderPanel CssClass="adaptive-no-header">
                        </AdaptiveHeaderPanel>
                    </Styles>
                </dx:ASPxGridView>

            <asp:SqlDataSource
                ID="dsAthleteKindOfSportList"
                runat="server"
                ConnectionString='<%$ ConnectionStrings:MFKSConnectionString %>'
                SelectCommand="GetAthleteAdditionalKindOfSportList" SelectCommandType="StoredProcedure" OnSelecting="dsAthleteKindOfSportList_Selecting"
                InsertCommand="AthletesAdditionalKindsOfSport_Insert" InsertCommandType="StoredProcedure" OnInserting="dsAthleteKindOfSportList_Inserting"
                DeleteCommand="AthletesAdditionalKindsOfSportByKindOFSportID_Delete" DeleteCommandType="StoredProcedure" OnDeleting="dsAthleteKindOfSportList_Deleting"
                >
                <SelectParameters>
                    <asp:Parameter Name="AthleteID"></asp:Parameter>
                    <asp:Parameter DefaultValue="Rus" Name="Lang" Type="String"></asp:Parameter>
                </SelectParameters>
                <InsertParameters>
                    <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
		            <asp:Parameter Name="Log_IP" Type="String" />
		            <asp:Parameter Name="Log_SessionID" Type="String" />
		            <asp:Parameter Name="Log_Login" Type="String" />
		            <asp:Parameter Name="Log_ClientID" Type="Int32" />
		            <asp:Parameter Name="Log_AuthorisationSessionID" Type="String" />
                    <asp:Parameter Name="AthleteID" />
                    <asp:Parameter Name="KindOfSportID" />
                </InsertParameters>
                <DeleteParameters>
                    <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
		            <asp:Parameter Name="Log_IP" Type="String" />
		            <asp:Parameter Name="Log_SessionID" Type="String" />
		            <asp:Parameter Name="Log_Login" Type="String" />
		            <asp:Parameter Name="Log_ClientID" Type="Int32" />
		            <asp:Parameter Name="Log_AuthorisationSessionID" Type="String" />
                    <asp:Parameter Name="AthleteID" />
		            <asp:Parameter Name="KindOfSportID" />
                </DeleteParameters>
            </asp:SqlDataSource>

            <asp:SqlDataSource ID="dsAllKindOfSportData" runat="server" ConnectionString='<%$ ConnectionStrings:MFKSConnectionString %>' 
                SelectCommand="dbo.GetAllKindOfSport" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:Parameter DefaultValue="Rus" Name="Lang" Type="String"></asp:Parameter>
                </SelectParameters>
            </asp:SqlDataSource>

             <asp:SqlDataSource ID="dsAthleteKindOfSportListForAdding" runat="server" ConnectionString='<%$ ConnectionStrings:MFKSConnectionString %>' 
                SelectCommand="dbo.GetAthleteKindOfSportListForAdding" SelectCommandType="StoredProcedure" OnSelecting="dsAthleteKindOfSportListForAdding_Selecting">
                <SelectParameters>
                    <asp:Parameter Name="AthleteID" />
                    <asp:Parameter DefaultValue="Rus" Name="Lang" Type="String"></asp:Parameter>
                </SelectParameters>
            </asp:SqlDataSource>

        </div>
    </form>
</body>
</html>
