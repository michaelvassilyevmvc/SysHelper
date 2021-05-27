<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="MFKSHelper._Default" %>

<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
        <dx:ASPxCallbackPanel
            ID="cbMainPanel"
            ClientInstanceName="cbMainPanel"
            runat="server"
            OnCallback="cbMainPanel_Callback">
            <SettingsLoadingPanel Text="%%Загрузка%%&amp;hellip;" />
            <PanelCollection>
                <dx:PanelContent runat="server">


                    <h2>Группы</h2>
                    <dx:ASPxGridView ID="gvLearningGroup" ClientInstanceName="gvLearningGroup" runat="server" AutoGenerateColumns="False" DataSourceID="dsLearningGroup" KeyFieldName="ID">
                        <Settings ShowFilterRow="True"></Settings>

                        <SettingsSearchPanel Visible="True"></SettingsSearchPanel>
                        <SettingsBehavior ConfirmDelete="true" />
                        <Columns>
                            <dx:GridViewCommandColumn ShowEditButton="True" VisibleIndex="0" ShowNewButtonInHeader="True" ShowDeleteButton="True" ShowClearFilterButton="True"></dx:GridViewCommandColumn>
                            <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" VisibleIndex="1">
                                <EditFormSettings Visible="False"></EditFormSettings>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Name" VisibleIndex="3"></dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="TrainerID" VisibleIndex="4"></dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Year" VisibleIndex="7"></dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Type" VisibleIndex="8"></dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Period" VisibleIndex="9"></dx:GridViewDataTextColumn>
                            <dx:GridViewDataComboBoxColumn FieldName="FirmID" ShowInCustomizationForm="True" VisibleIndex="2">
                                <PropertiesComboBox DataSourceID="dsFirms" TextField="NameRus" ValueField="ID"></PropertiesComboBox>
                            </dx:GridViewDataComboBoxColumn>

                            <dx:GridViewDataComboBoxColumn FieldName="KindsOfSportsID" ShowInCustomizationForm="True" VisibleIndex="6">
                                <PropertiesComboBox DataSourceID="dsKindOfSport" TextField="NameRus" ValueField="ID"></PropertiesComboBox>
                            </dx:GridViewDataComboBoxColumn>

                            <dx:GridViewDataComboBoxColumn FieldName="TrainerID" VisibleIndex="5">
                                <PropertiesComboBox DataSourceID="dsTrainers" TextField="Last_name" ValueField="ID"></PropertiesComboBox>
                            </dx:GridViewDataComboBoxColumn>

                        </Columns>
                    </dx:ASPxGridView>

                    <asp:SqlDataSource ID="dsKindOfSport" runat="server" ConnectionString='<%$ ConnectionStrings:MFKSConnectionString %>' 
                        SelectCommand="SELECT [ID], [ParentID], [NameRus], [NameKaz] FROM [KindsOfSports] WHERE ([State] > @State)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="0" Name="State" Type="Int32"></asp:Parameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="dsFirms" runat="server" ConnectionString='<%$ ConnectionStrings:MFKSConnectionString %>' 
                        SelectCommand="SELECT [ID], [NameRus], [NameKaz] FROM [Firms] WHERE ([State] > @State)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="0" Name="State" Type="Int32"></asp:Parameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="dsTrainers" runat="server" ConnectionString='<%$ ConnectionStrings:MFKSConnectionString %>' 
                        SelectCommand="SELECT [ID], [Last_name], [First_name], [Pat_name], CONCAT([Last_name],[First_name],) [FirmID] FROM [Trainers]"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="dsAthletes" runat="server" ConnectionString='<%$ ConnectionStrings:MFKSConnectionString %>' SelectCommand="SELECT [ID], [Last_name], [First_name], [Pat_name] FROM [Athletes]"></asp:SqlDataSource>

                    <asp:SqlDataSource 
                        runat="server" 
                        ID="dsLearningGroup" 
                        ConnectionString='<%$ ConnectionStrings:MFKSConnectionString %>' 
                        DeleteCommand="DELETE FROM [Learning_groups] WHERE [ID] = @ID" 
                        InsertCommand="INSERT INTO [Learning_groups] ([FirmID], [Name], [TrainerID], [KindsOfSportsID], [Year], [Type], [Period]) 
                                       VALUES (@FirmID, @Name, @TrainerID, @KindsOfSportsID, @Year, @Type, @Period)" 
                        SelectCommand="SELECT [ID], [FirmID], [Name], [TrainerID], [KindsOfSportsID], [Year], [Type], [Period] FROM [Learning_groups] WHERE ([State] > @State)" 
                        UpdateCommand="UPDATE [Learning_groups] SET [FirmID] = @FirmID, [Name] = @Name, [TrainerID] = @TrainerID
                                       , [KindsOfSportsID] = @KindsOfSportsID, [Year] = @Year, [Type] = @Type, [Period] = @Period WHERE [ID] = @ID">
                        <DeleteParameters>
                            <asp:Parameter Name="ID" Type="Int64"></asp:Parameter>
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="FirmID" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="Name" Type="String"></asp:Parameter>
                            <asp:Parameter Name="TrainerID" Type="Int64"></asp:Parameter>
                            <asp:Parameter Name="KindsOfSportsID" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="Year" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="Type" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="Period" Type="Int32"></asp:Parameter>
                        </InsertParameters>
                        <SelectParameters>
                            <asp:Parameter DefaultValue="0" Name="State" Type="Int32"></asp:Parameter>
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="FirmID" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="Name" Type="String"></asp:Parameter>
                            <asp:Parameter Name="TrainerID" Type="Int64"></asp:Parameter>
                            <asp:Parameter Name="KindsOfSportsID" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="Year" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="Type" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="Period" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="ID" Type="Int64"></asp:Parameter>
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>
    </div>

</asp:Content>
