﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Site.master" AutoEventWireup="true" CodeFile="ApplyList.aspx.cs" Inherits="Teacher_ApplyList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHoldermainContent" Runat="Server">
    <h3 style="color: #FF3300">所有待审核的讨论室</h3>
    

    <asp:ListView ID="ListView1" runat="server" DataKeyNames="ApplyID" 
        DataSourceID="SqlDataSource1">
        <AlternatingItemTemplate>
            <span style="background-color: #FFF8DC;">讨论室编号：
            <asp:Label ID="ApplyIDLabel" runat="server" Text='<%# Eval("ApplyID") %>' />
            <br />
            申请人：
            <asp:Label ID="ApplyerLabel" runat="server" Text='<%# Eval("Applyer") %>' />
            <br />
           
            讨论室名称：
            <asp:Label ID="NameOfRoomLabel" runat="server" 
                Text='<%# Eval("NameOfRoom") %>' />
            <br />
            申请理由：
            <asp:Label ID="AddInfoLabel" runat="server" Text='<%# Eval("AddInfo") %>' />
            <br />
            申请时间：
            <asp:Label ID="BuildTimeLabel" runat="server" Text='<%# Eval("BuildTime") %>' />
            <br />
            <br />
            </span>
        </AlternatingItemTemplate>

        <EditItemTemplate>
            <span style="background-color: #008A8C;color: #FFFFFF;">ApplyID:
            <asp:Label ID="ApplyIDLabel1" runat="server" Text='<%# Eval("ApplyID") %>' />
            <br />
            Applyer:
            <asp:TextBox ID="ApplyerTextBox" runat="server" Text='<%# Bind("Applyer") %>' />
            <br />
            <asp:CheckBox ID="ApplyStateCheckBox" runat="server" 
                Checked='<%# Bind("ApplyState") %>' Text="ApplyState" />
            <br />
            NameOfRoom:
            <asp:TextBox ID="NameOfRoomTextBox" runat="server" 
                Text='<%# Bind("NameOfRoom") %>' />
            <br />
            AddInfo:
            <asp:TextBox ID="AddInfoTextBox" runat="server" Text='<%# Bind("AddInfo") %>' />
            <br />
            BuildTime:
            <asp:TextBox ID="BuildTimeTextBox" runat="server" 
                Text='<%# Bind("BuildTime") %>' />
            <br />
            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="更新" />
            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="取消" />
            <br />
            <br />
            </span>
        </EditItemTemplate>

        <EmptyDataTemplate>
            <span>未返回数据。
            <br/>目前没有待审核的讨论室友！</span>
        </EmptyDataTemplate>
        
        <ItemTemplate>
       
            <span style="background-color: #DCDCDC;color: #000000;">讨论室编号：
            <asp:Label ID="ApplyIDLabel" runat="server" Text='<%# Eval("ApplyID") %>' />
            <br />
            申请人：
            <asp:Label ID="ApplyerLabel" runat="server" Text='<%# Eval("Applyer") %>' />
            <br />
            
            讨论室名称：
            <asp:Label ID="NameOfRoomLabel" runat="server" 
                Text='<%# Eval("NameOfRoom") %>' />
            <br />
            申请理由：
            <asp:Label ID="AddInfoLabel" runat="server" Text='<%# Eval("AddInfo") %>' />
            <br />
            申请时间：
            <asp:Label ID="BuildTimeLabel" runat="server" Text='<%# Eval("BuildTime") %>' />
            <br />
            <br />
            </span>
        </ItemTemplate>

        <LayoutTemplate>
            <div ID="itemPlaceholderContainer" runat="server" 
                style="font-family: Verdana, Arial, Helvetica, sans-serif;">
                <span runat="server" id="itemPlaceholder" />
            </div>
            <div style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                <asp:DataPager ID="DataPager1" runat="server" PageSize="5">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                            ShowNextPageButton="False" ShowPreviousPageButton="False" />
                        <asp:NumericPagerField />
                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" 
                            ShowNextPageButton="False" ShowPreviousPageButton="False" />
                    </Fields>
                </asp:DataPager>
            </div>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <span style="background-color: #008A8C;font-weight: bold;color: #FFFFFF;">
            ApplyID:
            <asp:Label ID="ApplyIDLabel" runat="server" Text='<%# Eval("ApplyID") %>' />
            <br />
            Applyer:
            <asp:Label ID="ApplyerLabel" runat="server" Text='<%# Eval("Applyer") %>' />
            <br />
            <asp:CheckBox ID="ApplyStateCheckBox" runat="server" 
                Checked='<%# Eval("ApplyState") %>' Enabled="false" Text="ApplyState" />
            <br />
            NameOfRoom:
            <asp:Label ID="NameOfRoomLabel" runat="server" 
                Text='<%# Eval("NameOfRoom") %>' />
            <br />
            AddInfo:
            <asp:Label ID="AddInfoLabel" runat="server" Text='<%# Eval("AddInfo") %>' />
            <br />
            BuildTime:
            <asp:Label ID="BuildTimeLabel" runat="server" Text='<%# Eval("BuildTime") %>' />
            <br />
            <br />
            </span>
        </SelectedItemTemplate>
        <ItemSeparatorTemplate>
        <table border="0" cellpadding="5" cellspacing="1" width="100%" style=" margin:6px;">
                           <tr  class="dot" >-------------------------------------------------------------------------------</tr></table>
        </ItemSeparatorTemplate>

</asp:ListView>


    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:DISCUSSROOM2ConnectionString %>" 
    SelectCommand="SELECT * FROM [Apply]"></asp:SqlDataSource>

</asp:Content>


