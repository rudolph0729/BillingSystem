﻿using BillingSystem.Models;
using BillingSystem.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using BillingSystem.ViewModels;
using BillingSystem.Services.Utils;

namespace BillingSystem.Views
{
    public partial class Ajax : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //[WebMethod]
        //public static List<string> getLoanAccountByPerson(string loanName)
        //{
        //    UserInfo userInfo = UserMethods.GetUserByName(loanName);
        //    if (userInfo.Id > 0)
        //    {
        //        CardCollection coll = CardMethods.GetCardByUserId(userInfo.Id);
        //        List<string> list = new List<string>();
        //        for (int i = 0; i < coll.Count; i++)
        //        {
        //            string bank = StaticRescourse.DisplayBank(coll[i].BankId);
        //            list.Add( coll[i].CardNumber + " " + bank );
        //        }
        //        return list;
        //    }
        //    return new List<string>(0);
        //}
        [WebMethod]
        public static List<DropItem> getLoanAccountByPerson(string loanName)
        {
            UserInfo userInfo = UserMethods.GetUserByName(loanName);
            if (userInfo.Id > 0)
            {
                CardCollection coll = CardMethods.GetCardByUserId(userInfo.Id);
                List<DropItem> list = new List<DropItem>();
                //list.Add(new DropItem { ValueField = "", DisplayField = " " });
                for (int i = 0; i < coll.Count; i++)
                {
                    string bank = StaticRescourse.DisplayBank(coll[i].BankId);
                    list.Add(new DropItem { ValueField = coll[i].Id.ToString(), DisplayField = coll[i].CardNumber + " " + bank });
                }
                return list;
            }
            return new List<DropItem>();
        }

        [WebMethod]
        public static BorrowORLoanViewInfo GetBorrowInfo(string Id)
        {
            BorrowORLoanInfo info = BorrowedMethods.GetBorrowById(Convert.ToInt32(Id));
            BorrowORLoanViewInfo viewInfo = ViewInfoUtils.BuildBorrowORLoanViewInfo(info);
            viewInfo.BorrowedAccountList = getLoanAccountByPerson(viewInfo.Borrower);
            return viewInfo;
        }

    }
}