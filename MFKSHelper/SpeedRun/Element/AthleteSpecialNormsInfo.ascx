<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AthleteSpecialNormsInfo.ascx.cs" Inherits="MFKSHelper.SpeedRun.Element.AthleteSpecialNormsInfo" %>
<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:PlaceHolder runat="server">
    <%: Scripts.Render("~/bundles/specialNormsInfo") %>
</asp:PlaceHolder>

<div class="dvAthletes_special_performance_card">

<dx:ASPxGridView 
    ID="gvAthletesKindsOfSport" 
    ClientInstanceName="gvAthletesKindsOfSport"
    runat="server"
    AutoGenerateColumns="False"
    DataSourceID="dsAthletesKindsOfSport"
    KeyFieldName="RowID"
    Width="100%"
    OnCustomErrorText="DataSource_CustomErrorText"
    OnRowInserted="gvAthletesKindsOfSport_RowInserted"
    OnRowUpdated="gvAthletesKindsOfSport_RowUpdated"
    OnRowDeleted="gvAthletesKindsOfSport_RowDeleted"

    OnRowUpdating="gvAthletesKindsOfSport_RowUpdating"
    OnRowDeleting="gvAthletesKindsOfSport_RowDeleting"
>
<ClientSideEvents 
    ToolbarItemClick="AthleteSpecialOlimpicNorm.gvAthletesKindsOfSport_ToolbarItemClick"
    EndCallback='function(s,e){ if (e.command === "UPDATEEDIT" || e.command === "DELETEROW") { Master.cp_EndCallback(s,e); cbPanel.PerformCallback("refresh"); } }' />

<Styles 
    Cell-HorizontalAlign="Center" 
    Cell-VerticalAlign="Middle">
    <DetailRow BackColor="#cccccc"></DetailRow>
</Styles>
<Settings ShowFooter="true" />
<SettingsDetail ShowDetailRow="true" ShowDetailButtons="true" />
<SettingsEditing EditFormColumnCount="2"></SettingsEditing>
<Settings ShowFilterRow="true" AutoFilterCondition="Contains" />
<Columns>
    <dx:GridViewCommandColumn 
        Name="CommandColum" 
        ShowNewButtonInHeader="False"
        ShowDeleteButton="true"
        ShowUpdateButton="true"
        ShowEditButton="true" 
        VisibleIndex="0" 
        Width="150px" 
        ShowClearFilterButton="true">
    </dx:GridViewCommandColumn>

    <dx:GridViewDataTextColumn FieldName="RowID" Visible="false">
        <EditFormSettings Visible="False" />
    </dx:GridViewDataTextColumn>

    <dx:GridViewDataComboBoxColumn 
        FieldName="SpecialKindOfSportID" 
        ShowInCustomizationForm="True"
        VisibleIndex="1" 
        Caption="Вид спорта">
        <PropertiesComboBox 
            DataSourceID="dsSpecialKindsOfSport" 
            TextField="Name" 
            ValueField="ID">
            <ValidationSettings 
                RequiredField-IsRequired="true" 
                ErrorImage-ToolTip=""
                ErrorText="Обязательное поле"></ValidationSettings>
        </PropertiesComboBox>
    </dx:GridViewDataComboBoxColumn>

    <dx:GridViewDataDateColumn 
        FieldName="Date" 
        VisibleIndex="4" 
        Caption="Дата">
        <PropertiesDateEdit DisplayFormatString="dd.MM.yyyy">
            <ValidationSettings 
                RequiredField-IsRequired="true" 
                ErrorText="Обязательное поле"></ValidationSettings>
        </PropertiesDateEdit>
    </dx:GridViewDataDateColumn>

    <dx:GridViewDataComboBoxColumn FieldName="State" Caption="Состояние" VisibleIndex="6">
        <PropertiesComboBox>
            <Items>
                <dx:ListEditItem Text="Удалено" Value="0"></dx:ListEditItem>
                <dx:ListEditItem Text="Действует" Value="1"></dx:ListEditItem>
                <dx:ListEditItem Text="Архив" Value="2"></dx:ListEditItem>
            </Items>
        </PropertiesComboBox>
        <EditFormSettings Visible="False" />
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
                        runat="server"
                        DataSourceID="dsSpecialOlimpicsPeriods"
                        ValueField="ID"
                        TextField="Name"
                        Caption="Период"
                        SelectedIndex="0"
                        >
                        <ClientSideEvents SelectedIndexChanged="function(s,e){gvAthletesKindsOfSport.Refresh();}" />
                    </dx:ASPxComboBox>
                </Template>
            </dx:GridViewToolbarItem>
            <dx:GridViewToolbarItem Command="New" Name="btAdd" Text="Добавить"></dx:GridViewToolbarItem>
			<%--<dx:GridViewToolbarItem Command="FullExpand"  Text="Раскрыть все"></dx:GridViewToolbarItem>
			<dx:GridViewToolbarItem Command="FullCollapse"  Text="Свернуть все"></dx:GridViewToolbarItem>--%>
           <%-- <dx:GridViewToolbarItem BeginGroup="true" Name="Notification" ItemStyle-CssClass="toolbox-item">
                <Template>
                    <divs class="sfp_notification">
                        <div>Срок учета (актуальности данных) 12 месяцев с момента ввода</div>
                        <div class="sfp_date"><%# LastAddSpecialNormsDate %></div>

                    </divs>
                </Template>
            </dx:GridViewToolbarItem>--%>
        </Items>
    </dx:GridViewToolbar>
