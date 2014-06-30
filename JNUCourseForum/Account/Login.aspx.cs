using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Account_Login : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        RegisterHyperLink.NavigateUrl = "Register";
        OpenAuthLogin.ReturnUrl = Request.QueryString["ReturnUrl"];

        var returnUrl = HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
        if (!String.IsNullOrEmpty(returnUrl))
        {
            RegisterHyperLink.NavigateUrl += "?ReturnUrl=" + returnUrl;
        }
    }
    protected void login(object sender, EventArgs e)
    {
        if (!Membership.ValidateUser(this.UserName.Text, this.Password.Text))
        {
            FailureText.Text = "用户名或密码不正确,请检查.";
            panel1.Visible = true;
            return;
        }

        //!!!验证的授权机制
        FormsAuthentication.SetAuthCookie(this.UserName.Text, true);
        Response.Redirect("~/pages/Forums.aspx");
    }
}