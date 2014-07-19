using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ClassLibrary;

namespace WebApp
{
    public partial class EncryptDecryptTryIt : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void EncButton_Click(object sender, EventArgs e)
        {
            String cipher = EncryptionDecryption.Encrypt(EncTextBox.Text);
            EncResult.Text = cipher;
        }

        protected void DecButton_Click(object sender, EventArgs e)
        {
            String plain = EncryptionDecryption.Decrypt(DecTextBox.Text);
            DecResult.Text = plain;
        }
    }
}