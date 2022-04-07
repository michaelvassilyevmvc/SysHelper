<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SimpleCach.aspx.cs" Inherits="MFKSHelper.CachTest.SimpleCach" %>

<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ OutputCache Duration="30" VaryByParam="None"  %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <dx:ASPxGridView ID="gvKindOfSport" runat="server" DataSourceID="dsKindOfSport" AutoGenerateColumns="False">
                <Columns>
                    <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" VisibleIndex="0">
                        <EditFormSettings Visible="False"></EditFormSettings>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="NameRus" ReadOnly="True" VisibleIndex="1"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="NameKaz" ReadOnly="True" VisibleIndex="2"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Name" ReadOnly="True" VisibleIndex="3"></dx:GridViewDataTextColumn>
                </Columns>
            </dx:ASPxGridView>

        </div>
        <asp:SqlDataSource 
            ID="dsKindOfSport" runat="server" 
            ConnectionString='<%$ ConnectionStrings:MFKSConnectionString %>' 
            SelectCommand="[Catalogs].GetAllKindOfSport" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:Parameter DefaultValue="Rus" Name="Lang" Type="String"></asp:Parameter>
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
