using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Option
{
    public partial class OptionEdit : System.Web.UI.Page
    {
        string _type = "", _en = "", _tw = "";
        int _default = 0,_display=0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getOption(Request.QueryString["rowid"]);
            }
            else
            {
                _type = cboType.SelectedValue;
                _default = int.Parse(rbt1.SelectedValue);
                _display = int.Parse(rbt_display.SelectedValue);
                _en = txtEn.Text;
                _tw = txtTw.Text;
                
            }
        }

        private void getOption(string rowid)
        {
            using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate))
            {
                string sql = "select * from eipe.dbo.IPQC_Ra_Option where rowid='" + rowid + "'";

                rs.Open(sql);
              
                if (!rs.EOF)
                {
                    //rowid,main,kind,en,tw,seq,def
                    _default = rs["def"] == "false" ? 1 : 0;
                    _type = rs["kind"].ToString();
                    _en = rs["en"].ToString();
                    _tw = rs["tw"].ToString();
                    _display = ( (bool)rs["display"]) ? 1 : 0;
                } 
            }

            cboType.Items.AddRange(IPQC_RaBase.getKind(_type));
            rbt1.SelectedValue = _default.ToString();
            rbt_display.SelectedValue = _display.ToString();
            cboType.SelectedValue = _type;
            rbt1.SelectedValue = _default.ToString();
            rbt_display.SelectedValue = _display.ToString();
            txtEn.Text = _en;
            txtTw.Text = _tw;

        }

        protected void Save_Click(object sender, EventArgs e)
        {
            save();
        }
         

        private void save()
        {
            _default =int.Parse( rbt1.SelectedValue);
            _en = txtEn.Text;
            _tw = txtTw.Text;
            _type = cboType.SelectedValue;

            if (string.IsNullOrEmpty(_tw))
            {
                _tw = _en;
            }

            if (_default ==1)
            {
                updateDefault(_type);
            }

            update(Request.QueryString["rowid"]);
            ClientScript.RegisterStartupScript(this.GetType(), "", "alert('Save is success');back()", true);
        }

        private void update(string rowid)
        {
            using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate))
            {
                string sql = " select * from eipe.dbo.IPQC_Ra_Option where rowid='" + rowid + "' ";
                rs.Open(sql);

                rs["Kind"] = _type;
                rs["en"] = _en;
                rs["tw"] = _tw;
                rs["def"] = _default;
                rs["display"] = (_display==1)?true:false;

                rs.Update();
                rs.Close();
            }
        }

        protected void updateDefault(string _type)
        {
            using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate))
            {

                string sql = " update eipe.dbo.IPQC_Ra_Option set def=0 where  kind='" + _type + "' ";
                rs.ExecuteNonQuery(sql);
            }

        }

    }
}