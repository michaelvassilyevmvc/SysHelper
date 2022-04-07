<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCAthletesControl.ascx.cs" Inherits="MFKSHelper.CachTest.UserControl.UCAthletesControl" %>
<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ OutputCache Duration="60" VaryByControl="cbKindOfSport" %>

<dx:ASPxComboBox ID="cbKindOfSport" DataSourceID="dsKindOfSport" runat="server" ValueField="ID" TextField="Name" SelectedIndex="0" AutoPostBack="true"
                OnSelectedIndexChanged="cbKindOfSport_SelectedIndexChanged"></dx:ASPxComboBox>

            <dx:ASPxGridView ID="gvAthletes" runat="server" AutoGenerateColumns="False" DataSourceID="dsAthletes" KeyFieldName="ID">
                <Columns>
                    <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" VisibleIndex="0">
                        <EditFormSettings Visible="False"></EditFormSettings>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="FirmID" VisibleIndex="1"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="FIO" ReadOnly="True" VisibleIndex="2"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="KindsOfSportsID" VisibleIndex="3"></dx:GridViewDataTextColumn>
                </Columns>
            </dx:ASPxGridView>


            <asp:SqlDataSource ID="dsAthletes" runat="server" ConnectionString='<%$ ConnectionStrings:MFKSConnectionString %>' 
                SelectCommand="Athletes_Select" SelectCommandType="StoredProcedure" OnSelecting="dsAthletes_Selecting">
                <SelectParameters>
                    <asp:Parameter DefaultValue="0" Name="KindOfSportID" Type="Int32"></asp:Parameter>
                </SelectParameters>
            </asp:SqlDataSource>

            <asp:SqlDataSource
                ID="dsKindOfSport" runat="server"
                ConnectionString='<%$ ConnectionStrings:MFKSConnectionString %>'
                SelectCommand="[Catalogs].GetAllKindOfSport" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:Parameter DefaultValue="Rus" Name="Lang" Type="String"></asp:Parameter>
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <br />
            ServerTime:
            <dx:ASPxLabel ID="lblTime" runat="server" Text="ASPxLabel"></dx:ASPxLabel>
            <br />
            <br />
            ClientTime:
            <script type="text/javascript">
                document.write(Date());
            </script>