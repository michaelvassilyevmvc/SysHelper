<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AthleteContactInfo.ascx.cs" Inherits="MFKSHelper.SpeedRun.Element.AthleteContactInfo" %>
<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:PlaceHolder runat="server">
    <%: Scripts.Render("~/bundles/contactInfo") %>
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

                    <dx:ASPxTextBox
                        ID="tbContact_phone_number"
                        ClientInstanceName="tbContact_phone_number"
                        runat="server"
                        AutoResizeWithContainer="True"
                        Caption="Контактный телефон"
                        MaxLength="50"
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

                    <dx:ASPxTextBox
                        ID="tbHome_phone_number"
                        ClientInstanceName="tbHome_phone_number"
                        runat="server"
                        AutoResizeWithContainer="True"
                        Caption="Домашний телефон"
                        MaxLength="50"
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


            <div id="dvContactInfoEdit" class="group-edit-buttons" runat="server">
                <dx:aspxbutton
                    id="btContactInfoStartEdit"
                    clientinstancename="btContactInfoStartEdit"
                    runat="server"
                    autopostback="False"
                    text="Редактировать">
                    <ClientSideEvents Click="athleteContactInfo.StartEdit" />
                </dx:aspxbutton>

                <dx:aspxbutton
                    id="btContactInfoSave"
                    clientinstancename="btContactInfoSave"
                    autopostback="False"
                    runat="server"
                    text="Сохранить">
                    <ClientSideEvents Click="athleteContactInfo.Save" />
                </dx:aspxbutton>

                <dx:aspxbutton
                    id="btContactInfoCancel"
                    clientinstancename="btContactInfoCancel"
                    autopostback="False"
                    runat="server"
                    text="Отмена">
                    <ClientSideEvents Click="athleteContactInfo.Cancel" />
                </dx:aspxbutton>
            </div>

        </div>
