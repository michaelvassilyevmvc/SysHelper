<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="MFKSHelper.WebForm1" %>
<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
	
</head>
<body>
    

    <form id="form1" runat="server">
        
        <div>
            <a href="#customModalSportInfoTrainerSelect" rel="modal:open">Login</a>

             <div id="customModalSportInfoTrainerSelect"  runat="server" >
                 
                <section class="grid-center">
					<dx:ASPxGridView
                        ID="gvTrainersSelect"
                        ClientInstanceName="gvTrainersSelect"
                        DataSourceID="dsTrainersSelect"
                        runat="server"
                        AutoGenerateColumns="False"                        
                        KeyFieldName="ID"
						>
                        <SettingsPager NumericButtonCount="5"></SettingsPager>
                        <Settings ShowFilterRow="True" GroupFormat="{1}" />
                        <SettingsBehavior
                            AllowGroup="true"
                            AutoExpandAllGroups="true"
                            AllowSelectByRowClick="True"
                            AllowSelectSingleRowOnly="True"
                            />
                        <Columns>
                            <dx:GridViewCommandColumn
                                SelectAllCheckboxMode="Page"
                                ShowInCustomizationForm="True"
                                ShowSelectCheckbox="True"
                                VisibleIndex="0"
                                Width="50px"
                                Name="gvCommandColumn">
                            </dx:GridViewCommandColumn>
                            <dx:GridViewDataTextColumn
                                FieldName="ID"
                                ShowInCustomizationForm="True"
                                Visible="True"
                                VisibleIndex="1">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn
                                FieldName="FIO"
                                ShowInCustomizationForm="True"
                                VisibleIndex="5"
                                Caption="ФИО">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataDateColumn
                                FieldName="Date_of_firm_entered"
                                ShowInCustomizationForm="True"
                                VisibleIndex="6"
                                Caption="Дата начала преподавания в организации">
                                <PropertiesDateEdit AllowMouseWheel="false" Width="170" UseMaskBehavior="True">
                                    <CalendarProperties
                                        ShowWeekNumbers="false"
                                        ShowClearButton="True"
                                        TodayButtonText="Сегодня"
                                        ClearButtonText="Очистить">
                                        <FastNavProperties OkButtonText="OK" CancelButtonText="Отмена" />
                                    </CalendarProperties>
                                </PropertiesDateEdit>
                                <CellStyle HorizontalAlign="Center"></CellStyle>
                            </dx:GridViewDataDateColumn>
                            <dx:GridViewDataDateColumn
                                FieldName="Date_of_firm_escaping"
                                ShowInCustomizationForm="True"
                                VisibleIndex="7"
                                Caption="Дата завершения преподавания в организации">
                                <PropertiesDateEdit
                                    AllowMouseWheel="false"
                                    Width="170"
                                    NullText="настоящее время"
                                    UseMaskBehavior="True"
                                    NullDisplayText="настоящее время"
                                    ShowOutOfRangeWarning="False">
                                    <CalendarProperties
                                        ShowWeekNumbers="false"
                                        ShowClearButton="True"
                                        TodayButtonText="Сегодня"
                                        ClearButtonText="Очистить">
                                        <FastNavProperties OkButtonText="OK" CancelButtonText="Отмена" />
                                    </CalendarProperties>
                                </PropertiesDateEdit>
                                <CellStyle HorizontalAlign="Center"></CellStyle>
                            </dx:GridViewDataDateColumn>
                            <dx:GridViewDataTextColumn
                                FieldName="IsCurrentFirm"
                                ShowInCustomizationForm="True"
                                Visible="True"
                                VisibleIndex="9"
                                SortOrder="Ascending"
                                GroupIndex="0">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn
                                FieldName="Firm_Name"
                                ShowInCustomizationForm="True"
                                Visible="True"
                                VisibleIndex="10"
                                Caption="Организация" GroupIndex="1">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn
                                FieldName="KindsOfSports_Name"
                                ShowInCustomizationForm="True"
                                Visible="True"
                                VisibleIndex="2">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn
                                FieldName="IIN"
                                ShowInCustomizationForm="True"
                                VisibleIndex="4"
                                Caption="ИИН">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn
                                FieldName="FirmID"
                                ShowInCustomizationForm="True"
                                VisibleIndex="8"
                                Visible="True">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataComboBoxColumn
                                FieldName="KindsOfSportsID"
                                VisibleIndex="11"
                                Caption="Вид спорта">
                                <PropertiesComboBox
                                    DataSourceID="dsKindsOfSportAll"
                                    TextField="Name"
                                    ValueField="ID"
                                    ItemStyle-Wrap="True"
                                    AllowMouseWheel="true">
                                </PropertiesComboBox>
                            </dx:GridViewDataComboBoxColumn>

                        </Columns>
                        <Styles>
                            <Header Wrap="True"></Header>
                            <Row Wrap="True"></Row>
                            <AdaptiveHeaderPanel
                                BackColor="#FF6666"
                                ForeColor="#009933"
                                CssClass="adaptive-no-header">
                            </AdaptiveHeaderPanel>
                        </Styles>
                        <Toolbars>
                            <dx:GridViewToolbar>
                                <Items>
                                    <dx:GridViewToolbarItem Command="FullExpand" Text="Раскрыть все" />
                                    <dx:GridViewToolbarItem Command="FullCollapse" Text="Свернуть все" />
                                </Items>
                            </dx:GridViewToolbar>
                        </Toolbars>
                    </dx:ASPxGridView>

               </section>

                <section class="btns_trainer_modal">
                    <dx:ASPxButton
                        ID="btTrainersSelect"
                        ClientInstanceName="btTrainersSelect"
                        runat="server"
                        Text="Выбрать"
                        CssClass="btn-primary"
                        AutoPostBack="false">
                        <ClientSideEvents Click="function(s,e){}" />
                    </dx:ASPxButton>
                    <a href="#close" rel="modal:close" class="btn btn-default">Отмена</a>
                </section>

                 <asp:SqlDataSource 
								ID="dsTrainersSelect" 
								runat="server" 
								ConnectionString="<%$ ConnectionStrings:MFKSConnectionString %>" 
								SelectCommand="
		SELECT top(20)
		  A.ID
		, A.IIN
		, A.FIO
		, A.Date_of_firm_entered
		, A.Date_of_firm_escaping
		, F.ID as FirmID
		, F.NameRus AS Firm_Name
		, N'Тренера текущей организации' AS IsCurrentFirm
		, ISNULL(kos.CommonID, A.KindsOfSportsID) AS KindsOfSportsID
		, ISNULL(COMN.NameRus, A.KindsOfSports_NameRus)  AS KindsOfSports_Name
		from dbo.GetTrainersListAll(0) AS A
		LEFT JOIN dbo.Trainers as T on A.ID = T.ID 
		LEFT JOIN dbo.Firms as F on T.FirmID = F.ID OR T.Edit_FirmID = F.ID
		LEFT JOIN dbo.KindsOfSports as kos on kos.ID = A.KindsOfSportsID
		LEFT JOIN [dbo].[KindsOfSports] as COMN ON COMN.ID = kos.CommonID
		ORDER BY A.FIO"

								 >
							</asp:SqlDataSource>

                 <asp:SqlDataSource
                     ID="dsKindsOfSportAll"
                     runat="server"
                     ConnectionString="<%$ ConnectionStrings:MFKSConnectionString %>"
                     SelectCommand="SELECT ID, NameRus as Name FROM dbo.KindsOfSports
		WHERE [State] = 1 AND ParentID &lt;&gt; 0 AND CommonID IS NULL "
                     ></asp:SqlDataSource>


               

            </div>

            
        </div>
    </form>
</body>
</html>
