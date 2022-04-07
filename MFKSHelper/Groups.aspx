<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Groups.aspx.cs" Inherits="MFKSHelper.Groups" %>
<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
    <script src="Scripts/LearningGroupsComposition.js"></script>

<dx:ASPxCallbackPanel
    ID="cbLearningGroupCompositionPanel"
    ClientInstanceName="cbLearningGroupCompositionPanel"
    runat="server"
    OnCallback="cbLearningGroupCompositionPanel_Callback">
    <ClientSideEvents EndCallback="LearningGroupsComposition.cbLearningGroupCompositionPanel_EndCallback" />
    <PanelCollection>
        <dx:PanelContent runat="server">


<dx:ASPxHiddenField ID="hfAthletesProps" ClientInstanceName="hfAthletesProps" runat="server" />

	<div style="margin:20px;">
    <dx:ASPxGridView 
					ID="gvGroups" 
					ClientInstanceName="gvGroups" 
					runat="server" 
					AutoGenerateColumns="False"
					DataSourceID="dsGroups"
					KeyFieldName="ID" 
					Width="100%" 
					>
					<%--OnStartRowEditing="gvGroups_StartRowEditing" 
					OnInitNewRow="gvGroups_InitNewRow"
					OnRowDeleted="gvGroups_RowDeleted"--%>
					<SettingsPager Mode="ShowAllRecords"></SettingsPager>
					<Settings ShowFilterRow="true" ShowFooter="true" />
					<SettingsEditing EditFormColumnCount="1"></SettingsEditing>
					<SettingsDataSecurity AllowEdit="False" />
					<Columns>
						<dx:GridViewCommandColumn Caption=" " Name="CommandColum" ShowClearFilterButton="true" ShowEditButton="True" ShowDeleteButton="True"
							ShowInCustomizationForm="True" VisibleIndex="10" MaxWidth="108" Width="108" CellStyle-Paddings-Padding="0">
						</dx:GridViewCommandColumn>
						<dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" ShowInCustomizationForm="True"  Visible="False">
							<EditFormSettings Visible="False" />
						</dx:GridViewDataTextColumn>
						<dx:GridViewDataTextColumn FieldName="rank" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0" Visible="True" Caption=" " Width="50px">
							<EditFormSettings Visible="False" />
						</dx:GridViewDataTextColumn>
						<dx:GridViewDataTextColumn FieldName="AthleteID" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0" Visible="False">
							<EditFormSettings Visible="False" />
						</dx:GridViewDataTextColumn>
						<dx:GridViewDataTextColumn FieldName="IIN" ShowInCustomizationForm="True" VisibleIndex="4" Caption="ИИН"  CellStyle-HorizontalAlign="Center">
							<EditFormSettings Visible="False" />
							<Settings AutoFilterCondition="Contains" />
						</dx:GridViewDataTextColumn>
						<dx:GridViewDataTextColumn FieldName="FIO" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="3" Caption="ФИО">
							<EditFormSettings Visible="False" />
							<Settings AutoFilterCondition="Contains" />
						</dx:GridViewDataTextColumn>
						<dx:GridViewDataDateColumn Caption="Дата рождения" FieldName="Birth_date" ShowInCustomizationForm="True" VisibleIndex="5"  CellStyle-HorizontalAlign="Center">
							<PropertiesDateEdit AllowMouseWheel="false" UseMaskBehavior="True">
								<CalendarProperties ShowWeekNumbers="false" ShowClearButton="True" TodayButtonText="Сегодня" ClearButtonText="Очистить">
									<FastNavProperties OkButtonText="OK" CancelButtonText="Отмена" />
								</CalendarProperties>
							</PropertiesDateEdit>
							<EditFormSettings Visible="False" />
						</dx:GridViewDataDateColumn>
						<dx:GridViewDataDateColumn Caption="Дата зачисления" FieldName="DateFrom" ShowInCustomizationForm="True" VisibleIndex="6" CellStyle-HorizontalAlign="Center">
							<PropertiesDateEdit AllowMouseWheel="false" UseMaskBehavior="True" Width="170" ClientInstanceName="gvGroups_DateFrom">
								<CalendarProperties ShowWeekNumbers="false" ShowClearButton="True" TodayButtonText="Сегодня" ClearButtonText="Очистить">
									<FastNavProperties OkButtonText="OK" CancelButtonText="Отмена" />
								</CalendarProperties>
								<ValidationSettings ErrorText="Неверное значение">
									<RequiredField ErrorText="Заполните обязательное поле" IsRequired="True" />
								</ValidationSettings>
								<ClientSideEvents ValueChanged="Learning_groups_composition.gvGroups_DateFrom_ValueChanged" />
							</PropertiesDateEdit>
						</dx:GridViewDataDateColumn>
						<dx:GridViewDataDateColumn Caption="Дата окончания" FieldName="DateTo" ShowInCustomizationForm="True" VisibleIndex="7" CellStyle-HorizontalAlign="Center">
							<PropertiesDateEdit AllowMouseWheel="false" UseMaskBehavior="True" Width="170" NullDisplayText="Не указано" NullText="Не указано" ClientInstanceName="gvGroups_DateTo">
								<CalendarProperties ShowWeekNumbers="false" ShowClearButton="True" TodayButtonText="Сегодня" ClearButtonText="Очистить">
									<FastNavProperties OkButtonText="OK" CancelButtonText="Отмена" />
								</CalendarProperties>
								<ValidationSettings ErrorText="Неверное значение">
								</ValidationSettings>
								<ClientSideEvents ValueChanged="Learning_groups_composition.gvGroups_DateTo_ValueChanged" />
							</PropertiesDateEdit>
						</dx:GridViewDataDateColumn>
						<dx:GridViewDataMemoColumn Caption="Примечание" FieldName="Description" ShowInCustomizationForm="True" VisibleIndex="8">
							<EditFormSettings Visible="True" />
							<PropertiesMemoEdit Rows="5" />
							<Settings AutoFilterCondition="Contains" />
						</dx:GridViewDataMemoColumn>
						<dx:GridViewDataTextColumn Caption="Группы" FieldName="Learning_groups_ID" ShowInCustomizationForm="True" Visible="True" VisibleIndex="9" CellStyle-HorizontalAlign="Center">
							<DataItemTemplate>
								<dx:ASPxHyperLink ID="hlTransfer" Text="Перевести" runat="server" OnInit="hlTransfer_Init" >
									<ClientSideEvents Click="LearningGroupsComposition.hlSelectGroup_gvGroups_Click" />
								</dx:ASPxHyperLink>
							</DataItemTemplate>
							<EditFormSettings Visible="False" />
						</dx:GridViewDataTextColumn>

						<dx:GridViewDataComboBoxColumn FieldName="AthleteID" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2" Name="cbSelectAthlete">
							<PropertiesComboBox ClientInstanceName="cbSelectAthlete_gvGroups">
								<ClientSideEvents 
									ButtonClick="LearningGroupsComposition.cbSelectAthlete_gvGroups_ButtonClick" />
								<DropDownButton Visible="False">
								</DropDownButton>
								<Buttons>
									<dx:EditButton Text="...">
									</dx:EditButton>
								</Buttons>
								<ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom">
									<RequiredField ErrorText="Выберите спортсмена" IsRequired="True" />
								</ValidationSettings>
							</PropertiesComboBox>
							<EditFormSettings CaptionLocation="Top" Visible="True" Caption="Спортсмен" />
						</dx:GridViewDataComboBoxColumn>
					</Columns>
					<Templates>
						<EditForm>
							<div style="padding: 4px 3px 4px">
								<dx:ASPxGridViewTemplateReplacement ID="Editors" ReplacementType="EditFormEditors" runat="server">
								</dx:ASPxGridViewTemplateReplacement>
							</div>
							<div style="text-align: right; padding: 2px">
								<dx:ASPxGridViewTemplateReplacement ID="UpdateButton" ReplacementType="EditFormUpdateButton"
									runat="server">
								</dx:ASPxGridViewTemplateReplacement>
								<dx:ASPxGridViewTemplateReplacement ID="CancelButton" ReplacementType="EditFormCancelButton"
									runat="server">
								</dx:ASPxGridViewTemplateReplacement>
							</div>
						</EditForm>
					</Templates>
					<Toolbars>
						<dx:GridViewToolbar>
							<Items>
								<dx:GridViewToolbarItem Text="Отображать состав">
									<Template>
										<dx:ASPxComboBox ID="cbShowAllAthletes" Caption="Отображать состав" runat="server" SelectedIndex="0">
											<Items>
												<dx:ListEditItem Value="0" Text="Текущий" Selected="true" />
												<dx:ListEditItem Value="1" Text="Весь" />
											</Items>
											<ClientSideEvents SelectedIndexChanged="LearningGroupsComposition.cbShowAllAthletes_SelectedIndexChanged" />
										</dx:ASPxComboBox>
									</Template>
								</dx:GridViewToolbarItem>
								<dx:GridViewToolbarItem Name="tbbtNew" Command="Custom" Image-IconID="actions_add_16x16gray" Text="Добавить"></dx:GridViewToolbarItem>
								<dx:GridViewToolbarItem Command="Refresh" Text="Обновить"></dx:GridViewToolbarItem>
							</Items>
						</dx:GridViewToolbar>
					</Toolbars>
					<Styles>
						<Header Wrap="True" HorizontalAlign="Center"></Header>
						<Cell HorizontalAlign="Center"></Cell>
					</Styles>

					<ClientSideEvents ToolbarItemClick="LearningGroupsComposition.gvGroups_ToolbarItemClick" />
				</dx:ASPxGridView>

	</div>

	<div id="customModalGroupSelect" class="modal trainer-modal">
				<label class="custom-label">%%%%Перевести в группу%%%%</label>
				<section class="grid-center mb-10">
                    <dx:ASPxGridView
                        ID="gvGroupSelect"
                        ClientInstanceName="gvGroupSelect"
                        runat="server"
                        AutoGenerateColumns="False"
                        DataSourceID="dsGroupSelect"
                        KeyFieldName="ID"
                        Width="100%"						
						EnableCallBacks="true"
                        >
                        <%--<ClientSideEvents SelectionChanged="LearningGroupsComposition.gvGroupSelect_SelectionChanged" />--%>
                        <Settings ShowFilterRow="True" />
						<SettingsPager Mode="ShowAllRecords"></SettingsPager>
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
                                ShowClearFilterButton="true"
                                VisibleIndex="0"
                                Width="50px"
                                Caption=" "
                                Name="gvCommandColumn">
                            </dx:GridViewCommandColumn>
                            <dx:GridViewDataTextColumn
                                FieldName="ID"
                                ShowInCustomizationForm="True"
                                VisibleIndex="1"
                                ReadOnly="True"
                                Visible="False">
                                <EditFormSettings Visible="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Name" ShowInCustomizationForm="True" VisibleIndex="2" Caption="%%Название%%">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataComboBoxColumn FieldName="Type" ShowInCustomizationForm="True" VisibleIndex="4" Caption="%%Тип группы%%">
                                <PropertiesComboBox ValueType="System.Byte" Width="100%">
                                    <Items>
                                        <dx:ListEditItem Selected="True" Text="%%Начальная подготовка%%" Value="0" />
                                        <dx:ListEditItem Text="%%Спортивно-оздоровительная%%" Value="1" />
                                        <dx:ListEditItem Text="%%Учебно-тренировочная%%" Value="2" />
                                        <dx:ListEditItem Text="%%Спортивного совершенствования%%" Value="3" />
                                        <dx:ListEditItem Text="%%Высшего спортивного мастерства%%" Value="4" />
                                    </Items>
                                </PropertiesComboBox>
                                <Settings AllowAutoFilter="True" />
                            </dx:GridViewDataComboBoxColumn>
                            <dx:GridViewDataComboBoxColumn FieldName="Period" ShowInCustomizationForm="True" VisibleIndex="3" ReadOnly="True" Caption="%%Период обучения%%">
                                <PropertiesComboBox Width="100%">
                                    <Items>
                                        <dx:ListEditItem Selected="True" Text="%%Весь период%%" Value="0" />
                                        <dx:ListEditItem Text="%%Первый год обучения%%" Value="1" />
                                        <dx:ListEditItem Text="%%Второй год обучения%%" Value="2" />
                                        <dx:ListEditItem Text="%%Третий год обучения%%" Value="3" />
                                        <dx:ListEditItem Text="%%Свыше одного года обучения%%" Value="-1" />
                                        <dx:ListEditItem Text="%%Свыше двух лет обучения%%" Value="-2" />
                                        <dx:ListEditItem Text="%%Свыше трёх лет обучения%%" Value="-3" />
                                    </Items>
                                </PropertiesComboBox>
                                <Settings AllowAutoFilter="True" />
                            </dx:GridViewDataComboBoxColumn>
                            <dx:GridViewDataTextColumn Caption="%%ФИО тренера%%" FieldName="TrainerFIO" ShowInCustomizationForm="True" VisibleIndex="4">
                            </dx:GridViewDataTextColumn>
                        </Columns>
                        <Toolbars>
                            <dx:GridViewToolbar>
                                <Items>
                                    <dx:GridViewToolbarItem Command="Refresh" Text="%%Обновить%%"></dx:GridViewToolbarItem>
                                </Items>
                            </dx:GridViewToolbar>
                        </Toolbars>
                        <Styles>
                            <AdaptiveHeaderPanel BackColor="#FF6666" ForeColor="#009933" CssClass="adaptive-no-header">
                            </AdaptiveHeaderPanel>
                        </Styles>
                    </dx:ASPxGridView>

				</section>
				<section class="btns_trainer_modal">
					<dx:ASPxButton 
						ID="btGroupSelect" 
						ClientInstanceName="btGroupSelect" 
						runat="server" 
						ClientEnabled="False" 
						Text="%%Выбрать%%" 
						AutoPostBack="False">
						<DisabledStyle CssClass="btn-default"></DisabledStyle>
					<ClientSideEvents Click="LearningGroupsComposition.btGroupSelect_Click" />
				</dx:ASPxButton>
					<a href="#close" rel="modal:close" class="btn btn-default">%%Отмена%%</a>
				</section>
			</div>

			<%--Data Sources--%>
			
			<asp:SqlDataSource 
					ID="dsGroups" 
					runat="server" 
					ConnectionString="<%$ ConnectionStrings:MFKSConnectionString %>" 
					SelectCommand="SELECT row_number() OVER(ORDER BY dbo.GetFIO(A.Last_name, A.First_name, A.Pat_name) ASC) as rank, 
					LGC.[ID]
	,	LGC.[Learning_groups_ID]
	,	LGC.[AthleteID]
	,	A.IIN
	,	dbo.GetFIO(A.Last_name, A.First_name, A.Pat_name) as FIO
	,	A.Birth_date
	,	A.FirmID
	,	LGC.[DateFrom]
	,	LGC.[DateTo]
	,	LGC.[Description]
	FROM [dbo].[Learning_groups_composition] LGC
	LEFT JOIN  [dbo].[Athletes] A ON (A.ID = LGC.AthleteID)
	WHERE 
	LGC.[Learning_groups_ID] = @ID AND (@ShowArchiveAthletes = 1 OR LGC.[DateTo] IS NULL OR LGC.[DateTo] &gt; GETDATE())"  OnSelecting="dsLearning_groups_composition_Selecting">
					<SelectParameters>
						<asp:Parameter Name="ID" />
						<asp:Parameter Name="ShowArchiveAthletes" />
					</SelectParameters>
				</asp:SqlDataSource>

			<asp:SqlDataSource
                ID="dsGroupSelect"
                runat="server"
                ConnectionString="<%$ ConnectionStrings:MFKSConnectionString %>"
                SelectCommand="SELECT 
lg.[ID], 
lg.[Type], 
lg.[Period], 
dbo.GetFIO(t.[Last_name],t.[First_name],t.[Pat_name]) as [TrainerFIO],
lg.[Name]
FROM [dbo].[Learning_groups] lg
LEFT JOIN [dbo].[Trainers] t ON lg.TrainerID = t.ID
WHERE lg.KindsOfSportsID = @KindsOfSportsID 
	AND lg.[Year] = (SELECT [Year] FROM [dbo].[Learning_groups] WHERE [ID] = @GroupID) 
	AND lg.[FirmID] = @FirmID AND lg.[ID] &lt;&gt; @GroupID"
                OnSelecting="dsGroupSelect_Selecting" ViewStateMode="Enabled"
				>
                <SelectParameters>
                    <asp:Parameter Name="FirmID" />
                    <asp:Parameter Name="KindsOfSportsID" />
                    <asp:Parameter Name="GroupID" />
                </SelectParameters>
            </asp:SqlDataSource>

			 </dx:PanelContent>
        </PanelCollection>
</dx:ASPxCallbackPanel>

</asp:Content>
