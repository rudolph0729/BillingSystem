﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Borrowed.aspx.cs" Inherits="BillingSystem.Views.Borrowed" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="../../Css/css.css" />
    <link rel="stylesheet" type="text/css" href="../../Css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="../../Css/jquery-ui-1.10.3.custom.min.css" />
    <script type="text/javascript" src="../../Scripts/jquery-2.0.3.min.js"></script>
    <script type="text/javascript" src="../../Scripts/borrow-jquery.js"></script>
    <script type="text/javascript" src="../../Scripts/jquery-ui-1.10.3.custom.min.js"></script>
</head>

<body>
    <form id="form1" runat="server" style="width: 100%;">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div>
            <div>
                <div id="divBorrowTitle" class="title">
                    借入管理
                </div>
                <div id="divSet" style="margin-top:5px;margin-left:5px;height:20px;vertical-align:middle;">
                    <div class="row">
                        <div class="span1" onclick="DisplayAddBorrowdiv()">
                            <img src="../Image/add2_16.png" title="新增" />
                            <input type="button" style="border:none;background-color:transparent;" value="新增" />
                        </div>
                        <div style="border-right-color:red;border-left-color:red;width:2px;font-size:20px;" class="span1">|</div>
                        <div style="margin-left:3px;width:90px;float:left" onclick="DisplayQueryBorrowdiv()">
                            <img src="../Image/query1_16.png" title="高级查询" />
                            <input type="button" style="border:none;background-color:transparent;" value="高级查询" />
                        </div>
                        <div style="border-right-color:red;border-left-color:red;width:2px;font-size:22px;" class="span1">|</div>
                    </div>
                </div>
                <hr style="border-color:#cccfd2;margin-top:10px;" />
                <div id="BorrowEdit" class="margin-top">
                    <div class="controls controls-row">
                        <asp:Label runat="server" Text="借入方式：" CssClass="span1" />
                    </div>
                    <div class="controls controls-row">
                        <asp:RadioButtonList ID="RadioBorrowAddBorrowType" runat="server" RepeatDirection="Horizontal" CssClass="span2">
                            <asp:ListItem Value="1">现金</asp:ListItem>
                            <asp:ListItem Value="2">刷卡</asp:ListItem>
                        </asp:RadioButtonList>
                        <label class="span1">&nbsp;</label>

                        <asp:HiddenField ID="HiddenField1" runat="server" />
                    </div>
                    <div class="controls controls-row">
                        <asp:Label ID="Label1" runat="server" Text="借款人:" CssClass="span1" />
                        <asp:TextBox runat="server" ID="txtBorrowAddBorrower" CssClass="span2" />
                        <div runat="server" id="divBorrow">
                            <asp:Label ID="Label2" runat="server" Text="借入账户:" CssClass="span1" />
                            <asp:TextBox runat="server" ID="txtBorrowAddBorrowAccount" CssClass="span2" />
                        </div>

                        <asp:Label runat="server" Text="出借人:" CssClass="span1" />
                        <asp:TextBox runat="server" ID="txtBorrowAddLender" CssClass="span2" />
                        <div runat="server" id="divLoan">
                            <asp:Label runat="server" Text="借出账户:" CssClass="span1" />
                            <asp:TextBox runat="server" ID="txtBorrowAddLoanAccount" CssClass="span2" />
                        </div>
                    </div>
                    <div class="controls controls-row">
                        <asp:Label runat="server" Text="借入金额:" CssClass="span1" />
                        <asp:TextBox runat="server" ID="txtBorrowAddBorrowAmount" CssClass="span2" />
                        <asp:Label runat="server" Text="借款日期:" CssClass="span1" />
                        <asp:TextBox runat="server" ID="txtBorrowAddBorrowDate" CssClass="span2" />
                        <asp:Label runat="server" Text="归还日期:" CssClass="span1" />
                        <asp:TextBox runat="server" ID="txtBorrowAddReturnDate" CssClass="span2" />
                    </div>
                    <div class="controls controls-row">
                        <asp:Label runat="server" Text="备注:" CssClass="span1" />
                        <asp:TextBox runat="server" ID="txtBorrowAddContent" CssClass="span8" TextMode="MultiLine" />
                        <div class="span3" style="text-align: right">
                            <asp:Button runat="server" ID="btnBorrowAddSubmit" CssClass="btn btn-primary" Text="提交" OnClick="btnBorrowAddSubmit_Click" />
                            <input type="button" id="btnBorrowAddCanel" class="btn btn-primary" value="返回" onclick="DisplaySysdiv()" />
                        </div>
                    </div>
                </div>

                <div id="BorrowQuery" class="margin-top">
                    <div class="controls controls-row">
                        <asp:Label runat="server" Text="借款人:" CssClass="span1" />
                        <asp:TextBox runat="server" ID="txtBorrowQueryBorrower" CssClass="span2" />
                        <asp:Label runat="server" Text="借款日期:" CssClass="span1" />
                        <asp:TextBox runat="server" ID="txtBorrowQueryBBorrowDate" CssClass="span2" />
                        <asp:Label runat="server" Text="到:" CssClass="span1" />
                        <asp:TextBox runat="server" ID="txtBorrowQueryEBorrowDate" CssClass="span2" />
                        <label class="span1">&nbsp;</label>
                        <div class="span2">
                            <asp:Button runat="server" ID="btnBorrowQuerySubmit" Text="查询" CssClass="btn btn-primary" OnClick="btnBorrowQuerySubmit_Click" />
                            <input type="button" id="btnBorrowQueryCanel" value="返回" class="btn btn-primary" onclick="DisplaySysdiv()" />
                        </div>
                    </div>
                </div>
            </div>
            <hr id="fgdiv" style="border-color: #cccfd2;display:none;" />
            <div class="margin">
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <asp:DataGrid runat="server" AutoGenerateColumns="false" ID="BorrowListDataGrid" Width="99%" BorderColor="Black" BorderStyle="None" BorderWidth="5px" CellPadding="2" CellSpacing="2" GridLines="Both" Font-Size="Small"
                            HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" ItemStyle-VerticalAlign="Middle" ItemStyle-Font-Size="Small" SelectedItemStyle-BorderColor="Red"
                            OnItemCommand="BorrowListDataGrid_ItemCommand">
                            <Columns>
                                <asp:BoundColumn ReadOnly="true" DataField="Id" HeaderText="Id" ItemStyle-Width="5%" Visible="false" />
                                <asp:HyperLinkColumn HeaderText="借款人" DataTextField="Borrower" DataNavigateUrlField="Id" DataNavigateUrlFormatString="javascript:openBorrowEditWin('{0}')" ItemStyle-Width="5%"></asp:HyperLinkColumn>
                                <asp:BoundColumn ReadOnly="true" DataField="BorrowORLoanType" HeaderText="借入方式" ItemStyle-Width="5%" />
                                <asp:BoundColumn ReadOnly="true" DataField="BorrowedAccount" HeaderText="借入账户" ItemStyle-Width="10%" />
                                <asp:BoundColumn ReadOnly="true" DataField="Lender" HeaderText="出借方" ItemStyle-Width="5%" />
                                <asp:BoundColumn ReadOnly="true" DataField="LoanAccount" HeaderText="出借账户" ItemStyle-Width="10%" />
                                <asp:BoundColumn ReadOnly="true" DataField="Amount" HeaderText="金额" ItemStyle-Width="7%" />
                                <asp:BoundColumn ReadOnly="true" DataField="HappenedDate" HeaderText="借款日期" ItemStyle-Width="7%" />
                                <asp:BoundColumn ReadOnly="true" DataField="ReturnDate" HeaderText="归还日期" ItemStyle-Width="7%" />
                                <asp:BoundColumn ReadOnly="true" DataField="Content" HeaderText="备注" ItemStyle-Width="15%" />
                                <asp:TemplateColumn HeaderText="操作" HeaderStyle-HorizontalAlign="Center" FooterStyle-BorderStyle="None" ItemStyle-Width="3%">
                                    <ItemTemplate>
                                        <asp:ImageButton runat="server" ID="btnBorrowDelete" ImageUrl="~/Images/delete/1.jpg" CommandName="BorrowImageDelete" OnClientClick="return confirm('确定删除？')" OnClick="btnBorrowDelete_Click" />
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
