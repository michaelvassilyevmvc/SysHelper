<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AthleteTrainerList.ascx.cs" Inherits="MFKSHelper.SpeedRun.Element.AthleteTrainerList" %>
<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<script src="/Scripts/sport-info.js"></script>

			<dx:ASPxLoadingPanel
                                ID="lpSportInfo"
                                ClientInstanceName="lpSportInfo"
                                runat="server"								
                                Text="%%Загрузка%%&amp;hellip;">
                            </dx:ASPxLoadingPanel>


            <dx:ASPxGridView 
						ID="gvTrainerListByAthlete" 
						ClientInstanceName="gvTrainerListByAthlete" 
						runat="server" 
						DataSourceID="dsAthleteTrainerList" 
						AutoGenerateColumns="False" 
						KeyFieldName="ID" 
						Caption="Тренеры" 
						Width="100%"
						OnRowUpdated="gvTrainerListByAthlete_RowUpdated"
						OnRowInserted="gvTrainerListByAthlete_RowInserted"
						OnRowDeleted="gvTrainerListByAthlete_RowDeleted"
						>
						<ClientSideEvents EndCallback="Master.cp_EndCallback" />
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
									ClientInstanceName="TrainerStartDate" 
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
									ClientInstanceName="TrainerEndDate" 
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
								<CellStyle HorizontalAlign="Center"></CellStyle>
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
								<EditItemTemplate>
									<dx:ASPxComboBox 
										ID="cbTrainerList" 
										ClientInstanceName="cbTrainerList"
										runat="server" 
                                        ValueField="ID" TextField="Name" 
                                        ValueType="System.Int32" 
										Width="100%" 
										OnInit="cbTrainerList_Init" 
										OnValidation="cbEditTemplate_Validation" 
										ValidationSettings-ValidationGroup="<%# Container.ValidationGroup %>"
										AutoPostBack="false"
										>
										<ClientSideEvents 
										ButtonClick="SportInfo.ShowTrainerListPopup"  />
										<DropDownButton Visible="false"></DropDownButton>
										<Buttons>
											<dx:EditButton Text="..."></dx:EditButton>
										</Buttons>
										<ValidationSettings
                                            Display="Dynamic"
                                            ErrorDisplayMode="ImageWithText"
                                            ErrorTextPosition="Bottom">
                                            <RequiredField ErrorText="Выберите вид спорта" IsRequired="True" />
										 </ValidationSettings>
										<CaptionSettings Position="Top"  />
                                    </dx:ASPxComboBox>
								</EditItemTemplate>
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
                                    <dx:ASPxComboBox 
										ID="cbKindOfSportList" 
										ClientInstanceName="cbKindOfSportList" 
										runat="server" DataSourceID="dsAthleteKindOfSportList"
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
								<EditFormSettings CaptionLocation="Top"   />
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

			<dx:ASPxPopupControl 
				ID="ppcCustomModalSportInfoTrainerSelect" 
				ClientInstanceName="ppcCustomModalSportInfoTrainerSelect" 
				runat="server" 
				AllowDragging="True" 
				CloseAction="CloseButton" 
				AllowResize="true"
				PopupAction="None" 
				Width="100%" 
				HeaderText="Выберите тренера"
				PopupHorizontalAlign="WindowCenter"
				PopupVerticalAlign="TopSides"
				PopupVerticalOffset="50"
				OnWindowCallback="ppcCustomModalSportInfoTrainerSelect_WindowCallback"
				>
				<ClientSideEvents Closing="SportInfo.ClosingTrainerListPopup" />
				<ContentCollection>
					<dx:PopupControlContentControl>


								<section class="grid-center">


									<dx:ASPxGridView
										ID="gvTrainersSelect"
										ClientInstanceName="gvTrainersSelect"
										runat="server"
										AutoGenerateColumns="False"
										KeyFieldName="ID"
										Width="100%"
										DataSourceID="dsAccessTrainersToAthlete"
                            
										>
										<SettingsPager PageSize="5"></SettingsPager>
										<ClientSideEvents SelectionChanged="SportInfo.gvTrainersSelect_SelectionChanged" />
										<Settings ShowFilterRow="True" GroupFormat="{1}" />
										<SettingsBehavior
											AllowGroup="true"
											AllowSelectByRowClick="True"
											AllowSelectSingleRowOnly="True" />
										<Columns>
											<dx:GridViewCommandColumn
												SelectAllCheckboxMode="Page"
												ShowSelectCheckbox="True"
												VisibleIndex="0"
												Width="50px"
												Name="gvCommandColumn">
											</dx:GridViewCommandColumn>
											<dx:GridViewDataTextColumn
												FieldName="ID"
												Visible="False"
												VisibleIndex="1">
											</dx:GridViewDataTextColumn>
											<dx:GridViewDataTextColumn
												FieldName="FIO"
												VisibleIndex="4"
												Caption="ФИО">
											</dx:GridViewDataTextColumn>
											<dx:GridViewDataDateColumn
												FieldName="Date_of_firm_entered"
												VisibleIndex="5"
												Caption="Дата начала преподавания в организации">
												<PropertiesDateEdit AllowMouseWheel="false" Width="170" UseMaskBehavior="True">
													<DateRangeSettings CalendarColumnCount="1" />
													<CalendarProperties
														ShowWeekNumbers="false"
														ShowClearButton="True"
														TodayButtonText="Сегодня"
														ClearButtonText="Очистить">
														<FastNavProperties OkButtonText="OK" CancelButtonText="Отмена" />
													</CalendarProperties>
												</PropertiesDateEdit>

												<CellStyle HorizontalAlign="Center"></CellStyle>
											</dx:GridViewDataDateColumn>
											<dx:GridViewDataDateColumn
												FieldName="Date_of_firm_escaping"
												VisibleIndex="6"
												Caption="Дата завершения преподавания в организации">
												<PropertiesDateEdit
													AllowMouseWheel="false"
													Width="170"
													NullText="настоящее время"
													UseMaskBehavior="True"
													NullDisplayText="настоящее время"
													ShowOutOfRangeWarning="False">

													<CalendarProperties
														ShowWeekNumbers="false"
														ShowClearButton="True"
														TodayButtonText="Сегодня"
														ClearButtonText="Очистить">
														<FastNavProperties OkButtonText="OK" CancelButtonText="Отмена" />
													</CalendarProperties>
												</PropertiesDateEdit>
												<CellStyle HorizontalAlign="Center"></CellStyle>
											</dx:GridViewDataDateColumn>
											<dx:GridViewDataTextColumn
												FieldName="IIN"
												VisibleIndex="3" Caption="ИИН">
											</dx:GridViewDataTextColumn>                               
											<dx:GridViewDataTextColumn
												FieldName="FirmID"
												VisibleIndex="7" Visible="False">
											</dx:GridViewDataTextColumn>
											<dx:GridViewDataComboBoxColumn FieldName="KindOfSportID" Caption="Основной вид спорта" VisibleIndex="11">
												<FilterTemplate>
												<dx:ASPxComboBox 
													ID="cbKindOfSportListFilter" 
													ClientInstanceName="cbKindOfSportListFilter"
													runat="server" DataSourceID="dsAthleteKindOfSportList"
													 TextField="Name" ValueField="KindOfSportID"
													ValueType="System.Int32" Width="100%" ClearButton-DisplayMode="Always"  >
													<ClientSideEvents  ValueChanged="function(s,e){ gvTrainersSelect.AutoFilterByColumn('KindOfSportID',s.GetValue()); }"  />
												</dx:ASPxComboBox>

												</FilterTemplate>
												<PropertiesComboBox DataSourceID="dsAllKindOfSportData" TextField="Name" ValueField="ID">
													<ItemStyle Wrap="True"></ItemStyle>
												</PropertiesComboBox>
											</dx:GridViewDataComboBoxColumn>
											<dx:GridViewDataComboBoxColumn
												FieldName="IsCurrentFirm"
												VisibleIndex="10" GroupIndex="0" SortIndex="0" SortOrder="Ascending" Visible="False">
												<PropertiesComboBox
													ItemStyle-Wrap="True"
													AllowMouseWheel="true">
													<Items>
														<dx:ListEditItem Text="Тренер текущей организации" Value="1"></dx:ListEditItem>
														<dx:ListEditItem Text="Тренер других организаций" Value="0"></dx:ListEditItem>
													</Items>
												</PropertiesComboBox>
											</dx:GridViewDataComboBoxColumn>

										</Columns>
										<Styles>
											<Header Wrap="True"></Header>
											<Row Wrap="True"></Row>
											<AdaptiveHeaderPanel
												BackColor="#FF6666"
												ForeColor="#009933"
												CssClass="adaptive-no-header">
											</AdaptiveHeaderPanel>
										</Styles>
										<Toolbars>
											<dx:GridViewToolbar>
												<Items>
													<dx:GridViewToolbarItem Command="FullExpand" Text="Раскрыть все" />
													<dx:GridViewToolbarItem Command="FullCollapse" Text="Свернуть все" />
												</Items>
											</dx:GridViewToolbar>
										</Toolbars>
									</dx:ASPxGridView>

								</section>

								<section class="btns_trainer_modal">
									<dx:ASPxButton
										ID="btTrainersSelect"
										ClientInstanceName="btTrainersSelect"
										runat="server"
										Text="Выбрать"
										ClientEnabled="false"
										AutoPostBack="false">
										<ClientSideEvents Click="SportInfo.btTrainersSelect_Click" />
									</dx:ASPxButton>

									<dx:ASPxButton
											ID="btnCopyGroupCancel"
											ClientInstanceName="btnCopyGroupCancel"
											runat="server"
											Text="Отмена"
											CssClass="btn-default"
											AutoPostBack="false">
											<ClientSideEvents Click="SportInfo.btTrainersSelect_Cancel" />
										</dx:ASPxButton>
								</section>


						</dx:PopupControlContentControl>
				</ContentCollection>
			</dx:ASPxPopupControl>
	
			<asp:SqlDataSource
						ID="dsAccessTrainersToAthlete"
						runat="server"
						ConnectionString="<%$ ConnectionStrings:MFKSConnectionString %>"
						SelectCommand="[dbo].[GetAccessTrainerListToAthlete]"
						SelectCommandType="StoredProcedure"
						OnSelecting="dsAccessTrainersToAthlete_Selecting">
		<SelectParameters>
			<asp:Parameter Name="AthleteID" />
			<asp:Parameter Name="FirmID" />
			<asp:Parameter Name="RegionID" />
		</SelectParameters>
	</asp:SqlDataSource>


			<asp:SqlDataSource
    ID="dsAthleteTrainerList" 
    runat="server" 
    ConnectionString='<%$ ConnectionStrings:MFKSConnectionString %>' 
    SelectCommand="[dbo].[GetAthleteTrainerList]" SelectCommandType="StoredProcedure" OnSelecting="dsAthleteTrainerList_Selecting"
    DeleteCommand="[dbo].[Athletes_trainers_Delete]" DeleteCommandType="StoredProcedure" OnDeleting="BeginLoggableTransact"
	InsertCommand="[dbo].[Athletes_trainers_Insert]" InsertCommandType="StoredProcedure" OnInserting="dsAthleteTrainerList_Inserting"
	UpdateCommand="[dbo].[Athletes_trainers_Update]" UpdateCommandType="StoredProcedure" OnUpdating="dsAthleteTrainerList_Updating"
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
                SelectCommand="dbo.GetAllKindOfSport" SelectCommandType="StoredProcedure">
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