</Toolbars>
<Templates>
    <DetailRow>
        <dx:ASPxGridView 
            ID="gvAthleteNorms" 
            ClientInstanceName="gvAthleteNorms" 
            runat="server"
            AutoGenerateColumns="False"
            DataSourceID="dsAthleteNorms"
            KeyFieldName="ID"
            OnBeforePerformDataSelect="gvAthleteNorms_BeforePerformDataSelect"
            Width="100%"
           >
            <Styles 
                Cell-HorizontalAlign="Center"
                Cell-VerticalAlign="Middle">
            </Styles>
            <Columns>
                <dx:GridViewCommandColumn 
                    Name="Command" 
                    ShowEditButton="True"
                    VisibleIndex="0"
                    ShowNewButtonInHeader="False" 
                    ShowDeleteButton="False"
                    Caption=" "
                    Width="150px" 
                    ShowClearFilterButton="true">
                </dx:GridViewCommandColumn>

                <dx:GridViewDataTextColumn 
                    FieldName="ID" 
                    ReadOnly="True"
                    VisibleIndex="1"
                    Visible="false">
                    <EditFormSettings 
                        Visible="False"></EditFormSettings>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn 
                    FieldName="NormsName" 
                    VisibleIndex="2" 
                    Visible="true" 
                    Caption="Нормы">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn 
                    FieldName="AthleteID"
                    VisibleIndex="3" 
                    Visible="false"></dx:GridViewDataTextColumn>
                                                        
                <dx:GridViewDataSpinEditColumn 
                    FieldName="Value" 
                    Caption="Значение"
                    VisibleIndex="4"
                    Visible="true">
                    <PropertiesSpinEdit 
                        DisplayFormatString="g"
                        AllowNull="true"
                        MinValue="0"></PropertiesSpinEdit>
                </dx:GridViewDataSpinEditColumn>
                <dx:GridViewDataTextColumn 
                    FieldName="UnitName" 
                    VisibleIndex="5"
                    Visible="True" 
                    Caption="Единицы измерения">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn FieldName="State" Caption="Состояние" VisibleIndex="6">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="Удалено" Value="0"></dx:ListEditItem>
                            <dx:ListEditItem Text="Действует" Value="1"></dx:ListEditItem>
                            <dx:ListEditItem Text="Архив" Value="2"></dx:ListEditItem>
                        </Items>
                    </PropertiesComboBox>
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataComboBoxColumn>
            </Columns>
            <Settings ShowFilterRow="true" AutoFilterCondition="Contains" />
            <%--<ClientSideEvents EndCallback='function(s,e){ if (e.command === "UPDATEEDIT" || e.command === "DELETEROW") { Master.cp_EndCallback(s,e); cbPanel.PerformCallback("refresh"); } }' />--%>
        </dx:ASPxGridView>
    </DetailRow>
    <FooterRow>
        <div>Срок учета (актуальности данных) 12 месяцев с момента ввода - <dx:ASPxLabel ID="lblLastDateMsg" runat="server" Font-Bold="true" Text="<%# GetLastDate(AthleteCardDto?.AthleteInfo?.SpecialNormInfoLastDate) %>" ></dx:ASPxLabel> </div>
    </FooterRow>
</Templates>
    

</dx:ASPxGridView>

</div>



