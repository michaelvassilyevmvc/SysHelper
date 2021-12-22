<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TreeListStructurePage.aspx.cs" Inherits="MFKSHelper.TreeListStructurePage" %>

<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTreeList" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script>
        var currentNodeKey;
        function ShowMenu(nodeKey, x, y) {
            pmStructure.ShowAtPos(x, y);
            currentNodeKey = nodeKey;
        }

        function ProcessNodeClick(itemName) {
            switch (itemName) {
                case "New":
                    {
                        if (tlStructure.IsEditing()) {
                            tlStructure.UpdateEdit()
                        }
                        tlStructure.StartEditNewNode();
                        break;
                    }
                case "NewChild":
                    {
                        if (tlStructure.IsEditing()) {
                            tlStructure.UpdateEdit()
                        }
                        tlStructure.StartEditNewNode(currentNodeKey);
                        break;
                    }
                case "Edit":
                    {
                        if (tlStructure.IsEditing()) {
                            tlStructure.UpdateEdit()
                        }
                        tlStructure.StartEdit(currentNodeKey);
                        break;
                    }
                case "Delete":
                    {
                        if (tlStructure.IsEditing()) {
                            tlStructure.UpdateEdit()
                        }
                        if (!confirm('Хотите удалить?')) return;
                        tlStructure.DeleteNode(currentNodeKey);
                        break;
                    }
                default: return;
            }
        }


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
                OnNodeDeleting="tlStructure_NodeDeleting"
                OnNodeUpdating="tlStructure_NodeUpdating"
                OnProcessDragNode="tlStructure_ProcessDragNode"
                OnHtmlDataCellPrepared="tlStructure_HtmlDataCellPrepared"
                ClientSideEvents-FocusedNodeChanged='<%# "function(s,e){"+gvData.ClientID+".Refresh();}" %>'  
                
                >
                <ClientSideEvents StartDragNode="OnStartDragNode" ContextMenu="function(s,e){ 
                        if(e.objectType != 'Node') return;
                        s.SetFocusedNodeKey(e.objectKey);
                        var mouseX = ASPxClientUtils.GetEventX(e.htmlEvent);
	                    var mouseY = ASPxClientUtils.GetEventY(e.htmlEvent);
                        ShowMenu(e.objectKey, mouseX, mouseY);
                    }" />
                <Columns>
                    <dx:TreeListTextColumn AutoFilterCondition="Default" FieldName="ID" ShowInFilterControl="Default" VisibleIndex="1" Visible="False">
                        <EditFormSettings Visible="False" />
                    </dx:TreeListTextColumn>
                    <dx:TreeListTextColumn AutoFilterCondition="Default" FieldName="ParentID" ShowInFilterControl="Default" VisibleIndex="2" Visible="False">
                        <EditFormSettings Visible="False" />
                    </dx:TreeListTextColumn>
                    <dx:TreeListTextColumn AutoFilterCondition="Default" FieldName="Name" ShowInFilterControl="Default" VisibleIndex="3" Caption="Наименование">
                        <DataCellTemplate>
                            <div class="dctOuter">
                                <div class="dctInner"><%# Eval("Name") %></div>
                            </div>
                        </DataCellTemplate>
                        <PropertiesTextEdit ConvertEmptyStringToNull="False">
                        </PropertiesTextEdit>
                        <EditFormSettings Visible="True"  />
                    </dx:TreeListTextColumn>
                    <dx:TreeListTextColumn AutoFilterCondition="Default" FieldName="Count" ShowInFilterControl="Default" VisibleIndex="4" Caption="Количество">
                        <DataCellTemplate>
                            <div class="dctOuter">
                                <div class="dctInner"><%# Eval("Count") %></div>
                            </div>
                        </DataCellTemplate>
                        <PropertiesTextEdit ConvertEmptyStringToNull="False">
                        </PropertiesTextEdit>
                        <EditFormSettings Visible="False" />
                    </dx:TreeListTextColumn>
                    <dx:TreeListCommandColumn ButtonType="Image" ShowNewButtonInHeader="True" VisibleIndex="0"  ClearFilterButton-Visible="true" Width="25">
                        <NewButton Text="%%Добавить%%" Visible="False">
                            <Image AlternateText="%%Добавить%%" IconID="actions_add_32x32gray">
                            </Image>
                        </NewButton>
                        <UpdateButton Text="%%Сохранить%%">
                            <Image AlternateText="%%Сохранить%%" IconID="actions_apply_32x32gray">
                            </Image>
                        </UpdateButton>
                        <CancelButton Text="%%Отмена%%">
                            <Image AlternateText="%%Отмена%%" IconID="actions_cancel_32x32gray">
                            </Image>
                        </CancelButton>
                        <DeleteButton Text="%%Удалить%%" Visible="False">
                            <Image AlternateText="%%Удалить%%" IconID="edit_delete_32x32gray">
                            </Image>
                        </DeleteButton>
                        <CellStyle Wrap="True">
                        </CellStyle>
                        <ClearFilterButton Text="%%Очистить фильтр%%">
                            <Image AlternateText="%%Очистить фильтр%%" IconID="filter_ignoremasterfilter_32x32office2013">
                            </Image>
                        </ClearFilterButton>
                    </dx:TreeListCommandColumn>
                </Columns>
                <Toolbars>
                    <dx:TreeListToolbar>
                        <Items>
                            <dx:TreeListToolbarItem Command="Refresh" Text="%%Обновить%%"></dx:TreeListToolbarItem>
                            <dx:TreeListToolbarItem Command="FullExpand" Text="%%Раскрыть все%%">
                            </dx:TreeListToolbarItem>
                            <dx:TreeListToolbarItem Command="FullCollapse" Text="%%Свернуть все%%">
                            </dx:TreeListToolbarItem>
                        </Items>
                    </dx:TreeListToolbar>
                </Toolbars>
                <SettingsText
                        LoadingPanelText="%%Загрузка%%&hellip;"
                        CommandDelete="%%Удалить%%"
                        CommandEdit="%%Редактировать%%"
                        CommandUpdate="%%Изменить%%"
                        CommandNew="%%Новый%%"
                        ConfirmDelete="%%Подтвердить удаление%%?"
                        />
                <SettingsBehavior AllowFocusedNode="true" AllowDragDrop="true"   />
                <SettingsEditing AllowNodeDragDrop="true" ConfirmDelete="true"  EditFormColumnCount="1" Mode="PopupEditForm"></SettingsEditing>
		        <SettingsPopupEditForm VerticalAlign="WindowCenter" HorizontalAlign="WindowCenter" AllowResize="true" MinWidth="600px" Modal="true"></SettingsPopupEditForm>
                <SettingsDataSecurity AllowInsert="true" AllowEdit="true" AllowDelete="true" />
                <SettingsSelection Enabled="true" />
                <Settings GridLines="Both" />
            </dx:aspxtreelist>

            <dx:ASPxPopupMenu ID="pmStructure" ClientInstanceName="pmStructure" runat="server">
                <ClientSideEvents ItemClick="function(s,e){ProcessNodeClick(e.item.name);}" />
                <Items>
                    <dx:MenuItem Name="New" Text="Создать"></dx:MenuItem>
                    <dx:MenuItem Name="NewChild" Text="Создать внутрений узел"></dx:MenuItem>
                    <dx:MenuItem Name="Edit" Text="Редактировать"></dx:MenuItem>
                    <dx:MenuItem Name="Delete" Text="Удалить"></dx:MenuItem>
                </Items>
            </dx:ASPxPopupMenu>

            <h2>Данные по текущей структуре</h2>
            <dx:ASPxGridView 
                ID="gvData" 
                ClientInstanceName="gvData" 
                KeyFieldName="Name" 
                runat="server" 
                AutoGenerateColumns="False" 
                OnDataBinding="gvData_DataBinding" 
                OnRowDeleting="gvData_RowDeleting"
                OnRowUpdating="gvData_RowUpdating"
                OnRowInserting="gvData_RowInserting"
                >
                <Settings ShowFilterRow="True"></Settings>
                <SettingsBehavior ConfirmDelete="true" />
                <Columns>
                    <dx:GridViewCommandColumn ShowEditButton="True" VisibleIndex="0" ShowNewButtonInHeader="True" ShowDeleteButton="True" ShowClearFilterButton="True"
                        ButtonRenderMode="Image" ButtonType="Image" >
                    </dx:GridViewCommandColumn>
                    <dx:GridViewDataTextColumn FieldName="Name" Caption="Наименование" VisibleIndex="1"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="DateAndPlace" Caption="Сроки и место проведения" VisibleIndex="2"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="CompetitorFirm" Caption="Организации, участвующие в спортивно-массовых мероприятиях" VisibleIndex="3"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Count" Caption="Состав команды" VisibleIndex="4"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="AthleteCount" Caption="Кол-во спортсменов" VisibleIndex="5"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="TrainerCount" Caption="Кол-во тренеров" VisibleIndex="6"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="JudgeCount" Caption="Кол-во судей" VisibleIndex="7"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="OrganizerFirm" Caption="Организатор" VisibleIndex="8"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="SendingFirm" Caption="Командирующие организации" VisibleIndex="9"></dx:GridViewDataTextColumn>
                </Columns>
                <Styles>
                    <Cell HorizontalAlign="Center"></Cell>
                </Styles>
                <SettingsDataSecurity AllowDelete="true" AllowEdit="true" AllowInsert="true" />
                <SettingsCommandButton RenderMode="Image">
                    <NewButton Text="%%Добавить%%">
                        <Image AlternateText="%%Добавить%%" IconID="actions_add_32x32gray">
                        </Image>
                    </NewButton>
                    <UpdateButton Text="%%Сохранить%%">
                        <Image AlternateText="%%Сохранить%%" IconID="actions_apply_32x32gray">
                        </Image>
                    </UpdateButton>
                    <CancelButton Text="%%Отмена%%">
                        <Image AlternateText="%%Отмена%%" IconID="actions_cancel_32x32gray">
                        </Image>
                    </CancelButton>
                    <EditButton Text="%%Редактировать%%">
                        <Image AlternateText="%%Редактировать%%"  Height="32px" Width="32px">
                        </Image>
                        <Styles>
                            <Style>
                                <DisabledStyle>
                                    <BackgroundImage ImageUrl="~/Images/pencil_disabled.png" />
                                </DisabledStyle>
                                <BackgroundImage ImageUrl="~/Images/pencil_gray.png" />
                            </Style>
                        </Styles>
                    </EditButton>
                    <DeleteButton Text="%%Удалить%%">
                        <Image AlternateText="%%Удалить%%" IconID="edit_delete_32x32gray">
                        </Image>
                    </DeleteButton>
                    <ClearFilterButton Text="%%Очистить фильтр%%">
                        <Image AlternateText="%%Очистить фильтр%%" IconID="filter_ignoremasterfilter_32x32office2013">
                        </Image>
                    </ClearFilterButton>
                </SettingsCommandButton>
            </dx:ASPxGridView>

        </div>
    </form>
</body>
</html>
