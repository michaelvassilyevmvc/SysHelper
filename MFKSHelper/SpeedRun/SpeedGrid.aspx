<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SpeedGrid.aspx.cs" Inherits="MFKSHelper.SpeedRun.SpeedGrid" %>

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
						ID="gvTrainerListByAthlete" 
						ClientInstanceName="gvTrainerListByAthlete" 
						runat="server" 
						DataSourceID="dsAthleteTrainerList" 
						AutoGenerateColumns="False" 
						KeyFieldName="ID" 
						Caption="Тренеры" 
						Width="100%"
						>
						<SettingsAdaptivity AdaptivityMode="HideDataCells">
						</SettingsAdaptivity>
						<SettingsPager Mode="ShowAllRecords">
						</SettingsPager>
						<SettingsEditing EditFormColumnCount="1">
						</SettingsEditing>
						<SettingsDetail ShowDetailRow="true" ShowDetailButtons="true" />
						<SettingsBehavior AllowGroup="true" AutoExpandAllGroups="true" />
						<Columns>

							<dx:GridViewCommandColumn 
								ShowDeleteButton="True" 
								ShowEditButton="True" 
								ShowInCustomizationForm="True" 
								VisibleIndex="11" 
								AdaptivePriority="2" 
								Name="CommandColum" 
								Width="50px" 
								Caption=" ">
							</dx:GridViewCommandColumn>

							<dx:GridViewDataTextColumn 
								FieldName="ID"
								ReadOnly="True"
								ShowInCustomizationForm="True"
								Visible="False"
								VisibleIndex="0">
								<EditFormSettings Visible="False" CaptionLocation="Top" />
							</dx:GridViewDataTextColumn>

							<dx:GridViewDataTextColumn 
								FieldName="Edit_FirmID"
								ShowInCustomizationForm="True"
								Visible="False" 
								VisibleIndex="1">
								<EditFormSettings CaptionLocation="Top" Visible="False" />
							</dx:GridViewDataTextColumn>

							<dx:GridViewDataTextColumn 
								FieldName="TrainerID"
								ShowInCustomizationForm="True" 
								Visible="False" 
								VisibleIndex="3">
								<EditFormSettings CaptionLocation="Top" Visible="False" />
							</dx:GridViewDataTextColumn>

							<dx:GridViewDataTextColumn 
								Caption="ФИО" 
								FieldName="FIO" 
								ReadOnly="True" 
								ShowInCustomizationForm="True" 
								VisibleIndex="4">
								<PropertiesTextEdit>
									<ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom">
									</ValidationSettings>
								</PropertiesTextEdit>
								<EditFormSettings CaptionLocation="Top" Visible="False" />
							</dx:GridViewDataTextColumn>

							<dx:GridViewDataDateColumn 
								FieldName="Start_date" 
								ShowInCustomizationForm="True"
								Visible="False"
								VisibleIndex="8"
								Caption="Начало">
								<PropertiesDateEdit 
									AllowMouseWheel="false" 
									Width="170" 
									ClientInstanceName="gvAthletes_trainers_list_Start_date" 
									ShowOutOfRangeWarning="False"
									UseMaskBehavior="True">
									<DateRangeSettings CalendarColumnCount="1" />
									<CalendarProperties 
										ShowWeekNumbers="false" 
										ShowClearButton="True" 
										TodayButtonText="Сегодня" 
										ClearButtonText="Очистить">
										
										<FastNavProperties OkButtonText="OK" CancelButtonText="Отмена" />
									</CalendarProperties>
									<ValidationSettings 
										Display="Dynamic" 
										ErrorDisplayMode="ImageWithText" 
										ErrorTextPosition="Bottom">
										<RequiredField ErrorText="Заполните обязательное поле" IsRequired="True" />
									</ValidationSettings>
								</PropertiesDateEdit>
								<EditFormSettings CaptionLocation="Top" Visible="True" />
							</dx:GridViewDataDateColumn>

							<dx:GridViewDataDateColumn 
								FieldName="End_date" 
								ShowInCustomizationForm="True" 
								Visible="False"
								VisibleIndex="9" 
								Caption="Завершение">
								<PropertiesDateEdit 
									AllowMouseWheel="false"
									Width="170"
									NullDisplayText="настоящее время"
									NullText="настоящее время" 
									NullTextDisplayMode="UnfocusedAndFocused" 
									ClientInstanceName="gvAthletes_trainers_list_End_date" 
									ShowOutOfRangeWarning="False" 									
									UseMaskBehavior="True">
									<DateRangeSettings CalendarColumnCount="1" StartDateEditID="Start_date" />
									<CalendarProperties 
										ShowWeekNumbers="false" 
										ShowClearButton="True"
										TodayButtonText="Сегодня"
										ClearButtonText="Очистить"
										>
										<FastNavProperties OkButtonText="OK" CancelButtonText="Отмена" />
									</CalendarProperties>
									<ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom">
									</ValidationSettings>
								</PropertiesDateEdit>
								<EditFormSettings CaptionLocation="Top" Visible="True" />
							</dx:GridViewDataDateColumn>

							<dx:GridViewDataTextColumn 
								Caption="Период" 
								FieldName="Period" 
								ShowInCustomizationForm="True"
								VisibleIndex="5" 
								AdaptivePriority="1" 
								Width="350px">
								<EditFormSettings 
									CaptionLocation="Top" 
									Visible="False" />
							</dx:GridViewDataTextColumn>

							<dx:GridViewDataComboBoxColumn 
								FieldName="TrainerID" 
								Name="cbTrainerList" 
								ShowInCustomizationForm="True" 
								Visible="False"
								VisibleIndex="7">
								<PropertiesComboBox 
									ClientInstanceName="cbTrainerList" >
									<%--<ClientSideEvents 
										ButtonClick="SportInfo.cbTrainerList_Click" 
										Init="SportInfo.cbTrainerList_Init" />--%>
									<DropDownButton Visible="False">
									</DropDownButton>
									<Buttons>
										<dx:EditButton Text="...">
										</dx:EditButton>
									</Buttons>
									<ValidationSettings 
										Display="Dynamic" 
										ErrorDisplayMode="ImageWithText" 
										ErrorTextPosition="Bottom">
										<RequiredField ErrorText="Выберите тренера" IsRequired="True" />
									</ValidationSettings>
								</PropertiesComboBox>
								<EditFormSettings 
									CaptionLocation="Top" 
									Visible="True"
									Caption="Тренер" />
							</dx:GridViewDataComboBoxColumn>

                            <dx:GridViewDataComboBoxColumn FieldName="KindOfSportID" VisibleIndex="10" GroupIndex="0" Caption="Вид спорта">
                                <PropertiesComboBox DataSourceID="dsAllKindOfSportData" TextField="Name" ValueField="ID">
                                </PropertiesComboBox>
                                <EditFormSettings Visible="True" />
                                <EditItemTemplate>
                                    <dx:ASPxComboBox ID="cbAthleteKindOfSportList" runat="server" DataSourceID="dsAthleteKindOfSportList"
                                        Value='<%# Bind("KindOfSportID") %>' TextField="Name" ValueField="KindOfSportID"
                                        ValueType="System.Int32">
                                    </dx:ASPxComboBox>
                                </EditItemTemplate>
                            </dx:GridViewDataComboBoxColumn>

						</Columns>
						<Toolbars>
							<dx:GridViewToolbar>
								<Items>
									<dx:GridViewToolbarItem Command="New" Name="btAdd" Text="Добавить"></dx:GridViewToolbarItem>
									<dx:GridViewToolbarItem Command="FullExpand" Text="Раскрыть все"></dx:GridViewToolbarItem>
									<dx:GridViewToolbarItem Command="FullCollapse" Text="Свернуть все"></dx:GridViewToolbarItem>
								</Items>
							</dx:GridViewToolbar>
						</Toolbars>
						<Templates>
							<DetailRow>
								<dx:ASPxLabel runat="server" Text="Организация: " Font-Bold="true" />
								<dx:ASPxComboBox ID="cbFirms" runat="server" DataSourceID="dsFirmList"
                                        Value='<%# Bind("FirmID") %>' TextField="Name" ValueField="ID" Width="100%"
                                        ValueType="System.Int32" DropDownButton-ClientVisible="false" Border-BorderStyle="None">
                                    </dx:ASPxComboBox>
							</DetailRow>
						</Templates>
					</dx:ASPxGridView>




	<asp:SqlDataSource
    ID="dsAthleteTrainerList" 
    runat="server" 
    ConnectionString='<%$ ConnectionStrings:MFKSConnectionString %>' 
    SelectCommand="[dbo].[GetAthleteTrainerList]" SelectCommandType="StoredProcedure" OnSelecting="dsAthleteTrainerList_Selecting"
    DeleteCommand="[dbo].[Athletes_trainers_Delete]" DeleteCommandType="StoredProcedure" OnDeleting="BeginLoggableTransact"
	InsertCommand="[dbo].[Athletes_trainers_Insert]" InsertCommandType="StoredProcedure" OnInserting="BeginLoggableTransact"
	UpdateCommand="[dbo].[Athletes_trainers_Update]" UpdateCommandType="StoredProcedure" OnUpdating="BeginLoggableTransact"
    >
    <SelectParameters>
        <asp:Parameter Name="AthleteID"></asp:Parameter>
		<asp:Parameter Name="KindOfSportID" DefaultValue="0" />
		<asp:Parameter Name="Lang" DefaultValue="Rus" />
    </SelectParameters>
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
		<asp:Parameter Name="Start_date" />
		<asp:Parameter Name="End_date" />
		<asp:Parameter Name="ID" />
		<asp:Parameter Name="TrainerID" />
		<asp:Parameter Name="KindOfSportID" />
	</UpdateParameters>
	<InsertParameters>
		<asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
		<asp:Parameter Name="Log_IP" Type="String" />
		<asp:Parameter Name="Log_SessionID" Type="String" />
		<asp:Parameter Name="Log_Login" Type="String" />
		<asp:Parameter Name="Log_ClientID" Type="Int32" />
		<asp:Parameter Name="Log_AuthorisationSessionID" Type="String" />
		<asp:Parameter Name="Edit_FirmID" />
		<asp:Parameter Name="AthleteID" />
		<asp:Parameter Name="TrainerID" />
		<asp:Parameter Name="Start_date" />
		<asp:Parameter Name="End_date" />
		<asp:Parameter Name="KindOfSportID" />
	</InsertParameters>