<asp:SqlDataSource 
    runat="server" 
    ID="dsAthletesKindsOfSport" 
    ConnectionString='<%$ ConnectionStrings:MFKSConnectionString %>' 
    DeleteCommand="AthletesSpecialOlimpicKindOfSport_Delete" DeleteCommandType="StoredProcedure" OnDeleting="dsAthletesKindsOfSport_Updating"
    UpdateCommand="AthletesSpecialOlimpicKindOfSport_Update" UpdateCommandType="StoredProcedure" OnUpdating="dsAthletesKindsOfSport_Updating"
    InsertCommand="AthletesSpecialOlimpicKindOfSport_Insert" InsertCommandType="StoredProcedure" OnInserting="dsAthletesKindsOfSport_Updating"
    SelectCommand="SELECT AthleteID, SpecialKindOfSportID, Date, RowID, State FROM [dbo].[GetAthletesSpecialOlimpicKindOfSport](@AthleteID, @DateID)" 
    OnSelecting="dsAthletesKindsOfSport_Selecting" >
    <SelectParameters>
        <asp:Parameter Name="AthleteID" />
        <asp:Parameter Name="DateID" />
    </SelectParameters>
    <DeleteParameters>
        <asp:Parameter Name="Log_IP" Type="String" />
		<asp:Parameter Name="Log_SessionID" Type="String" />
		<asp:Parameter Name="Log_Login" Type="String" />
		<asp:Parameter Name="Log_ClientID" Type="Int32" />
		<asp:Parameter Name="Log_AuthorisationSessionID" Type="String" />
        <asp:SessionParameter Name="SpecialKindOfSportID" SessionField="SpecialKindOfSportID" />
        <asp:SessionParameter Name="Date" SessionField="Date" />
        <asp:Parameter Name="AthleteID"  />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="Log_IP" Type="String" />
		<asp:Parameter Name="Log_SessionID" Type="String" />
		<asp:Parameter Name="Log_Login" Type="String" />
		<asp:Parameter Name="Log_ClientID" Type="Int32" />
		<asp:Parameter Name="Log_AuthorisationSessionID" Type="String" />
        <asp:Parameter Name="SpecialKindOfSportID" Type="Int64"></asp:Parameter>
        <asp:Parameter Name="Date" />
        <asp:Parameter Name="AthleteID"  />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="Log_IP" Type="String" />
		<asp:Parameter Name="Log_SessionID" Type="String" />
		<asp:Parameter Name="Log_Login" Type="String" />
		<asp:Parameter Name="Log_ClientID" Type="Int32" />
		<asp:Parameter Name="Log_AuthorisationSessionID" Type="String" />
        <asp:Parameter Name="SpecialKindOfSportID" Type="Int64"></asp:Parameter>
        <asp:Parameter Name="AthleteID"  />
        <asp:Parameter Name="Date" />
        <asp:SessionParameter Name="OldDate" SessionField="OldDate" />
    </UpdateParameters>
</asp:SqlDataSource>

<asp:SqlDataSource 
    runat="server" 
    ID="dsAthleteNorms" 
    ConnectionString='<%$ ConnectionStrings:MFKSConnectionString %>' 
    SelectCommand="GetAthleteNorms" SelectCommandType="StoredProcedure" OnSelecting="dsAthleteNorms_Selecting"
    UpdateCommand="UPDATE [AthletesSpecialOlimpicNorms] SET [Value] = @Value WHERE [ID] = @ID">
    <SelectParameters>
        <asp:Parameter Name="Lang" DefaultValue="Rus" />
        <asp:Parameter Name="AthleteID" />
        <asp:SessionParameter Name="NormKindOfSportID" SessionField="NormSpecialNormsKindOfSportID" />
        <asp:SessionParameter Name="Date" SessionField="Date" />
    </SelectParameters>
    <UpdateParameters>
        <asp:Parameter Name="Value" Type="Int32"></asp:Parameter>
        <asp:Parameter Name="ID" Type="Int64"></asp:Parameter>
    </UpdateParameters>
</asp:SqlDataSource>

<asp:SqlDataSource
        runat="server"
        ID="dsSpecialKindsOfSport"
        ConnectionString='<%$ ConnectionStrings:MFKSConnectionString %>'
        SelectCommand="GetSpecialKindsOfSport" SelectCommandType="StoredProcedure" OnSelecting="dsSpecialKindsOfSport_Selecting"  CacheDuration="10">
    <SelectParameters>
        <asp:Parameter Name="Lang" DefaultValue="Rus" />
    </SelectParameters>
    </asp:SqlDataSource>

<asp:SqlDataSource
            runat="server"
            ID="dsSpecialOlimpicsPeriods"
            ConnectionString='<%$ ConnectionStrings:MFKSConnectionString %>'
            SelectCommand="SELECT [ID], [Name], [DateFrom], [DateTo] FROM GetSpecialOlimpicPeriod()" CacheDuration="10">

</asp:SqlDataSource>

<asp:SqlDataSource runat="server" ID="dsSpecialNorms"
    ConnectionString='<%$ ConnectionStrings:MFKSConnectionString %>'
    SelectCommand="GetSpecialNorms" SelectCommandType="StoredProcedure" OnSelecting="dsSpecialNorms_Selecting">
    <SelectParameters>
        <asp:Parameter Name="Lang" DefaultValue="Rus" />
    </SelectParameters>
</asp:SqlDataSource>