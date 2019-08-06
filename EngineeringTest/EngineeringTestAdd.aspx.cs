using System;

namespace EngineeringTest
{
    public partial class EngineeringTestAdd : SmoothEnterprise.Web.Page
    {
        public string data2;

        protected void Page_Load(object sender, System.EventArgs e)
        {

            BUTTON_save.Attributes.Add("OnClick", "return   j1()"); //如前端javascript檢查有問題,禁止提交頁面
                                                                    //Page.Title = "EngineeringTest Add Page";
            int count = 1;
            Int32.TryParse(Request.Form["idx"], out count);
            count = count;
            // Label1.Text = count.ToString();

            string value = Request.Form["txtSymbol"];
            //Label3.Text = value;

            DateTime dt = DateTime.Now;      //呼叫日期函數
            this.add_date.Text = dt.ToString("d");  //今天日期
            this.add_user.Text = this.CurrentUser.Name.ToString();
            SmoothEnterprise.Database.DataSet rdata = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
            rdata.Open("select comid from dguser where logonid='" + this.CurrentUser.LogonID.ToString() + "' ");
            if (!rdata.EOF)
            {
                this.plantid.Text = rdata["comid"].ToString();
            }

            managerlevel aa = new managerlevel(); //引用managerlevel class
            this.FIELD_lsend.Text = aa.manager(this.CurrentUser.ID.ToString()).Split('@')[0];

            SmoothEnterprise.Database.DataSet rsa = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
            //Response.Write("select pname,pid from ERP_FLOW WHERE ERP_NAME='apmt420' and dep_name='acc' and no in (SELECT CASE WHEN pml04 IN ('MISC固資','MISC-雜項購置') THEN '2' ELSE '1' END ot_hr FROM APMT420_IN_BODY b,APMT420_IN_HEAD a where a.pmk01=b.pmk01 and a.plantid=b.plantID and b.pmk01='" + rs["pmk01"].ToString() + "' and pml02='1' AND a.plantid='" + rs["plantID"].ToString() + "')");
            rsa.Open("select pname,pid from ERP_FLOW WHERE ERP_NAME='EngineeringTest' and dep_name='pmc'  and no='1' ");
            if (!rsa.EOF)
            {
                this.FIELD_pmcsend.Text = rsa["pid"].ToString();
            }



            //data2 = "[";
            //SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
            //rs.Open("select top 10 email from dguser where name <> '' and email like 'ann%' group by email     ");
            //while (!rs.EOF)
            //{
            //    data2 = data2 + "{\"id\":\"" + rs["email"].ToString() + "\",\"name\":\"" + rs["email"].ToString() + "\"},";
            //    rs.MoveNext();
            //}
            //rs.Close();
            //data2.Remove(data2.Length - 1, 1);
            //data2 = data2 + "]";


        }

