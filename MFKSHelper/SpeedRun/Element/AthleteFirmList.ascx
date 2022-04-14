<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AthleteFirmList.ascx.cs" Inherits="MFKSHelper.SpeedRun.Element.AthleteFirmList" %>
<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

 <div style="margin:20px;">
            <dx:ASPxGridView
                ID="gvAthletesFirmsList"
                ClientInstanceName="gvAthletesFirmsList"
                Caption="%%Организации обучения%%"
                runat="server"
                AutoGenerateColumns="False"
                DataSourceID="dsAthletesFirmsList"
                KeyFieldName="ID"
                Width="100%"
                OnRowInserted="gvAthletes_Firms_List_RowInserted"
                OnRowUpdated="gvAthletes_Firms_List_RowUpdated"
                OnRowDeleted="gvAthletes_Firms_List_RowDeleted"
                >
                <SettingsPager Mode="ShowAllRecords"></SettingsPager>
                <SettingsEditing EditFormColumnCount="1"></SettingsEditing>
                <ClientSideEvents EndCallback="Master.cp_EndCallback" />
                <Columns>

                    <dx:GridViewCommandColumn
                        ShowDeleteButton="True"
                        ShowEditButton="True"
                        ShowInCustomizationForm="True"
                        VisibleIndex="8"
                        Name="CommandColum"
                        Caption=" ">
                    </dx:GridViewCommandColumn>

                    <dx:GridViewDataTextColumn
                        FieldName="ID"
                        ReadOnly="True"
                        ShowInCustomizationForm="True"
                        Visible="False"
                        VisibleIndex="0">
                        <EditFormSettings Visible="False" />
                    </dx:GridViewDataTextColumn>

                    <dx:GridViewDataTextColumn
                        Caption="%%Организация%%"
                        FieldName="FirmName"
                        ShowInCustomizationForm="True"
                        VisibleIndex="2">
                        <EditFormSettings Visible="False" />
                        <CellStyle Paddings-PaddingLeft="10px"></CellStyle>
                    </dx:GridViewDataTextColumn>

                    <dx:GridViewDataDateColumn
                        Caption="%%Дата зачисления%%"
                        FieldName="Date_of_firm_entered"
                        ShowInCustomizationForm="True"
                        VisibleIndex="4">
                        <PropertiesDateEdit
                            AllowMouseWheel="false"
                            Width="170"
                            ClientInstanceName="gvAthletes_Firms_deDate_of_firm_entered"
                            UseMaskBehavior="True">
                            <DateRangeSettings CalendarColumnCount="1" />
                            <CalendarProperties
                                ShowWeekNumbers="false"
                                ShowClearButton="True"
                                TodayButtonText="%%Сегодня%%"
                                ClearButtonText="%%Очистить%%">
                                <FastNavProperties OkButtonText="OK" CancelButtonText="%%Отмена%%" />
                            </CalendarProperties>                           
                            <ValidationSettings
                                Display="Dynamic"
                                ErrorDisplayMode="ImageWithText"
                                ErrorTextPosition="Bottom">
                                <RequiredField ErrorText="%%Заполните обязательное поле%%" IsRequired="True" />
                            </ValidationSettings>
                        </PropertiesDateEdit>
                        <EditFormSettings CaptionLocation="Top" Visible="True" VisibleIndex="1" />
                        <CellStyle HorizontalAlign="Center"></CellStyle>
                    </dx:GridViewDataDateColumn>

                    <dx:GridViewDataDateColumn
                        Caption="%%Дата отчисления%%"
                        FieldName="Date_of_firm_escaping"
                        ShowInCustomizationForm="True"
                        VisibleIndex="5">
                        <PropertiesDateEdit
                            AllowMouseWheel="false"
                            Width="170"
                            ClientInstanceName="gvAthletes_Firms_deDate_of_firm_escaping"
                            UseMaskBehavior="True">
                            <DateRangeSettings CalendarColumnCount="1" StartDateEditID="Date_of_firm_entered" />
                            <CalendarProperties
                                ShowWeekNumbers="false"
                                ShowClearButton="True"
                                TodayButtonText="%%Сегодня%%"
                                ClearButtonText="%%Очистить%%">
                                <FastNavProperties OkButtonText="OK" CancelButtonText="%%Отмена%%" />
                            </CalendarProperties>
                            <ValidationSettings
                                Display="Dynamic"
                                ErrorDisplayMode="ImageWithText"
                                ErrorTextPosition="Bottom">
                                <RequiredField ErrorText="%%Заполните обязательное поле%%" IsRequired="True" />
                            </ValidationSettings>
                        </PropertiesDateEdit>
                        <EditFormSettings CaptionLocation="Top" Visible="True" VisibleIndex="2" />
                        <CellStyle HorizontalAlign="Center"></CellStyle>
                    </dx:GridViewDataDateColumn>

                    <dx:GridViewDataTextColumn
                        FieldName="Edit_FirmID"
                        ShowInCustomizationForm="True"
                        Visible="False"
                        VisibleIndex="6">
                        <EditFormSettings Visible="False" />
                    </dx:GridViewDataTextColumn>

                    <dx:GridViewDataTextColumn
                        FieldName="RecordType"
                        ShowInCustomizationForm="True"
                        Visible="False"
                        VisibleIndex="7">
                        <EditFormSettings Visible="False" />
                    </dx:GridViewDataTextColumn>

                    <dx:GridViewDataComboBoxColumn
                        Caption="%%Организация%%"
                        FieldName="FirmID"
                        ShowInCustomizationForm="True"
                        Visible="False"
                        VisibleIndex="1">
                        <PropertiesComboBox
                            DataSourceID="dsFirms"
                            TextField="Name"
                            ValueField="ID"
                            ValueType="System.Int32">
                            <ValidationSettings
                                Display="Dynamic"
                                ErrorDisplayMode="ImageWithText"
                                ErrorTextPosition="Bottom">
                                <RequiredField ErrorText="%%Выберите организацию%%" IsRequired="True" />
                            </ValidationSettings>
                        </PropertiesComboBox>
                        <EditFormSettings CaptionLocation="Top" Visible="True" VisibleIndex="3" />
                    </dx:GridViewDataComboBoxColumn>

                </Columns>
                <Toolbars>
                    <dx:GridViewToolbar>
                        <Items>
                            <dx:GridViewToolbarItem Command="New" Name="btAdd" Text="%%Добавить%%"></dx:GridViewToolbarItem>
                        </Items>
                    </dx:GridViewToolbar>
                </Toolbars>
                <Styles>
                    <Header Wrap="True"></Header>
                    <Cell CssClass="grid-row"></Cell>
                    <AdaptiveHeaderPanel CssClass="adaptive-no-header"></AdaptiveHeaderPanel>
                </Styles>
                <ClientSideEvents  EndCallback='function(s,e){ if (e.command === "UPDATEEDIT" || e.command === "DELETEROW") { Master.cp_EndCallback(s,e); cbPanel.PerformCallback("refresh"); } }' />
                <%--<ClientSideEvents EndCallback="AthletesCard.mnAthletes_Firms_ListUpdate" />--%>
            </dx:ASPxGridView>
        </div>
        <div style="margin:20px;">
            <dx:ASPxGridView 
                    ID="gvAthletesFirmsAssignment_List" 
                    ClientInstanceName="gvAthletesFirmsAssignmentList"
                    runat="server" 
                    AutoGenerateColumns="False" 
                    DataSourceID="dsAthletesFirmsAssignmentList"
                    KeyFieldName="ID" 
                    Width="100%" 
                    Caption="%%Организации командирования%%" 
                    OnRowUpdated="gvAthletesFirmsAssignment_List_RowUpdated"
                    OnCommandButtonInitialize="gvAthletesFirmsAssignment_List_CommandButtonInitialize"
                >
                    <ClientSideEvents  EndCallback='function(s,e){ if (e.command === "UPDATEEDIT" || e.command === "DELETEROW") { Master.cp_EndCallback(s,e); cbPanel.PerformCallback("refresh"); } }' />
					<%--<ClientSideEvents EndCallback="Athletes_Firms_Assignment_List.gvAthletes_Firms_Assignment_List_EndCallback" />--%>
                    <SettingsPager Mode="ShowAllRecords">
                    </SettingsPager>
                    <SettingsEditing EditFormColumnCount="1">
                    </SettingsEditing>
                    <SettingsDataSecurity AllowDelete="False" AllowInsert="False" />
					<Columns>
						<dx:GridViewCommandColumn
                            ShowEditButton="True" 
                            ShowInCustomizationForm="True" 
                            VisibleIndex="8"
                            Name="CommandColum" 
                            Caption=" ">
						</dx:GridViewCommandColumn>

						<dx:GridViewDataTextColumn 
                            FieldName="ID" 
                            ReadOnly="True"
                            ShowInCustomizationForm="True" 
                            Visible="False" 
                            VisibleIndex="0">
							<EditFormSettings Visible="False" />
						</dx:GridViewDataTextColumn>

						<dx:GridViewDataTextColumn 
                            Caption="%%Организация%%" 
                            FieldName="FirmName" 
                            ShowInCustomizationForm="True" 
                            VisibleIndex="2"
                            >
							<EditFormSettings Visible="False" />
						</dx:GridViewDataTextColumn>
					
						<dx:GridViewDataDateColumn 
                            Caption="%%Дата зачисления%%" 
                            FieldName="Date_of_firm_entered" 
                            ShowInCustomizationForm="True" 
                            VisibleIndex="4">
							<PropertiesDateEdit
                                AllowMouseWheel="false" 
                                Width="170" 
                                ClientInstanceName="gvAthletes_Firms_Assignment_deDate_of_firm_entered" 
                                UseMaskBehavior="True" >
                                <DateRangeSettings CalendarColumnCount="1" />
								<CalendarProperties 
                                    ShowWeekNumbers="false" 
                                    ShowClearButton="True" 
                                    TodayButtonText="%%Сегодня%%" 
                                    ClearButtonText="%%Очистить%%">
									<FastNavProperties OkButtonText="OK" CancelButtonText="%%Отмена%%" />
								</CalendarProperties>
								<ValidationSettings 
                                    Display="Dynamic" 
                                    ErrorDisplayMode="ImageWithText" 
                                    ErrorTextPosition="Bottom">
									<RequiredField ErrorText="%%Заполните обязательное поле%%" IsRequired="True" />
								</ValidationSettings>
							</PropertiesDateEdit>
                            <CellStyle HorizontalAlign="Center"></CellStyle>
							<EditFormSettings CaptionLocation="Top" Visible="True" VisibleIndex="1" />
						</dx:GridViewDataDateColumn>

						<dx:GridViewDataDateColumn 
                            Caption="%%Дата отчисления%%" 
                            FieldName="Date_of_firm_escaping" 
                            ShowInCustomizationForm="True"
                            VisibleIndex="5">
							<PropertiesDateEdit 
                                AllowMouseWheel="false" 
                                Width="170" 
                                ClientInstanceName="gvAthletes_Firms_Assignment_deDate_of_firm_escaping" 
                                UseMaskBehavior="True">
                                <DateRangeSettings CalendarColumnCount="1" StartDateEditID="Date_of_firm_entered" />
								<CalendarProperties 
                                    ShowWeekNumbers="false" 
                                    ShowClearButton="True" 
                                    TodayButtonText="%%Сегодня%%" 
                                    ClearButtonText="%%Очистить%%">
									<FastNavProperties OkButtonText="OK" CancelButtonText="%%Отмена%%" />
								</CalendarProperties>
								<ValidationSettings 
                                    Display="Dynamic" 
                                    ErrorDisplayMode="ImageWithText" 
                                    ErrorTextPosition="Bottom">
								</ValidationSettings>
							</PropertiesDateEdit>
                            <CellStyle HorizontalAlign="Center"></CellStyle>
							<EditFormSettings CaptionLocation="Top" Visible="True" VisibleIndex="2" />
						</dx:GridViewDataDateColumn>

						<dx:GridViewDataTextColumn 
                            FieldName="Edit_FirmID" 
                            ShowInCustomizationForm="True"
                            Visible="False"
                            VisibleIndex="6">
							<EditFormSettings Visible="False" />
						</dx:GridViewDataTextColumn>

						<dx:GridViewDataTextColumn 
                            FieldName="RecordType" 
                            ShowInCustomizationForm="True" 
                            Visible="False"
                            VisibleIndex="7">
							<EditFormSettings Visible="False" />
						</dx:GridViewDataTextColumn>

						<dx:GridViewDataComboBoxColumn 
                            Caption="%%Организация%%" 
                            FieldName="FirmID" 
                            ShowInCustomizationForm="True" 
                            Visible="False" 
                            VisibleIndex="1">
							<EditFormSettings CaptionLocation="Top" Visible="False" VisibleIndex="3" />
						</dx:GridViewDataComboBoxColumn>
					</Columns>
					<Styles>
						<Header Wrap="True">
						</Header>
                        <Cell CssClass="grid-row"></Cell>
						<AdaptiveHeaderPanel CssClass="adaptive-no-header">
						</AdaptiveHeaderPanel>
					</Styles>
				</dx:ASPxGridView>
        </div>

        <asp:SqlDataSource
                ID="dsAthletesFirmsList"
                runat="server"
                ConnectionString="<%$ ConnectionStrings:MFKSConnectionString %>"
                SelectCommand="GetAthleteFirmList" SelectCommandType="StoredProcedure" OnSelecting="dsAthletesFirmsList_Selecting"
                DeleteCommand="[dbo].[Athletes_firms_Delete]" DeleteCommandType="StoredProcedure" OnDeleting="BeginLoggableTransact"
                InsertCommand="[dbo].[Athletes_firms_Insert]" InsertCommandType="StoredProcedure" OnInserting="dsAthletesFirmsList_Inserting"
                UpdateCommand="[dbo].[Athletes_firms_Update]" UpdateCommandType="StoredProcedure" OnUpdating="BeginLoggableTransact">
                <DeleteParameters>
                    <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                    <asp:Parameter Name="Log_IP" Type="String" />
                    <asp:Parameter Name="Log_SessionID" Type="String" />
                    <asp:Parameter Name="Log_Login" Type="String" />
                    <asp:Parameter Name="Log_ClientID" Type="Int32" />
                    <asp:Parameter Name="Log_AuthorisationSessionID" Type="String" />
                    <asp:Parameter Name="ID" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                    <asp:Parameter Name="Log_IP" Type="String" />
                    <asp:Parameter Name="Log_SessionID" Type="String" />
                    <asp:Parameter Name="Log_Login" Type="String" />
                    <asp:Parameter Name="Log_ClientID" Type="Int32" />
                    <asp:Parameter Name="Log_AuthorisationSessionID" Type="String" />
                    <asp:Parameter Name="FirmID" />
                    <asp:Parameter Name="Date_of_firm_entered" />
                    <asp:Parameter Name="Date_of_firm_escaping" />
                    <asp:Parameter Name="ID" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                    <asp:Parameter Name="Log_IP" Type="String" />
                    <asp:Parameter Name="Log_SessionID" Type="String" />
                    <asp:Parameter Name="Log_Login" Type="String" />
                    <asp:Parameter Name="Log_ClientID" Type="Int32" />
                    <asp:Parameter Name="Log_AuthorisationSessionID" Type="String" />
                    <asp:Parameter Name="AthleteID" />
                    <asp:Parameter Name="FirmID" />
                    <asp:Parameter Name="Date_of_firm_entered" />
                    <asp:Parameter Name="Date_of_firm_escaping" />
                    <asp:Parameter Name="Edit_FirmID" />
                </InsertParameters>
                <SelectParameters>
                    <asp:Parameter Name="AthleteID" />
                    <asp:Parameter Name="Lang" DefaultValue="Rus" />
                </SelectParameters>
            </asp:SqlDataSource>

        <asp:SqlDataSource 
                    ID="dsAthletesFirmsAssignmentList"
                    runat="server" 
                    ConnectionString="<%$ ConnectionStrings:MFKSConnectionString %>" 
                    SelectCommand="GetAthletesFirmsAssignmentList" SelectCommandType="StoredProcedure" OnSelecting="dsAthletesFirmsAssignmentList_Selecting"
                    UpdateCommand="Athletes_assignment_Update" UpdateCommandType="StoredProcedure" OnUpdating="BeginLoggableTransact" >
					<SelectParameters>
						<asp:Parameter Name="AthleteID" />
                        <asp:Parameter Name="Lang" DefaultValue="Rus" />
					</SelectParameters>
					<UpdateParameters>
                        <asp:Parameter Name="Log_IP" Type="String" />
                        <asp:Parameter Name="Log_SessionID" Type="String" />
                        <asp:Parameter Name="Log_Login" Type="String" />
                        <asp:Parameter Name="Log_ClientID" Type="Int32" />
                        <asp:Parameter Name="Log_AuthorisationSessionID" Type="String" />
						<asp:Parameter Name="Date_of_firm_entered" />
						<asp:Parameter Name="Date_of_firm_escaping" />
						<asp:Parameter Name="ID" />
					</UpdateParameters>
				</asp:SqlDataSource>

        <asp:SqlDataSource
                ID="dsFirms"
                runat="server"
                ConnectionString="<%$ ConnectionStrings:MFKSConnectionString %>"
                SelectCommand="[dbo].[GetAllFirmListByRegion]" SelectCommandType="StoredProcedure" OnSelecting="dsFirms_Selecting"  CacheDuration="30">
                <SelectParameters>
                    <asp:Parameter Name="RegionID" />
                    <asp:Parameter Name="FirmID" DefaultValue="0" />
                    <asp:Parameter Name="Lang" DefaultValue="Rus" />
                </SelectParameters>
            </asp:SqlDataSource>
