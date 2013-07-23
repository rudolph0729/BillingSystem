﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BillingSystemMainPage.aspx.cs" Inherits="BillingSystem.Views.BillingSystemMainPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style3 {
            width: 80px;
            height: 27px;
        }

        .auto-style4 {
            height: 30px;
        }

        .auto-style5 {
            width: 173px;
        }
    </style>
</head>
<body>
    <form id="form1" style="width: 100%; height: 100%;" runat="server">
        <div style="height: 8%; width: 100%; background-color: #3D3D3D;">
            <div style="width: 100%; height: 90.5px;">
                <iframe id="Iframe1" style="width: 100%; height: 90.5px;" frameborder="0" src="Default.aspx"></iframe>
            </div>
            <div style="width: 100%; background-color: #cccfd2; text-align: right; vertical-align: central; height: 30px;">
                <div style="width: 90%; height: 30px; float: left; vertical-align: central">
                    <asp:Label runat="server" align="right" BorderStyle="None" ID="labWel"></asp:Label>
                </div>
                <div style="width: 10%; height: 30px; float: left;">
                    <asp:Button ID="btn_exit" runat="server" Text="Exit" Width="82px" BackColor="#cccfd2" BorderStyle="None" OnClick="btn_exit_Click" /><%--BorderColor="#000CCC"--%>
                </div>
            </div>
        </div>
        <div style="width: 100%; height: 100%;">
            <div style="width: 12%; height: 100%; float: left;">
                <div style="width: 100%; height: 30px;">
                    导航
                </div>
                <div style="width: 100%; height: auto;">
                    <asp:TreeView ID="tree" runat="server" Height="100%" ImageSet="Arrows" Width="100%"
                        EnableTheming="True" ForeColor="Blue" ShowCheckBoxes="Parent">
                        <Nodes>
                            <asp:TreeNode Text="系统设置" Value="system" Target="content">
                                <asp:TreeNode Text="卡信息维护" Value="卡信息维护" NavigateUrl="~/Views/SystemSetting/CardSetting.aspx" Target="content" />
                                <asp:TreeNode Text="用户信息维护" Value="用户信息维护" NavigateUrl="~/Views/SystemSetting/UserSetting.aspx" Target="content" />
                            </asp:TreeNode>
                            <asp:TreeNode Text="收入管理" Value="InCome" Target="content">
                                <asp:TreeNode Text ="收入管理" Value="收入管理" NavigateUrl ="~/views/InCome/InCome.aspx" Target="content" />
                            </asp:TreeNode>
                            <asp:TreeNode Text="支出管理" Value="Expenses" Target="content">
                                <asp:TreeNode Text ="支出管理" Value="支出管理" NavigateUrl="~/Views/Expenses/Expenses.aspx" Target ="content" />
                            </asp:TreeNode>
                            <asp:TreeNode Text="资产管理" Value="asset_management" Target="content"></asp:TreeNode>
                        </Nodes>
                        <HoverNodeStyle BackColor="#0099FF" />
                        <SelectedNodeStyle BackColor="SkyBlue" />
                    </asp:TreeView>
                </div>
            </div>
            <div style="width: 87%; height: auto; float: left;">
                <iframe id="content" style="width: 100%; height: 100%;">
                   
                </iframe>
            </div>
        </div>
    </form>
</body>
</html>