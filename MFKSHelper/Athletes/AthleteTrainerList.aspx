<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AthleteTrainerList.aspx.cs" Inherits="MFKSHelper.Athletes.AthleteTrainerList" %>

<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTreeList" TagPrefix="dx" %>
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
						ID="gvAthletes_trainers_list" 
						ClientInstanceName="gvAthletes_trainers_list" 
						runat="server" 
						DataSourceID="dsAthleteTrainerList" 
						AutoGenerateColumns="False" 
						KeyFieldName="ID" 
						Caption="Тренеры" 
						Width="100%"
						OnAfterPerformCallback="gvAthletes_rank_and_trainers_AfterPerformCallback" 
						OnDetailRowGetButtonVisibility="gvAthletes_trainers_list_DetailRowGetButtonVisibility" 
						OnCommandButtonInitialize="CommandButtonInitializeOnEditebleGrid" 
						>
						<ClientSideEvents EndCallback="AthletesCard.mnSportInfoUpdate" />
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

						<%--	<dx:GridViewDataTextColumn 
								FieldName="Edit_FirmID"
								ShowInCustomizationForm="True"
								Visible="False" 
								VisibleIndex="1">
								<EditFormSettings CaptionLocation="Top" Visible="False" />
							</dx:GridViewDataTextColumn>--%>

							<%--<dx:GridViewDataComboBoxColumn 
								FieldName="TrainerID"
								ShowInCustomizationForm="True" 
								Visible="True" 
								VisibleIndex="3">
								<EditFormSettings CaptionLocation="Top" Visible="False" />
								<PropertiesComboBox 
									DataSourceID="dsTrainerList" 
									TextField="FIO"
									ValueField="ID">
								</PropertiesComboBox>
							</dx:GridViewDataComboBoxColumn>--%>

							<dx:GridViewDataTextColumn 
								Caption="Тренер" 
								FieldName="FIO" 
								ReadOnly="True" 
								ShowInCustomizationForm="True" 
								VisibleIndex="4">
								<EditItemTemplate>

											<dx:ASPxDropDownEdit 
												ID="ddeTrainerFIO" 
												ClientInstanceName="ddeTrainerFIO" 
												runat="server" 
												Theme="Default" 
												Width="100%" 
												OnLoad="ddeTrainerFIO_Load"
												ValidationSettings-ValidationGroup="<%# Container.ValidationGroup %>">
												<ClientSideEvents 
													DropDown="SportInfo.ddeTrainerFIO_DropDown"
													Init="SportInfo.ddeTrainerFIO_Init" />

												<ValidationSettings 
													Display="Dynamic" 
													ErrorDisplayMode="ImageWithText"
													ErrorTextPosition="Bottom" 
													ValidateOnLeave="False">
													<RequiredField ErrorText="Заполните обязательное поле" IsRequired="true" />
												</ValidationSettings>

												<DropDownWindowTemplate>

													<dx:ASPxGridView 
														ID="gvTrainerFIO" 
														runat="server" 
														ClientInstanceName="gvTrainerFIO" 
														KeyFieldName="ID" 
														DataSourceID="dsTrainerFioList"
														Width="100%"
														>
														<ClientSideEvents 
															Init="SportInfo.gvTrainerFIO_Init('ddeTrainerFIO')"
															FocusedRowChanged="SportInfo.gvTrainerFIO_FocusedRowChanged" />
														<Columns>
															<dx:GridViewDataTextColumn FieldName="FirmID" Caption="Организация" VisibleIndex="2" GroupIndex="0">
															</dx:GridViewDataTextColumn>
															<dx:GridViewDataTextColumn FieldName="FIO" Caption="Ф.И.О." VisibleIndex="1" SortIndex="2" SortOrder="Ascending"></dx:GridViewDataTextColumn>
														</Columns>
														<Toolbars>
															<dx:GridViewToolbar>
																<Items>
																	<dx:GridViewToolbarItem Command="Refresh" Text="Обновить"></dx:GridViewToolbarItem>
																	<dx:GridViewToolbarItem Command="FullExpand" Text="Раскрыть все"></dx:GridViewToolbarItem>
																	<dx:GridViewToolbarItem Command="FullCollapse" Text="Свернуть все"></dx:GridViewToolbarItem>
																</Items>
															</dx:GridViewToolbar>
														</Toolbars>
														<Settings AutoFilterCondition="Contains" ShowFilterRow="true" VerticalScrollableHeight="300" VerticalScrollBarMode="Auto" />
														<SettingsPager Position="Bottom" PageSize="20" Mode="ShowPager" >
															<FirstPageButton Visible="true">
																<Image ToolTip="Первая" AlternateText="«"></Image>
															</FirstPageButton>
															<LastPageButton Visible="true">
																<Image ToolTip="Последняя" AlternateText="»"></Image>
															</LastPageButton>
															<PrevPageButton>
																<Image ToolTip="Предыдущая" AlternateText="&lt;"></Image>
															</PrevPageButton>
															<NextPageButton>
																<Image ToolTip="Следующая" AlternateText="&gt;"></Image>
															</NextPageButton>
															<PageSizeItemSettings Visible="true" />
														</SettingsPager>
														<SettingsBehavior AllowFocusedRow="true" AutoExpandAllGroups="true"/>
													</dx:ASPxGridView>
												</DropDownWindowTemplate>
											</dx:ASPxDropDownEdit>


										</EditItemTemplate>
								<EditFormSettings CaptionLocation="Top" Visible="True" />
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

							<%--<dx:GridViewDataTextColumn 
								Caption="Период" 
								FieldName="Period" 
								ShowInCustomizationForm="True"
								VisibleIndex="5" 
								AdaptivePriority="1" 
								Width="150px">
								<EditFormSettings 
									CaptionLocation="Top" 
									Visible="False" />
							</dx:GridViewDataTextColumn>--%>

						<%--	<dx:GridViewDataComboBoxColumn 
								FieldName="TrainerID" 
								Name="cbSelectTrainer_gvAthletes_trainers_list" 
								ShowInCustomizationForm="True" 
								Visible="False"
								VisibleIndex="7">
								<PropertiesComboBox ClientInstanceName="cbSelectTrainer_gvAthletes_trainers_list" >
									<ClientSideEvents ButtonClick="SportInfo.cbSelectTrainer_gvAthletes_trainers_list_Click" />
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
							</dx:GridViewDataComboBoxColumn>--%>

							

							<dx:GridViewDataComboBoxColumn 
								FieldName="KindOfSportID" 
								Name="KindOfSportID" 
								Caption="Вид спорта" 
								VisibleIndex="10" 
								GroupIndex="0">
								<PropertiesComboBox 
									DataSourceID="dsKindOfSportList" 
									TextField="Name" 
									ValueField="ID" >
									<ValidationSettings
										Display="Dynamic" 
										ErrorDisplayMode="ImageWithText" 
										ErrorTextPosition="Bottom">
										<RequiredField ErrorText="Выберите вид спорта" IsRequired="True" />
									</ValidationSettings>
								</PropertiesComboBox>
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
								<dx:ASPxLabel runat="server" ID="lbTrainersFirmName" Text='<%# Eval("Firm_Name") %>' />
							</DetailRow>
						</Templates>
					</dx:ASPxGridView>



        </div>
    </form>
</body>
</html>
