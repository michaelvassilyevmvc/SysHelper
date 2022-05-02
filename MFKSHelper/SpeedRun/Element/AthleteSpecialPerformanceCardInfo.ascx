<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AthleteSpecialPerformanceCardInfo.ascx.cs" Inherits="MFKSHelper.SpeedRun.Element.AthleteSpecialPerformanceCardInfo" %>
<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:PlaceHolder runat="server">
    <%: Scripts.Render("~/bundles/specialPerformanceCardInfo") %>
</asp:PlaceHolder>

<dx:ASPxGridView 
				ID="gvAthletes_special_performance_card" 
				ClientInstanceName="gvAthletes_special_performance_card"
				runat="server" 
				AutoGenerateColumns="False" 
				DataSourceID="dsAthletes_special_performance_card" 
				KeyFieldName="ID"
				Width="100%"
				>
				<SettingsAdaptivity AdaptivityMode="HideDataCellsWindowLimit" HideDataCellsAtWindowInnerWidth="960">
					<AdaptiveDetailLayoutProperties>
						<SettingsItemCaptions Location="Top" />
					</AdaptiveDetailLayoutProperties>
				</SettingsAdaptivity>
				<SettingsPager Mode="ShowAllRecords">
				</SettingsPager>
				<SettingsDataSecurity 
					AllowEdit="True" 
					AllowInsert="true" 
					AllowDelete="true" />
				<Columns>
					<dx:GridViewDataTextColumn 
						FieldName="ID" 
						ReadOnly="True" 
						ShowInCustomizationForm="True" 
						VisibleIndex="0" 
						Visible="False">
					</dx:GridViewDataTextColumn>

					<dx:GridViewDataTextColumn 
						FieldName="Learning_groups_Name"
						Caption="%%Учебная группа%%" 
						ShowInCustomizationForm="True"
						VisibleIndex="0" 
						GroupIndex="1">
					</dx:GridViewDataTextColumn>

					<dx:GridViewDataDateColumn 
						FieldName="Performance_date" 
						Caption="%%Дата сдачи норматива%%"
						SortOrder="Descending"
						ShowInCustomizationForm="True" 
						VisibleIndex="0"
						GroupIndex="2">
						<PropertiesDateEdit AllowMouseWheel="false" />
					</dx:GridViewDataDateColumn>

					<dx:GridViewDataTextColumn 
						Caption="%%Название норматива%%" 
						ShowInCustomizationForm="True" 
						VisibleIndex="1">
						<DataItemTemplate>
							<dx:ASPxLabel
								runat="server"
								Text='<%# Eval("Performance_Name") %>' />
						</DataItemTemplate>
					</dx:GridViewDataTextColumn>

					<dx:GridViewDataTextColumn 
						FieldName="Result" 
						Caption="%%Результат%%"
						ShowInCustomizationForm="True"
						VisibleIndex="2">
						<CellStyle HorizontalAlign="Center">
						</CellStyle>
					</dx:GridViewDataTextColumn>

					<dx:GridViewDataTextColumn 
						FieldName="Rate"
						Caption="%%Оценка%%"
						ShowInCustomizationForm="True"
						VisibleIndex="3">
						<CellStyle HorizontalAlign="Center">
						</CellStyle>
					</dx:GridViewDataTextColumn>

					 <dx:GridViewDataComboBoxColumn 
						 FieldName="KindsOfSportsID" 
						 Caption="%%Вид спорта%%" 
						 VisibleIndex="8" 
						 GroupIndex="0">
                            <PropertiesComboBox 
								DataSourceID="dsAllKindOfSportData" 
								TextField="Name" 
								ValueField="ID">
                            </PropertiesComboBox>
							<EditFormSettings CaptionLocation="Top" Visible="False"  />
                        </dx:GridViewDataComboBoxColumn>
				</Columns>
				<Styles>
					<Header Wrap="True" HorizontalAlign="Center">
					</Header>
					<AdaptiveHeaderPanel CssClass="adaptive-no-header">
					</AdaptiveHeaderPanel>
				</Styles>
				<Toolbars>
					<dx:GridViewToolbar>
						<Items>
							<dx:GridViewToolbarItem Command="FullExpand" Text="%%Раскрыть все%%" />
							<dx:GridViewToolbarItem Command="FullCollapse" Text="%%Свернуть все%%" />
							<dx:GridViewToolbarItem Command="Refresh" Text="%%Обновить%%" />							
						</Items>
					</dx:GridViewToolbar>
				</Toolbars>
				<Templates>
					<FooterRow>
						<div>Срок учета (актуальности данных) 12 месяцев с момента ввода - <dx:ASPxLabel ID="lblLastDateMsg" runat="server" Font-Bold="true" Text="<%# GetLastDate() %>" ></dx:ASPxLabel> </div>
					</FooterRow>
				</Templates>
				<Settings ShowFooter="true" />
			</dx:ASPxGridView>

<asp:SqlDataSource 
				ID="dsAthletes_special_performance_card" 
				runat="server" 
				ConnectionString="<%$ ConnectionStrings:MFKSConnectionString %>" 
				SelectCommand="GetAthletesSpecialPerformanceCard" SelectCommandType="StoredProcedure" OnSelecting="dsAthletes_special_performance_card_Selecting">
				<SelectParameters>
					<asp:Parameter Name="AthleteID" />
					<asp:Parameter Name="KindOfSportId" DefaultValue="0" />
					<asp:Parameter Name="Lang" DefaultValue="Rus" />
				</SelectParameters>
			</asp:SqlDataSource>

<asp:SqlDataSource ID="dsAllKindOfSportData" runat="server" ConnectionString='<%$ ConnectionStrings:MFKSConnectionString %>' 
    SelectCommand="GetAllKindOfSport" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:Parameter DefaultValue="Rus" Name="Lang" Type="String"></asp:Parameter>
    </SelectParameters>
</asp:SqlDataSource>
