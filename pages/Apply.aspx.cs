﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
public partial class Student_Apply : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void tijiao_Click(object sender, EventArgs e)
    {
        string url = HttpContext.Current.Request.Url.ToString();
        string course = url.Substring(url.IndexOf("=") + 1, 1);
        int courseId=0;
        if (int.Parse(RadioButtonList1.SelectedValue) == 1)
            courseId = 1;
        else if (int.Parse(RadioButtonList1.SelectedValue) == 2)
            courseId = 2;
        else if (int.Parse(RadioButtonList1.SelectedValue) == 3)
            courseId = 3;
        else if (int.Parse(RadioButtonList1.SelectedValue) == 4)
            courseId = 4;
        else if (int.Parse(RadioButtonList1.SelectedValue) == 5)
            courseId = 5;

        String accountName = zhanghao.Text;
        String discussroomTitle = mingcheng.Text;
        String addInfo = liuyan.Text;
        DateTime time = DateTime.Now;
        Boolean applyState = false;
        Boolean checkState = false;

        string connection = WebConfigurationManager.ConnectionStrings["DiscussRoomConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection(connection);
        conn.Open();

        SqlCommand cmd = new SqlCommand("insert into Apply(ApplyState,NameOfRoom,AddInfo,BuildTime,CheckState,CourseId) values('" + applyState + "','" + discussroomTitle + "','" + addInfo + "','" + time + "','" + checkState + "','" + courseId + "')", conn);
        cmd.ExecuteNonQuery();
      //  
        string newTopic = "Forums?courseid=" + course;
       // Response.Redirect("Apply.aspx");
       // Response.Write("<script> alert('提交成功')</script>");
        Page.ClientScript.RegisterStartupScript(ClientScript.GetType(), "", "<script>alert('提交成功');location.href='Apply.aspx';</script>");
        conn.Close();
        Response.Redirect(newTopic);
    }
}