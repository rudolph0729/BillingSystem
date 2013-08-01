﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BillingSystem.Models;
using BillingSystem.Services;
using MySql.Data.MySqlClient;

namespace BillingSystem.Views
{
    public partial class Loan : System.Web.UI.Page
    {
        private List<QueryElement> queryList = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.ClientScript.RegisterStartupScript(this.GetType(), "", "DisplaySysdiv();", true);
                queryList = new List<QueryElement>();
                BindLoanListDataGrid(queryList);
            }
        }

        private void BindLoanListDataGrid(List<QueryElement> list)
        {
            LoanCollection coll = LoanMethods.GetLoanList(list);
            this.LoanListDataGrid.DataSource = coll;
            this.LoanListDataGrid.DataBind();
            for (int i = 0; i < coll.Count; i++)
            {
                this.LoanListDataGrid.Items[i].Cells[8].Text = coll[i].LoanDate.ToString("yyyy-MM-dd");
                bool dateFlag = HelperCommon.CompareAccordToRequired(coll[i].ReturnDate);
                if (dateFlag)
                {
                    this.LoanListDataGrid.Items[i].Cells[9].Text = coll[i].ReturnDate.ToString("yyyy-MM-dd");
                }
                else
                {
                    this.LoanListDataGrid.Items[i].Cells[9].Text = string.Empty;
                }
            }
        }

        protected void LoanListDataGrid_ItemCommand(object source, DataGridCommandEventArgs e)
        {
            string id = string.Empty;
            if (e.CommandName == "LoanImageDelete")
            {
                int selectindex = e.Item.ItemIndex;
                id = this.LoanListDataGrid.Items[selectindex].Cells[0].Text;
            }
            


            if (!string.IsNullOrEmpty(id))
            {
                int iSuccess = LoanMethods.DeleteLoanById(Convert.ToInt32(id));
                if (iSuccess > 0)
                {
                    Alert.Show(this, "删除成功！");
                }
                else
                {
                    Alert.Show(this, "删除失败！");
                }
                if (queryList == null)
                {
                    queryList = new List<QueryElement>();
                }
                BindLoanListDataGrid(queryList);
                this.ClientScript.RegisterStartupScript(this.GetType(), "", "HideORShowColumn();", true);
            }
        }

        protected void btnLoanAddSubmit_Click(object sender, EventArgs e)
        {
            #region 验证
            if (string.IsNullOrEmpty(this.txtLoanAddLender.Text.Trim()))
            {
                Alert.Show(this, "请输入出借人！");
                this.txtLoanAddLender.Focus();
                return;
            }

            if (this.RadioLoanAddLoanType.SelectedValue == "2" && string.IsNullOrEmpty(this.txtLoanAddLoanAccount.Text.Trim()))
            {
                Alert.Show(this, "请输入借款账户！");
                this.txtLoanAddLoanAccount.Focus();
                return;
            }

            if (string.IsNullOrEmpty(this.txtLoanAddBorrower.Text.Trim()))
            {
                Alert.Show(this, "请输入借款人！");
                this.txtLoanAddBorrower.Focus();
                return;
            }

            if (this.RadioLoanAddBorrowType.SelectedValue == "2" && string.IsNullOrEmpty(this.txtLoanAddBorrowAccount.Text.Trim()))
            {
                Alert.Show(this, "请输入出借账户！");
                this.txtLoanAddBorrowAccount.Focus();
                return;
            }

            if (string.IsNullOrEmpty(this.txtLoanAddLoanAmount.Text.Trim()))
            {
                Alert.Show(this, "请输入借出金额!");
                this.txtLoanAddLoanAmount.Focus();
                return;
            }

            if (string.IsNullOrEmpty(this.txtLoanAddLoanDate.Text.Trim()))
            {
                Alert.Show(this, "请输入借款日期！");
                this.txtLoanAddLoanDate.Focus();
                return;
            }
            #endregion

            LoanInfo loanInfo = new LoanInfo();
            if (!string.IsNullOrEmpty(this.HiddenField1.Value.Trim()))
            {
                loanInfo.Id = Convert.ToInt32(this.HiddenField1.Value.Trim());
            }
            else
            {
                loanInfo.Id = 0;
            }

            loanInfo.BorrowType = Convert.ToInt32(this.RadioLoanAddBorrowType.SelectedValue);
            loanInfo.Borrower = this.txtLoanAddBorrower.Text.Trim();
            loanInfo.LoanAccount = this.txtLoanAddLoanAccount.Text.Trim();
            loanInfo.Lender = this.txtLoanAddLender.Text.Trim();
            loanInfo.BorrowAccount = this.txtLoanAddBorrowAccount.Text.Trim();
            loanInfo.LoanType = Convert.ToInt32(this.RadioLoanAddLoanType.SelectedValue);
            loanInfo.LoanAmount = Convert.ToSingle(this.txtLoanAddLoanAmount.Text.Trim());
            loanInfo.LoanDate = HelperCommon.ConverToDateTime(string.Format("{0:d}", this.txtLoanAddLoanDate.Text.Trim()));
            if (!string.IsNullOrEmpty(this.txtLoanAddReturnDate.Text.Trim()))
            {
                loanInfo.ReturnDate = HelperCommon.ConverToDateTime(string.Format("{0:d}", this.txtLoanAddReturnDate.Text.Trim()));
            }
            loanInfo.Content = this.txtLoanAddContent.Text.Trim();

            int iSuccess = LoanMethods.InsertOrUpdatetoLoan(loanInfo);
            this.ClientScript.RegisterStartupScript(this.GetType(), "", "DisplayAddLoandiv();", true);
            if (iSuccess == 1)
            {
                Alert.Show(this, "新增一条收入成功！");
            }
            else if (iSuccess == 2)
            {
                Alert.Show(this, "修改成功！");
            }
            else
            {
                Alert.Show(this, "操作失败！");
            }
            queryList = new List<QueryElement>();
            BindLoanListDataGrid(queryList);

        }

        protected void btnLoanQuerySubmit_Click(object sender, EventArgs e)
        {
            queryList = new List<QueryElement>();

            #region 查询条件验证
            if (!string.IsNullOrEmpty(this.txtLoanQueryBLoanDate.Text.Trim()) || !string.IsNullOrEmpty(this.txtLoanQueryELoanDate.Text.Trim()))
            {
                if (!string.IsNullOrEmpty(this.txtLoanQueryBLoanDate.Text.Trim()) && string.IsNullOrEmpty(this.txtLoanQueryELoanDate.Text.Trim()))
                {
                    Alert.Show(this, "请输入一个时间段！");
                    this.txtLoanQueryBLoanDate.Focus();
                    return;
                }
                else if (string.IsNullOrEmpty(this.txtLoanQueryBLoanDate.Text.Trim()) && !string.IsNullOrEmpty(this.txtLoanQueryELoanDate.Text.Trim()))
                {
                    Alert.Show(this, "请输入一个时间段！");
                    this.txtLoanQueryBLoanDate.Focus();
                    return;
                }
                else
                {
                    bool flag = HelperCommon.ValidDateTime(this.txtLoanQueryBLoanDate.Text.Trim(), this.txtLoanQueryELoanDate.Text.Trim());
                    if (!flag)
                    {
                        Alert.Show(this, "开始日期不能大于结束日期！");
                        this.txtLoanQueryELoanDate.Focus();
                        return;
                    }
                }
            }
            #endregion
            if (!string.IsNullOrEmpty(this.txtLoanQueryLoaner.Text.Trim()))
            {
                QueryElement query = new QueryElement { Queryname = "Lender", QueryElementType = MySqlDbType.String, Queryvalue = this.txtLoanQueryLoaner.Text.Trim(), QueryOperation = "like" };
                queryList.Add(query);
            }

            if (!string.IsNullOrEmpty(this.txtLoanQueryBLoanDate.Text.Trim()) && !string.IsNullOrEmpty(this.txtLoanQueryELoanDate.Text.Trim()))
            {
                QueryElement query = new QueryElement { Queryname = "LoanDate", QueryElementType = MySqlDbType.DateTime, Queryvalue = this.txtLoanQueryBLoanDate.Text.Trim(), QueryOperation = ">=" };
                queryList.Add(query);
                query = new QueryElement { Queryname = "LoanDate", QueryElementType = MySqlDbType.DateTime, Queryvalue = this.txtLoanQueryELoanDate.Text.Trim(), QueryOperation = "<" };
                queryList.Add(query);
            }
            BindLoanListDataGrid(queryList);
            this.ClientScript.RegisterStartupScript(this.GetType(), "", "DisplayQueryLoandiv();", true);
        }
    }
}