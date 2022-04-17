<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AthletePerformance.ascx.cs" Inherits="MFKSHelper.SpeedRun.Element.AthletePerformance" %>

<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:PlaceHolder runat="server">
    <%: Scripts.Render("~/bundles/performance") %>
</asp:PlaceHolder>

<dx:ASPxLoadingPanel
                                ID="lpAthletesPerformance"
                                ClientInstanceName="lpAthletesPerformance"
                                runat="server"								
                                Text="%%Загрузка%%&amp;hellip;">
                            </dx:ASPxLoadingPanel>

<dx:ASPxGridView 
					ID="gvAthletes_performance" 
					ClientInstanceName="gvAthletes_performance" 
					runat="server" 
					AutoGenerateColumns="False" 
					DataSourceID="dsAthletes_performance" 
					KeyFieldName="ID" 
					Width="100%"
					OnCommandButtonInitialize="gvAthletes_performance_CommandButtonInitialize" 
					OnCustomJSProperties="gvAthletes_performance_CustomJSProperties"
					OnRowInserted="gvAthletes_performance_RowInserted"
					OnRowUpdated="gvAthletes_performance_RowUpdated"
					OnRowDeleted="gvAthletes_performance_RowDeleted"
					>
					<Settings ShowFilterRow="true" AutoFilterCondition="Contains" ShowFooter="true" />
					<SettingsEditing EditFormColumnCount="1">
					</SettingsEditing>
					<SettingsBehavior AutoExpandAllGroups="true" AllowGroup="true" />
                    <SettingsPager
                        Position="TopAndBottom"
                        PageSize="20"
                        Mode="ShowPager">
                    </SettingsPager>
					<Columns>
						<dx:GridViewCommandColumn 
							ShowClearFilterButton="True" 
							ShowDeleteButton="True"
							ShowEditButton="True" 
							ShowInCustomizationForm="True" 
							VisibleIndex="18" 
							Width="50px" 
							AllowTextTruncationInAdaptiveMode="True" 
							Name="CommandColum" Caption=" ">
							<CellStyle Wrap="True">
							</CellStyle>
						</dx:GridViewCommandColumn>

						<dx:GridViewDataTextColumn 
							FieldName="ID" 
							ReadOnly="True" 
							ShowInCustomizationForm="True" 
							VisibleIndex="0" 
							Visible="False">
							<EditFormSettings Visible="False" />
						</dx:GridViewDataTextColumn>

						<dx:GridViewDataTextColumn 
							FieldName="Edit_FirmID" 
							ShowInCustomizationForm="True" 
							VisibleIndex="1" 
							Visible="False">
							<EditFormSettings Visible="False" />
						</dx:GridViewDataTextColumn>

						<dx:GridViewDataTextColumn 
							FieldName="AthleteID" 
							ShowInCustomizationForm="True" 
							VisibleIndex="2"
							Visible="False">
							<EditFormSettings Visible="False" />
						</dx:GridViewDataTextColumn>

						<dx:GridViewDataTextColumn 
							FieldName="Events_CompletedList_Name" 
							ReadOnly="True" 
							ShowInCustomizationForm="True" 
							VisibleIndex="4" 
							Caption="Наименование спортивного мероприятия, соревнований">
							<CellStyle HorizontalAlign="Left"></CellStyle>
							<EditFormSettings Visible="False" />
						</dx:GridViewDataTextColumn>

						<dx:GridViewDataTextColumn
							FieldName="Events_CompletedList_Place" 
							ReadOnly="True" 
							ShowInCustomizationForm="True" 
							VisibleIndex="7" 
							Caption="Место проведения">
							<EditFormSettings Visible="False" />
						</dx:GridViewDataTextColumn>

						<dx:GridViewDataTextColumn 
							FieldName="Result_planned" 
							ShowInCustomizationForm="True" 
							VisibleIndex="9" 
							Caption="Планируемый результат">
							<PropertiesTextEdit MaxLength="256">
							</PropertiesTextEdit>
							<EditFormSettings Visible="True" CaptionLocation="Top" />
						</dx:GridViewDataTextColumn>


						<dx:GridViewDataTextColumn 
							FieldName="Result_shown" 
							ShowInCustomizationForm="True" 
							VisibleIndex="10" 
							Caption="Показанный результат">
							<PropertiesTextEdit MaxLength="256">
							</PropertiesTextEdit>
							<EditFormSettings Visible="True" CaptionLocation="Top" />
						</dx:GridViewDataTextColumn>

						<dx:GridViewBandColumn 
							Caption="Сроки проведения" 
							ShowInCustomizationForm="True"
							VisibleIndex="6">
							<Columns>
								<dx:GridViewDataDateColumn
									Caption="Дата начала" 
									FieldName="Events_CompletedList_StartDate" 
									ReadOnly="True" 
									ShowInCustomizationForm="True" 
									VisibleIndex="0">
									<CellStyle HorizontalAlign="Center"></CellStyle>
									<EditFormSettings Visible="False" />
									<PropertiesDateEdit AllowMouseWheel="false">
										<DateRangeSettings CalendarColumnCount="1" />
										<CalendarProperties 
											ShowWeekNumbers="false" 
											ShowClearButton="True" 
											TodayButtonText="Сегодня" 
											ClearButtonText="Очистить">
											<FastNavProperties OkButtonText="OK" CancelButtonText="Отмена" />
										</CalendarProperties>
									</PropertiesDateEdit>
								</dx:GridViewDataDateColumn>

								<dx:GridViewDataDateColumn 
									Caption="Дата окончания" 
									FieldName="Events_CompletedList_EndDate" 
									ReadOnly="True" 
									ShowInCustomizationForm="True" 
									VisibleIndex="1">
									<CellStyle HorizontalAlign="Center"></CellStyle>
									<EditFormSettings Visible="False" />
									<PropertiesDateEdit AllowMouseWheel="false">
										<DateRangeSettings CalendarColumnCount="1" StartDateEditID="Events_CompletedList_StartDate" />
										<CalendarProperties 
											ShowWeekNumbers="false" 
											ShowClearButton="True"
											TodayButtonText="Сегодня" 
											ClearButtonText="Очистить">
											<FastNavProperties OkButtonText="OK" CancelButtonText="Отмена" />
										</CalendarProperties>
									</PropertiesDateEdit>
								</dx:GridViewDataDateColumn>
							</Columns>
						</dx:GridViewBandColumn>

						<dx:GridViewDataComboBoxColumn 
							Caption="Наименование мероприятия" 
							FieldName="Events_CompletedListID" 
							ShowInCustomizationForm="True" 
							Visible="False" 
							VisibleIndex="3" 
							Name="cbEvents_Completed_gvAthletes_performance">
							<PropertiesComboBox DataSourceID="dsEvents_CompletedSelect" TextField="Name" ValueField="ID"></PropertiesComboBox>
							<%--<PropertiesComboBox ClientInstanceName="cbEvents_Completed_gvAthletes_performance">
								<ClientSideEvents 
									ButtonClick="Athletes_performance.cbEvents_Completed_gvAthletesperformanceClick" 
									Init="Athletes_performance.cbEvents_Completed_gvAthletes_performance_Init" />
								<DropDownButton Visible="False">
								</DropDownButton>
								<Buttons>
									<dx:EditButton Text="...">
									</dx:EditButton>
								</Buttons>
								
							</PropertiesComboBox>--%>
							<EditItemTemplate>
									<dx:ASPxComboBox 
										ID="cbEventsCompletedList" 
										ClientInstanceName="cbEventsCompletedList"
										runat="server" 
                                        ValueField="ID" TextField="Name" 
                                        ValueType="System.Int32" 
										Width="100%" 
										OnInit="cbEventsCompletedList_Init" 
										OnValidation="cbEventsCompletedList_Validation" 
										ValidationSettings-ValidationGroup="<%# Container.ValidationGroup %>"
										AutoPostBack="false"
										>
										<ClientSideEvents ButtonClick="athletesPerformance.ShowTrainerListPopup"  />
										<DropDownButton Visible="false"></DropDownButton>
										<Buttons>
											<dx:EditButton Text="..."></dx:EditButton>
										</Buttons>
										<ValidationSettings
                                            Display="Dynamic"
                                            ErrorDisplayMode="ImageWithText"
                                            ErrorTextPosition="Bottom">
                                            <RequiredField ErrorText="Выберите мероприятие" IsRequired="True" />
										 </ValidationSettings>
										<CaptionSettings Position="Top"  />
                                    </dx:ASPxComboBox>
								</EditItemTemplate>
							<EditFormSettings 
								Caption="Наименование мероприятия" 
								CaptionLocation="Top" 
								Visible="True" />
						</dx:GridViewDataComboBoxColumn>

						<dx:GridViewDataComboBoxColumn 
							Caption="Командирующая организация" 
							FieldName="Business_trip_organizationID" 
							ShowInCustomizationForm="True" 
							Visible="True" 
							VisibleIndex="13" 
							Name="cbBusiness_trip_organization_gvAthletes_performance">
							<PropertiesComboBox
								ClientInstanceName="cbBusiness_trip_organization_gvAthletes_performance"
								DataSourceID="dsBusiness_trip_organization"
								TextField="FirmName"
								ValueField="ID"
								ValueType="System.Int32">
							<ClientSideEvents 
								Init="athletesPerformance.cbBusiness_trip_organization_gvAthletes_performance_Init"
								SelectedIndexChanged="athletesPerformance.cbBusiness_trip_organization_gvAthletes_performance_SelectedIndexChanged" 
								/>
                            <ValidationSettings
                                Display="Dynamic"
                                ErrorDisplayMode="ImageWithText"
                                ErrorTextPosition="Bottom">
                                <RequiredField ErrorText="Выберите организацию" IsRequired="True" />
                            </ValidationSettings>
                        </PropertiesComboBox>
                        <EditFormSettings CaptionLocation="Top" Visible="True" VisibleIndex="7" />
						</dx:GridViewDataComboBoxColumn>

						<dx:GridViewDataSpinEditColumn 
							Caption="Примечание" 
							FieldName="Spent_Money" 
							ShowInCustomizationForm="True" 
							VisibleIndex="16">
							<PropertiesSpinEdit 
								AllowMouseWheel="false" 
								DisplayFormatString="{0} тг." 
								MaxValue="100000000000000" 
								ShowOutOfRangeWarning="False">
								<SpinButtons ShowIncrementButtons="False">
								</SpinButtons>
							</PropertiesSpinEdit>
							<EditFormSettings 
								Caption="Примечание (тг.)" 
								CaptionLocation="Top" 
								Visible="False" />
						</dx:GridViewDataSpinEditColumn>

						<dx:GridViewBandColumn Caption="Смета расходов" VisibleIndex="16">
							<Columns>
								<dx:GridViewDataTextColumn 
									FieldName="PassagePayment" 
									ShowInCustomizationForm="True"
									VisibleIndex="0" 
									Caption="Проезд" 
									CellStyle-HorizontalAlign="Center" 
									PropertiesTextEdit-DisplayFormatString="{0} тг.">
									<EditFormSettings Visible="False" VisibleIndex="20" />
									<CellStyle HorizontalAlign="Center"></CellStyle>
								</dx:GridViewDataTextColumn>
								<dx:GridViewDataTextColumn 
									FieldName="AccommodationPayment" 
									ShowInCustomizationForm="True" 
									VisibleIndex="1" 
									Caption="Проживание" 
									CellStyle-HorizontalAlign="Center" 
									PropertiesTextEdit-DisplayFormatString="{0} тг.">
									<EditFormSettings Visible="False" VisibleIndex="21" />

									<CellStyle HorizontalAlign="Center"></CellStyle>
								</dx:GridViewDataTextColumn>
								<dx:GridViewDataTextColumn 
									FieldName="NutritionPayment" 
									ShowInCustomizationForm="True" 
									VisibleIndex="2" 
									Caption="Питание" 
									CellStyle-HorizontalAlign="Center" 
									PropertiesTextEdit-DisplayFormatString="{0} тг.">
									<EditFormSettings Visible="False" VisibleIndex="22" />

									<CellStyle HorizontalAlign="Center"></CellStyle>
								</dx:GridViewDataTextColumn>

								<dx:GridViewDataTextColumn 
									FieldName="DayPayment" 
									ShowInCustomizationForm="True" 
									VisibleIndex="3" 
									Caption="Суточные" 
									CellStyle-HorizontalAlign="Center"
									PropertiesTextEdit-DisplayFormatString="{0} тг.">
									<EditFormSettings Visible="False" VisibleIndex="23" />

									<CellStyle HorizontalAlign="Center"></CellStyle>
								</dx:GridViewDataTextColumn>

								<dx:GridViewDataTextColumn 
									FieldName="AdditionalPayment" 
									ShowInCustomizationForm="True" 
									VisibleIndex="4" 
									Caption="Другое" 
									CellStyle-HorizontalAlign="Center" 
									PropertiesTextEdit-DisplayFormatString="{0} тг.">
									<EditFormSettings Visible="False" VisibleIndex="24" />

									<CellStyle HorizontalAlign="Center"></CellStyle>
								</dx:GridViewDataTextColumn>

								<dx:GridViewDataTextColumn 
									FieldName="TotalPayment" 
									ReadOnly="True" 
									ShowInCustomizationForm="True"
									VisibleIndex="5"
									Caption="Итого"
									CellStyle-HorizontalAlign="Center"
									PropertiesTextEdit-DisplayFormatString="{0} тг.">
									<EditFormSettings Visible="False" VisibleIndex="25" />
									<CellStyle HorizontalAlign="Center"></CellStyle>
								</dx:GridViewDataTextColumn>
							</Columns>

						</dx:GridViewBandColumn>

						<dx:GridViewDataComboBoxColumn FieldName="KindsOfSportsID" Caption="Вид спорта" VisibleIndex="17" GroupIndex="0">
                            <PropertiesComboBox DataSourceID="dsAllKindOfSportData" TextField="Name" ValueField="ID">
                            </PropertiesComboBox>
							<EditFormSettings CaptionLocation="Top" Visible="False"   />
                        </dx:GridViewDataComboBoxColumn>

					</Columns>
					<Toolbars>
						<dx:GridViewToolbar Name="Main">
							<Items>
								<dx:GridViewToolbarItem Name="tbbtYear">
											<Template>
												<div class="spin-year">
													<div class="spin-year__caption">Год:</div>
												<dx:ASPxSpinEdit 
													ID="cbYear" 
													ClientInstanceName="cbYear"
													
													runat="server" 
													MinValue="1970" 
													MaxValue="2100" 
													Width="90" 
													AutoPostBack="false"
													OnInit="cbYear_Init"
													>
													<ClientSideEvents ValueChanged="function(s,e){ cbPanel.PerformCallback('refresh'); }" />
												</dx:ASPxSpinEdit>
													</div>
												<%--gvAthletes_performance.Refresh();--%>
											</Template>
										</dx:GridViewToolbarItem>
								<dx:GridViewToolbarItem Command="New" Name="btAdd" Text="Добавить"></dx:GridViewToolbarItem>
								<dx:GridViewToolbarItem Command="FullExpand" Text="Раскрыть все"></dx:GridViewToolbarItem>
								<dx:GridViewToolbarItem Command="FullCollapse" Text="Свернуть все"></dx:GridViewToolbarItem>
							</Items>
						</dx:GridViewToolbar>
					</Toolbars>
					<Styles>
						<Header Wrap="True" HorizontalAlign="Center"></Header>
						<AdaptiveHeaderPanel CssClass="adaptive-no-header"></AdaptiveHeaderPanel>
						<Cell HorizontalAlign="Center"></Cell>
					</Styles>
					<ClientSideEvents EndCallback='function(s,e){ if (e.command === "UPDATEEDIT" || e.command === "DELETEROW") { Master.cp_EndCallback(s,e); cbPanel.PerformCallback("refresh"); } }' />
				</dx:ASPxGridView>

