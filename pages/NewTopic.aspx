<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="NewTopic.aspx.cs" Inherits="NewTopic" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="content">
        <div class="breadcrumbs col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <a class="nav-text" href="#"><span class="glyphicon glyphicon-home" style="color: #000; margin-right: 10px;"></span>Board index</a>&nbsp;&nbsp;     
                <span class="glyphicon glyphicon-hand-right"></span>&nbsp;&nbsp;<a class="nav-text" href="">申请讨论室</a>
        </div>

        <section class="col-xs-12 col-sm-12 col-md-12 col-lg-12" id="postform">

            <h3>Post a new topic</h3>
            <hr />

            <div class="form-group " id="postingbox">
                Subject:<asp:textbox runat="server" id="Subject" width=100% class="" for="subject"></asp:textbox>
                
            </div>
            <div class="form-group" id="message-box">
                <asp:textbox runat="server" id="message" width=100% rows="200" cols="76" tabindex="4" class=" form-control " Height="146px"></asp:textbox>
            </div>
            <div class="form-group">

                <asp:Button runat="server" Text="提 交" OnClick="submit" />

            </div>

        </section>


    </div>

</asp:Content>

