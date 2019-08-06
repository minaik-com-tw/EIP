using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Standard
{
    public partial class StandardAdd : LeicaBase
    {
        string _rowid = "";
        string _sandard_id = "";
        string _max = "", _min = "", _value = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            this.msg.Value = "";

            if (!IsPostBack)
            {
                _rowid = Guid.NewGuid().ToString();
                _sandard_id = Request.QueryString["standard_id"].ToString();
                txt_standard.Text = getStandrad(_sandard_id);
            }
            else
            {
                _sandard_id = Request.QueryString["standard_id"].ToString();
                _rowid = rowid.Value;
                _max = txt_max.Text;
                _min = txt_min.Text;
                _value = txt_val.Text;
                
            }

            rowid.Value = _rowid;
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            save();
        }



        private bool save()
        {
            bool ispass = true;
            msg.Value = "";
            List<string> alert = new List<string>();

            if (string.IsNullOrEmpty(_max))
            {
                alert.Add("上限");
                ispass = false;
            }

            if (string.IsNullOrEmpty(_min))
            {
                alert.Add("下限");
                ispass = false;
            }

            if (string.IsNullOrEmpty(_value))
            {
                alert.Add("抽樣數");
                ispass = false;
            }

           
            if (alert.Count > 0)
            {
                msg.Value = string.Join(",", alert.ToArray()) + "必填";
            }
            if (ispass)
            {
                ispass = Insert(_sandard_id, _max, _min, _value);
            }
            return ispass;

        } 

        protected bool Insert(string standar, string max, string min, string val)
        {
            bool pass = false;
            try
            {
                using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate))
                {

                    string sql = string.Format(" select * from eipe.[dbo].[Leica_Standard] where Standard_id='{0}' and max='{1}' and min='{2}'  ", standar, max, min);
                    rs.Open(sql);
                    if (rs.EOF)
                    {
                        rs.Add();

                        rs["rowid"] = Guid.NewGuid().ToString();
                        rs["Standard_id"] = standar;
                        rs["min"] = min;
                        rs["max"] = max;
                        rs["value"] = val;
                        rs["modify_user"] = CurrentUser.LogonID;
                        rs["modify_date"] = DateTime.Now.ToString();

                        rs.Update();
                        rs.Close();

                        this.msg.Value = "新增成功";
                        pass = true;
                    }
                    else
                    {
                        this.msg.Value = "資料已存在，請確認";
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }

            return pass;
        }
         

        protected void Btn_Back_Click(object sender, EventArgs e)
        {
            _sandard_id = Request.QueryString["standard_id"].ToString();
            Response.Redirect("Standard.aspx?standard_id=" + _sandard_id);
        }
    }
}