<dx:ASPxPopupControl 
	ID="ppcCustomModalEvents_CompletedSelect" 
	ClientInstanceName="ppcCustomModalEvents_CompletedSelect" 
	runat="server" 
	AllowDragging="True" 
	CloseAction="CloseButton" 
	AllowResize="true"
	PopupAction="None" 
	Width="920" 
	HeaderText="Выберите мероприятие"
	PopupHorizontalAlign="WindowCenter"
	PopupVerticalAlign="TopSides"
	PopupHorizontalOffset="30"
	OnWindowCallback="ppcCustomModalEvents_CompletedSelect_WindowCallback"
	>
	<ContentCollection>
		<dx:PopupControlContentControl>

					<dx:ASPxLabel ID="lblYearByModal" runat="server" Text="Выбранный период: " CssClass="lbl-year"></dx:ASPxLabel>

                    <section class="grid-center">

                       <dx:ASPxGridView 
						ID="gvEvents_CompletedSelect" 
						ClientInstanceName="gvEvents_CompletedSelect"
						runat="server"
						AutoGenerateColumns="False"
						DataSourceID="dsEvents_CompletedSelect" 
						KeyFieldName="ID" 
						Width="100%"
						>
						<ClientSideEvents SelectionChanged="athletesPerformance.gvEvents_CompletedSelect_SelectionChanged" />
                        <SettingsPager
                            Position="Bottom"
                            PageSize="5"
                            Mode="ShowPager">
                        </SettingsPager>
						<Settings 
							ShowFilterRow="True" 
							VerticalScrollableHeight="500" 
							VerticalScrollBarMode="Auto" />
						<SettingsBehavior 
							AllowSelectByRowClick="True" 
							AllowSelectSingleRowOnly="True" 
							AllowFixedGroups="True" 
							AutoExpandAllGroups="True" />
						<SettingsDataSecurity 
							AllowDelete="False" 
							AllowEdit="False" 
							AllowInsert="False" />
						<Columns>
							<dx:GridViewCommandColumn 
								SelectAllCheckboxMode="Page" 
								ShowInCustomizationForm="True" 
								ShowSelectCheckbox="True" 
								VisibleIndex="0" 
								Name="CommandColumn"
								>
							</dx:GridViewCommandColumn>
							<dx:GridViewDataTextColumn 
								ShowInCustomizationForm="True" 
								VisibleIndex="1" 
								Caption="Вид мероприятия" 
								Name="SportsCompetitionsClassification_Name"
								FieldName="SportsCompetitionsClassification_Name">
							</dx:GridViewDataTextColumn>
							<dx:GridViewDataTextColumn
								ShowInCustomizationForm="True"
								VisibleIndex="2" 
								Caption="Наименование" 
								FieldName="Name"
								Name="Name"
								>
							</dx:GridViewDataTextColumn>
							<dx:GridViewDataComboBoxColumn 
								ShowInCustomizationForm="True" 
								VisibleIndex="3" 
								Caption="Вид спорта" 
								Name="KindsOfSportsID" 
								FieldName="KindsOfSportsID">
								<PropertiesComboBox 
									ValueField="ID" 
									TextField="Name" 
									DataSourceID="dsAllKindOfSportData" />
							</dx:GridViewDataComboBoxColumn>
							<dx:GridViewDataDateColumn 
								FieldName="StartDate" 
								ShowInCustomizationForm="True" 
								VisibleIndex="4" 
								Caption="Начало">
								<PropertiesDateEdit AllowMouseWheel="false">
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
								FieldName="EndDate" 
								ShowInCustomizationForm="True" 
								VisibleIndex="5" 
								Caption="Окончание">
								<PropertiesDateEdit AllowMouseWheel="false">
									<CalendarProperties 
										ShowWeekNumbers="false" 
										ShowClearButton="True" 
										TodayButtonText="Сегодня" 
										ClearButtonText="Очистить">
										<FastNavProperties OkButtonText="OK" CancelButtonText="Отмена" />
									</CalendarProperties>
								</PropertiesDateEdit>
								<CellStyle HorizontalAlign="Center" ></CellStyle>
							</dx:GridViewDataDateColumn>
						</Columns>
						<Styles>
							<Header Wrap="True">
							</Header>
							<Row Wrap="True">
							</Row>
							<AdaptiveHeaderPanel BackColor="#FF6666" ForeColor="#009933" CssClass="adaptive-no-header">
							</AdaptiveHeaderPanel>
						</Styles>
						<%--<Toolbars>
						<dx:GridViewToolbar Name="btAdd">
							<Items>
								<dx:GridViewToolbarItem Name="tbbtYear">
											<Template>
												<dx:ASPxTextBox 
													ID="tbYearEventComplete"
													ClientInstanceName="tbYearEventComplete"
													Caption="Выбранный период"
													runat="server"
													Width="100px"
													ClientEnabled="false"
													
													>
													<ClientSideEvents Init="Athletes_performance.tbYearEventComplete_Init" />
												</dx:ASPxTextBox>
												
											</Template>
										</dx:GridViewToolbarItem>
							</Items>
						</dx:GridViewToolbar>
					</Toolbars>--%>
					</dx:ASPxGridView>


                    </section>

                    <section class="btns_trainer_modal">
                        <dx:ASPxButton
                            ID="btnEvents_CompletedSelect"
                            ClientInstanceName="btnEvents_CompletedSelect"
                            runat="server"
                            Text="Выбрать"
                            ClientEnabled="false"
                            AutoPostBack="false">
                            <ClientSideEvents Click="athletesPerformance.EventCompletedList_Click" />
                        </dx:ASPxButton>
                        <dx:ASPxButton
                                ID="btnEvents_CompletedCancel"
                                ClientInstanceName="btnEvents_CompletedCancel"
                                runat="server"
                                Text="Отмена"
                                CssClass="btn-default"
                                AutoPostBack="false">
                                <ClientSideEvents Click="athletesPerformance.EventCompletedList_Cancel" />
                            </dx:ASPxButton>
                    </section>



			</dx:PopupControlContentControl>
	</ContentCollection>
