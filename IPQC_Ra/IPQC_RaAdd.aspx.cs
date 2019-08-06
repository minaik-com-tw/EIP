using System;
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
    public partial class IPQC_RaAdd : IPQC_RaBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lang = CurrLang;

            if (!IsPostBack)
            {
                Init();

            }
            else
            {

                _product = cbo_product.SelectedValue;
                _test_item = cbo_testitem.SelectedValue;
                _test_type = cbo_testtype.SelectedValue;
                _equipment = cbo_Machine.SelectedValue;
                _material = cbo_material.SelectedValue;
                _receivedDt = DateTime.Now;
                _week = new TaiwanCalendar().GetWeekOfYear(DateTime.Now, System.Globalization.CalendarWeekRule.FirstDay, System.DayOfWeek.Sunday).ToString();
                getDept(CurrentUser.ID);
                _dispatch = txt_dispatch.Text;
                string bom = txt_bomdt.Text;
                if (!string.IsNullOrEmpty(bom))
                {
                    _bomDt = Convert.ToDateTime(bom);
                }

                _tooling = txt_tooling.Text;
                
                _program = cbo_program.SelectedValue;
                _sample = int.Parse(txt_sample.Text);
                
                _remark = txt_remark.Text;
            }

            
            Btn_Save.Text = getStr("save");
            Btn_Continue.Text = getStr("continue");
            Cancel.Text = getStr("back");

            initCboList();
        }

        private void initCboList()
        {
            cbo_product.Items.Clear();
            getProduct(cbo_product, true);

            cbo_testtype.Items.Clear();
            getTestType(cbo_testtype, true);

            cbo_testitem.Items.Clear();
            getTestItem(cbo_testitem, true);

            cbo_program.Items.Clear();
            getProgram(cbo_program, true);

            cbo_Machine.Items.Clear();
            getMachin(cbo_Machine);

            cbo_material.Items.Clear();
            getMaterial(cbo_material, true); 
            
        }

        private void Init()
        {
            string week = new TaiwanCalendar().GetWeekOfYear(DateTime.Now, System.Globalization.CalendarWeekRule.FirstDay, System.DayOfWeek.Sunday).ToString();


            getDept(CurrentUser.ID);
            txt_sample.Text = _sample.ToString();
            lab_applicant.Text = _user;
            lab_depat.Text = _dept;
            lab_Received.Text = DateTime.Now.ToString("yyyy/MM/dd");
            lab_week.Text = week;
            
        }

        protected void Btn_Continue_Click(object sender, EventArgs e)
        {
            string rowid = Guid.NewGuid().ToString();
            bool isPass = save(rowid, "c");
            if (isPass)
            {
                Response.Redirect("/IPQC_Ra/IPQC_RaAdd.aspx");
            }
        }

        protected void Btn_Save_Click(object sender, EventArgs e)
        {
            string rowid = Guid.NewGuid().ToString();
            bool isPass = save(rowid, "c");
            if (isPass)
            {
                Response.Redirect("/IPQC_Ra/IPQC_RaEdit.aspx?rowid=" + rowid);
            }
        }

    }
}
