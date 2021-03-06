﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Expenses.aspx.cs" Inherits="BillingSystem.Views.Expenses" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="../../Css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="../../Css/css.css" />
    <link rel="stylesheet" type="text/css" href="../../Css/jquery-ui-1.10.3.custom.min.css" />
    <script src="../../Scripts/jquery-2.0.3.min.js" type="text/javascript"></script>
    <script src="../../Scripts/jquery-ui-1.10.3.custom.min.js" type="text/javascript"></script>
    <title></title>
    <script type="text/javascript" lang="ja">
        function openExpensesEditWin(id) {
            location.replace(" Expenses.aspx?ExpensesId=" + id);
        }

        function DisplaySysdiv() {
            document.getElementById("divSet").style.display = '';
            document.getElementById("ExpensesEdit").style.display = 'none';
            document.getElementById("ExpensesQuery").style.display = 'none';
            document.getElementById("fgdiv").style.display = 'none';
            document.getElementById("divExpensesTitle").innerText = "支出管理";
        }

        function DisplayExpensesAdddiv() {
            document.getElementById("ExpensesEdit").style.display = '';
            document.getElementById("ExpensesQuery").style.display = 'none';
            document.getElementById("fgdiv").style.display = '';
            document.getElementById("divExpensesTitle").innerText = "支出管理--新增";
        }

        function DisplayExpensesQuerydiv() {
            document.getElementById("ExpensesEdit").style.display = 'none';
            document.getElementById("ExpensesQuery").style.display = '';
            document.getElementById("fgdiv").style.display = '';
            document.getElementById("divExpensesTitle").innerText = "支出管理--查询";
        }

        function DisplayExpensesEditdiv(cardNumber) {
            document.getElementById("ExpensesEdit").style.display = '';
            document.getElementById("ExpensesQuery").style.display = 'none';
            document.getElementById("fgdiv").style.display = '';
            document.getElementById("divExpensesTitle").innerText = "支出管理--编辑";
        }
        $(function () {
            $("#ExpensesListDataGrid tr").first().nextAll().bind('click', function () {
                $("#ExpensesListDataGrid tr.highlight").removeClass('highlight');
                $(this).toggleClass("highlight");
            });
        });

        $(document).ready(function () {
            //新增、编辑div的日期
            $('#txtExpensesAddSpendDate').datepicker({ dateFormat: "yy-mm-dd" });
            $('#txtExpensesQueryBSpendDate').datepicker({ dateFormat: "yy-mm-dd" });
            $('#txtExpensesQueryESpendDate').datepicker({ dateFormat: "yy-mm-dd" });

            $('#btnExpensesAdd').hide();
            $('#btnExpensesQuery').hide();
            $('#btnExpensesAddSubmit').hide();
            $('#btnExpensesQuerySubmit').hide();
        });

        $(function () {
            $('#btnExpensesAddC').button();
            $('#btnExpensesQueryC').button();
            $('#btnExpensesAddConfirm').button();
            $('#btnExpensesAddCanel').button();
            $('#btnExpensesQueryConfirm').button();
            $('#btnExpensesQueryCanel').button();
        });

        function onexpensesaddclick() {
            DisplayExpensesAdddiv();
            $('#btnExpensesAdd').click();
        }

        function onexpensesqueryclick() {
            DisplayExpensesQuerydiv();
            $('#btnExpensesQuery').click();
        }

        function onexpensesaddconfirmclick() {
            $('#btnExpensesAddSubmit').click();
        }

        function onexpensesqueryconfirmclick() {
            $('#btnExpensesQuerySubmit').click();
        }
    </script>