</dx:ASPxPopupControl>


<%----------------------------------------------------------%>
<asp:SqlDataSource ID="dsAthletes_performance" runat="server" ConnectionString="<%$ ConnectionStrings:MFKSConnectionString %>" 
					SelectCommand="GetAthletePerformance" SelectCommandType="StoredProcedure" OnSelecting="dsAthletes_performance_Selecting"
					DeleteCommand="[dbo].[Athletes_performance_Delete]" DeleteCommandType="StoredProcedure" OnDeleting="BeginLoggableTransact"
					InsertCommand="[dbo].[Athletes_performance_Insert]" InsertCommandType="StoredProcedure" OnInserting="dsAthletes_performance_Inserting"
					UpdateCommand="[dbo].[Athletes_performance_Update]" UpdateCommandType="StoredProcedure" OnUpdating="BeginLoggableTransact">
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
						<asp:Parameter Name="AthleteID" />
						<asp:Parameter Name="Events_CompletedListID" />
						<asp:Parameter Name="Result_planned" />
						<asp:Parameter Name="Result_shown" />
						<asp:Parameter Name="Business_trip_organizationID" />
						<asp:Parameter Name="Spent_Money" />
						<asp:Parameter Name="ID" />
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
						<asp:Parameter Name="Events_CompletedListID" />
						<asp:Parameter Name="Result_planned" />
						<asp:Parameter Name="Result_shown" />
						<asp:Parameter Name="Business_trip_organizationID" />
						<asp:Parameter Name="Spent_Money" />
					</InsertParameters>
					<SelectParameters>
						<asp:Parameter Name="AthleteID" />
						<asp:Parameter Name="KindOfSportId" DefaultValue="0" />
						<asp:Parameter Name="Year" />
						<asp:Parameter Name="Lang" DefaultValue="Rus" />
					</SelectParameters>
				</asp:SqlDataSource>

