<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Md5Test.ascx.cs" Inherits="MFKSHelper.md5.Md5Test" %>
<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<style>
    .blindword-input-block{
        display:flex;
        align-items:center;
    }
    .red{
        color:red;
        font-size:14px;
        font-family: "Roboto Regular", Helvetica, "Droid Sans", Tahoma, Geneva, sans-serif;
        font-weight:normal;
    }
    .green{
        color:green;
        font-size:14px;
        font-family: "Roboto Regular", Helvetica, "Droid Sans", Tahoma, Geneva, sans-serif;
        font-weight:normal;
    }
    .caption-style{
        min-width:auto;
        width:auto;
    }
    .layout-group td div{
        margin-bottom:3px;
    }
</style>

<script>
    var passwordMinLength = 8;
    var ratingValue = 0;

    function GetPasswordStrength(password) {
        var result = 0;
        if (password) {
            result++;
            if (password.length >= passwordMinLength) {
                if (/[a-z]/.test(password))
                    result++;
                if (/[A-Z]/.test(password))
                    result++;
                if (/\d/.test(password))
                    result++;
                if (!(/^[a-z0-9]+$/i.test(password)))
                    result++;
                if (!(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/i.test(password)))
                    result += 11;
            }
        }
        return result;
    }

    function ApplyPasswordStrength(value) {
        var lblMessage = document.getElementById('lblNewBlindwordMessage');
        ratingValue = value;
        if (value == 0)
            lblMessage.classList.add('hidden');
        else {
            lblMessage.classList.remove('hidden');
            
        }

        if (ratingValue > 2) {
            lblMessage.classList.remove('red');
            lblMessage.classList.add('green');
        }
        else {
            lblMessage.classList.remove('green');
            lblMessage.classList.add('red');
        }

        if (value >= 10) {
            lblMessage.innerText = "Пароль не соответствует требованиям";
            return;
        }
        
        switch (value) {
            case 0:
                lblMessage.innerText ="Пароль безопасный";
                break;
            case 1:
                lblMessage.innerText ="Слишком простой";
                break;
            case 2:
                lblMessage.innerText ="Не безопасный";
                break;
            case 3:
                lblMessage.innerText = "Норма";
                
                break;
            case 4:
                lblMessage.innerText ="Безопасный";
                break;
            case 5:
                lblMessage.innerText ="Пароль безопасный";
                break;
            default:
                lblMessage.innerText ="Пароль безопасный";
        }

        
    }

    function ApplyCurrentPasswordStrength(s, e) {
        var password = tbNewBlindword.GetText();
        var passwordStrength = GetPasswordStrength(password);
        ApplyPasswordStrength(passwordStrength);
    }

    function OnPassValidation(s, e) {
        var lblMsgAccept = document.getElementById('lblNewBlindwordAcceptMessage');

        var errorText = GetErrorText(s);
        if (errorText) {
            lblMsgAccept.classList.remove('hidden');
            e.isValid = false;
            lblMsgAccept.innerText = errorText;
            btnAccept.SetEnabled(false);
        }
        else {
            lblMsgAccept.classList.add('hidden');
            e.isValid = true;
            e.errorText = '';
            if (tbNewBlindwordAccept.GetText() != '')
                btnAccept.SetEnabled(true);
        }
    }

    function GetErrorText(editor) {
        if (editor === tbNewBlindword) {
            //if (ratingValue === 1)
            //    return "Слишком простой пароль";
        } else if (editor === tbNewBlindwordAccept) {
            if (tbNewBlindword.GetText() !== tbNewBlindwordAccept.GetText() )
            {
                console.log('boom');
                return "Пароли не совпадают";
            }
        }
        return "";
    }

    function HashPwdwithSalt(salt) {

        var clientHash = hex_md5(tbBlindword.GetValue() + salt);
        var signSuccess = document.getElementById('blindword-success-sign');
        var signFail = document.getElementById('blindword-fail-sign');
        var lblMessage = document.getElementById('lblMessage');

        if (tbBlindword.GetText() != "") {
            


            if (clientHash == tbBlindword.cpBlindword) {
                lblMessage.innerText = 'Пароль подтвержден';
                lblMessage.classList.add('green');

                signSuccess.classList.remove("hidden");
                signFail.classList.add('hidden');
                tbBlindword.SetEnabled(false);
                tbNewBlindword.SetEnabled(true);
                tbNewBlindwordAccept.SetEnabled(true);
                tbNewBlindword.Focus();
            }
            else {
                signSuccess.classList.add("hidden");
                signFail.classList.remove('hidden');
                lblMessage.classList.add('red');
                lblMessage.innerText = 'Не верный пароль';
            }
        }
        else {
            lblMessage.innerText = '';
            signSuccess.classList.add('hidden');
            signFail.classList.add('hidden');
        }

    }