</head>
<body>
    <form id="Expenses" runat="server" style="width: 100%;">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div>
            <div>
                <div id="divExpensesTitle" class="title">
                    支出管理
                </div>
                <div id="divSet" style="height: 30px; margin-top: 5px; vertical-align: middle; margin-left: 5px;">
                    <div class="row">
                        <div class="span3">
                            <asp:Button runat="server" ID="btnExpensesAdd" OnClick="btnExpensesAdd_Click" />
                            <button type="button" title="新增" id="btnExpensesAddC" onclick="onexpensesaddclick();">
                                <img src="../Image/add3_16.png" />
                                新增
                            </button>
                            <asp:Button ID="btnExpensesQuery" runat="server" OnClick="btnExpensesQuery_Click" />
                            <button type="button" title="查询" id="btnExpensesQueryC" onclick="onexpensesqueryclick();">
                                <img src="../Image/query1_16.png" />
                                查询
                            </button>
                        </div>
                    </div>
                </div>
                <hr style="border-color: #cccfd2; margin-top: 10px;" />
                <div id="ExpensesEdit" class="margin-top">
                    <div class="controls controls-row">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <asp:Label runat="server" Text="卡号:" CssClass="span1" />
                                <asp:DropDownList runat="server" ID="dropExpensesAddCardNumber" CssClass="span3" AutoPostBack="true" OnSelectedIndexChanged="dropExpensesAddCardNumber_SelectedIndexChanged" />
                                <label class="span2">&nbsp;</label>
                                <asp:Label ID="Label2" runat="server" Text="所有者:" CssClass="span1" />
                                <asp:DropDownList runat="server" ID="dropExpensesAddOwner" CssClass="span2" />
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <asp:Label runat="server" Text="金额:" CssClass="span1" />
                        <asp:TextBox runat="server" ID="txtExpensesAddAmount" CssClass="span2" />
                    </div>
                    <div class="controls controls-row">
                        <asp:Label ID="Label1" runat="server" Text="消费日期:" CssClass="span1" />
                        <asp:TextBox runat="server" ID="txtExpensesAddSpendDate" CssClass="span2" />

                        <asp:Label runat="server" Text="分类:" CssClass="span1" />
                        <asp:DropDownList runat="server" ID="dropExpensesAddSpendType" CssClass="span2" />
                        <asp:Label runat="server" Text="消费方式:" CssClass="span1" />
                        <asp:DropDownList runat="server" ID="dropExpensesAddSpendMode" CssClass="span2" />
                        <asp:Label runat="server" Text="消费者:" CssClass="span1" />
                        <asp:TextBox runat="server" ID="txtExpensesAddConsumerName" CssClass="span2" />
                    </div>
                    <div class="controls controls-row">
                        <asp:Label runat="server" Text="用途" CssClass="span1" />
                        <asp:TextBox runat="server" ID="txtExpensesAddHowToUse" CssClass="span2" />
                        <asp:Label runat="server" Text="单价:" CssClass="span1" />
                        <asp:TextBox runat="server" ID="txtExpensesAddPrice" CssClass="span2" />
                        <asp:Label runat="server" Text="数量:" CssClass="span1" />
                        <asp:TextBox runat="server" ID="txtExpensesAddNumber" CssClass="span2" />
                    </div>
                    <div class="controls controls-row">
                        <asp:Label runat="server" Text="备注:" CssClass="span1" />
                        <asp:TextBox runat="server" ID="txtExpensesAddContent" CssClass="span8" TextMode="MultiLine" />
                        <div class="span3">
                            <asp:Button runat="server" ID="btnExpensesAddSubmit" OnClick="btnExpensesAddSubmit_Click" />
                            <button type="button" id="btnExpensesAddConfirm" title="提交" onclick="onexpensesaddconfirmclick();">
                                <img src="../Image/submit1_16.png" />
                                提交
                            </button>
                            <button type="button" id="btnExpensesAddCanel" title="返回" onclick="DisplaySysdiv();">
                                <img src="../Image/back2_16.ico" />
                                返回
                            </button>
                        </div>
                    </div>
                </div>
                <div id="ExpensesQuery" class="margin-top">
                    <div class="controls controls-row">
                        <asp:Label runat="server" Text="卡号:" CssClass="span1" />
                        <asp:TextBox runat="server" ID="txtExpensesQueryCardNumber" CssClass="span3" />

                    </div>
                    <div class="controls controls-row">
                        <asp:Label ID="Label3" runat="server" Text="分类:" CssClass="span1" />
                        <asp:DropDownList runat="server" ID="dropExpensesQuerySpendType" CssClass="span2" />
                        <%--                        <label class="span1">&nbsp;</label>--%>
                        <asp:Label ID="Label4" runat="server" Text="方式:" CssClass="span1" />
                        <asp:DropDownList runat="server" ID="dropExpensesQuerySpendMode" CssClass="span2" />
                        <asp:Label ID="Label5" runat="server" Text="消费者:" CssClass="span1" />
                        <asp:TextBox runat="server" ID="txtExpensesQueryConsumerName" CssClass="span2" />
                    </div>
                    <div class="controls controls-row">
                        <asp:Label runat="server" Text="消费日期:" CssClass="span1" />
                        <asp:TextBox runat="server" ID="txtExpensesQueryBSpendDate" CssClass="span2" />
                        <asp:Label runat="server" Text="到:" CssClass="span1" />
                        <asp:TextBox runat="server" ID="txtExpensesQueryESpendDate" CssClass="span2" />
                        <label class="span1">&nbsp;</label>
                        <div class="span3">
                            <asp:Button runat="server" ID="btnExpensesQuerySubmit" OnClick="btnExpensesQuerySubmit_Click" />
                            <button type="button" id="btnExpensesQueryConfirm" title="查询" onclick="onexpensesqueryconfirmclick();">
                                <img src="../Image/query2_16.png" />
                                查询
                            </button>
                            <button type="button" id="btnExpensesQueryCanel" title="返回" onclick="DisplaySysdiv();">
                                <img src="../Image/back2_16.ico" />
                                返回
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            <hr id="fgdiv" style="border-color: #cccfd2; margin-top: 10px;" />
            <div class="margin-left">
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <asp:DataGrid runat="server" AutoGenerateColumns="false" ID="ExpensesListDataGrid" Width="99%" BorderColor="Black" BorderStyle="None" BorderWidth="5px" CellPadding="2" CellSpacing="2" GridLines="Both" Font-Size="Small"
                            HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" ItemStyle-VerticalAlign="Middle" ItemStyle-Font-Size="Small" SelectedItemStyle-BorderColor="Red" OnItemCommand="ExpensesListDataGrid_ItemCommand">
                            <Columns>
                                <asp:BoundColumn ReadOnly="true" DataField="Id" HeaderText="Id" ItemStyle-Width="5%" Visible="false" />
                                <asp:HyperLinkColumn HeaderText="卡号" DataTextField="BankCardNumber" DataNavigateUrlField="Id" DataNavigateUrlFormatString="javascript:openExpensesEditWin('{0}')" ItemStyle-Width="10%" />
                                <asp:BoundColumn ReadOnly="true" DataField="OwnerName" HeaderText="所有者" ItemStyle-Width="6%" />
                                <asp:BoundColumn ReadOnly="true" DataField="Amount" HeaderText="金额" ItemStyle-Width="6%" />
                                <asp:BoundColumn ReadOnly="true" DataField="SpendType" HeaderText="分类" ItemStyle-Width="6%" />
                                <asp:BoundColumn ReadOnly="true" DataField="HowToUse" HeaderText="用途" ItemStyle-Width="6%" />
                                <asp:BoundColumn ReadOnly="true" DataField="SpendDate" HeaderText="消费日期" ItemStyle-Width="7%" />
                                <asp:BoundColumn ReadOnly="true" DataField="SpendMode" HeaderText="消费方式" ItemStyle-Width="6%" />
                                <asp:BoundColumn ReadOnly="true" DataField="ConsumerName" HeaderText="消费者" ItemStyle-Width="6%" />
                                <asp:BoundColumn ReadOnly="true" DataField="Price" HeaderText="单价" ItemStyle-Width="6%" />
                                <asp:BoundColumn ReadOnly="true" DataField="Number" HeaderText="数量" ItemStyle-Width="6%" />
                                <asp:TemplateColumn HeaderText="操作" HeaderStyle-HorizontalAlign="Center" FooterStyle-BorderStyle="None" ItemStyle-Width="3%">
                                    <ItemTemplate>
                                        <asp:ImageButton runat="server" ID="btnExpensesDelete" ImageUrl="~/Images/delete/1.jpg" CommandName="ExpensesImageDelete" OnClientClick="return confirm('确定删除？')" OnClick="btnExpensesDelete_Click" />
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
