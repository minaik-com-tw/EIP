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
    public partial class BuildAdd : LeicaBase
    {

        string _program = "Leica", _en = "", _tw = "", _menu = "";
        bool _def = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            msg.Value = "";
            lang = CurrLang;
            if (IsPostBack)
            {
                // _program = ddl_program.SelectedValue;
                _menu = ddl_menu.SelectedValue;
                _en = txt_en.Text;
                _tw = txt_tw.Text;
                _def = chk_def.Checked;
            }
            else
            {
                getMenu(ddl_menu);
            }
        }

        

        private bool save()
        {
            bool ispass = false;
            //if (string.IsNullOrEmpty(_program))
            //{
            //    hid_msg.Value = "系統不得為空";
            //}

            if (string.IsNullOrEmpty(_menu))
            {
                msg.Value = "分類不得為空";
            }
            else if (string.IsNullOrEmpty(_en))
            {
                msg.Value = "內容不得為空";
            }
            else
            {
                ispass = Insert();

            }

            return ispass;

        }


        protected void Btn_Continue_Click(object sender, EventArgs e)
        {
            bool pass = save();
            if (pass)
            {
                Response.Redirect("BuildAdd.aspx");
            }
        }

        protected bool Insert()
        {
            bool ispass = false;

            try
            {


                using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate))

                {
                    string sql2 = string.Format(" select * from eipe.dbo.Sys_Option where Main='{0}' and  kind='{1}' and en='{2}' ", _program, _menu, _en);


                    rs.Open(sql2);
                    if (rs.EOF)
                    {
                        rs.Add();
                        rs["rowid"] = Guid.NewGuid();
                        rs["main"] = _program;
                        rs["kind"] = _menu;
                        rs["en"] = _en;
                        rs["tw"] = _tw;
                        rs["display"] = 1;
                        rs["def"] = _def == true ? 1 : 0;

                        rs.Update();
                        rs.Close();

                        if (_def == true)
                        {
                            string sql = string.Format(" select * from eipe.dbo.Sys_Option where Main='{0}' and  kind='{1}'  and en!='{2}' ", _program, _menu, _en);
                            rs.Open(sql);
                            while (!rs.EOF)
                            {
                                rs["def"] = 0;
                                rs.Update();

                                rs.MoveNext();
                            }

                            rs.Close();
                        }
                        //this.msg.Value = "新增成功";
                        msg.Value = "新增成功";
                        ispass = true;
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
            return ispass;


        }




        protected void Btn_Save_Click(object sender, EventArgs e)
        {
            save();
        }
    }
}