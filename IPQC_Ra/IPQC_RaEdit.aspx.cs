using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.IO;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IPQC_Ra
{
    public partial class IPQC_RaEdit : IPQC_RaBase
    {
        private IPQC_Ra_Head head = new IPQC_Ra_Head();
        string _leader = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            lang=CurrLang;
            msg.Value = "";
            if (!IsPostBack)
            {
                Init();
                setDisplay();
                _leader = "2CA1C1C5-D0C2-405C-91D0-F45DDF9AB462";//"02CA2090-C5D0-455B-A671-5D7168D08559"; carol 
                 
            }
            else
            {
                _product = cbo_product.SelectedValue;
                _test_item = cbo_testitem.SelectedValue;
                _test_type = cbo_testtype.SelectedValue;
                _material = cbo_material.SelectedValue;

                _receivedDt = DateTime.Now;
                _week = new TaiwanCalendar().GetWeekOfYear(DateTime.Now, System.Globalization.CalendarWeekRule.FirstDay, System.DayOfWeek.Sunday).ToString();
                //getDept(CurrentUser.ID);
                _dispatch = txt_dispatch.Text;
                string bom = txt_bomdt.Text;
                _bomDt = Convert.ToDateTime(bom);
                _tooling = txt_tooling.Text;
                
                _program = cbo_program.SelectedValue;
                _sample = int.Parse(txt_sample.Text);
                _equipment = cbo_Machine.SelectedValue;
                _remark = txt_remark.Text;
                string user= txt_user.Text;
                _leader = Utility.GetUserID(user);

            }

            
            Dictionary<string,string> US= Utility.GetUIDInfo(_leader);
            txt_user.Text = US["LOGONID"];
            Btn_RemindReviewer.Text = getStr("remind_reviewer");
            Btn_Stop.Text = getStr("stop");
            Btn_SendRequest.Text = getStr("sb");
            Btn_fail.Text = getStr("fail");
            Btn_Save.Text = getStr("save");
            Btn_Back.Text = getStr("back");
            Btn_AddNext.Text = getStr("addnext");

            //2CA1C1C5-D0C2-405C-91D0-F45DDF9AB462 Thomas.Hsiao
            
            _rowid = Request.QueryString["rowid"];
            
        }

        private void Init()
        {
            string rowid = Request.QueryString["rowid"];
            head.GetInfo(rowid);

            _cStatus =(status) head.status;
             
            getDept(head.employee);

            lab_applicant.Text = _user;
            lab_depat.Text = _dept;
            lab_week.Text = new TaiwanCalendar().GetWeekOfYear(head.received_dt, System.Globalization.CalendarWeekRule.FirstDay, System.DayOfWeek.Sunday).ToString();
            lab_Received.Text = head.received_dt.ToString("yyyy/MM/dd");

            txt_bomdt.Text = head.manufacture_dt.ToString("yyyy/MM/dd");
            txt_dispatch.Text = head.dispatch_no;
            
       
            txt_sample.Text = head.sample.ToString();
            txt_tooling.Text = head.tooling_no;
     
            lab_Ra_NO.Text = head.ra_no; 
            txt_remark.Text = head.remark;

            cbo_product.Items.Clear();
            cbo_testtype.Items.Clear();
            cbo_testitem.Items.Clear();
            cbo_program.Items.Clear();
            cbo_Machine.Items.Clear();
            cbo_material.Items.Clear();


            getProduct(cbo_product, true);
            cbo_product.SelectedValue = head.product;

            getTestType(cbo_testtype, true);
            cbo_testtype.SelectedValue = head.test_type;


            getTestItem(cbo_testitem, true);
            cbo_testitem.SelectedValue = head.test_item;

            getProgram(cbo_program, true);
            cbo_program.SelectedValue = head.program;

            getMachin(cbo_Machine);
            cbo_Machine.SelectedValue = head.equipment;

            getMaterial(cbo_material);
            cbo_material.SelectedValue = head.material;

        }

      

        private void setDisplay()
        {

            
            Utility.setEnable(false, Btn_RemindReviewer, Btn_Stop, Btn_SendRequest, Btn_fail, Btn_Save, Btn_Back,Btn_AddNext);
            Utility.setEnable(false, txt_user);
            Utility.setEnable(false, lab_Mg1);
            int Status = (int)_cStatus;
 

            switch (Status)
            {
                case (int)status.Fial:
                case (int)status.Complete:
                    Utility.setEnable(true, Btn_AddNext);
                    Utility.setEnable(false, txt_bomdt, txt_dispatch, txt_remark, txt_sample, txt_tooling);
                    Utility.setEnable(false, cbo_product, cbo_program, cbo_testitem, cbo_testtype,cbo_Machine,cbo_material);
                  
                    break;

                case (int)status.Send:
                    Utility.setEnable(true, Btn_Stop, Btn_RemindReviewer, Btn_AddNext);
                    Utility.setEnable(false, txt_bomdt, txt_dispatch,  txt_remark, txt_sample, txt_tooling);
                    Utility.setEnable(false, cbo_product, cbo_program, cbo_testitem,cbo_testtype, cbo_material, cbo_Machine);
                
                    break;

                case (int)status.Stop:
                case (int)status.Waite:
                

                    Utility.setEnable(true, Btn_SendRequest, Btn_fail, Btn_Save);
                    Utility.setEnable(true, txt_user);
                    Utility.setEnable(true, lab_Mg1);

                    //this.AddWarning(this, "Page_Load()", "", "請記得將單據送審！");
                    //this.AddWarning(this, "Page_Load()", "", "若修改資料，請先按儲存鈕將資料儲存！");
                    msg.Value = getStr("alert_save");
                  

                    break; 
            }

            Utility.setEnable(true, Btn_Back);

            if (isManage) //supert manager 
            {
                if (Status != (int)status.Fial)
                {
                    Utility.setEnable(true, Btn_RemindReviewer, Btn_Stop, Btn_SendRequest, Btn_fail, Btn_Save, Btn_Back, Btn_AddNext);
                    Utility.setEnable(true, txt_bomdt, txt_dispatch, txt_remark, txt_sample, txt_tooling);
                    Utility.setEnable(true, cbo_product, cbo_program, cbo_Machine, cbo_testitem, cbo_testtype, cbo_material);
                 
                }
            }
        }

        
        protected void Btn_Save_Click(object sender, EventArgs e)
        {
            string rowid = Request.QueryString["rowid"];
            bool isPass = save(rowid, "u");
            Init();

        }

        protected void Btn_SendRequest_Click(object sender, SmoothEnterprise.Flowwork.UI.WebControl.FlowButtonEventArgs e)
        {

            string rowid = Request.QueryString["rowid"];

            IPQC_Ra_Head db = new IPQC_Ra_Head();


            if (this.IsValid)
            {
                try
                {
                    this.Btn_SendRequest.Flow = this.FlowClient1;
                    _cStatus = status.Send;

                    db.UpdataStatus(rowid, status.Send);
                    setDisplay();
                    // lab_InspectNO.Text = AddONumber(Request.QueryString["rowid"]);

                    // Response.Write("<script>alert('執行送審');</script>");
                    //執行送審程序
                    ArrayList managerid = new ArrayList();  //主管id 
                    ArrayList managernm = new ArrayList();  //主管 Text

                    managerid.Add(_leader);
                    managernm.Add("確認");

                    int count = 0;
                    foreach (string i in managerid)
                    {
                        this.FlowClient1.AddParameter("USER" + count.ToString(), i);
                        count++;
                    }
                    count = 0;
                    foreach (string i in managernm)
                    {
                        this.FlowClient1.AddParameter("USERTITLE" + count.ToString(), i);
                        count++;
                    }


                    sharflow12_2.Flowwork.sharflow12_21 flow = new sharflow12_2.Flowwork.sharflow12_21();
                    FlowClient1.Text = "IPQC Ra檢驗單 單號：" + lab_Ra_NO.Text;

                    switch (managerid.Count)  //依舊arraylist裡面有幾個,來判斷走那條flow
                    {

                        case 1:
                            e.NextNode = flow.sharflow12_2Node1;
                            break;

                        case 2:
                            e.NextNode = flow.sharflow12_2Node1;
                            break;

                        case 3:
                            e.NextNode = flow.sharflow12_2Node1;
                            break;

                        case 4:
                            e.NextNode = flow.sharflow12_2Node1;
                            break;

                        case 5:
                            e.NextNode = flow.sharflow12_2Node1;
                            break;

                        case 6:
                            e.NextNode = flow.sharflow12_2Node1;
                            break;

                        case 7:
                            e.NextNode = flow.sharflow12_2Node1;
                            break;

                        case 8:
                            e.NextNode = flow.sharflow12_2Node1;
                            break;

                        case 9:
                            e.NextNode = flow.sharflow12_2Node1;
                            break;

                        case 10:
                            e.NextNode = flow.sharflow12_2Node1;
                            break;

                        case 11:
                            e.NextNode = flow.sharflow12_2Node1;
                            break;

                        case 12:
                            e.NextNode = flow.sharflow12_2Node1;
                            break;

                        case 13:
                            e.NextNode = flow.sharflow12_2Node1;
                            break;

                        case 14:
                            e.NextNode = flow.sharflow12_2Node1;
                            break;

                        case 15:
                            e.NextNode = flow.sharflow12_2Node1;
                            break;
                    }

                    e.NextNode.ReviewerURL = "/IPQC_Ra/IPQC_RaView.aspx";
                    FirstApprove(managerid[0].ToString());



                }
                catch (Exception ex)
                {
                    this.AddError(this, "BUTTON_save_Click()", "", ex.Message);
                }
            }
        }

        protected void Btn_RemindReviewer_Click(object sender, SmoothEnterprise.Flowwork.UI.WebControl.FlowButtonEventArgs e)
        {
            string rowid = Request.QueryString["rowid"];
            head.GetInfo(rowid);
            SendMail(rowid, _leader, lab_Ra_NO.Text, head.send_dt, "催審");


        }

        protected void Btn_Stop_Click(object sender, SmoothEnterprise.Flowwork.UI.WebControl.FlowButtonEventArgs e)
        {

            string guid = Request.QueryString["rowid"].ToString();
            _cStatus = status.Stop;

            head.UpdataStatus(guid, status.Stop);
            setDisplay();
            //發通知給目前審核者,說已經中止了

            string rowid = Request.QueryString["rowid"];
            head.GetInfo(rowid);
            SendMail(rowid, _leader, lab_Ra_NO.Text, head.send_dt, "中止");

            DBTransfer fs = new DBTransfer();
            if (!string.IsNullOrEmpty(guid))
            {
                fs.RunIUSql("delete  dgflowqueue where requesturl like '%" + guid + "%'");

            }

        }

        protected void Btn_fail_Click(object sender, EventArgs e)
        {
            string guid = Request.QueryString["rowid"].ToString();
            _cStatus = status.Fial;
            head.UpdataStatus(guid, status.Fial);
            setDisplay();
            Utility.setEnable(false, Btn_Save, Btn_SendRequest, Btn_RemindReviewer, Btn_Stop, Btn_fail);
            Response.Write("<script>alert('已經作廢完畢');</script>");


        }

        protected void Btn_Back_Click(object sender, EventArgs e)
        {
            Response.Redirect("/IPQC_Ra/IPQC_Ra.aspx");
        }
        private void FirstApprove(string uid)
        {
            string rowid = Request.QueryString["rowid"];
            SendMail(rowid, uid, lab_Ra_NO.Text, DateTime.Now.ToShortDateString(), "送審");

        }

        protected void FlowFeedbackViewer1_OnLoadHistory(object sender, SmoothEnterprise.Flowwork.UI.WebControl.FlowFeedbackHistoryEventArgs e)
        {
            try
            {
                SmoothEnterprise.Web.UI.HTMLControl.InputText it;
                object obj = this.FlowFeedbackViewer1.HistoryView.FindControl("S_Comment");
                it = (SmoothEnterprise.Web.UI.HTMLControl.InputText)obj;
                it.Enabled = true;
                it.ReadOnly = true;
                it.Text = (string)e["Flow_Comment"];

                System.Web.UI.WebControls.Image sin1;
                object obj5 = this.FlowFeedbackViewer1.HistoryView.FindControl("Image1");
                sin1 = (System.Web.UI.WebControls.Image)obj5;


                System.Web.UI.WebControls.Image sin2;
                object obj6 = this.FlowFeedbackViewer1.HistoryView.FindControl("Image2");
                sin2 = (System.Web.UI.WebControls.Image)obj6;


                sin1.Visible = false;  //default image 為Visable=true;

                //e["IniReviewer"].ToString() 表示"代"字
                if ((string)e["IniReviewer"].ToString().Length.ToString() == "0") sin2.Visible = false;
                else sin2.Visible = true;//為代理人


                //Response.Write((string)e["InputText3"].ToString() + "--");
                if ((string)e["InputText3"].ToString().Length.ToString() != "0")
                {
                    //判斷圖檔是否存在
                    string strupp = "";  //接 歷史的審核人員 logonid
                    DirectoryInfo di = new DirectoryInfo("C:\\Inetpub\\E_Portal1\\image");
                    FileInfo[] fi = di.GetFiles();
                    foreach (FileInfo fiTemp in fi)
                    {
                        strupp = (string)e["InputText3"] + ".jpg";//簽核者帳號
                                                                  //資料一律轉成大寫
                                                                  // Response.Write(fiTemp.Name.ToUpper() + "--" + strupp.ToUpper()+"--");

                        if (fiTemp.Name.ToUpper() == strupp.ToUpper())
                        {
                            sin1.Visible = true;
                            break;

                        }
                    }
                    sin1.ImageUrl = "~/image/" + (string)e["InputText3"] + ".JPG";


                }

                if ((string)e["IniReviewer"].ToString().Length.ToString() == "0") sin2.Visible = false;


            }
            catch { }
        }


        protected void Btn_AddNext_Click(object sender, EventArgs e)
        {
            Response.Redirect("IPQC_RaAdd.aspx");
        }
    }
}