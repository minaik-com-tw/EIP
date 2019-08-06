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
    public partial class OptionAdd :System.Web.UI.Page
    {
        string _type = "", _en="", _tw="";
        int _default=0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cboType.Items.AddRange(IPQC_RaBase.getKind(_type));
                rbt1.SelectedValue = _default.ToString(); 
            }
        } 

        protected void Save_Click(object sender, EventArgs e)
        {
            save();
        }

        protected void Save__Click(object sender, EventArgs e)
        {
            save();
        }

        private void save()
        {
            _default = int.Parse(rbt1.SelectedValue);
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

            Insert(_type,_en,_tw,_default);
            ClientScript.RegisterStartupScript(this.GetType(), "", "alert('Save is success');back()", true);
        }


        protected void Btn_Continue_Click(object sender, EventArgs e)
        {
            save();
            Response.Redirect("OptionAdd");

        } 

        protected void Insert(string type, string en, string tw, int def)
        {
            using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate))
            {

                string sql = " select * from eipe.dbo.IPQC_Ra_Option where 1=0 ";
                rs.Open(sql);
                rs.Add();

                rs["rowid"] = Guid.NewGuid().ToString();
               
                rs["Kind"] = type;
                rs["en"] = en;
                rs["tw"] = tw;
                rs["def"] = def;
                rs["display"] = 1;

                rs.Update();
                rs.Close();
            }
        }

        protected void updateDefault(string _type)
        {
            using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate))
            {

                string sql = " update eipe.dbo.sys_option2 set def=0 where main='vmi' and kind='" + _type + "' ";
                rs.ExecuteNonQuery(sql);
            }

        }


    }
}