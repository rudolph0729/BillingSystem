﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CardSetting.aspx.cs" Inherits="BillingSystem.Views.CardSetting" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head runat="server">
    <title></title>
    <!--<link rel="stylesheet" type="text/css" href="/Css/css.css"/>-->
    <link rel="stylesheet" type="text/css" href="/Css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="/Css/css.css" />
    <script type="text/javascript" lang="ja">
        function openCardEditWin(Id) {
            //showModalDialog("CardSetting.aspx?CardNumber=" + cardNumber, "CardSetting.aspx", 'dialogWidth:560px;dialogHeight:300px;center:yes;help:no;resizable:no;status:no');
            //sessionStorage.setItem("CardNumber", cardNumber);
            //location.reload(document.referrer);
            location.replace(" CardSetting.aspx?Id=" + Id);
        }

        function DisplaySysdiv() {
            document.getElementById("divSet").style.display = '';
            document.getElementById("cardEdit").style.display = 'none';
            document.getElementById("cardQuery").style.display = 'none';
            document.getElementById("divCardTitle").innerText = "卡信息管理";
        }

        function DisplayCardAdddiv() {
            document.getElementById("divSet").style.display = 'none';
            document.getElementById("cardEdit").style.display = '';
            document.getElementById("cardQuery").style.display = 'none';
            document.getElementById("divCardTitle").innerText = "卡信息管理--新增";
        }

        function DisplayCardQuerydiv() {
            document.getElementById("divSet").style.display = 'none';
            document.getElementById("cardEdit").style.display = 'none';
            document.getElementById("cardQuery").style.display = '';
            document.getElementById("divCardTitle").innerText = "卡信息管理--查询";
        }

        function DisplayCardEditdiv(cardNumber) {

            document.getElementById("divSet").style.display = 'none';
            document.getElementById("cardEdit").style.display = '';
            document.getElementById("cardQuery").style.display = 'none';
            document.getElementById("divCardTitle").innerText = "卡信息管理--编辑";
            //window.opener.location = window.opener.location;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server" style="width: 97%; height: auto;">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="margin-left">
            <div>
                <div id="divCardTitle" style="font-size: 18px;margin-top:5px;">
                    卡信息管理
                </div>
                <br />
                <div id="divSet">
                    <div class="row">
                        <div class="span4">
                            <asp:Button runat="server" Text="新增" ID="btnCardAdd" CssClass="btn btn-primary" OnClick="btnCardAdd_Click" />
                            <asp:Button runat="server" Text="高级查询" ID="btnCardQuery" CssClass="btn btn-primary" OnClick="btnCardQuery_Click" />
                        </div>
                    </div>
                </div>
                <div id="cardEdit" class="margin-top">
                    <div class="controls controls-row">
                        <asp:Label ID="Label16" runat="server" Text="卡号:" CssClass="span1" />
                        <asp:TextBox runat="server" ID="txtAddCardNumber" CssClass="span3" />
                        <label class="span2">&nbsp;</label>
                        <asp:Label ID="Label17" runat="server" Text="账户类型:" CssClass="span1" />
                        <asp:DropDownList runat="server" ID="dropCardAddAccountType" CssClass="span2" />
                        <asp:Label ID="Label18" runat="server" Text="所属银行:" CssClass="span1" />
                        <asp:DropDownList runat="server" ID="dropAddBank" CssClass="span2" />
                    </div>
                    <div class="controls controls-row">
                        <asp:Label ID="Label4" runat="server" Text="卡所有者:" CssClass="span1" />
                        <asp:DropDownList runat="server" ID="dropAddCardOwner" CssClass="span2" />
                        <asp:Label ID="Label6" runat="server" Text="使用者:" CssClass="span1" />
                        <asp:DropDownList runat="server" ID="dropAddCardUser" CssClass="span2" />
                        <asp:Label ID="Label5" runat="server" Text="开户银行:" CssClass="span1" />
                        <asp:TextBox runat="server" ID="txtAddBankName" CssClass="span2" />
                        <asp:Label ID="Label7" runat="server" Text="开户日期:" CssClass="span1" />
                        <asp:TextBox runat="server" ID="txtAddCardOpenDate" CssClass="span2" />
                    </div>
                    <div class="controls controls-row">
                        <asp:Label ID="Label8" runat="server" Text="备注:" CssClass="span1" />
                        <asp:TextBox runat="server" ID="txtCardAddContent" TextMode="MultiLine" CssClass="span8" /><%--"input-xxlarge" --%>
                        <label class="span1">&nbsp;</label>
                        <div class="span2">
                            <asp:Button runat="server" Text="提交" ID="btnCardEditSave" OnClick="btnCardEditSave_Click" CssClass="btn btn-primary" />
                            <asp:Button runat="server" Text="后退" ID="btnCardEditCanel" OnClick="btnCardEditCanel_Click" CssClass="btn btn-primary" />
                        </div>
                    </div>
                </div>
                <div id="cardQuery" class="margin-top">
                    <div class="controls controls-row">
                        <asp:Label ID="Label9" runat="server" Text="卡号:" CssClass="span1" />
                        <asp:TextBox runat="server" ID="txtCardQueryCardNumber" CssClass="span2" />
                        <asp:Label ID="Label12" runat="server" Text="卡使用者:" CssClass="span1" />
                        <asp:DropDownList runat="server" ID="dropCardQueryUser" CssClass="span2" />
                        <asp:Label ID="Label10" runat="server" Text="账户类型:" CssClass="span1" />
                        <asp:DropDownList runat="server" ID="dropCardQueryAccountType" CssClass="span2" />
                        <asp:Label ID="Label11" runat="server" Text="所属银行:" CssClass="span1" />
                        <asp:DropDownList runat="server" ID="dropCardQueryBank" CssClass="span2" />
                    </div>
                    <div class="controls controls-row">
                        <asp:Label ID="Label13" runat="server" Text="开户银行:" CssClass="span1" />
                        <asp:TextBox runat="server" ID="txtCardQueryBankName" CssClass="span2" />
                        <asp:Label ID="Label14" runat="server" Text="开户日期:" CssClass="span1" />
                        <asp:TextBox runat="server" ID="txtCardQueryBOpenDate" CssClass="span2" />
                        <asp:Label ID="Label15" runat="server" Text="到:" CssClass="span1" />
                        <asp:TextBox runat="server" ID="txtCardQueryEOpenDate" CssClass="span2" />
                        <label class ="span1">&nbsp;</label>
                        <div class="span2">
                            <asp:Button runat="server" Text="查询" ID="btnCardQuerySelect" OnClick="btnCardQuerySelect_Click" CssClass="btn btn-primary" />
                            <asp:Button runat="server" Text="后退" ID="btnCardQueryCanel" OnClick="btnCardQueryCanel_Click" CssClass="btn btn-primary" />
                        </div>
                    </div>
                </div>
            </div>
            <hr />
            <div>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:DataGrid runat="server" AutoGenerateColumns="false" ID="CardListDataGrid" Width="100%" BorderColor="Black" BorderStyle="None" BorderWidth="5px" CellPadding="2" CellSpacing="2" GridLines="Both" Font-Size="Small"
                            HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" ItemStyle-VerticalAlign="Middle" ItemStyle-Font-Size="Small" OnDeleteCommand="CardListDataGrid_DeleteCommand">
                            <AlternatingItemStyle BorderStyle="None" />
                            <Columns>
                                <asp:BoundColumn ReadOnly="true" DataField="Id" HeaderText="Id" ItemStyle-Width="5%" Visible="false" />
                                <asp:HyperLinkColumn HeaderText="CardNumber" DataTextField="CardNumber" DataNavigateUrlField="Id" DataNavigateUrlFormatString="javascript:openCardEditWin({0})" ItemStyle-Width="8%" Target="_blank" />
                                <asp:BoundColumn ReadOnly="true" DataField="AccountType" HeaderText="AccountType" ItemStyle-Width="3%" />
                                <asp:BoundColumn ReadOnly="true" DataField="BankId" HeaderText="BankName" ItemStyle-Width="5%" />
                                <asp:BoundColumn ReadOnly="true" DataField="Amount" HeaderText="Amount" ItemStyle-Width="3%" />
                                <asp:BoundColumn ReadOnly="true" DataField="ExpenditureAmount" HeaderText="ExpenditureAmount" ItemStyle-Width="3%" />
                                <asp:BoundColumn ReadOnly="true" DataField="BorrowAmount" HeaderText="BorrowAmount" ItemStyle-Width="3%" />
                                <asp:BoundColumn ReadOnly="true" DataField="IncomeAmount" HeaderText="IncomeAmount" ItemStyle-Width="3%" />
                                <asp:BoundColumn ReadOnly="true" DataField="OwnerName" HeaderText="OwnerName" ItemStyle-Width="5%" />
                                <asp:BoundColumn ReadOnly="true" DataField="UserName" HeaderText="UserName" ItemStyle-Width="5%" />
                                <asp:ButtonColumn HeaderText="操作" Text="Delete" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="3%" CommandName="Delete" />
                                <%--<asp:TemplateColumn HeaderText="操作" HeaderStyle-HorizontalAlign="Center" FooterStyle-BorderStyle="None" ItemStyle-Width="8%">
                            <ItemTemplate>
                                <asp:ImageButton runat ="server" ImageUrl="~/Images/delete/1.jpg" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:ImageButton ID="btnCardDelete" runat="server" />
                            </EditItemTemplate>
                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                        </asp:TemplateColumn>--%>
                            </Columns>
                        </asp:DataGrid>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </form>
</body>
</html>