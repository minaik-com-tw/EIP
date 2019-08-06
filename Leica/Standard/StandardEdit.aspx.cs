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
    public partial class StandardEdit : LeicaBase
    {
        string _rowid = "";
        string _sandard_id = "";
        string _max = "", _min = "", _value = "";


        protected void Page_Load(object sender, EventArgs e)
        {
            this.msg.Value = "";

            if (!IsPostBack)
            {
                _rowid = Request.QueryString["rowid"].ToString();
                setUI();
                standard.Value=_sandard_id;
            }
            else
            {
                _sandard_id =standard.Value;
                _rowid = rowid.Value;
                _value = txt_val.Text;
                update();
            }

            rowid.Value = _rowid;
           
        }

        private void setUI()
        {
            using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead))
            {
                string sql = string.Format(" select * from eipe.dbo.Leica_Standard where rowid='{0}' ", _rowid);
                rs.Open(sql);

                if (!rs.EOF)
                {
                    txt_standard.Text = getStandrad(rs["Standard_id"].ToString());
                    _sandard_id = rs["Standard_id"].ToString();
                    lab_min.Text = rs["min"].ToString();
                    lab_max.Text = rs["max"].ToString();
                    txt_val.Text = rs["value"].ToString();
                }
            }
        }

        private void update()
        {
            try
            {
                using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate))
                {
                    string sql = string.Format(" select * from eipe.dbo.Leica_Standard where rowid='{0}' ", _rowid);

                    rs.Open(sql);
                    if (!rs.EOF)
                    {
                        rs["value"] = _value;
                        rs["modify_user"] = CurrentUser.LogonID;
                        rs["modify_date"] = DateTime.Now.ToString(); 
                        rs.Update();
                        rs.Close(); 
                        ClientScript.RegisterStartupScript(ClientScript.GetType(), "java_script", "<script> Success('" + _sandard_id+"') </script>");


                    } 
                }
            }
            catch (Exception ex)
            {
                Utility.log(0, ex.Message, ex.StackTrace); 
            }
        }


    }
}