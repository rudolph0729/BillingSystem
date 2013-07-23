﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserSetting.aspx.cs" Inherits="BillingSystem.Views.UserSetting" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="../../Css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="../../Css/css.css" />
    <script type="text/javascript" lang="ja">
        function openUserEditWin(code) {
            //showModalDialog("UserAdd.aspx?Code=" + code, "UserAdd.aspx", 'dialogWidth:300px;dialogHeight:200px;center:yes;help:no;resizable:no;status:no');
            location.replace(" UserSetting.aspx?Code=" + code);
        }

        //function setWidthSize() {
        //    return window.screen.width * 0.2;
        //}

        //function setHeightSize() {
        //    return window.screen.height * 0.2;
        //}
        function displayUserAdddiv() {
            divUserSet.style.display = 'none';
            UserEdit.style.display = "";
            UserQuery.style.display = 'none';
            this.divUserTitle = "用户信息维护--新增";
        }

        function displayUserEditdiv() {
            divUserSet.style.display = 'none';
            UserEdit.style.display = '';
            UserQuery.style.display = 'none';
            this.divUserTitle = "用户信息维护--编辑";
        }

        function displayUserQuery() {
            divUserSet.style.display = 'none';
            UserEdit.style.display = 'none';
            UserQuery.style.display = '';
            this.divUserTitle = "用户信息维护--查询";
        }

        function displayUserSet() {
            divUserSet.style.display = '';
            UserEdit.style.display = 'none';
            UserQuery.style.display = 'none';
            this.divUserTitle = "用户信息维护";
        }
    </script>
</head>
<body>
    <form id="form1" runat="server" style="width: 97%">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="margin-left">
            <div>
                <div id="divUserTitle" style="font-size: 18px;margin-top:5px;">
                    用户信息维护
                </div>
                <br />
                <div id="divUserSet">
                    <div class="row">
                        <div class="span4">
                            <asp:Button runat="server" Text="新增" ID="btnUserAdd" CssClass="btn btn-primary" OnClick="btnUserAdd_Click" />
                            <asp:Button runat="server" Text="高级查询" ID="btnUserQuery" CssClass="btn btn-primary" OnClick="btnUserSelect_Click" />
                        </div>
                    </div>
                </div>
                <div id="UserEdit" class="margin-top">
                    <div class="controls controls-row">
                        <asp:Label ID="Label1" runat="server" Text="用户名:" CssClass="span1" />
                        <asp:TextBox runat="server" ID="txtUserName" CssClass="span2" />
                        <asp:Label ID="Label2" runat="server" Text="IdCode:" CssClass="span1" />
                        <asp:TextBox runat="server" ID="txtIdCode" CssClass="span2" />
                        <asp:Label ID="Label3" runat="server" Text="密码:" CssClass="span1" />
                        <asp:TextBox runat="server" ID="txtPassword" TextMode="Password" CssClass="span2" />
                        <asp:Label ID="Label5" runat="server" Text="角色:" CssClass="span1" />
                        <asp:DropDownList runat="server" ID="dropRole" CssClass="input-span2" />
                    </div>

                    <div class="controls controls-row">
                        <asp:Label ID="Label4" runat="server" Text="邮箱:" CssClass="span1" />
                        <asp:TextBox runat="server" ID="txtEmail" CssClass="span2" />
                        <asp:Label ID="Label6" runat="server" Text="备注:" CssClass="span1" />
                        <asp:TextBox runat="server" ID="txtContent" TextMode="MultiLine" CssClass="span5" />
                        <label class="span1">&nbsp;</label>
                        <div class="span2">
                            <asp:Button runat="server" ID="btnUserEditSave" Text="提交" OnClick="btnUserEditSave_Click" CssClass="btn btn-primary" />
                            <asp:Button runat="server" Text="后退" ID="btnUserEditCanel" OnClick="btnUserEditCanel_Click" CssClass="btn btn-primary" />
                        </div>
                    </div>
                </div>
                <div id="UserQuery">
                    <div class="controls controls-row">
                        <asp:Label ID="Label7" runat="server" Text="用户名称:" CssClass="span1" />
                        <asp:TextBox runat="server" ID="txtUserQueryUserName" CssClass="span2" />
                        <asp:Label ID="Label8" runat="server" Text="IdCode:" CssClass="span1" />
                        <asp:TextBox runat="server" ID="txtUserQueryIdCode" CssClass="span2" />
                        <label class="span1">&nbsp;</label>
                        <div class="span2">
                            <asp:Button runat="server" ID="btnUserQuerySave" Text="查询" CssClass="btn btn-primary" OnClick="btnUserQuerySave_Click" />
                            <asp:Button runat="server" ID="btnUserQueryCancel" Text="后退" CssClass="btn btn-primary" OnClick="btnUserQueryCancel_Click" />
                        </div>
                    </div>
                </div>
            </div>
            <hr />
            <div>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:DataGrid runat="server" AutoGenerateColumns="False" ID="UserListDataGrid" Width="100%" BorderColor="Black" BorderStyle="None" BorderWidth="5px" CellPadding="2" CellSpacing="2" GridLines="Both" Font-Size="Small"
                            HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" ItemStyle-VerticalAlign="Middle" ItemStyle-Font-Size="Small" OnItemCommand="UserListDataGrid_ItemCommand">
                            <AlternatingItemStyle BorderStyle="None" />
                            <Columns>
                                <asp:BoundColumn ReadOnly="true" DataField="Id" HeaderText="Id" Visible="false" ItemStyle-Width="5%" />
                                <asp:HyperLinkColumn HeaderText="Code" DataTextField="Code" DataNavigateUrlField="Code" DataNavigateUrlFormatString="javascript:openUserEditWin('{0}')" ItemStyle-Width="3%" />
                                <asp:BoundColumn ReadOnly="true" DataField="Name" HeaderText="Name" ItemStyle-Width="5%" />
                                <asp:BoundColumn ReadOnly="true" DataField="EMail" HeaderText="EMail" ItemStyle-Width="8%" />
                                <asp:BoundColumn ReadOnly="true" DataField="Role" HeaderText="Role" ItemStyle-Width="5%" />
                                <asp:BoundColumn ReadOnly="true" DataField="Content" HeaderText="Content" ItemStyle-Width="10%" />
                                <asp:TemplateColumn HeaderText="操作" HeaderStyle-HorizontalAlign="Center" FooterStyle-BorderStyle="None" ItemStyle-Width="1%">
                                    <ItemTemplate>
                                        <asp:ImageButton runat="server" ID="btnCardDelete" ImageUrl="~/Images/delete/1.jpg" CommandName="ImageDelete" />
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                </asp:TemplateColumn>
                            </Columns>
                        </asp:DataGrid>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </form>
</body>
</html>