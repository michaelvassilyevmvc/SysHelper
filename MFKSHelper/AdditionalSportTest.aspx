<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdditionalSportTest.aspx.cs" Inherits="MFKSHelper.AdditionalSportTest" %>
<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            
             <dx:ASPxGridView
                    ID="gvAthleteAdditionKindOfSport"
                    ClientInstanceName="gvAthleteAdditionKindOfSport"
                    runat="server"
                    AutoGenerateColumns="False"
                    KeyFieldName="ID"
                    Width="100%"
                    Style="margin-right: 2px"
                    OnDataBinding="gvAthleteAdditionKindOfSport_DataBinding"
                    >
                    <ClientSideEvents EndCallback="AthletesCard.AdditionKindOfSportListUpdate" />
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

                        <dx:GridViewDataComboBoxColumn
                            FieldName="KindOfSportID"
                            ReadOnly="True"
                            VisibleIndex="1"
                            Visible="True">
                            <EditItemTemplate>
                                <dx:ASPxComboBox 
                                    ID="cbKindOfSportList"
                                    ClientInstanceName="cbKindOfSportList"
                                    runat="server" Width="500"
                                    ValueField="ID" 
                                    TextField="Name" 
                                    OnDataBinding="cbKindOfSportList_DataBinding"
                                    NullText="%%Выбрать%%...">
                                    <ValidationSettings Display="Dynamic" ErrorText="%%Неверное значение%%"
                                        ErrorTextPosition="Right" ValidationGroup="vgInfo">
                                        <RequiredField IsRequired="True" ErrorText="%%Заполните обязательное поле%%" />
                                    </ValidationSettings>
                                </dx:ASPxComboBox>
                            </EditItemTemplate>
                            <EditFormSettings Visible="True" CaptionLocation="Near" Caption="%%Вид спорта%%"></EditFormSettings>
                        </dx:GridViewDataComboBoxColumn>

                        <dx:GridViewDataTextColumn
                            FieldName="ID"
                            ReadOnly="True"
                            VisibleIndex="2"
                            Visible="False">
                            <EditFormSettings Visible="False"></EditFormSettings>
                        </dx:GridViewDataTextColumn>

                        <dx:GridViewDataTextColumn
                            FieldName="Name"
                            VisibleIndex="2"
                            Visible="True">
                            <EditFormSettings Visible="False"></EditFormSettings>
                        </dx:GridViewDataTextColumn>

                    </Columns>
                    <Toolbars>
                        <dx:GridViewToolbar Name="btAdd">
                            <Items>
                                <dx:GridViewToolbarItem Command="New" Name="tbbtNew" Text="%%Добавить%%">
                                </dx:GridViewToolbarItem>
                            </Items>
                        </dx:GridViewToolbar>
                    </Toolbars>
                    <Styles>
                        <Header Wrap="True">
                        </Header>
                        <AdaptiveHeaderPanel CssClass="adaptive-no-header">
                        </AdaptiveHeaderPanel>
                    </Styles>
                </dx:ASPxGridView>

            <asp:SqlDataSource 
						ID="dsAthletesAdditionalSport" 
						runat="server"
						ConnectionString="<%$ ConnectionStrings:MFKSConnectionString %>" 
						DeleteCommand="[dbo].[AthletesAdditionalKindsOfSport_Delete]" DeleteCommandType="StoredProcedure" OnDeleting="BeginLoggableTransact"
						InsertCommand="[dbo].[AthletesAdditionalKindsOfSport_Insert]" InsertCommandType="StoredProcedure" OnInserting="BeginLoggableTransact">
						<DeleteParameters>
							<asp:Parameter Name="Log_IP" Type="String" />
							<asp:Parameter Name="Log_SessionID" Type="String" />
							<asp:Parameter Name="Log_Login" Type="String" />
							<asp:Parameter Name="Log_ClientID" Type="Int32" />
							<asp:Parameter Name="Log_AuthorisationSessionID" Type="String" />
							<asp:Parameter Name="ID" />
						</DeleteParameters>
						<InsertParameters>
							<asp:Parameter Name="Log_IP" Type="String" />
							<asp:Parameter Name="Log_SessionID" Type="String" />
							<asp:Parameter Name="Log_Login" Type="String" />
							<asp:Parameter Name="Log_ClientID" Type="Int32" />
							<asp:Parameter Name="Log_AuthorisationSessionID" Type="String" />
							<asp:Parameter Name="AthleteID" />
							<asp:Parameter Name="KindOfSportId" />
						</InsertParameters>
					</asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