<asp:SqlDataSource
                ID="dsBusiness_trip_organization"
                runat="server"
                ConnectionString="<%$ ConnectionStrings:MFKSConnectionString %>"
                SelectCommand="GetBusinessTripOrganizationList" SelectCommandType="StoredProcedure" OnSelecting="dsBusiness_trip_organization_Selecting" >
                <SelectParameters>
                    <asp:Parameter Name="RegionID" DefaultValue="0" />
					<asp:Parameter Name="Lang" DefaultValue="Rus" />
                </SelectParameters>
            </asp:SqlDataSource>

<asp:SqlDataSource 
						ID="dsEvents_CompletedSelect" 
						runat="server" 
						ConnectionString="<%$ ConnectionStrings:MFKSConnectionString %>" 
						SelectCommand="GetEventsCompletedList" SelectCommandType="StoredProcedure" OnSelecting="dsEvents_CompletedSelect_Selecting">
						<SelectParameters>
							<asp:Parameter Name="FirmID" />
							<asp:Parameter Name="AthleteID" />
							<asp:Parameter Name="Year" />
							<asp:Parameter Name="Lang" />
						</SelectParameters>
					</asp:SqlDataSource>

<asp:SqlDataSource
	ID="dsAllKindOfSportData" 
	runat="server" 
	ConnectionString='<%$ ConnectionStrings:MFKSConnectionString %>' 
    SelectCommand="dbo.GetAllKindOfSport" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:Parameter DefaultValue="Rus" Name="Lang" Type="String"></asp:Parameter>
    </SelectParameters>
</asp:SqlDataSource>