</script>



<dx:ASPxCallbackPanel ID="cpBlindwordValidation" ClientInstanceName="cpBlindwordValidation" runat="server"  OnCallback="cpBlindwordValidation_Callback">
    <PanelCollection>
        <dx:PanelContent>

            <dx:ASPxFormLayout 
                ID="authorizationFormLayout" 
                ClientInstanceName="authorizationFormLayout"
                runat="server" 
                AlignItemCaptionsInAllGroups="True"
                Width="100%" 
                CssClass="layout-group">
                <Items>
                    <dx:LayoutGroup Caption="Подтверждение текущего пароля" GroupBoxDecoration="Box" SettingsItemCaptions-HorizontalAlign="Right" ColCount="1">
                        <Items>
                                <dx:LayoutItem Caption="Текущий пароль:" Paddings-Padding="3px">  
                                <LayoutItemNestedControlCollection>  
                                    <dx:LayoutItemNestedControlContainer> 

                                        <div class="blindword-input-block">
                                            <dx:ASPxTextBox
                                                ID="tbBlindword"
                                                ClientInstanceName="tbBlindword"
                                                runat="server"
                                                Password="true"
                                                Width="100%"
                                                OnCustomJSProperties="tbBlindword_CustomJSProperties">
                                            </dx:ASPxTextBox>
                                            <span id="blindword-success-sign" class="glyphicon glyphicon-ok hidden" aria-hidden="true" style="color: green; margin-left: 5px;"></span>
                                            <span id="blindword-fail-sign" class="glyphicon glyphicon-remove hidden" aria-hidden="true" style="color: red; margin-left: 5px;"></span>

                                        </div>
                                        <label id="lblMessage"></label>

                                    </dx:LayoutItemNestedControlContainer>  
                                </LayoutItemNestedControlCollection>  
                            </dx:LayoutItem>  
                        </Items>
                        <SettingsItemCaptions HorizontalAlign="Right"></SettingsItemCaptions>
                    </dx:LayoutGroup>
                    <dx:LayoutGroup Caption="Установка нового пароля " GroupBoxDecoration="Box" SettingsItemCaptions-HorizontalAlign="Right" ColCount="1" Paddings-Padding="5px">
                        <Items>
                            <dx:LayoutItem 
                                Caption="Введите новый пароль: " Paddings-Padding="3px">  
                                <CaptionSettings AllowWrapCaption="True" HorizontalAlign="Right" VerticalAlign="Middle" />
                                <CaptionCellStyle CssClass="caption-style"></CaptionCellStyle>
                                <LayoutItemNestedControlCollection>  
                                    <dx:LayoutItemNestedControlContainer> 
                                        <dx:ASPxTextBox ID="tbNewBlindword"
                                            ClientInstanceName="tbNewBlindword"
                                            Password="true"
                                            runat="server"
                                            Width="100%"
                                            ClientEnabled="false"
                                            AutoPostBack="false">
                                            <ClientSideEvents Init="ApplyCurrentPasswordStrength" KeyUp="ApplyCurrentPasswordStrength" />
                                            <ValidationSettings Display="Dynamic" ErrorDisplayMode="Text" ErrorTextPosition="Bottom"
                                                SetFocusOnError="True">
                                                <RequiredField ErrorText="Обязательное поле" IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
                                        <label id="lblNewBlindwordMessage" class="hidden red"></label>

                                    </dx:LayoutItemNestedControlContainer>  
                                </LayoutItemNestedControlCollection>  
                            </dx:LayoutItem>  
                            
                            <dx:LayoutItem Caption="Подтвердите пароль:">  
                                <LayoutItemNestedControlCollection>  
                                    <dx:LayoutItemNestedControlContainer> 

                                        <dx:ASPxTextBox
                                            ID="tbNewBlindwordAccept"
                                            ClientInstanceName="tbNewBlindwordAccept"
                                            Password="true"
                                            runat="server"
                                            Width="100%"
                                            ClientEnabled="false"
                                            AutoPostBack="false">
                                            <ValidationSettings
                                                Display="Dynamic"
                                                ErrorDisplayMode="Text"
                                                ErrorTextPosition="Bottom"
                                                SetFocusOnError="True">
                                                <RequiredField ErrorText="Обязательное поле" IsRequired="True" />
                                            </ValidationSettings>
                                            <ClientSideEvents Validation="OnPassValidation" KeyUp="OnPassValidation" GotFocus="OnPassValidation" />
                                        </dx:ASPxTextBox>
                                        <label id="lblNewBlindwordAcceptMessage" class="hidden red" Text="dkdkddk"></label>
                                    </dx:LayoutItemNestedControlContainer>  
                                </LayoutItemNestedControlCollection>  
                            </dx:LayoutItem>

                            

                        </Items>
                        <SettingsItemCaptions HorizontalAlign="Right" AllowWrapCaption="True"></SettingsItemCaptions>
                    </dx:LayoutGroup>
                    <dx:LayoutGroup Caption="Требования к Паролю" GroupBoxDecoration="Default" CssClass="layout-group">
                        <Items>
                            <dx:LayoutItem ShowCaption="False" Paddings-Padding="3px" >  
                                <LayoutItemNestedControlCollection>  
                                    <dx:LayoutItemNestedControlContainer> 
                           
                                        <span>Длина пароля должна быть не менее 8 символов, содержать хотя бы одну буквы в верхнем, нижнем регистре, цифру и специальный символ (@,$,!,%,*,?,&)</span>

                                        </dx:LayoutItemNestedControlContainer>  
                                </LayoutItemNestedControlCollection>  
                            </dx:LayoutItem>
                        </Items>
                    </dx:LayoutGroup>
                    <dx:LayoutGroup  GroupBoxDecoration="None" SettingsItemCaptions-HorizontalAlign="Right"  HorizontalAlign="Right">
                        <Items>
                            <dx:LayoutItem ShowCaption="False" RowSpan="2">  
                                <LayoutItemNestedControlCollection>  
                                    <dx:LayoutItemNestedControlContainer> 

                                        <dx:ASPxButton ID="btnAccept" ClientInstanceName="btnAccept" runat="server" Text="Подтвердить" ClientEnabled="false" AutoPostBack="false">
                                            <ClientSideEvents Click="function(s,e){  cpBlindwordValidation.PerformCallback('validate');  }" />
                                        </dx:ASPxButton>
                                        <dx:ASPxButton ID="btnCancel" ClientInstanceName="btnCancel" runat="server" Text="Отмена" AutoPostBack="false"></dx:ASPxButton>

                                     </dx:LayoutItemNestedControlContainer>  
                                </LayoutItemNestedControlCollection>  
                            </dx:LayoutItem>
                            </Items>
                        <SettingsItemCaptions HorizontalAlign="Right"></SettingsItemCaptions>
                    </dx:LayoutGroup>

                </Items>
            </dx:ASPxFormLayout>
            
            <br />
            Component time: <dx:ASPxLabel ID="lblComponentTime" ClientInstanceName="lblComponentTime" runat="server" Text=" "></dx:ASPxLabel>
        </dx:PanelContent>
    </PanelCollection>
</dx:ASPxCallbackPanel>

