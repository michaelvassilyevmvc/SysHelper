<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AthleteParentsInfo.ascx.cs" Inherits="MFKSHelper.SpeedRun.Element.AthleteParentsInfo" %>
<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:PlaceHolder runat="server">
    <%: Scripts.Render("~/bundles/parentInfo") %>
</asp:PlaceHolder>

 <dx:ASPxCardView
    ID="cvParents_info"
    ClientInstanceName="cvParents_info"
    runat="server"
    AutoGenerateColumns="False"
    DataSourceID="dsAthletes_parents_info"
    KeyFieldName="ID"
    Width="100%"
    
    OnCardUpdating="cvParents_info_CardUpdating"
    OnCardInserting="cvParents_info_CardInserting"

    OnCardInserted="cvParents_info_CardInserted"
    OnCardUpdated="cvParents_info_CardUpdated"
    OnCardDeleted="cvParents_info_CardDeleted"
    >
    <SettingsLoadingPanel Text="%%Загрузка%%&amp;hellip;" />
    <SettingsPager Mode="ShowAllRecords">
        <SettingsTableLayout ColumnCount="1" />
    </SettingsPager>
    <SettingsPopup>
        <HeaderFilter MinHeight="140px"></HeaderFilter>
    </SettingsPopup>
    <SettingsExport ExportSelectedCardsOnly="True"></SettingsExport>
    <Columns>
        <dx:CardViewTextColumn
            FieldName="ID"
            ReadOnly="True"
            ShowInCustomizationForm="True"
            Visible="False"
            VisibleIndex="5">
        </dx:CardViewTextColumn>
        <dx:CardViewTextColumn
            FieldName="AthleteID"
            ShowInCustomizationForm="True"
            Visible="False"
            VisibleIndex="0">
        </dx:CardViewTextColumn>
        <dx:CardViewTextColumn
            Caption="%%ФИО%%"
            FieldName="Parent_full_name"
            ShowInCustomizationForm="True"
            VisibleIndex="1">
            <PropertiesTextEdit
                MaxLength="256"
                NullDisplayText="(%%Не указано%%)"
                NullText="(%%Не указано%%)">
                <ValidationSettings
                    Display="Dynamic"
                    ErrorDisplayMode="ImageWithText"
                    ErrorTextPosition="Bottom">
                    <RequiredField
                        ErrorText="%%Заполните обязательное поле%%"
                        IsRequired="True" />
                </ValidationSettings>
            </PropertiesTextEdit>
        </dx:CardViewTextColumn>
        <dx:CardViewTextColumn
            Caption="%%Место работы%%"
            FieldName="Place_of_job"
            ShowInCustomizationForm="True"
            VisibleIndex="2">
            <PropertiesTextEdit
                MaxLength="256"
                NullDisplayText="(%%Не указано%%)"
                NullText="(%%Не указано%%)">
            </PropertiesTextEdit>
        </dx:CardViewTextColumn>
        <dx:CardViewTextColumn
            Caption="%%Контактный телефон%%"
            FieldName="Contact_phone_number"
            ShowInCustomizationForm="True"
            VisibleIndex="3">
            <PropertiesTextEdit
                MaxLength="50"
                NullDisplayText="(%%Не указано%%)"
                NullText="(%%Не указано%%)">
            </PropertiesTextEdit>
            <EditItemTemplate>
                <table>
                    <tr>
                        <td style="padding-right: 5px;">
                            <dx:ASPxComboBox
                                ID="cbPhoneIndex"
                                ClientInstanceName="cbPhoneIndex"
                                runat="server"
                                Width="70px"
                                OnLoad="cbPhoneIndex_Load">
                                <Items>
                                    <dx:ListEditItem Text="+7" Value="+7"></dx:ListEditItem>
                                    <dx:ListEditItem Text="8" Value="8"></dx:ListEditItem>
                                    <dx:ListEditItem Text="+9" Value="+9"></dx:ListEditItem>
                                    <dx:ListEditItem Text="+1" Value="+1"></dx:ListEditItem>
                                </Items>
                            </dx:ASPxComboBox>
                        </td>
                        <td style="padding-right: 5px;">
                            <dx:ASPxTextBox
                                ID="tbMainNumbPhone"
                                ClientInstanceName="tbMainNumbPhone"
                                runat="server"
                                OnLoad="tbMainNumbPhone_Load"
                                MaxLength="3"
                                NullText="000">
                                <ClientSideEvents KeyPress="athleteParentInfo.AllowOnlyNumbers" />
                            </dx:ASPxTextBox>
                        </td>
                        <td>
                            <dx:ASPxTextBox
                                ID="tbNumbPhone"
                                ClientInstanceName="tbNumbPhone"
                                runat="server"
                                OnLoad="tbNumbPhone_Load"
                                MaxLength="7"
                                NullText="000-00-00">
                                <ClientSideEvents KeyPress="athleteParentInfo.AllowOnlyNumbers" />
                            </dx:ASPxTextBox>
                        </td>
                    </tr>
                </table>
            </EditItemTemplate>
        </dx:CardViewTextColumn>
        <dx:CardViewTextColumn
            Caption="%%Домашний телефон%%"
            FieldName="Home_phone_number"
            ShowInCustomizationForm="True"
            VisibleIndex="4">
            <PropertiesTextEdit
                MaxLength="50"
                NullDisplayText="(%%Не указано%%)"
                NullText="(%%Не указано%%)">
            </PropertiesTextEdit>
        </dx:CardViewTextColumn>
    </Columns>
    <CardLayoutProperties ColCount="2">
        <Items>
            <dx:CardViewCommandLayoutItem
                HorizontalAlign="Right"
                ShowDeleteButton="True"
                ShowEditButton="True"
                ShowNewButton="True"
                ColSpan="2"
                RowSpan="2"
                Width="100%">
            </dx:CardViewCommandLayoutItem>
            <dx:CardViewColumnLayoutItem ColumnName="Parent_full_name">
            </dx:CardViewColumnLayoutItem>
            <dx:CardViewColumnLayoutItem ColumnName="Contact_phone_number">
            </dx:CardViewColumnLayoutItem>
            <dx:CardViewColumnLayoutItem ColumnName="Place_of_job">
            </dx:CardViewColumnLayoutItem>
            <dx:CardViewColumnLayoutItem ColumnName="Home_phone_number">
            </dx:CardViewColumnLayoutItem>
            <dx:EditModeCommandLayoutItem HorizontalAlign="Right" Width="100%">
            </dx:EditModeCommandLayoutItem>
        </Items>
        <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="700" />
        <Styles>
            <LayoutItem>
                <NestedControlCell>
                    <Paddings PaddingBottom="0px" PaddingTop="0px" />
                </NestedControlCell>
                <CaptionCell>
                    <Paddings PaddingBottom="0px" PaddingTop="0px" />
                </CaptionCell>
            </LayoutItem>
        </Styles>
    </CardLayoutProperties>
    <Styles>
        <Card Width="100%" CssClass="parents-card" Height="10px">
        </Card>
    </Styles>
    <StylesExport>
        <Card BorderSides="All" BorderSize="1">
        </Card>
        <Group BorderSides="All" BorderSize="1">
        </Group>
        <TabbedGroup BorderSides="All" BorderSize="1">
        </TabbedGroup>
        <Tab BorderSize="1">
        </Tab>
    </StylesExport>
    <ClientSideEvents EndCallback='function(s,e){ if (e.command === "UPDATEEDIT" || e.command === "DELETEROW") { Master.cp_EndCallback(s,e); cbPanel.PerformCallback("refresh"); } }' />
