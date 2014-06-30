using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewTopic : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string an = "<p><div class='container'><textarea cols='120' rows='15' name='con' id='con'></div></textarea></p>";
        Control ct2 = ParseControl(an);
        PlaceHolder1.Controls.Add(ct2);
    }
    protected void submit2_Click(object sender, EventArgs e)
    {
        string url = HttpContext.Current.Request.Url.ToString();
        string topic =url.Substring(url.IndexOf("=")+1, 1);
        string[] ss = Request.Form.GetValues("con");
        string connection = WebConfigurationManager.ConnectionStrings["DiscussRoomConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection(connection);
        conn.Open();
        string sql = "insert into Message (TopicId, postBody,AuthorName,Posted) values(" + topic + ",'" + ss[0] + "','2011052406','" + DateTime.Now.ToString() + "')";
        SqlCommand cmd = new SqlCommand(sql, conn);
        cmd.ExecuteNonQuery();
        Response.Redirect(url);
    }
}