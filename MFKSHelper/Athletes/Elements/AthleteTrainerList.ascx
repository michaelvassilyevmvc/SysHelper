<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AthleteTrainerList.ascx.cs" Inherits="MFKSHelper.Athletes.Elements.AthleteTrainerList" %>
<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>



<dx:ASPxGridView 
    ID="gvAthleteTrainerList" 
    ClientInstanceName="gvAthleteTrainerList"
    runat="server" AutoGenerateColumns="False" 
    DataSourceID="dsAthleteTrainerList" 
    KeyFieldName="ID">
    <Columns>
        <dx:GridViewCommandColumn ShowEditButton="True" VisibleIndex="0" ShowNewButtonInHeader="True" ShowDeleteButton="True"></dx:GridViewCommandColumn>
        <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" VisibleIndex="1" Visible="false">
            <EditFormSettings Visible="False"></EditFormSettings>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="Edit_FirmID" VisibleIndex="2" Visible="false">
           
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataDateColumn FieldName="Start_date" VisibleIndex="5" Visible="false">
             <EditFormSettings Visible="True" />
             <PropertiesDateEdit>
                 <DateRangeSettings CalendarColumnCount="1" />
             </PropertiesDateEdit>
        </dx:GridViewDataDateColumn>
        <dx:GridViewDataDateColumn FieldName="End_date" VisibleIndex="7" Visible="false" >
            <PropertiesDateEdit AllowMouseWheel="false">
                <DateRangeSettings CalendarColumnCount="1" StartDateEditID="Start_date" />
            </PropertiesDateEdit>
             <EditFormSettings Visible="True" />
        </dx:GridViewDataDateColumn>
        <dx:GridViewDataDateColumn FieldName="ID" VisibleIndex="6" Caption="Период">
            <EditFormSettings Visible="False" />
            <DataItemTemplate>
                <%# DateTimePeriod(Eval("Start_date").ToString()) %> - <%# DateTimePeriod(Eval("End_date").ToString()) %>
            </DataItemTemplate>
        </dx:GridViewDataDateColumn>
        <dx:GridViewDataComboBoxColumn FieldName="KindOfSportID" VisibleIndex="4" GroupIndex="0" Caption="Вид спорта">
            <PropertiesComboBox DataSourceID="dsKindOfSportList" TextField="Name" ValueField="ID">               
            </PropertiesComboBox>
            <EditFormSettings Visible="True" />
            <EditItemTemplate>
                <dx:ASPxComboBox ID="cb" runat="server" DataSourceID="dsAthleteKindOfSportList"
                            Value='<%# Bind("KindOfSportID") %>' TextField="Name" ValueField="KindOfSportID"
                            ValueType="System.Int32">
                        
                        </dx:ASPxComboBox>
            </EditItemTemplate>
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataComboBoxColumn FieldName="TrainerID" VisibleIndex="3" Caption="Тренер">
            <PropertiesComboBox DataSourceID="dsTrainerList" TextField="FIO" ValueField="ID" DropDownRows="1" DropDownStyle="DropDownList" >
             <DropDownButton Visible="False"></DropDownButton>
                <Buttons>
					<dx:EditButton Text="..." >
					</dx:EditButton>
				</Buttons>
                <ClientSideEvents Init="function(s,e){s.SetSelectedIndex(s.GetSelectedIndex());}" />
            </PropertiesComboBox>
            <EditFormSettings Visible="True" />
            <
        </dx:GridViewDataComboBoxColumn>
    </Columns>
    <SettingsEditing EditFormColumnCount="1"></SettingsEditing>
    <SettingsPager AlwaysShowPager="false" Visible="false"></SettingsPager>
    <Styles>
        <Cell HorizontalAlign="Center"></Cell>
    </Styles>
</dx:ASPxGridView>

<asp:SqlDataSource
    ID="dsAthleteTrainerList" 
    runat="server" 
    ConnectionString='<%$ ConnectionStrings:MFKSConnectionString %>' 
    SelectCommand="SELECT T.ID,T.Edit_FirmID, T.TrainerID, T.KindOfSportID, T.Start_date, T.End_date
FROM dbo.Athletes_trainers_list as T
WHERE AthleteID = @AthleteID" OnSelecting="dsAthleteTrainerList_Selecting"
    DeleteCommand="[dbo].[Athletes_trainers_Delete]" DeleteCommandType="StoredProcedure" OnDeleting="BeginLoggableTransact"
	InsertCommand="[dbo].[Athletes_trainers_Insert]" InsertCommandType="StoredProcedure" OnInserting="BeginLoggableTransact"
	UpdateCommand="[dbo].[Athletes_trainers_Update]" UpdateCommandType="StoredProcedure" OnUpdating="BeginLoggableTransact"
    >
    <SelectParameters>
        <asp:Parameter Name="AthleteID"></asp:Parameter>
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

<asp:SqlDataSource 
    ID="dsKindOfSportList" 
    runat="server" 
    ConnectionString='<%$ ConnectionStrings:MFKSConnectionString %>' 
    SelectCommand="[Catalogs].[GetAllKindOfSport]" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:Parameter DefaultValue="Rus" Name="Lang" Type="String"></asp:Parameter>
    </SelectParameters>
</asp:SqlDataSource>

<asp:SqlDataSource 
    ID="dsTrainerList" 
    runat="server" 
    ConnectionString='<%$ ConnectionStrings:MFKSConnectionString %>' 
    SelectCommand="SELECT ID, dbo.GetFIO(Last_name, First_name, Pat_name) as FIO FROM dbo.Trainers"
    ></asp:SqlDataSource>

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

<%--
Тренер
Вид спорта
Начало
Завершение
--%>
