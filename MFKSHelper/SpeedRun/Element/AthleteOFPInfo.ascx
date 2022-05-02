<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AthleteOFPInfo.ascx.cs" Inherits="MFKSHelper.SpeedRun.Element.AthleteOFPInfo" %>
<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:PlaceHolder runat="server">
    <%: Scripts.Render("~/bundles/sportInfo") %>
</asp:PlaceHolder>


<div class="dvAthletes_performance_card">
	<dx:ASPxGridView 
				ID="gvAthletes_performance_card"
				ClientInstanceName="gvAthletes_performance_card" 
				runat="server" 
				AutoGenerateColumns="False" 
				DataSourceID="dsAthletes_performance_card" 
				Width="100%" 
				KeyFieldName="ID"
				OnCommandButtonInitialize="gvAthletes_performance_card_CommandButtonInitialize" 
				OnRowInserted="gvAthletes_performance_card_RowInserted"
				OnRowUpdated="gvAthletes_performance_card_RowUpdated"
				OnRowDeleted="gvAthletes_performance_card_RowDeleted"
				>
				<ClientSideEvents EndCallback='function(s,e){ if (e.command === "UPDATEEDIT" || e.command === "DELETEROW") { Master.cp_EndCallback(s,e); cbPanel.PerformCallback("refresh"); } }' />
				<SettingsAdaptivity AdaptivityMode="HideDataCellsWindowLimit" HideDataCellsAtWindowInnerWidth="940">
					<AdaptiveDetailLayoutProperties>
						<Items>
							<dx:GridViewColumnLayoutItem ColumnName="Firms_Name" Visible="False">
							</dx:GridViewColumnLayoutItem>
							<dx:GridViewColumnLayoutItem ColumnName="Group_type">
							</dx:GridViewColumnLayoutItem>
							<dx:GridViewColumnLayoutItem ColumnName="Date">
							</dx:GridViewColumnLayoutItem>
							<dx:GridViewLayoutGroup Caption="&lt;span title=&quot;общефизическая подготовка&quot;&gt;ОФП&lt;/span&gt;">
								<Items>
									<dx:GridViewColumnLayoutItem ColumnName="Running_30_m">
									</dx:GridViewColumnLayoutItem>
									<dx:GridViewColumnLayoutItem ColumnName="Running_6_min">
									</dx:GridViewColumnLayoutItem>
									<dx:GridViewColumnLayoutItem ColumnName="Running_10_sec">
									</dx:GridViewColumnLayoutItem>
									<dx:GridViewColumnLayoutItem ColumnName="Shuttle_run_3_10_m">
									</dx:GridViewColumnLayoutItem>
									<dx:GridViewColumnLayoutItem ColumnName="Long_jump">
									</dx:GridViewColumnLayoutItem>
									<dx:GridViewColumnLayoutItem ColumnName="Pull_up">
									</dx:GridViewColumnLayoutItem>
									<dx:GridViewColumnLayoutItem ColumnName="Throwing_the_ball_sitting_2_kg">
									</dx:GridViewColumnLayoutItem>
									<dx:GridViewColumnLayoutItem ColumnName="Jump_up">
									</dx:GridViewColumnLayoutItem>
								</Items>
							</dx:GridViewLayoutGroup>
							<dx:GridViewColumnLayoutItem ColumnName="Best_sporting_result">
							</dx:GridViewColumnLayoutItem>
							<dx:GridViewLayoutGroup Caption="соревновательно-тренировочная деятельность">
								<Items>
									<dx:GridViewColumnLayoutItem Caption="соревнований" ColumnName="Competitions_count">
									</dx:GridViewColumnLayoutItem>
									<dx:GridViewColumnLayoutItem Caption="стартов" ColumnName="Starts_count">
									</dx:GridViewColumnLayoutItem>
									<dx:GridViewColumnLayoutItem Caption="соревновательных дней" ColumnName="Competitive_days_count">
									</dx:GridViewColumnLayoutItem>
								</Items>
							</dx:GridViewLayoutGroup>
							<dx:GridViewColumnLayoutItem ColumnName="CommandColum">
							</dx:GridViewColumnLayoutItem>
						</Items>
						<SettingsItemCaptions Location="Top" />
					</AdaptiveDetailLayoutProperties>
				</SettingsAdaptivity>
				<Settings ShowFooter="true" />
				<SettingsPager Mode="ShowAllRecords">
				</SettingsPager>
				<SettingsEditing EditFormColumnCount="2">
				</SettingsEditing>
				<SettingsBehavior AutoExpandAllGroups="True" />
				<EditFormLayoutProperties>
					<Items>
						<dx:GridViewColumnLayoutItem ColumnName="Group_type">
						</dx:GridViewColumnLayoutItem>
						<dx:GridViewColumnLayoutItem ColumnName="Date">
						</dx:GridViewColumnLayoutItem>
						<dx:GridViewLayoutGroup Caption="ОФП (общефизическая подготовка)" ColCount="2">
							<Items>
								<dx:GridViewColumnLayoutItem ColumnName="Running_30_m">
								</dx:GridViewColumnLayoutItem>
								<dx:GridViewColumnLayoutItem ColumnName="Running_6_min">
								</dx:GridViewColumnLayoutItem>
								<dx:GridViewColumnLayoutItem ColumnName="Running_10_sec">
								</dx:GridViewColumnLayoutItem>
								<dx:GridViewColumnLayoutItem ColumnName="Shuttle_run_3_10_m">
								</dx:GridViewColumnLayoutItem>
								<dx:GridViewColumnLayoutItem ColumnName="Long_jump">
								</dx:GridViewColumnLayoutItem>
								<dx:GridViewColumnLayoutItem ColumnName="Pull_up">
								</dx:GridViewColumnLayoutItem>
								<dx:GridViewColumnLayoutItem ColumnName="Throwing_the_ball_sitting_2_kg">
								</dx:GridViewColumnLayoutItem>
								<dx:GridViewColumnLayoutItem ColumnName="Jump_up">
								</dx:GridViewColumnLayoutItem>
							</Items>
						</dx:GridViewLayoutGroup>
						<dx:GridViewColumnLayoutItem ColumnName="Best_sporting_result">
						</dx:GridViewColumnLayoutItem>
						<dx:GridViewLayoutGroup Caption="соревновательно-тренировочная деятельность" ColCount="2">
							<Items>
								<dx:GridViewColumnLayoutItem ColumnName="Competitions_count">
								</dx:GridViewColumnLayoutItem>
								<dx:GridViewColumnLayoutItem ColumnName="Starts_count">
								</dx:GridViewColumnLayoutItem>
								<dx:GridViewColumnLayoutItem ColumnName="Competitive_days_count">
								</dx:GridViewColumnLayoutItem>
							</Items>
						</dx:GridViewLayoutGroup>
						<dx:GridViewColumnLayoutItem ColumnName="KindOfSportID"></dx:GridViewColumnLayoutItem>
						<dx:EditModeCommandLayoutItem HorizontalAlign="Right">
						</dx:EditModeCommandLayoutItem>
					</Items>
					<SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" />
					<SettingsItemCaptions Location="Top" />
				</EditFormLayoutProperties>
				<Columns>
					<dx:GridViewCommandColumn 
						Caption=" " 
						Name="CommandColum" 
						ShowDeleteButton="True"
						ShowEditButton="True"
						ShowInCustomizationForm="True"
						VisibleIndex="22" 
						Width="50px">
						<HeaderStyle Wrap="True" />
						<CellStyle Wrap="True">
						</CellStyle>
					</dx:GridViewCommandColumn>

					<dx:GridViewDataTextColumn 
						FieldName="ID" 
						ShowInCustomizationForm="True"
						VisibleIndex="0" 
						Visible="False" 
						ReadOnly="True">
						<EditFormSettings Visible="False" />
					</dx:GridViewDataTextColumn>

					<dx:GridViewDataTextColumn 
						FieldName="AthleteID" 
						ShowInCustomizationForm="True" 
						VisibleIndex="1" 
						Visible="False">
					</dx:GridViewDataTextColumn>

					<dx:GridViewDataComboBoxColumn 
						Caption="Организация"
						FieldName="FirmID" 
						ShowInCustomizationForm="True" 
						VisibleIndex="2" 
						Visible="True"
						GroupIndex="0"
						>
							<PropertiesComboBox
							DataSourceID="dsFirms"
							TextField="Name"
							ValueField="ID"
							>
						</PropertiesComboBox>
						<EditFormSettings Visible="False" />
					</dx:GridViewDataComboBoxColumn>

					<dx:GridViewDataDateColumn 
						Caption="Дата" 
						FieldName="Date" 
						ShowInCustomizationForm="True" 
						VisibleIndex="6">
						<PropertiesDateEdit 
							AllowMouseWheel="false" 
							Width="170"
							UseMaskBehavior="True">
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
					</dx:GridViewDataDateColumn>

					<dx:GridViewBandColumn 
						Caption="соревновательно-тренировочная деятельность" 
						ShowInCustomizationForm="True"
						VisibleIndex="17">
						<Columns>
							<dx:GridViewDataSpinEditColumn 
								Caption="количество соревнований" 
								FieldName="Competitions_count" 
								ShowInCustomizationForm="True"
								VisibleIndex="0">
								<PropertiesSpinEdit 
									AllowMouseWheel="false"
									DisplayFormatString="g" 
									MinValue="0" 
									MaxValue="100000000000000" 
									ShowOutOfRangeWarning="False" 
									DecimalPlaces="2">
									<SpinButtons ShowIncrementButtons="False" ClientVisible="False">
									</SpinButtons>
								</PropertiesSpinEdit>
								<EditFormSettings CaptionLocation="Top" Visible="True" />
							</dx:GridViewDataSpinEditColumn>

							<dx:GridViewDataSpinEditColumn 
								Caption="количество стартов" 
								FieldName="Starts_count" 
								ShowInCustomizationForm="True"
								VisibleIndex="1">
								<PropertiesSpinEdit 
									AllowMouseWheel="false" 
									DisplayFormatString="g" 
									MinValue="0" 
									MaxValue="100000000000000"
									ShowOutOfRangeWarning="False" 
									DecimalPlaces="2">
									<SpinButtons ShowIncrementButtons="False" ClientVisible="False">
									</SpinButtons>
								</PropertiesSpinEdit>
								<EditFormSettings CaptionLocation="Top" Visible="True" />
							</dx:GridViewDataSpinEditColumn>

							<dx:GridViewDataSpinEditColumn 
								Caption="количество соревновательных дней" 
								FieldName="Competitive_days_count" 
								ShowInCustomizationForm="True" 
								VisibleIndex="2">
								<PropertiesSpinEdit 
									AllowMouseWheel="false" 
									DisplayFormatString="g" 
									MinValue="0"
									MaxValue="100000000000000"
									ShowOutOfRangeWarning="False" 
									DecimalPlaces="2">
									<SpinButtons ShowIncrementButtons="False" ClientVisible="False">
									</SpinButtons>
								</PropertiesSpinEdit>
								<EditFormSettings CaptionLocation="Top" Visible="True" />
							</dx:GridViewDataSpinEditColumn>
						</Columns>
					</dx:GridViewBandColumn>

					<dx:GridViewBandColumn 
						Caption="&lt;span title=&quot;общефизическая подготовка&quot;&gt;ОФП&lt;/span&gt;" 
						ShowInCustomizationForm="True" 
						VisibleIndex="7">
						<Columns>
							<dx:GridViewDataSpinEditColumn 
								Caption="бег 30 м" 
								FieldName="Running_30_m" 
								ShowInCustomizationForm="True"
								VisibleIndex="0">
								<PropertiesSpinEdit 
									AllowMouseWheel="false" 
									DisplayFormatString="g" 
									MaxValue="100000000000000"
									ShowOutOfRangeWarning="False"
									DecimalPlaces="2">
									<SpinButtons ShowIncrementButtons="False" ClientVisible="False">
									</SpinButtons>
								</PropertiesSpinEdit>
								<EditFormSettings CaptionLocation="Top" Visible="True" />
							</dx:GridViewDataSpinEditColumn>

							<dx:GridViewDataSpinEditColumn 
								Caption="бег 6 мин" 
								FieldName="Running_6_min" 
								ShowInCustomizationForm="True"
								VisibleIndex="1">
								<PropertiesSpinEdit 
									AllowMouseWheel="false" 
									DisplayFormatString="g" 
									MaxValue="100000000000000"
									ShowOutOfRangeWarning="False"
									DecimalPlaces="2">
									<SpinButtons ShowIncrementButtons="False" ClientVisible="False">
									</SpinButtons>
								</PropertiesSpinEdit>
								<EditFormSettings CaptionLocation="Top" Visible="True" />
							</dx:GridViewDataSpinEditColumn>

							<dx:GridViewDataSpinEditColumn 
								Caption="бег 10 сек" 
								FieldName="Running_10_sec" 
								ShowInCustomizationForm="True"
								VisibleIndex="2">
								<PropertiesSpinEdit 
									AllowMouseWheel="false" 
									DisplayFormatString="g"
									MaxValue="100000000000000"
									ShowOutOfRangeWarning="False"
									DecimalPlaces="2">
									<SpinButtons ShowIncrementButtons="False" ClientVisible="False">
									</SpinButtons>
								</PropertiesSpinEdit>
								<EditFormSettings CaptionLocation="Top" Visible="True" />
							</dx:GridViewDataSpinEditColumn>

							<dx:GridViewDataSpinEditColumn
								Caption="челночный бег 3*10 м"
								FieldName="Shuttle_run_3_10_m"
								ShowInCustomizationForm="True"
								VisibleIndex="3">
								<PropertiesSpinEdit 
									AllowMouseWheel="false"
									DisplayFormatString="g" 
									MaxValue="100000000000000"
									ShowOutOfRangeWarning="False"
									DecimalPlaces="2">
									<SpinButtons ShowIncrementButtons="False" ClientVisible="False">
									</SpinButtons>
								</PropertiesSpinEdit>
								<EditFormSettings CaptionLocation="Top" Visible="True" />
							</dx:GridViewDataSpinEditColumn>

							<dx:GridViewDataSpinEditColumn 
								Caption="прыжок в длину с места" 
								FieldName="Long_jump" 
								ShowInCustomizationForm="True"
								VisibleIndex="4">
								<PropertiesSpinEdit 
									AllowMouseWheel="false" 
									DisplayFormatString="g" 
									MaxValue="100000000000000"
									ShowOutOfRangeWarning="False"
									DecimalPlaces="2">
									<SpinButtons ShowIncrementButtons="False" ClientVisible="False">
									</SpinButtons>
								</PropertiesSpinEdit>
								<EditFormSettings CaptionLocation="Top" Visible="True" />
							</dx:GridViewDataSpinEditColumn>

							<dx:GridViewDataSpinEditColumn 
								Caption="подтягивание" 
								FieldName="Pull_up" 
								ShowInCustomizationForm="True" 
								VisibleIndex="5">
								<PropertiesSpinEdit 
									AllowMouseWheel="false"
									DisplayFormatString="g" 
									MaxValue="100000000000000"
									ShowOutOfRangeWarning="False"
									DecimalPlaces="2">
									<SpinButtons ShowIncrementButtons="False" ClientVisible="False">
									</SpinButtons>
								</PropertiesSpinEdit>
								<EditFormSettings CaptionLocation="Top" Visible="True" />
							</dx:GridViewDataSpinEditColumn>

							<dx:GridViewDataSpinEditColumn 
								Caption="бросок мяча сидя 2 кг"
								FieldName="Throwing_the_ball_sitting_2_kg"
								ShowInCustomizationForm="True"
								VisibleIndex="6">
								<PropertiesSpinEdit 
									AllowMouseWheel="false"
									DisplayFormatString="g"
									MaxValue="100000000000000" 
									ShowOutOfRangeWarning="False" 
									DecimalPlaces="2">
									<SpinButtons ShowIncrementButtons="False" ClientVisible="False">
									</SpinButtons>
								</PropertiesSpinEdit>
								<EditFormSettings CaptionLocation="Top" Visible="True" />
							</dx:GridViewDataSpinEditColumn>

							<dx:GridViewDataSpinEditColumn 
								Caption="прыжок вверх по Абалакову" 
								FieldName="Jump_up" 
								ShowInCustomizationForm="True" 
								VisibleIndex="7">
								<PropertiesSpinEdit 
									AllowMouseWheel="false" 
									DisplayFormatString="g" 
									MaxValue="100000000000000" 
									ShowOutOfRangeWarning="False" 
									DecimalPlaces="2">
									<SpinButtons ShowIncrementButtons="False" ClientVisible="False">
									</SpinButtons>
								</PropertiesSpinEdit>
								<EditFormSettings CaptionLocation="Top" Visible="True" />
							</dx:GridViewDataSpinEditColumn>

						</Columns>
					</dx:GridViewBandColumn>

					<dx:GridViewDataComboBoxColumn 
						Caption="Группа"
						FieldName="Group_type" 
						ShowInCustomizationForm="True"
						VisibleIndex="5">
						<PropertiesComboBox ValueType="System.Int32">
							<Items>
								<dx:ListEditItem Text="При зачислении" Value="0" />
								<dx:ListEditItem Text="Начальная подготовка" Value="1" />
								<dx:ListEditItem Text="Учебно-тренировочная" Value="2" />
								<dx:ListEditItem Text="Спортивного совершенствования" Value="3" />
								<dx:ListEditItem Text="Высшего спортивного мастерства" Value="4" />
							</Items>
							<ValidationSettings 
								Display="Dynamic"
								ErrorDisplayMode="ImageWithText" 
								ErrorTextPosition="Bottom">
								<RequiredField ErrorText="Выберите этап обучения" IsRequired="True" />
							</ValidationSettings>
						</PropertiesComboBox>
						<EditFormSettings CaptionLocation="Top" VisibleIndex="0" />
					</dx:GridViewDataComboBoxColumn>

					<dx:GridViewDataMemoColumn 
						Caption="лучший спортивный результат"
						FieldName="Best_sporting_result"
						ShowInCustomizationForm="True" 
						VisibleIndex="16">
						<PropertiesMemoEdit Rows="3" MaxLength="1024" />
					</dx:GridViewDataMemoColumn>

					<dx:GridViewDataComboBoxColumn 
						FieldName="KindOfSportID" 
						Caption="Вид спорта"
						VisibleIndex="21" 
						GroupIndex="1">
						<PropertiesComboBox DataSourceID="dsAllKindOfSportData" TextField="Name" ValueField="ID"></PropertiesComboBox>
						<EditItemTemplate>
                                <dx:ASPxComboBox 
									ID="cbKindOfSportList" 
									ClientInstanceName="cbKindOfSportList" 
									runat="server" 
									DataSourceID="dsAthleteKindOfSportList"
									OnDataBound="cbKindOfSportList_DataBound"
                                    Value='<%# Bind("KindOfSportID") %>' TextField="Name" ValueField="KindOfSportID"
                                    ValueType="System.Int32" 
									Width="100%" 
									OnValidation="cbKindOfSportList_Validation" 
									ValidationSettings-ValidationGroup="<%# Container.ValidationGroup %>">
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

					<dx:GridViewToolbar Name="Main">
						<Items>
							<dx:GridViewToolbarItem Name="tbbtPeriodFilter">
                            <Template>
                                <dx:ASPxComboBox
                                    ID="cbPeriods"
                                    ClientInstanceName="cbPeriods"
                                    Caption="Отображать за периоды"
									SelectedIndex="0"
									AutoPostBack="false"
                                    runat="server">
                                    <CaptionCellStyle Paddings-PaddingLeft="20px"></CaptionCellStyle>
                                    <Items>
                                        <dx:ListEditItem
                                            Text="Текущий период"
                                            Value="1"
                                            Selected="true" />
                                        <dx:ListEditItem
                                            Text="Все периоды"
                                            Value="0" />
                                    </Items>
                                    <ClientSideEvents SelectedIndexChanged="function(s,e){ gvAthletes_performance_card.Refresh();}" />
                                </dx:ASPxComboBox>
                            </Template>
                        </dx:GridViewToolbarItem>
							<dx:GridViewToolbarItem Command="New" Name="btAdd" Text="Добавить"></dx:GridViewToolbarItem>
							<dx:GridViewToolbarItem Command="FullExpand" Text="Раскрыть все"></dx:GridViewToolbarItem>
							<dx:GridViewToolbarItem Command="FullCollapse" Text="Свернуть все"></dx:GridViewToolbarItem>
						</Items>
					</dx:GridViewToolbar>
				</Toolbars>
				<Templates>
					<FooterRow>
						<div>Срок учета (актуальности данных) 12 месяцев с момента ввода - <dx:ASPxLabel ID="lblLastDateMsg" runat="server" Font-Bold="true" Text="<%# GetLastDate(AthleteCardDto?.AthleteInfo?.OFPInfoLastDate) %>" ></dx:ASPxLabel> </div>
					</FooterRow>
				</Templates>
				<Styles>
					<Header Wrap="True" HorizontalAlign="Center">
					</Header>
					<Cell Wrap="True" HorizontalAlign="Center">
					</Cell>
					<AdaptiveHeaderPanel CssClass="adaptive-no-header">
					</AdaptiveHeaderPanel>
				</Styles>
			</dx:ASPxGridView>
