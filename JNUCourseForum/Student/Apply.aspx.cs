using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class Student_Apply : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void tijiao_Click(object sender, EventArgs e)
    {
        String accountName = zhanghao.Text;
        String discussroomTitle = mingcheng.Text;
        String addInfo = liuyan.Text;
        DateTime time = DateTime.Now;
        Boolean applyState = false;
        SqlConnection con = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString.ToString());
        
        con.Open();

        SqlCommand cmd = new SqlCommand("insert into Apply(Applyer,ApplyState,NameOfRoom,AddInfo,BuildTime) values('" + accountName + "','" + applyState + "','" +discussroomTitle + "','" + addInfo + "','" + time + "')", con);
        cmd.ExecuteNonQuery();
      //  
        
       // Response.Redirect("Apply.aspx");
       // Response.Write("<script> alert('提交成功')</script>");
        Page.ClientScript.RegisterStartupScript(ClientScript.GetType(), "", "<script>alert('提交成功');location.href='Apply.aspx';</script>");
        con.Close();

    }
}