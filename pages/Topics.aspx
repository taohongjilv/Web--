<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Topics.aspx.cs" Inherits="Topics" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="content">
        <div class="breadcrumbs col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <a class="nav-text" href="../pages"><span class="glyphicon glyphicon-home" style="color: #000; margin-right: 10px;"></span>Board index</a>&nbsp;&nbsp;
                <span class="glyphicon glyphicon-hand-right"></span>&nbsp;&nbsp;<a class="nav-text" href="Forums?courseid=<%=Request["courseid"]%>">课程</a>&nbsp;&nbsp;
                <span class="glyphicon glyphicon-hand-right"></span>&nbsp;&nbsp;<a class="nav-text" href="">讨论室</a>
        </div>

        <div class="title col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <h2></h2>
            <!-- NOTE: remove the style="display: none" when you want to have the forum description on the forum body -->
            <div style="display: none !important;">
                Description of 讨论室.
                    <br />
            </div>
        </div>

        <div class="topic-actions col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <div class="buttons">
                <div class="post-icon" title="Post a new topic">
                    <a href="NewTopic?discussroomid=<%=Request["discussroomid"]%>"><span></span>Post a new topic</a>
                </div>
            </div>

            <div class="search-box">
                <form method="get" id="forum-search" action="#">
                    <fieldset>
                        <div class="search-box-inner">
                            <input class="button2" type="submit" value="Search" />
                            <input class="inputbox search tiny" type="text" name="keywords" id="keywords" size="20" value="Search this forum…" onclick="if (this.value == 'Search this forum…') this.value = '';" onblur="if (this.value == '') this.value = 'Search this forum…';" />
                        </div>
                    </fieldset>
                </form>
            </div>


        </div>

        <div class="forum-list col-xs-12 col-sm-12 col-md-12 col-lg-12">

            <asp:Repeater ID="repeater" runat="server" DataSourceID="SqlDataSource3">
                <ItemTemplate>
                    <tr>
                        <td title="No unread posts">
                            <p>
                                <a href="ViewTopic?topicid=<%#DataBinder.Eval(Container.DataItem, "ID")%>&discussroomid=<%=Request["discussroomid"]%>&courseid=<%=Request["courseid"]%>" class="topic-title"><%#DataBinder.Eval(Container.DataItem, "Title")%></a>
                                <br />
                                <img src="image/icon_topic_attach.gif" width="7" height="10" />Posted <a href="" style="color: #AA0000;" class="username-coloured"></a>&raquo; <%#DataBinder.Eval(Container.DataItem, "Posted")%>
                            </p>
                        </td>
                        <td class="post"><span>by <a href="#" style="color: #AA0000;" class="username-coloured"><%#DataBinder.Eval(Container.DataItem, "AuthorName")%></a>
                            <a href="#"></a>
                            <br />
                        </span>
                        </td>
                    </tr>
                </ItemTemplate>
                <HeaderTemplate>
                    <table class="table table-hover">
                        <thead>
                            <tr class="thead">
                                <th>Topics</th>


                                <th class="post"><span>published</span>
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                </HeaderTemplate>

                <FooterTemplate>
                    </tbody>
            </table>
                </FooterTemplate>
            </asp:Repeater>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DiscussRoomConnectionString4 %>" SelectCommand="SELECT * FROM [Topic] WHERE ([DiscussRoomID] = @DiscussRoomID)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="DiscussRoomID" QueryStringField="discussroomid" Type="Int32" />
                </SelectParameters>

            </asp:SqlDataSource>
        </div>

        <div class="topic-actions col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <div class="buttons">
                <div class="post-icon" title="Post a new topic">
                    <a href="NewTopic"><span></span>Post a new topic</a>
                </div>
            </div>

        </div>
    </div>
    <div class="statistics col-xs-12 col-sm-12 col-md-12 col-lg-12">
        <h3 class="dark-header">JNU</h3>
        <div class="dark-header-content"></div>
    </div>
</asp:Content>

