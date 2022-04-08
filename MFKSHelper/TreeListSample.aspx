<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TreeListSample.aspx.cs" Inherits="MFKSHelper.TreeListSample" %>

<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTreeList" TagPrefix="dx" %>

<%@ Register TagPrefix="dx" Namespace="DevExpress.Web" Assembly="DevExpress.Web.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <dx:ASPxTreeList 
                ID="tlCompletedEventsList" 
                ClientInstanceName="tlCompletedEventsList"
                DataSourceID="dsCompletedEventsList"
                runat="server"
                KeyFieldName="ID" 
		        ParentFieldName="ParentID" 
                >
                <Columns>
                    <dx:TreeListTextColumn
                        FieldName="Name"
                        AutoFilterCondition="Default"
                        ShowInFilterControl="Default"
                        Caption="Наименование спортивно-массовых мероприятий"
                        VisibleIndex="1">
                        <DataCellTemplate>
                            <div class="dctOuter">
                                <div class="dctInner"><%# Eval("Name") %></div>
                            </div>
                        </DataCellTemplate>
                        <PropertiesTextEdit ConvertEmptyStringToNull="False">
                        </PropertiesTextEdit>
                        <EditFormSettings Visible="False"></EditFormSettings>
                    </dx:TreeListTextColumn>
                </Columns>
            </dx:ASPxTreeList>


             <asp:SqlDataSource ID="dsCompletedEventsList" runat="server"
                        ConnectionString="<%$ ConnectionStrings:MFKSConnectionString %>"
						SelectCommand="Events.GetCompletedEvents" SelectCommandType="StoredProcedure" OnSelecting="dsCompletedEventsList_Selecting"
                        >
                        <SelectParameters>
                            <asp:Parameter Name="FirmID" />
                            <asp:Parameter Name="YearStart" />
                            <asp:Parameter Name="YearEnd" />
                            <asp:Parameter Name="RegionID" />
                            <asp:Parameter Name="Lang" />
                        </SelectParameters>
                    </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