</dx:ASPxCardView>

<asp:SqlDataSource ID="dsAthletes_parents_info" runat="server" 
													ConnectionString="<%$ ConnectionStrings:MFKSConnectionString %>" 
													SelectCommand="GetAthleteParentInfo" SelectCommandType="StoredProcedure" 
                                                    OnSelecting="dsAthletes_parents_info_Selecting"
													DeleteCommand="[dbo].[Athletes_parents_Delete]" DeleteCommandType="StoredProcedure" OnDeleting="dsAthletes_parents_info_Deleting"
													InsertCommand="[dbo].[Athletes_parents_Insert]" InsertCommandType="StoredProcedure" OnInserting="dsAthletes_parents_info_Inserting"
													UpdateCommand="[dbo].[Athletes_parents_Update]" UpdateCommandType="StoredProcedure" OnUpdating="dsAthletes_parents_info_Updating">
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
														<asp:Parameter Name="Parent_full_name" />
														<asp:Parameter Name="Place_of_job" />
														<asp:Parameter Name="Contact_phone_number" />
														<asp:Parameter Name="Home_phone_number" />
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
														<asp:Parameter Name="Parent_full_name" />
														<asp:Parameter Name="Place_of_job" />
														<asp:Parameter Name="Contact_phone_number" />
														<asp:Parameter Name="Home_phone_number" />
													</InsertParameters>
													<SelectParameters>
														<asp:Parameter Name="AthleteID" Type="Int64" DefaultValue="0" />
													</SelectParameters>
												</asp:SqlDataSource>