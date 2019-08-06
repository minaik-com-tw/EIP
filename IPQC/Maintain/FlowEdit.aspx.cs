using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Maintain
{
    public partial class FlowEdit : IPQC_Base
    {
        string _uid = "", _text = "", _level = "", _rowno = "", _account = "";
        bool enable = false;
        int _seq = 0,_mail;
        protected void Page_Load(object sender, EventArgs e)
        {
            _rowno = Request.QueryString["rowno"];

            if (!string.IsNullOrEmpty(_rowno))
            {
                
                if (!IsPostBack)
                {
                    setlevel(cbo_level);
                    Init();
                }
                else
                {
                    _level = cbo_level.SelectedValue;
                    _account = txt_user.Text;
                    _text = txt_text.Text;
                    _uid = Uid.Value;
                    _mail =int.Parse( rbt_mail.SelectedValue);
                    
                }

                txt_user.Text = _account;
                cbo_level.SelectedValue = _level;
                Uid.Value = _uid;
                txt_text.Text = _text;
                rbt_mail.SelectedValue = _mail.ToString();

            }
            else
            {
                sMsg.Value = "查無資料;";
                Response.Redirect("flow.aspx");
            }
        }

        private void Init()
        {
            using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead))
            {
                string sql = string.Format(" select * from eipe.dbo.ipqc_flow where rowno='{0}' ", _rowno);
                rs.Open(sql);
                if (!rs.EOF)
                {
                    _level = rs["class"].ToString();
                    _text = rs["text"].ToString();
                    _uid = rs["uid"].ToString();
                    Utility.log(rs["mail"].ToString());
                    _mail = (bool)rs["mail"] ==false ?0:1;
                    Dictionary<string, string> User = Utility.GetUIDInfo(_uid);
                    _account = User["NAME"];

                }
            }
        }

        private bool Update()
        {
            bool isPass = false;
            List<string> msg = new List<string>();

            if (string.IsNullOrEmpty(_uid))
            {
                msg.Add("簽核人員");
            }

            if (string.IsNullOrEmpty(_text))
            {
                msg.Add("簽核抬頭");
            }

            if (string.IsNullOrEmpty(_level))
            {
                msg.Add("簽核群組");
            }

            if (msg.Count == 0)
            {
                update_flow(_rowno, _level, _text, _uid,_mail.ToString());

                sMsg.Value = "修改成功";
            }
            else
            {
                string x = string.Join(",", msg.ToArray()) + "資料不得為空白";
                sMsg.Value = x;
            }
            return isPass;
        }

        private void update_flow(string Rowno, string Level, string Text, string UserID,string Mail)
        {
            try
            {
                
                using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate))
                {
                    StringBuilder sb = new StringBuilder();
                    sb.Append(" update eipe.dbo.ipqc_flow set ");
                    sb.AppendFormat(" text='{0}' ", Text);
                    sb.AppendFormat(", uid='{0}' ", UserID);
                    sb.AppendFormat(", class='{0}' ", Level);
                    sb.AppendFormat(", mail='{0}' ", Mail);
                    sb.AppendFormat(", modify_user='{0}' ", CurrentUser.LogonID);
                    sb.AppendFormat(", modify_time='{0}' ", DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss"));
                    sb.AppendFormat(" where rowno='{0}' ", Rowno);

                    rs.ExecuteNonQuery(sb.ToString());
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void Btn_Update_Click(object sender, EventArgs e)
        {
            Update();
        }
    }
}