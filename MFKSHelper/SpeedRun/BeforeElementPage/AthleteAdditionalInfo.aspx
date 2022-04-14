<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AthleteAdditionalInfo.aspx.cs" Inherits="MFKSHelper.SpeedRun.BeforeElementPage.AthleteAdditionalInfo" %>
<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <webopt:bundlereference runat="server" path="~/Content/css" />
    <asp:PlaceHolder runat="server">
        <%: Scripts.Render("~/bundles/toast") %>
    </asp:PlaceHolder>
</head>
<body>
    <form id="form1" runat="server">
         <div class="container">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <dx:ASPxTextBox
                                                ID="tbBirthplace"
                                                ClientInstanceName="tbBirthplace"
                                                runat="server"
                                                AutoResizeWithContainer="True"
                                                Caption="Место рождения"
                                                MaxLength="512"
                                                NullText="(Область, район, город, село)"
                                                NullTextDisplayMode="UnfocusedAndFocused"
                                                Width="100%">
                                                <CaptionSettings Position="Top" />
                                                <CaptionCellStyle>
                                                    <Paddings PaddingBottom="0px" />
                                                </CaptionCellStyle>
                                                <CaptionStyle Font-Bold="True">
                                                </CaptionStyle>
                                            </dx:ASPxTextBox>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">

                                            <dx:ASPxMemo
                                                ID="tbEducation_info"
                                                ClientInstanceName="tbEducation_info"
                                                runat="server"
                                                Caption="Образование"
                                                MaxLength="1024"
                                                NullText="(номер школы, колледжа, наименование ВУЗа и годы обучения)"
                                                NullTextDisplayMode="UnfocusedAndFocused"
                                                Width="100%"
                                                Rows="3">
                                                <CaptionSettings Position="Top" />
                                                <CaptionCellStyle>
                                                    <Paddings PaddingBottom="0px" />
                                                </CaptionCellStyle>
                                                <CaptionStyle Font-Bold="True">
                                                </CaptionStyle>
                                            </dx:ASPxMemo>

                                        </div>

                                        <div class="col-md-6">

                                            <dx:ASPxComboBox
                                                ID="cbSocial_status"
                                                ClientInstanceName="cbSocial_status"
                                                runat="server"
                                                DataSourceID="dsAthleteSocialStatusList"                                                
                                                ValueField="ID"
                                                TextField="Name"
                                                ValueType="System.Int32"
                                                NullText="(Не указано)"
                                                Caption="Социальный статус"
                                                Width="100%">
                                                <CaptionSettings Position="Top" />
                                                <CaptionStyle Font-Bold="true"></CaptionStyle>
                                            </dx:ASPxComboBox>

                                            <br />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">

                                            <dx:ASPxTextBox
                                                ID="tePassport_ID"
                                                ClientInstanceName="tePassport_ID"
                                                runat="server"
                                                AutoResizeWithContainer="True"
                                                Caption="Номер паспорта"
                                                MaxLength="50"
                                                NullText="(Не указано)"
                                                NullTextDisplayMode="UnfocusedAndFocused"
                                                Width="200px">
                                                <CaptionSettings Position="Top" />
                                                <CaptionCellStyle>
                                                    <Paddings PaddingBottom="0px" />
                                                </CaptionCellStyle>
                                                <CaptionStyle Font-Bold="True">
                                                </CaptionStyle>
                                            </dx:ASPxTextBox>

                                            <dx:ASPxDateEdit
                                                ID="tePassport_Date_of_issue"
                                                ClientInstanceName="tePassport_Date_of_issue"
                                                runat="server"
                                                Caption="Дата выдачи паспорта"
                                                NullText="День, месяц, год"
                                                NullTextDisplayMode="UnfocusedAndFocused"
                                                AutoResizeWithContainer="True"
                                                UseMaskBehavior="True">
                                                <CaptionSettings Position="Top" />
                                                <CaptionCellStyle>
                                                    <Paddings PaddingBottom="0px" />
                                                </CaptionCellStyle>
                                                <CaptionStyle Font-Bold="True">
                                                </CaptionStyle>
                                            </dx:ASPxDateEdit>

                                            <dx:ASPxTextBox
                                                ID="tePassport_Issued_by"
                                                ClientInstanceName="tePassport_Issued_by"
                                                runat="server"
                                                AutoResizeWithContainer="True"
                                                Caption="Кем выдан паспорт"
                                                MaxLength="256"
                                                NullText="(Не указано)"
                                                NullTextDisplayMode="UnfocusedAndFocused"
                                                Width="100%">
                                                <CaptionSettings Position="Top" />
                                                <CaptionCellStyle>
                                                    <Paddings PaddingBottom="0px" />
                                                </CaptionCellStyle>
                                                <CaptionStyle Font-Bold="True">
                                                </CaptionStyle>
                                            </dx:ASPxTextBox>

                                            <br />

                                        </div>
                                        <div class="col-md-6">

                                            <dx:ASPxTextBox
                                                ID="teIdentity_card_ID"
                                                ClientInstanceName="teIdentity_card_ID"
                                                runat="server"
                                                AutoResizeWithContainer="True"
                                                Caption="Номер удостоверения личности"
                                                MaxLength="9"
                                                NullText="(Не указано)"
                                                NullTextDisplayMode="UnfocusedAndFocused"
                                                Width="200px">
                                                <CaptionSettings Position="Top" />
                                                <CaptionCellStyle>
                                                    <Paddings PaddingBottom="0px" />
                                                </CaptionCellStyle>
                                                <CaptionStyle Font-Bold="True">
                                                </CaptionStyle>
                                            </dx:ASPxTextBox>

                                            <dx:ASPxDateEdit
                                                ID="teIdentity_card_Date_of_issue"
                                                ClientInstanceName="teIdentity_card_Date_of_issue"
                                                runat="server"
                                                Caption="Дата выдачи удостоверения личности"
                                                NullText="День, месяц, год"
                                                NullTextDisplayMode="UnfocusedAndFocused"
                                                AutoResizeWithContainer="True"
                                                UseMaskBehavior="True">
                                                <CaptionSettings Position="Top" />
                                                <CaptionCellStyle>
                                                    <Paddings PaddingBottom="0px" />
                                                </CaptionCellStyle>
                                                <CaptionStyle Font-Bold="True">
                                                </CaptionStyle>
                                            </dx:ASPxDateEdit>

                                            <dx:ASPxTextBox
                                                ID="tbIdentity_card_Issued_by"
                                                ClientInstanceName="tbIdentity_card_Issued_by"
                                                runat="server"
                                                AutoResizeWithContainer="True"
                                                Caption="Кем выдано удостоверение личности"
                                                MaxLength="256"
                                                NullText="(Не указано)"
                                                NullTextDisplayMode="UnfocusedAndFocused"
                                                Width="100%">
                                                <CaptionSettings Position="Top" />
                                                <CaptionCellStyle>
                                                    <Paddings PaddingBottom="0px" />
                                                </CaptionCellStyle>
                                                <CaptionStyle Font-Bold="True">
                                                </CaptionStyle>
                                            </dx:ASPxTextBox>
                                        </div>
                                    </div>
                                    <br />
                                    <div class="row">
                                        <div class="col-md-6">

                                            <dx:ASPxTextBox
                                                ID="teBC_ID"
                                                ClientInstanceName="teBC_ID"
                                                runat="server"
                                                AutoResizeWithContainer="True"
                                                Caption="Номер свидетельства о рождении"
                                                MaxLength="50"
                                                NullText="(Не указано)"
                                                NullTextDisplayMode="UnfocusedAndFocused"
                                                Width="200px">
                                                <CaptionSettings Position="Top" />
                                                <CaptionCellStyle>
                                                    <Paddings PaddingBottom="0px" />
                                                </CaptionCellStyle>
                                                <CaptionStyle Font-Bold="True">
                                                </CaptionStyle>
                                            </dx:ASPxTextBox>

                                            <dx:ASPxDateEdit
                                                ID="teBC_Date_of_issue"
                                                ClientInstanceName="teBC_Date_of_issue"
                                                runat="server"
                                                Caption="Дата выдачи свидетельства о рождении"
                                                NullText="День, месяц, год"
                                                NullTextDisplayMode="UnfocusedAndFocused"
                                                AutoResizeWithContainer="True"
                                                UseMaskBehavior="True">
                                                <CaptionSettings Position="Top" />
                                                <CaptionCellStyle>
                                                    <Paddings PaddingBottom="0px" />
                                                </CaptionCellStyle>
                                                <CaptionStyle Font-Bold="True">
                                                </CaptionStyle>
                                            </dx:ASPxDateEdit>

                                            <dx:ASPxTextBox
                                                ID="teBC_Issued_by"
                                                ClientInstanceName="teBC_Issued_by"
                                                runat="server"
                                                AutoResizeWithContainer="True"
                                                Caption="Кем выдано свидетельство о рождении"
                                                MaxLength="256"
                                                NullText="(Не указано)"
                                                NullTextDisplayMode="UnfocusedAndFocused"
                                                Width="100%">
                                                <CaptionSettings Position="Top" />
                                                <CaptionCellStyle>
                                                    <Paddings PaddingBottom="0px" />
                                                </CaptionCellStyle>
                                                <CaptionStyle Font-Bold="True">
                                                </CaptionStyle>
                                            </dx:ASPxTextBox>

                                            <br />
                                        </div>
                                        <div class="col-md-6">
                                        </div>
                                    </div>
              <div id="dvAdditionalInfoEdit" class="group-edit-buttons" runat="server">
                        <dx:ASPxButton
                            ID="btAdditionalInfoStartEdit"
                            ClientInstanceName="btAdditionalInfoStartEdit"
                            runat="server"
                            AutoPostBack="True"
                            Text="Редактировать"
                            OnClick="btAdditionalInfoStartEdit_Click"
                            >
                            <%--<ClientSideEvents Click="AthleteAdditionalInfo.btAdditionalInfoStartEdit" />--%>
                        </dx:ASPxButton>

                        <dx:ASPxButton
                            ID="btAdditionalInfoSave"
                            ClientInstanceName="btAdditionalInfoSave"
                            AutoPostBack="true"
                            runat="server"
                            Text="Сохранить"
                            OnClick="btAdditionalInfoSave_Click"
                            >
                            <%--<ClientSideEvents Click="AthleteAdditionalInfo.btAdditionalInfoSave_Click" />--%>
                        </dx:ASPxButton>

                        <dx:ASPxButton
                            ID="btAdditionalInfoCancel"
                            ClientInstanceName="btAdditionalInfoCancel"
                            AutoPostBack="true"
                            runat="server"
                            Text="Отмена"
                            OnClick="btAdditionalInfoCancel_Click"
                            >
                            <%--<ClientSideEvents Click="AthleteAdditionalInfo.btCancel_Click" />--%>
                        </dx:ASPxButton>
                    </div>
                                </div>
                       

        <asp:SqlDataSource
            runat="server"
            ID="dsAthleteSocialStatusList"
            ConnectionString='<%$ ConnectionStrings:MFKSConnectionString %>'
            SelectCommand="GetAthleteSocialStatusList" SelectCommandType="StoredProcedure" OnSelecting="dsAthletes_social_status_Selecting" CacheDuration="30">
            <SelectParameters>
                <asp:Parameter Name="Lang" DefaultValue="Rus" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
