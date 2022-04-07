using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MFKSHelper.md5
{
    public partial class Md5Test : System.Web.UI.UserControl
    {
        public string Salt
        {
            get
            {
                return Session["salt"] as string;
            }
            set
            {
                Session["salt"] = value;
            }
        }

        public string BlindHash
        {
            get
            {
                return Session["blindHash"] as string;
            }
            set
            {
                Session["blindHash"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Salt = CreateSalt(5);
                var checkOldBlindwordCommandText = "function(s,e){  HashPwdwithSalt('" + Salt.ToString() + "');  }";
                tbBlindword.ClientSideEvents.KeyUp = checkOldBlindwordCommandText;
            }

            lblComponentTime.Text = DateTime.Now.ToString();
        }

        private string CreateSalt(int size) //Generate the salt via Randon Number Genertor cryptography
        {
            RNGCryptoServiceProvider rng = new RNGCryptoServiceProvider();
            byte[] buff = new byte[size];
            rng.GetBytes(buff);
            return Convert.ToBase64String(buff);
        }

        protected void tbBlindword_CustomJSProperties(object sender, DevExpress.Web.CustomJSPropertiesEventArgs e)
        {
            string password = "q2w3e4r5";
            BlindHash = FormsAuthentication.HashPasswordForStoringInConfigFile(password.ToLower()+Salt, "md5").ToLower();

            e.Properties["cpBlindword"] = BlindHash;
        }
        

        protected void cpBlindwordValidation_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            switch (e.Parameter)
            {
                case "validate":
                    var currentBlindword = tbBlindword.Text;
                    var currentHash = FormsAuthentication.HashPasswordForStoringInConfigFile(currentBlindword.ToLower() + Salt, "md5").ToLower();

                    var flag = (BlindHash == currentHash);
                    var newBlindword = tbNewBlindword.Text;

                    if (flag)
                    {

                    }

                    break;
                default:
                    break;
            }
        }
    }
}