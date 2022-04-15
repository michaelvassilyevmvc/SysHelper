<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AthleteAdditionalInfo.ascx.cs" Inherits="MFKSHelper.SpeedRun.Element.AthleteAdditionalInfo" %>
<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:PlaceHolder runat="server">
        <%: Scripts.Render("~/bundles/additionalInfo") %>
    </asp:PlaceHolder>

 <div class="main-content-container">

     <div class="row">
                                            <div class="col-md-6">
                                                <dx:ASPxMemo
                                                    ID="tbPlace_of_permanent_residence"
                                                    ClientInstanceName="tbPlace_of_permanent_residence"
                                                    runat="server"
                                                    Caption="Место постоянного проживания"
                                                    MaxLength="512"
                                                    NullText="почтовый адрес (страна, область, город, улица, дом, кв., индекс)"
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
                                                <dx:ASPxTextBox
                                                    ID="tbContact_phone_number"
                                                    ClientInstanceName="tbContact_phone_number"
                                                    runat="server"
                                                    AutoResizeWithContainer="True"
                                                    Caption="Контактный телефон"
                                                    MaxLength="50"
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
                                                <dx:ASPxTextBox
                                                    ID="tbHome_phone_number"
                                                    ClientInstanceName="tbHome_phone_number"
                                                    runat="server"
                                                    AutoResizeWithContainer="True"
                                                    Caption="Домашний телефон"
                                                    MaxLength="50"
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
                                                Width="100%"
                                                ViewStateMode="Disabled"
                                                >
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
                                                Rows="3"
                                                ViewStateMode="Disabled"
                                                >
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
                                                Width="100%"
                                                ViewStateMode="Disabled"
                                                >
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
                                                Width="200px"
                                                ViewStateMode="Disabled"
                                                >
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
                                                UseMaskBehavior="True"
                                                ViewStateMode="Disabled"
                                                >
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
                                                Width="100%"
                                                ViewStateMode="Disabled"
                                                >
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
                                                Width="200px"
                                                ViewStateMode="Disabled"
                                                >
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
                                                UseMaskBehavior="True"
                                                ViewStateMode="Disabled"
                                                >
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
                                                Width="100%"
                                                ViewStateMode="Disabled"
                                                >
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
                                                Width="200px"
                                                ViewStateMode="Disabled"
                                                >
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
                                                UseMaskBehavior="True"
                                                ViewStateMode="Disabled"
                                                >
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
                                                Width="100%"
                                                ViewStateMode="Disabled"
                                                >
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
                            AutoPostBack="False"
                            Text="Редактировать"
                            >
                            <ClientSideEvents Click="athleteAdditionalInfo.StartEdit" />
                        </dx:ASPxButton>

                        <dx:ASPxButton
                            ID="btAdditionalInfoSave"
                            ClientInstanceName="btAdditionalInfoSave"
                            AutoPostBack="False"
                            runat="server"
                            Text="Сохранить"
                            >
                            <ClientSideEvents Click="athleteAdditionalInfo.Save" />
                        </dx:ASPxButton>

                        <dx:ASPxButton
                            ID="btAdditionalInfoCancel"
                            ClientInstanceName="btAdditionalInfoCancel"
                            AutoPostBack="False"
                            runat="server"
                            Text="Отмена"
                            >
                            <ClientSideEvents Click="athleteAdditionalInfo.Cancel" />
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
