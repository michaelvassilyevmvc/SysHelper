<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TreeListStructurePage.aspx.cs" Inherits="MFKSHelper.TreeListStructurePage" %>

<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTreeList" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script>
        function OnStartDragNode(s, e) {
            setTimeout(function () { CustomStartDragNode(s, e); }, 200);
        }
        function CustomStartDragNode(s, e) {
            var div = document.getElementById('form1').nextElementSibling;
            if (!div) return;
            var selectedKeys = s.GetVisibleSelectedNodeKeys();
            if (selectedKeys.indexOf(e.nodeKey) == -1 || selectedKeys.length == 0) return;
            table = div.childNodes[0];
            var row = table.rows[0];
            cloneRow = row.cloneNode(true);
            table.deleteRow(0);
            for (i = 0; i < selectedKeys.length; i++) {
                var row = cloneRow.cloneNode(true);
                var object = s.GetNodeHtmlElement(selectedKeys[i]).getElementsByClassName("customClass");
                for (var j = 0; j < object.length; j++) {
                    row.cells[j].innerHTML = object[j].innerHTML;
                }
                table.appendChild(row);
            }
        }
        
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <dx:aspxtreelist runat="server" 
                ClientInstanceName="tlStructure" 
                ID="tlStructure" 
                Width="100%" 
                AutoGenerateColumns="false" 
                KeyFieldName="ID" 
                ParentFieldName="ParentID"
                OnDataBinding="tlStructure_DataBinding"
                OnProcessDragNode="tlStructure_ProcessDragNode"
                OnHtmlDataCellPrepared="tlStructure_HtmlDataCellPrepared"
                ClientSideEvents-FocusedNodeChanged='<%# "function(s,e){"+gvData.ClientID+".Refresh();}" %>'
                >
                <ClientSideEvents StartDragNode="OnStartDragNode" />
                <Columns>
                    <dx:TreeListTextColumn AutoFilterCondition="Default" FieldName="ID" ShowInFilterControl="Default" VisibleIndex="0" Visible="False">
                        <EditFormSettings Visible="False" />
                    </dx:TreeListTextColumn>
                    <dx:TreeListTextColumn AutoFilterCondition="Default" FieldName="ParentID" ShowInFilterControl="Default" VisibleIndex="1" Visible="False">
                        <EditFormSettings Visible="False" />
                    </dx:TreeListTextColumn>
                    <dx:TreeListTextColumn AutoFilterCondition="Default" FieldName="Name" ShowInFilterControl="Default" VisibleIndex="2" Caption="Наименование">
                        <DataCellTemplate>
                            <div class="dctOuter">
                                <div class="dctInner"><%# Eval("Name") %></div>
                            </div>
                        </DataCellTemplate>
                        <PropertiesTextEdit ConvertEmptyStringToNull="False">
                        </PropertiesTextEdit>
                        <EditFormSettings Visible="False" />
                    </dx:TreeListTextColumn>
                    <dx:TreeListTextColumn AutoFilterCondition="Default" FieldName="Count" ShowInFilterControl="Default" VisibleIndex="3" Caption="Количество">
                        <DataCellTemplate>
                            <div class="dctOuter">
                                <div class="dctInner"><%# Eval("Count") %></div>
                            </div>
                        </DataCellTemplate>
                        <PropertiesTextEdit ConvertEmptyStringToNull="False">
                        </PropertiesTextEdit>
                        <EditFormSettings Visible="False" />
                    </dx:TreeListTextColumn>
                </Columns>
                <SettingsBehavior AllowFocusedNode="true" AllowDragDrop="true" />
                <SettingsEditing AllowNodeDragDrop="true"></SettingsEditing>
                <SettingsSelection Enabled="true" />
                <Settings GridLines="Both" />
            </dx:aspxtreelist>

            <h2>Данные по текущей структуре</h2>
            <dx:ASPxGridView ID="gvData" ClientInstanceName="gvData" KeyFieldName="Name" runat="server" AutoGenerateColumns="False" OnDataBinding="gvData_DataBinding">
                <Columns>
                    <dx:GridViewDataTextColumn FieldName="Name" Caption="Наименование" VisibleIndex="0"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="DateAndPlace" Caption="Сроки и место проведения" VisibleIndex="1"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="CompetitorFirm" Caption="Организации, участвующие в спортивно-массовых мероприятиях" VisibleIndex="2"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Count" Caption="Состав команды" VisibleIndex="3"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="AthleteCount" Caption="Кол-во спортсменов" VisibleIndex="4"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="TrainerCount" Caption="Кол-во тренеров" VisibleIndex="5"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="JudgeCount" Caption="Кол-во судей" VisibleIndex="6"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="OrganizerFirm" Caption="Организатор" VisibleIndex="7"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="SendingFirm" Caption="Командирующие организации" VisibleIndex="8"></dx:GridViewDataTextColumn>
                </Columns>
                <Styles>
                    <Cell HorizontalAlign="Center"></Cell>
                </Styles>
            </dx:ASPxGridView>

        </div>
    </form>
</body>
</html>
