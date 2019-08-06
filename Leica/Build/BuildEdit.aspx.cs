using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Build
{
    public partial class BuildEdit : LeicaBase
    {
        string _program = "Leica";
        string _menu = "",_tw="",_en = "";
        
        bool _def = false;
        bool _display = true ;
        string _rowid = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            lang = CurrLang;
            _rowid = Request.QueryString["rowid"].ToString();
            msg.Value = "";
            if (!IsPostBack)
            {
                
                InitUI(_rowid);
            }
            else
            {
               //_program =lab_program.Text;
               
                _def = chk_def.Checked;
                _display = chk_display.Checked;
            }

        }


        private void InitUI(string rowid)
        {
            using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead))
            {
                string sql = string.Format(" select * from eipe.dbo.Sys_Option where rowid='{0}' and main='{1}' ", rowid,_program);
                rs.Open(sql);

                if (!rs.EOF)
                {
                    //lab_program.Text = rs["main"].ToString();

                    //lab_menu.Text = rs["kind"].ToString();

                    chk_def.Checked = (bool)rs["def"];
                    chk_display.Checked = (bool)rs["display"]  ?false :true ;

                    lab_en.Text = rs["en"].ToString();
                    lab_tw.Text = rs["tw"].ToString();


                }
            }
        }

        private void update()
        {
            
            using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate))
            {
                string sql = string.Format(" select * from eipe.dbo.Sys_Option where rowid='{0}' and main='{1}' ", _rowid, _program);

                rs.Open(sql);
                
                 
                rs["def"] = _def == true ? 1 : 0;
                rs["display"] = _display == true ? 0 :1;

                rs.Update();
                rs.Close();

                if (_def == true)
                {
                    string sql2 = string.Format(" select * from eipe.dbo.Sys_Option where rowid!='{0}' and main='{1}' ", _rowid, _program);
                    rs.Open(sql2);

                    while (!rs.EOF)
                    {
                        rs["def"] = 0;
                        
                        rs.Update();
                        rs.MoveNext();
                        
                    }
                    rs.Close();
                }
                msg.Value = "更新成功";
            }
        }

        protected void Btn_Update_Click(object sender, EventArgs e)
        {
            update();
        }

    
    }
}