using DevExpress.Web;
using MFKSHelper.Classes.Main;
using MFKSHelper.Extensions;
using MFKSHelper.SpeedRun.Models;
using System;
using System.Web.UI.WebControls;

namespace MFKSHelper.SpeedRun.Element
{
    public partial class AthleteParentsInfo : System.Web.UI.UserControl, IAthleteCardControl
    {
        public AthleteCardDto AthleteCardDto { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            SetEditEnabled();
        }

        protected void dsAthletes_parents_info_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.Parameters["@AthleteID"].Value = AthleteCardDto.AthleteID;
        }

        public void Refresh()
        {
            cvParents_info.DataBind();
        }

        protected void tbNumbPhone_Load(object sender, EventArgs e)
        {
            ASPxTextBox numb = sender as ASPxTextBox;
            CardViewEditItemTemplateContainer container = numb.NamingContainer as CardViewEditItemTemplateContainer;

            if (!container.CardView.IsNewCardEditing && container.CardView.IsEditing)
            {
                string phoneNumber = cvParents_info.GetCardValuesByKeyValue(container.KeyValue, "Contact_phone_number").ToString();

                if (string.IsNullOrEmpty(phoneNumber) || phoneNumber.Length < 4)
                {
                    numb.Text = string.Empty;
                }
                else
                {
                    int startIndex = ((phoneNumber[0] != '+') ? 1 : 2) + 3;
                    numb.Text = phoneNumber.Substring(startIndex);
                }
            }
        }

        protected void cbPhoneIndex_Load(object sender, EventArgs e)
        {
            ASPxComboBox combo = sender as ASPxComboBox;
            CardViewEditItemTemplateContainer container = combo.NamingContainer as CardViewEditItemTemplateContainer;

            if (!container.CardView.IsNewCardEditing && container.CardView.IsEditing)
            {
                string phoneNumber = cvParents_info.GetCardValuesByKeyValue(container.KeyValue, "Contact_phone_number").ToString();

                if (string.IsNullOrEmpty(phoneNumber))
                {
                    combo.SelectedIndex = -1;
                }
                else
                {
                    int indx = (phoneNumber[0] == '+') ? combo.Items.IndexOfText(phoneNumber.Substring(0, 2)) : combo.Items.IndexOfText(phoneNumber.Substring(0, 1));
                    combo.SelectedIndex = indx;
                }
            }
        }

        protected void tbMainNumbPhone_Load(object sender, EventArgs e)
        {
            ASPxTextBox mainNumb = sender as ASPxTextBox;
            CardViewEditItemTemplateContainer container = mainNumb.NamingContainer as CardViewEditItemTemplateContainer;

            if (!container.CardView.IsNewCardEditing && container.CardView.IsEditing)
            {
                string phoneNumber = cvParents_info.GetCardValuesByKeyValue(container.KeyValue, "Contact_phone_number").ToString();

                if (string.IsNullOrEmpty(phoneNumber))
                {
                    mainNumb.Text = string.Empty;
                }
                else
                {
                    int startIndex = (phoneNumber[0] != '+') ? 1 : 2;
                    int len = (phoneNumber.Length - startIndex - mainNumb.MaxLength);

                    mainNumb.Text = (len > 3) ? phoneNumber.Substring(startIndex, mainNumb.MaxLength) : phoneNumber.Substring(startIndex);
                }
            }
        }

        protected void cvParents_info_CardInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            ASPxCardView card = sender as ASPxCardView;
            ASPxComboBox combo = card.FindEditFormLayoutItemTemplateControl("cbPhoneIndex") as ASPxComboBox;
            ASPxTextBox mainNumb = card.FindEditFormLayoutItemTemplateControl("tbMainNumbPhone") as ASPxTextBox;
            ASPxTextBox numb = card.FindEditFormLayoutItemTemplateControl("tbNumbPhone") as ASPxTextBox;

            e.NewValues["Contact_phone_number"] = (string.IsNullOrEmpty(mainNumb.Text) || string.IsNullOrEmpty(numb.Text)) ? null :
                string.Format("{0}{1}{2}", combo.SelectedItem.Value, mainNumb.Text, numb.Text);
        }


        protected void cvParents_info_CardUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            ASPxCardView card = sender as ASPxCardView;
            ASPxComboBox combo = card.FindEditFormLayoutItemTemplateControl("cbPhoneIndex") as ASPxComboBox;
            ASPxTextBox mainNumb = card.FindEditFormLayoutItemTemplateControl("tbMainNumbPhone") as ASPxTextBox;
            ASPxTextBox numb = card.FindEditFormLayoutItemTemplateControl("tbNumbPhone") as ASPxTextBox;
            e.NewValues["Contact_phone_number"] = (string.IsNullOrEmpty(mainNumb.Text) || string.IsNullOrEmpty(numb.Text)) ? null :
                string.Format("{0}{1}{2}", combo.SelectedItem.Value, mainNumb.Text, numb.Text);
        }

        protected void cvParents_info_CardInserted(object sender, DevExpress.Web.Data.ASPxDataInsertedEventArgs e)
        {
            ASPxCardView card = sender as ASPxCardView;
            card.ShowToastr("Запись добавлена", "Данные о родителях, опекунах, законных представителях", ToasterMessageType.Success);
        }

        protected void cvParents_info_CardUpdated(object sender, DevExpress.Web.Data.ASPxDataUpdatedEventArgs e)
        {
            ASPxCardView card = sender as ASPxCardView;
            card.ShowToastr("Запись изменена", "Данные о родителях, опекунах, законных представителях", ToasterMessageType.Success);
        }

        protected void cvParents_info_CardDeleted(object sender, DevExpress.Web.Data.ASPxDataDeletedEventArgs e)
        {
            ASPxCardView card = sender as ASPxCardView;
            card.ShowToastr("Запись удалена", "Данные о родителях, опекунах, законных представителях", ToasterMessageType.Success);
        }

        protected void BeginLoggableTransact(object sender, SqlDataSourceCommandEventArgs e)
        {
            e.Command.Parameters["@Log_IP"].Value = "";
            e.Command.Parameters["@Log_SessionID"].Value = this.Session.SessionID;
            e.Command.Parameters["@Log_Login"].Value = "stester";
            e.Command.Parameters["@Log_ClientID"].Value = 22;
            e.Command.Parameters["@Log_AuthorisationSessionID"].Value = null;
        }

        protected void dsAthletes_parents_info_Deleting(object sender, SqlDataSourceCommandEventArgs e)
        {
            BeginLoggableTransact(sender, e);
        }

        protected void dsAthletes_parents_info_Inserting(object sender, SqlDataSourceCommandEventArgs e)
        {
            e.Command.Parameters["@AthleteID"].Value = AthleteCardDto.AthleteID;
            BeginLoggableTransact(sender, e);
        }

        protected void dsAthletes_parents_info_Updating(object sender, SqlDataSourceCommandEventArgs e)
        {
            BeginLoggableTransact(sender, e);
        }

        public void SetEditEnabled()
        {
            cvParents_info.SettingsDataSecurity.AllowInsert = AthleteCardDto?.IsEditable ?? false;
            cvParents_info.SettingsDataSecurity.AllowDelete = AthleteCardDto?.IsEditable ?? false;
            cvParents_info.SettingsDataSecurity.AllowEdit = AthleteCardDto?.IsEditable ?? false;
        }
    }
}