</div>

<asp:SqlDataSource
					ID="dsAthletes_performance_card"
					runat="server" 
					ConnectionString="<%$ ConnectionStrings:MFKSConnectionString %>" 
					SelectCommand="GetAthleteOFPList" SelectCommandType="StoredProcedure" OnSelecting="dsAthletes_performance_card_Selecting"
					InsertCommandType="StoredProcedure" InsertCommand="[dbo].[Athletes_performance_card_Insert]" OnInserting="dsAthletes_performance_card_Inserting"
					DeleteCommandType="StoredProcedure" DeleteCommand="[dbo].[Athletes_performance_card_Delete]" OnDeleting="BeginLoggableTransact"
					UpdateCommandType="StoredProcedure" UpdateCommand="[dbo].[Athletes_performance_card_Update]" OnUpdating="BeginLoggableTransact">
					<DeleteParameters>
						<asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
						<asp:Parameter Name="Log_IP" Type="String" />
						<asp:Parameter Name="Log_SessionID" Type="String" />
						<asp:Parameter Name="Log_Login" Type="String" />
						<asp:Parameter Name="Log_ClientID" Type="Int32" />
						<asp:Parameter Name="Log_AuthorisationSessionID" Type="String" />
						<asp:Parameter Name="ID" Type="Int64" />
					</DeleteParameters>
					<InsertParameters>
						<asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
						<asp:Parameter Name="Log_IP" Type="String" />
						<asp:Parameter Name="Log_SessionID" Type="String" />
						<asp:Parameter Name="Log_Login" Type="String" />
						<asp:Parameter Name="Log_ClientID" Type="Int32" />
						<asp:Parameter Name="Log_AuthorisationSessionID" Type="String" />
						<asp:Parameter Name="AthleteID" Type="Int64" />
						<asp:Parameter Name="FirmID" Type="Int32" />
						<asp:Parameter Name="Group_type" Type="Int32" />
						<asp:Parameter Name="Date" Type="DateTime" />
						<asp:Parameter Name="Running_30_m" Type="Decimal" />
						<asp:Parameter Name="Running_6_min" Type="Decimal" />
						<asp:Parameter Name="Running_10_sec" Type="Decimal" />
						<asp:Parameter Name="Shuttle_run_3_10_m" Type="Decimal" />
						<asp:Parameter Name="Long_jump" Type="Decimal" />
						<asp:Parameter Name="Pull_up" Type="Decimal" />
						<asp:Parameter Name="Throwing_the_ball_sitting_2_kg" Type="Decimal" />
						<asp:Parameter Name="Jump_up" Type="Decimal" />
						<asp:Parameter Name="Best_sporting_result" Type="String" />
						<asp:Parameter Name="Competitions_count" Type="Int32" />
						<asp:Parameter Name="Starts_count" Type="Int32" />
						<asp:Parameter Name="Competitive_days_count" Type="Int32" />
						<asp:Parameter Name="KindOfSportID" />
					</InsertParameters>
					<SelectParameters>
						<asp:Parameter Name="AthleteID" />
						<asp:Parameter Name="OnlyCurrentPeriod"  />
						<asp:Parameter Name="KindOfSportId" DefaultValue="0" />
					</SelectParameters>
					<UpdateParameters>
						<asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
						<asp:Parameter Name="Log_IP" Type="String" />
						<asp:Parameter Name="Log_SessionID" Type="String" />
						<asp:Parameter Name="Log_Login" Type="String" />
						<asp:Parameter Name="Log_ClientID" Type="Int32" />
						<asp:Parameter Name="Log_AuthorisationSessionID" Type="String" />
						<asp:Parameter Name="ID" Type="Int64" />
						<asp:Parameter Name="Group_type" Type="Int32" />
						<asp:Parameter Name="Date" Type="DateTime" />
						<asp:Parameter Name="Running_30_m" Type="Decimal" />
						<asp:Parameter Name="Running_6_min" Type="Decimal" />
						<asp:Parameter Name="Running_10_sec" Type="Decimal" />
						<asp:Parameter Name="Shuttle_run_3_10_m" Type="Decimal" />
						<asp:Parameter Name="Long_jump" Type="Decimal" />
						<asp:Parameter Name="Pull_up" Type="Decimal" />
						<asp:Parameter Name="Throwing_the_ball_sitting_2_kg" Type="Decimal" />
						<asp:Parameter Name="Jump_up" Type="Decimal" />
						<asp:Parameter Name="Best_sporting_result" Type="String" />
						<asp:Parameter Name="Competitions_count" Type="Int32" />
						<asp:Parameter Name="Starts_count" Type="Int32" />
						<asp:Parameter Name="Competitive_days_count" Type="Int32" />
						<asp:Parameter Name="KindOfSportID" />
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

<asp:SqlDataSource ID="dsAllKindOfSportData" runat="server" ConnectionString='<%$ ConnectionStrings:MFKSConnectionString %>' 
    SelectCommand="GetAllKindOfSport" SelectCommandType="StoredProcedure">
    <SelectParameters>
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



