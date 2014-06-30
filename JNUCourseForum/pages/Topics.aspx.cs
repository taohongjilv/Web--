using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Topics : System.Web.UI.Page
{
    
    protected void Page_Load(string topic, EventArgs e)
    {
        
        //string roomid = Request.QueryString["roomid"];
        //int id = Convert.ToInt32(roomid);
        /*
        string constr = "Data Source=lyl;Initial Catalog=DISCUSSROOM2;User ID=sa;Password=12345qwe";
        string str = "select *from Topic where DiscussRoomID=" + roomid;

        SqlConnection con = new SqlConnection(constr);
        con.Open();
        SqlDataAdapter sda = new SqlDataAdapter(str, constr);
        DataSet ds = new DataSet();

        sda.Fill(ds, "Topic");
        repeater.DataSource = ds;
        repeater.DataBind();
        con.Close();
*/
    }

}