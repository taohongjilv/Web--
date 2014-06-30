using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class NewTopic : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void submit(object sender, EventArgs e)
    {
        string subject = Subject.Text;
        string messa = message.Text;
        string url = HttpContext.Current.Request.Url.ToString();
        string roomid = url.Substring(url.IndexOf("=") + 1, 1);

        int i = 1;

        string connection = WebConfigurationManager.ConnectionStrings["DiscussRoomConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection(connection);
        conn.Open();
        

        string connection2 = WebConfigurationManager.ConnectionStrings["DiscussRoomConnectionString"].ConnectionString;
        SqlConnection conn2 = new SqlConnection(connection2);
        conn2.Open();
        string sql2 = "insert into Topic (DiscussRoomID, Title) values(" + roomid + ",'" + subject + "')";
        SqlCommand cmd2 = new SqlCommand(sql2, conn2);
        cmd2.ExecuteNonQuery();
        string newTopic = "Topics?discussroomid=" + roomid;

        string ifin = "select distinct id from Topic order by id ASC";
        SqlCommand cmd3 = new SqlCommand(ifin, conn);
        SqlDataReader reader = cmd3.ExecuteReader();
        while (reader.Read())
        {
            i = Convert.ToInt32(reader[0].ToString());
        }
        i++;

        string sql = "insert into Message (TopicID,postBody) values(" + i +",'" + messa + "')";
        SqlCommand cmd = new SqlCommand(sql, conn2);
        cmd.ExecuteNonQuery();
        reader.Close();

        
        
        Response.Redirect(newTopic);

        //conn.Close();
        
    }
}