</asp:SqlDataSource>

            <asp:SqlDataSource ID="dsAllKindOfSportData" runat="server" ConnectionString='<%$ ConnectionStrings:MFKSConnectionString %>' 
                SelectCommand="dbo.GetAllKindOfSport" SelectCommandType="StoredProcedure" CacheDuration="30">
                <SelectParameters>
                    <asp:Parameter DefaultValue="Rus" Name="Lang" Type="String"></asp:Parameter>
                </SelectParameters>
            </asp:SqlDataSource>

			<asp:SqlDataSource ID="dsFirmList" runat="server" ConnectionString='<%$ ConnectionStrings:MFKSConnectionString %>' 
                SelectCommand="[dbo].[GetAllFirmListByRegion]" SelectCommandType="StoredProcedure" CacheDuration="30">
                <SelectParameters>
					<asp:Parameter Name="RegionID" DefaultValue="1" />
					<asp:Parameter Name="FirmID" DefaultValue="0" />
                    <asp:Parameter DefaultValue="Rus" Name="Lang" Type="String"></asp:Parameter>
                </SelectParameters>
            </asp:SqlDataSource>

            <asp:SqlDataSource
                ID="dsAthleteKindOfSportList"
                runat="server"
                ConnectionString='<%$ ConnectionStrings:MFKSConnectionString %>'
                SelectCommand="GetAthleteKindOfSportList" SelectCommandType="StoredProcedure" OnSelecting="dsAthleteKindOfSportList_Selecting">
                <SelectParameters>
                    <asp:Parameter Name="AthleteID"></asp:Parameter>
                    <asp:Parameter DefaultValue="Rus" Name="Lang" Type="String"></asp:Parameter>
                    <asp:Parameter DefaultValue="0" Name="IsFilter" />
                </SelectParameters>
            </asp:SqlDataSource>

        </div>
    </form>
</body>
</html>