        protected void BUTTON_save_Click(object sender, System.EventArgs e)
        {
            if (this.IsValid)
            {
                try
                {
                    //單頭
                    SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                    rs.Open("SELECT * FROM EngineeringTest_head WHERE 1=0");
                    rs.Add();
                    SmoothEnterprise.Database.DataSet onum = new SmoothEnterprise.Database.DataSet();
                    string now = DateTime.UtcNow.AddHours(6).ToString("yyyyMM");
                    object objola = onum.ExecuteScalar("SELECT ISNULL(MAX(substring(NO,8,11)),'00000')+1 FROM EngineeringTest_head WHERE NO LIKE 'Z" + now + "%' ");
                    string maxnum = objola.ToString();
                    Int64 sidnum;
                    sidnum = Convert.ToInt64(maxnum);
                    string OK_NO = "Z" + now + sidnum.ToString("0000");
                    rs["NO"] = OK_NO;
                    rs["plantid"] = this.plantid.Text;
                    rs["flow_type"] = this.flow_type.Text;
                    rs["rd_level"] = this.rd_level.Text;
                    rs["cima01"] = Request.Form["cima01"];
                    rs["cima02"] = Request.Form["cima02"];
                    rs["cima03"] = Request.Form["cima03"];
                    if (Request.Form["rev"] != "") rs["rev"] = Request.Form["rev"];
                    rs["oduction_amount"] = Request.Form["oduction_amount"];
                    rs["delivers_amount"] = Request.Form["delivers_amount"];
                    DateTime de = Convert.ToDateTime(this.FIELD_expect_date.Text);
                    rs["expect_date"] = de.ToString("yyyy/MM/dd");
                    rs["remark"] = this.remark.Text;
                    if (this.oduction_explain.Text != "") rs["oduction_explain"] = this.oduction_explain.Text;
                    if (this.order_no.Text != "") rs["order_no"] = this.order_no.Text;
                    rs["makes_no"] = Request.Form["makes_no"];
                    rs["lsend"] = this.FIELD_lsend.Text;
                    rs["pmcsend"] = this.FIELD_pmcsend.Text;
                    if (this.FIELD_workssend.Text != "") rs["workssend"] = this.FIELD_workssend.Text;
                    if (this.FIELD_makesend.Text != "") rs["makesend"] = this.FIELD_makesend.Text;
                    rs["add_user"] = this.CurrentUser.ID.ToString();
                    //if (Request.Form["demo-input-facebook-theme"] != "") rs["mail"] = Request.Form["demo-input-facebook-theme"];
                    DateTime dd = DateTime.Now;
                    rs["add_date"] = dd.ToString();
                    rs["status"] = "N";
                    rs["mail"] = Request.Form["email"].Replace(",", ";");
                    rs["project_no"] = Request.Form["project_no"];
                    rs["module_no"] = Request.Form["module_no"];
                    rs["obj"] = this.FEILD_obj.SelectedValue;
                    rs["isnot"] = this.FIELD_ISNOTORNULL.Checked;
                    rs.Update();
                    rs.Close();

                    //找單頭id
                    SmoothEnterprise.Database.DataSet onum2 = new SmoothEnterprise.Database.DataSet();
                    object objola2 = onum2.ExecuteScalar("SELECT id FROM EngineeringTest_head WHERE NO ='" + OK_NO.ToString() + "' ");
                    string headid = objola2.ToString();

                    //單身
                    for (int i = 0; i <= int.Parse(Request.Form["idx"]); i++)
                    {
                        if (Request.Form["txtSymbol"].Split(',')[i] != "")
                        {
                            SmoothEnterprise.Database.DataSet rs2 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                            rs2.Open("SELECT * FROM EngineeringTest_body WHERE 1=0");
                            rs2.Add();
                            rs2["aid"] = headid.ToString();
                            rs2["ima01"] = Request.Form["txtSymbol"].Split(',')[i];
                            rs2["amount"] = float.Parse(Request.Form["Quantity"].Split(',')[i]);
                            rs2["pcs"] = Request.Form["Unit"].Split(',')[i];
                            rs2.Update();
                            rs2.Close();
                        }
                        //Response.Write(Request.Form["Unit"]);
                        //Response.Write("aaa");
                    }

                    // 20130521 增加內容定義
                    #region 內容定義
                    //Response.Write(Request.Form["Item"].Split(',').Length.ToString());

                    if (!string.IsNullOrEmpty(Request.Params["Item"].ToString())) //ADD BY CAROL 20190325 
                    { 
                        SmoothEnterprise.Database.DataSet email = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                        email.Open("SELECT * FROM Engineeringtest_Item WHERE 1=0");

                        String[] Item = Request.Form["Item"].Split(',');
                        String[] resolution = Request.Form["resolution"].Split(',');
                        String[] describe = Request.Form["describe"].Split(',');

                        int x = 0;

                        foreach (string bb in Item)
                        {
                            if (!String.IsNullOrEmpty(bb))
                            {
                                email.Add();
                                email["aid"] = headid.ToString();
                                email["strItem"] = bb;
                                email["strDoc"] = resolution[x];
                                email["strProductNum"] = describe[x];
                                email.Update();
                            }
                            x = x + 1;
                        }
                        email.Close();
                    }
                    #endregion

                    // 20130521 增加內容定義



                    Response.Redirect("EngineeringTestEdit.aspx?id=" + headid.ToString());

                }
                catch (Exception ex)
                {
                    this.AddError(this, "BUTTON_save_Click()", "", ex.Message);
                }
            }
        }

        protected void BUTTON_back_Click(object sender, System.EventArgs e)
        {
            this.GoBack();
        }
    }
}