<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AthleteAntroInfo.ascx.cs" Inherits="MFKSHelper.SpeedRun.Element.AthleteAntroInfo" %>
<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:PlaceHolder runat="server">
    <%: Scripts.Render("~/bundles/antroInfo") %>
</asp:PlaceHolder>

 <div class="main-content-container">

            <div class="row">
                                            <div class="col-sm-3">
                                                <dx:ASPxSpinEdit
                                                    ID="tbAnthropometric_growth"
                                                    ClientInstanceName="tbAnthropometric_growth"
                                                    runat="server"
                                                    AutoResizeWithContainer="True"
                                                    Caption="Рост (см)"
                                                    MaxLength="20"
                                                    MaxValue="500"
                                                    MinValue="0"
                                                    NullText="(Не указано)"
                                                    NullTextDisplayMode="UnfocusedAndFocused"
                                                    Width="100%"
                                                    CssClass="max-width-200"
                                                    NumberType="Float"
                                                    AllowMouseWheel="false"
                                                    ViewStateMode="Disabled"
                                                    >
                                                    <ValidationSettings ErrorTextPosition="Bottom"></ValidationSettings>
                                                    <CaptionSettings Position="Top" />
                                                    <CaptionCellStyle>
                                                        <Paddings PaddingBottom="0px" />
                                                    </CaptionCellStyle>
                                                    <CaptionStyle Font-Bold="True">
                                                    </CaptionStyle>
                                                </dx:ASPxSpinEdit>


                                            </div>
                                            <div class="col-sm-3">

                                                <dx:ASPxSpinEdit
                                                    ID="tbAnthropometric_weight"
                                                    ClientInstanceName="tbAnthropometric_weight"
                                                    runat="server"
                                                    AutoResizeWithContainer="True"
                                                    Caption="Вес (кг)"
                                                    MaxLength="20"
                                                    NullText="(Не указано)"
                                                    NullTextDisplayMode="UnfocusedAndFocused"
                                                    Width="100%"
                                                    MaxValue="500"
                                                    MinValue="0"
                                                    CssClass="max-width-200"
                                                    NumberType="Float"
                                                    AllowMouseWheel="false"
                                                    ViewStateMode="Disabled"
                                                    >
                                                    <CaptionSettings Position="Top" />
                                                    <CaptionCellStyle>
                                                        <Paddings PaddingBottom="0px" />
                                                    </CaptionCellStyle>
                                                    <CaptionStyle Font-Bold="True">
                                                    </CaptionStyle>
                                                </dx:ASPxSpinEdit>

                                            </div>
                                            <div class="col-sm-6">

                                                <dx:ASPxTextBox
                                                    ID="tbAnthropometric_clothing_size"
                                                    ClientInstanceName="tbAnthropometric_clothing_size"
                                                    runat="server"
                                                    AutoResizeWithContainer="True"
                                                    Caption="Размер костюма"
                                                    MaxLength="1024"
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
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <dx:ASPxSpinEdit
                                                    ID="tbAnthropometric_shoe_size"
                                                    ClientInstanceName="tbAnthropometric_shoe_size"
                                                    runat="server"
                                                    AutoResizeWithContainer="True"
                                                    Caption="Размер обуви (стелька , см)"
                                                    MaxLength="20"
                                                    NullText="(Не указано)"
                                                    NullTextDisplayMode="UnfocusedAndFocused"
                                                    Width="200px"
                                                    NumberType="Float"
                                                    AllowMouseWheel="false"
                                                    MaxValue="500"
                                                    MinValue="0"
                                                    ViewStateMode="Disabled"
                                                    >
                                                    <CaptionSettings Position="Top" />
                                                    <CaptionCellStyle>
                                                        <Paddings PaddingBottom="0px" />
                                                    </CaptionCellStyle>
                                                    <CaptionStyle Font-Bold="True">
                                                    </CaptionStyle>
                                                </dx:ASPxSpinEdit>
                                            </div>
                                            <div class="col-sm-6">

                                                <dx:ASPxTextBox
                                                    ID="tbAnthropometric_cap_size"
                                                    ClientInstanceName="tbAnthropometric_cap_size"
                                                    runat="server"
                                                    AutoResizeWithContainer="True"
                                                    Caption="Размер головного убора (обхват , см)"
                                                    MaxLength="1024"
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
                                            </div>
                                        </div>


            <div id="dvAntroInfoEdit" class="group-edit-buttons" runat="server">
                <dx:aspxbutton
                    id="btAntroInfoStartEdit"
                    clientinstancename="btAntroInfoStartEdit"
                    runat="server"
                    autopostback="False"
                    text="Редактировать">
                    <ClientSideEvents Click="athleteAntroInfo.StartEdit" />
                </dx:aspxbutton>

                <dx:aspxbutton
                    id="btAntroInfoSave"
                    clientinstancename="btAntroInfoSave"
                    autopostback="False"
                    runat="server"
                    text="Сохранить">
                    <ClientSideEvents Click="athleteAntroInfo.Save" />
                </dx:aspxbutton>

                <dx:aspxbutton
                    id="btAntroInfoCancel"
                    clientinstancename="btAntroInfoCancel"
                    autopostback="False"
                    runat="server"
                    text="Отмена">
                    <ClientSideEvents Click="athleteAntroInfo.Cancel" />
                </dx:aspxbutton>
            </div>

        </div>