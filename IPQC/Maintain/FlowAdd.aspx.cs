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
    public partial class FlowAdd : IPQC_Base
    {
        string _uid = "", _text = "", _level=""  ;
        bool enable = false;
        int _seq = 0,_mail=0;
        protected void Page_Load(object sender, EventArgs e)
        {
            string account="";
            if (!IsPostBack)
            {
                setlevel(cbo_level);
            }
            else
            {
                _level = cbo_level.SelectedValue;
                account = txt_user.Text;
                _text = txt_text.Text;
                _uid = Uid.Value;
                _mail = int.Parse(rbt_mail.SelectedValue);
            }

            txt_user.Text = account;
            cbo_level.SelectedValue = _level;
            Uid.Value=_uid;
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            save();
        }



        private bool save()
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
                isPass = Insert(_uid, _text, _level,_mail);
            }
            else
            {
                string x = string.Join(",", msg.ToArray())+"資料不得為空白";
                sMsg.Value = x;
            }
            
             

            return isPass;
        }


        protected void Btn_Continue_Click(object sender, EventArgs e)
        {
            bool pass = save();
            if (pass)
            {
                Response.Redirect("FlowAdd.aspx");
            }
        }

        protected bool Insert(string uid, string text, string level,int mail)
        {
            bool pass = false;
            try
            {　  
                using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate))
                {
                   string seq =rs.ExecuteScalar(" select (isnull(max(seq),0)+1) 'seq' from eipe.dbo.ipqc_flow where class='" + level + "' ").ToString();
                    string sql = string.Format(" select * from eipe.dbo.ipqc_flow where uid='{0}'", uid);
                    rs.Open(sql);
                    if (rs.EOF)
                    {
                        rs.Add();

                        rs["rowno"] = Guid.NewGuid().ToString();
                        rs["text"] = text;
                        rs["uid"] = uid;
                        rs["seq"] = seq;
                        rs["enable"] = 1;
                        rs["class"] = level;
                        rs["mail"] = mail;

                        rs["modify_user"] = CurrentUser.LogonID;
                        rs["modify_time"] = DateTime.Now.ToString();

                        rs.Update();
                        rs.Close();
                        
                        pass = true;

                        sMsg.Value = "新增成功";
                    }
                    else
                    {
                        sMsg.Value = "簽核人員重覆";
                    }
                }
            }
            catch (Exception ex)
            {
                sMsg.Value = ex.Message; 
            }

            return pass;
        }



    }
}