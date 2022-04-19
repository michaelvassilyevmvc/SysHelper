<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AthleteMedicalInfo.ascx.cs" Inherits="MFKSHelper.SpeedRun.Element.AthleteMedicalInfo" %>
<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:PlaceHolder runat="server">
    <%: Scripts.Render("~/bundles/medicalInfo") %>
</asp:PlaceHolder>

<dx:ASPxLoadingPanel
                                ID="lpAthletesPerformance"
                                ClientInstanceName="lpAthletesPerformance"
                                runat="server"								
                                Text="Загрузка&amp;hellip;">
                            </dx:ASPxLoadingPanel>



			<dx:ASPxGridView 
				ID="gvAthletes_medical_card" 
				ClientInstanceName="gvAthletes_medical_card" 
				runat="server" 
				AutoGenerateColumns="False" 
				DataSourceID="dsAthletes_medical_card" 
				Width="100%" 				
				KeyFieldName="ID"
				OnCommandButtonInitialize="gvAthletes_medical_card_CommandButtonInitialize" 
				OnRowInserted="gvAthletes_medical_card_RowInserted"
				OnRowUpdated="gvAthletes_medical_card_RowUpdated"
				OnRowDeleted="gvAthletes_medical_card_RowDeleted"
				>
				<ClientSideEvents EndCallback='function(s,e){ if (e.command === "UPDATEEDIT" || e.command === "DELETEROW") { Master.cp_EndCallback(s,e); cbPanel.PerformCallback("refresh"); } }' />
				<SettingsAdaptivity AdaptivityMode="HideDataCellsWindowLimit" HideDataCellsAtWindowInnerWidth="940">
					<AdaptiveDetailLayoutProperties>
						<Items>
							<dx:GridViewColumnLayoutItem ColumnName="ID" Visible="False">
							</dx:GridViewColumnLayoutItem>
							<dx:GridViewColumnLayoutItem ColumnName="AthleteID" Visible="False">
							</dx:GridViewColumnLayoutItem>
							<dx:GridViewColumnLayoutItem ColumnName="FirmID" Visible="False">
							</dx:GridViewColumnLayoutItem>
							<dx:GridViewColumnLayoutItem ColumnName="FirmName">
							</dx:GridViewColumnLayoutItem>
							<dx:GridViewColumnLayoutItem ColumnName="Group_type">
							</dx:GridViewColumnLayoutItem>
							<dx:GridViewColumnLayoutItem ColumnName="Date">
							</dx:GridViewColumnLayoutItem>
							<dx:GridViewLayoutGroup Caption="Физическое развитие">
								<Items>
									<dx:GridViewColumnLayoutItem ColumnName="Height">
									</dx:GridViewColumnLayoutItem>
									<dx:GridViewColumnLayoutItem ColumnName="Weight">
									</dx:GridViewColumnLayoutItem>
									<dx:GridViewColumnLayoutItem ColumnName="Foot_length">
									</dx:GridViewColumnLayoutItem>
									<dx:GridViewColumnLayoutItem ColumnName="Force_of_hand_flexor">
									</dx:GridViewColumnLayoutItem>
									<dx:GridViewColumnLayoutItem ColumnName="Volume_of_lungs">
									</dx:GridViewColumnLayoutItem>
									<dx:GridViewColumnLayoutItem ColumnName="Maximum_oxygen_consumption">
									</dx:GridViewColumnLayoutItem>
									<dx:GridViewColumnLayoutItem ColumnName="Maximum_oxygen_consumption_kg">
									</dx:GridViewColumnLayoutItem>
								</Items>
							</dx:GridViewLayoutGroup>
							<dx:GridViewColumnLayoutItem ColumnName="Medical_description">
							</dx:GridViewColumnLayoutItem>
							<dx:GridViewColumnLayoutItem ColumnName="CommandColum" Caption="" Width="50px">
							</dx:GridViewColumnLayoutItem>
						</Items>
						<SettingsItemCaptions Location="Top" />
					</AdaptiveDetailLayoutProperties>
				</SettingsAdaptivity>
				<Settings ShowFooter="true" />
				<SettingsPager Mode="ShowAllRecords"></SettingsPager>
				<SettingsEditing EditFormColumnCount="2"></SettingsEditing>
				<EditFormLayoutProperties>
					<Items>
						<dx:GridViewColumnLayoutItem ColumnName="Group_type" ShowCaption="True">
							<CaptionSettings Location="Top" />
						</dx:GridViewColumnLayoutItem>
						<dx:GridViewColumnLayoutItem ColumnName="Date" ShowCaption="True">
							<CaptionSettings Location="Top" />
						</dx:GridViewColumnLayoutItem>
						<dx:GridViewLayoutGroup Caption="Физическое развитие" ColCount="3">
							<Items>
								<dx:GridViewColumnLayoutItem 
									ColumnName="Height" 
									ShowCaption="True" 
									Caption="Рост см">
									<CaptionSettings Location="Top" />
								</dx:GridViewColumnLayoutItem>
								<dx:GridViewColumnLayoutItem 
									ColumnName="Weight" 
									ShowCaption="True" 
									Caption="Вес кг">
									<CaptionSettings Location="Top" />
								</dx:GridViewColumnLayoutItem>
								<dx:GridViewColumnLayoutItem 
									ColumnName="Foot_length" 
									ShowCaption="True" 
									Caption="Длина стопы см">
									<CaptionSettings Location="Top" />
								</dx:GridViewColumnLayoutItem>
								<dx:GridViewColumnLayoutItem 
									ColumnName="Force_of_hand_flexor" 
									ShowCaption="True" 
									Caption="Сила сгибателей кисти кг">
									<CaptionSettings Location="Top" />
								</dx:GridViewColumnLayoutItem>
								<dx:GridViewColumnLayoutItem 
									ColumnName="Volume_of_lungs" 
									ShowCaption="True" 
									Caption="ЖЕЛ л (жизненная емкость легких) ">
									<CaptionSettings Location="Top" />
								</dx:GridViewColumnLayoutItem>
								<dx:GridViewColumnLayoutItem 
									ColumnName="Maximum_oxygen_consumption" 
									ShowCaption="True" 
									Caption="МПК мл/мин (максимальное потребление кислорода)">
									<CaptionSettings Location="Top" />
								</dx:GridViewColumnLayoutItem>
								<dx:GridViewColumnLayoutItem 
									ColumnName="Maximum_oxygen_consumption_kg" 
									ShowCaption="True" 
									Caption="МПК мл/мин/кг (максимальное потребление кислорода)">
									<CaptionSettings Location="Top" />
								</dx:GridViewColumnLayoutItem>
							</Items>
						</dx:GridViewLayoutGroup>
						<dx:GridViewColumnLayoutItem ColumnName="Medical_description" ShowCaption="True">
							<CaptionSettings Location="Top" />
						</dx:GridViewColumnLayoutItem>
						<dx:EditModeCommandLayoutItem HorizontalAlign="Right">
						</dx:EditModeCommandLayoutItem>
					</Items>
					<SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="700" />
					<SettingsItemCaptions Location="Top" />
				</EditFormLayoutProperties>
				<Columns>
					<dx:GridViewCommandColumn 
						ShowDeleteButton="True" 
						ShowEditButton="True" 
						ShowInCustomizationForm="True"
						VisibleIndex="9"
						Name="CommandColum" 
						Caption=" " 
						Width="50px">
						<CellStyle Wrap="True">
						</CellStyle>
					</dx:GridViewCommandColumn>
					<dx:GridViewDataTextColumn 
						FieldName="ID" 
						ShowInCustomizationForm="True" 
						VisibleIndex="0"
						Visible="False"
						ReadOnly="True">
					</dx:GridViewDataTextColumn>
					<dx:GridViewDataTextColumn 
						FieldName="AthleteID" 
						ShowInCustomizationForm="True" 
						VisibleIndex="1" 
						Visible="False">
						<EditFormSettings Visible="False" />
					</dx:GridViewDataTextColumn>
					<dx:GridViewDataTextColumn 
						FieldName="FirmID" 
						ShowInCustomizationForm="True" 
						VisibleIndex="2" 
						Visible="False">
					</dx:GridViewDataTextColumn>
					
					<dx:GridViewDataDateColumn 
						Caption="Дата обследования" 
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
						<EditFormSettings CaptionLocation="Top" VisibleIndex="1" />
					</dx:GridViewDataDateColumn>
					<dx:GridViewDataComboBoxColumn 
						Caption="Группа" 
						FieldName="Group_type" 
						ShowInCustomizationForm="True" VisibleIndex="5">
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
					<dx:GridViewBandColumn 
						Caption="Физическое развитие"
						ShowInCustomizationForm="True" 
						VisibleIndex="7">
						<Columns>

							<dx:GridViewDataSpinEditColumn 
								Caption="Рост см" 
								FieldName="Height" 
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
								Caption="Вес кг"
								FieldName="Weight" 
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
								Caption="Длина стопы см"
								FieldName="Foot_length"
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
								Caption="Сила сгибателей кисти кг"
								FieldName="Force_of_hand_flexor"
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
								Caption="&lt;span title=&quot;жизненная емкость легких&quot;&gt;ЖЕЛ л&lt;/span&gt;" 
								FieldName="Volume_of_lungs" 
								ShowInCustomizationForm="True"
								VisibleIndex="4">
								<PropertiesSpinEdit 
									AllowMouseWheel="false" 
									DisplayFormatString="g" 
									MaxValue="100000000000000" 
									ShowOutOfRangeWarning="False"
									DecimalPlaces="3">
									<SpinButtons ShowIncrementButtons="False" ClientVisible="False">
									</SpinButtons>
								</PropertiesSpinEdit>
								<EditFormSettings CaptionLocation="Top" Visible="True" />
							</dx:GridViewDataSpinEditColumn>

							<dx:GridViewDataSpinEditColumn 
								Caption="&lt;span title=&quot;максимальное потребление кислорода&quot;&gt;МПК&lt;/span&gt; мл/мин " 
								FieldName="Maximum_oxygen_consumption"
								ShowInCustomizationForm="True"
								VisibleIndex="5">
								<PropertiesSpinEdit 
									AllowMouseWheel="false"
									DisplayFormatString="g"
									MaxValue="100000000000000"
									ShowOutOfRangeWarning="False"
									DecimalPlaces="3">
									<SpinButtons ShowIncrementButtons="False" ClientVisible="False">
									</SpinButtons>
								</PropertiesSpinEdit>
								<EditFormSettings CaptionLocation="Top" Visible="True" />
							</dx:GridViewDataSpinEditColumn>

							<dx:GridViewDataSpinEditColumn 
								Caption="&lt;span title=&quot;максимальное потребление кислорода&quot;&gt;МПК&lt;/span&gt; мл/мин/кг " 
								FieldName="Maximum_oxygen_consumption_kg" 
								ShowInCustomizationForm="True" 
								VisibleIndex="6">
								<PropertiesSpinEdit 
									AllowMouseWheel="false"
									DisplayFormatString="g"
									MaxValue="100000000000000"
									ShowOutOfRangeWarning="False"
									DecimalPlaces="3">
									<SpinButtons ShowIncrementButtons="False" ClientVisible="False">
									</SpinButtons>
								</PropertiesSpinEdit>
								<EditFormSettings CaptionLocation="Top" Visible="True" />
							</dx:GridViewDataSpinEditColumn>
						</Columns>
					</dx:GridViewBandColumn>

					<dx:GridViewDataMemoColumn 
						Caption="Медицинское заключение" 
						FieldName="Medical_description" 
						ShowInCustomizationForm="True" 
						VisibleIndex="8">
						<PropertiesMemoEdit Rows="4" MaxLength="2048">
						</PropertiesMemoEdit>
						<EditFormSettings CaptionLocation="Top" ColumnSpan="2" />
					</dx:GridViewDataMemoColumn>

					<dx:GridViewDataTextColumn 
						Caption="Организация" 
						FieldName="FirmName" 
						ShowInCustomizationForm="True"
						VisibleIndex="3">
						<EditFormSettings Visible="False" />
						<CellStyle HorizontalAlign="Left"></CellStyle>
					</dx:GridViewDataTextColumn>
				</Columns>
				<Toolbars>
					<dx:GridViewToolbar Name="Main" >
						<Items>
                            <dx:GridViewToolbarItem Name="tbbtPeriodFilter">
                                <Template>
                                    <dx:ASPxComboBox
                                        ID="cbPeriods"
                                        ClientInstanceName="cbPeriods"
                                        Caption="Отображать за периоды"
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
                                        <ClientSideEvents SelectedIndexChanged="medicalCard.ChangePeriod" />
                                    </dx:ASPxComboBox>
                                </Template>
                            </dx:GridViewToolbarItem>
                            <dx:GridViewToolbarItem Command="New" Name="btAdd" Text="Добавить" ></dx:GridViewToolbarItem>
						</Items>
					</dx:GridViewToolbar>
				</Toolbars>
				<Templates>
					<FooterRow>
						<div>Срок учета (актуальности данных) до конца учебного года, установленного в вашей организации – <dx:ASPxLabel ID="lblLastDateMsg" runat="server" Font-Bold="true" Text="<%# AthleteCardDto?.AthleteInfo?.MedicalInfoLastDate.ToShortDateString() ?? DateTime.Now.ToShortDateString() %>" ></dx:ASPxLabel>  </div>
					</FooterRow>
				</Templates>
				
				<Styles>
					<Header Wrap="True" HorizontalAlign="Center">
					</Header>
					<AdaptiveHeaderPanel CssClass="adaptive-no-header">
					</AdaptiveHeaderPanel>
					<Cell HorizontalAlign="Center"></Cell>
				</Styles>
				
			</dx:ASPxGridView>

			<asp:SqlDataSource 
					ID="dsAthletes_medical_card"
					runat="server" 
					ConnectionString="<%$ ConnectionStrings:MFKSConnectionString %>" 
					SelectCommand="GetAthleteMedicalInfoList" SelectCommandType="StoredProcedure" OnSelecting="dsAthletes_medical_card_Selecting"
					InsertCommand="[dbo].[Athletes_medical_card_Insert]" InsertCommandType="StoredProcedure" OnInserting="dsAthletes_medical_card_Inserting"
					DeleteCommand="[dbo].[Athletes_medical_card_Delete]" DeleteCommandType="StoredProcedure" 
					UpdateCommand="[dbo].[Athletes_medical_card_Update]" UpdateCommandType="StoredProcedure" >
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
						<asp:Parameter Name="Height"  />
						<asp:Parameter Name="Weight"  />
						<asp:Parameter Name="Foot_length"  />
						<asp:Parameter Name="Force_of_hand_flexor"  />
						<asp:Parameter Name="Volume_of_lungs"  />
						<asp:Parameter Name="Maximum_oxygen_consumption"  />
						<asp:Parameter Name="Maximum_oxygen_consumption_kg"  />
						<asp:Parameter Name="Medical_description" Type="String" />
					</InsertParameters>
					<SelectParameters>
						<asp:Parameter Name="AthleteID" DefaultValue="0" />
						<asp:Parameter Name="OnlyCurrentPeriod"  />
						<asp:Parameter Name="Lang" />
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
						<asp:Parameter Name="Height"  />
						<asp:Parameter Name="Weight"  />
						<asp:Parameter Name="Foot_length"  />
						<asp:Parameter Name="Force_of_hand_flexor"  />
						<asp:Parameter Name="Volume_of_lungs"  />
						<asp:Parameter Name="Maximum_oxygen_consumption"  />
						<asp:Parameter Name="Maximum_oxygen_consumption_kg"  />
						<asp:Parameter Name="Medical_description" Type="String" />
					</UpdateParameters>
				</asp:SqlDataSource>

			<div class="bottom-block">
				<strong>ЖЕЛ</strong> — жизненная емкость легких; <strong>МПК</strong> — максимальное потребление кислорода		
			</div>

		