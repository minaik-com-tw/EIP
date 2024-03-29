using System;
using System.Collections.Generic;
using System.Resources;
using System.Text;
using System.Web.UI.WebControls;


namespace Lab
{
    public partial class Lab : MABase
    {
        string _applicant = "", _Ra_No = "", _receivedDt = "", _tooling = "", _startDt = "", _endDt = "";
        string _product = "", _type = "", _status = "", _program="";
        public void Page_Load(object sender, EventArgs e)
        {

            lang = CurrLang;

            IPQC_RaBase Baseic = new IPQC_RaBase();
            Baseic.lang = lang;

            Baseic.getTestType(cbo_type);
            Baseic.getProduct(ddl_product);
            Baseic.getProgram(ddl_program);

            if (!IsPostBack)
            {
                //  _applicant = txt_applicant.Text;
                _startDt = DateTime.Now.AddDays(-14).ToString("yyyy/MM/dd");
                _endDt = DateTime.Now.ToString("yyyy/MM/dd");

                Utility.getStatus(ddl_status, lang);

            }
            else
            {
                _Ra_No = txt_no.Text;
                _startDt = txt_startDt.Text;
                _endDt = txt_endDt.Text;
                _tooling = txt_Tooling.Text;
                _type = cbo_type.SelectedValue;
                _program = ddl_program.Text;
                _product = ddl_product.Text;
                _status = ddl_status.SelectedValue;
            }

            txt_startDt.Text = _startDt;
            txt_endDt.Text = _endDt;
            btn_qry.Text = getStr("qry");

        }

        public void Page_PreRender(object sender, System.EventArgs e)
        {
            this.KeepURL();
            Query();
            
        }

        public void Query()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("  SELECT  h.rowid ,l.rowid 'lab_id',h.ra_no,h.equipment,h.tooling_no,convert(char(10),h.manufacture_dt,111) 'manufacture_dt',convert(char(10),h.received_dt,111) 'received_dt', m.en 'material',sample,h.data_nuit, l.result ");
            sb.Append("  ,l.status  'status', u.id 'user_id',u.name 'Applicant',tt.en 'test_type',ti.en 'test_item' ,pt.en 'product',pg.en 'program' ,d.dept_nm,h.dispatch_no ,u2.name 'modify_user' ");
            sb.Append("  FROM  EIPE.dbo.IPQC_Ra_Head h ");
            sb.Append("  left join eipe.dbo.IPQC_Ra_Lab l on l.head_id=h.rowid  ");
            sb.Append("  left join eipe.dbo.IPQC_Ra_Option tt on tt.rowid= h.test_type ");
            sb.Append("  left join eipe.dbo.IPQC_Ra_Option ti on ti.rowid= h.test_item ");
            sb.Append("  left join eipe.dbo.IPQC_Ra_Option pt on pt.rowid= h.product ");
            sb.Append("  left join eipe.dbo.IPQC_Ra_Option pg on pg.rowid= h.program ");
            sb.Append("  left join eipe.dbo.IPQC_Ra_Option m on m.rowid= h.material ");
            sb.Append("  left join eipa.dbo.dguser u on u.id= h.employee ");
            sb.Append("  left join eipa.dbo.dguser u2 on u2.id= l.modify_user ");
                       
            sb.Append("  left join eipa.dbo.lea_hm1dept10 d on d.dept_no= h.applied_dep where h.status='3' {0} order by h.ra_no,manufacture_dt desc ");

            string seach = string.Format(sb.ToString(), limit(), lang.ToString());
            DataList1.SQL = seach;
            

        }

        private string limit()
        {
            StringBuilder sb = new StringBuilder();

            if (!string.IsNullOrEmpty(_applicant))
            {
                sb.AppendFormat(" and employee ='{0}' ", _applicant);
            }

            if (!string.IsNullOrEmpty(_startDt))
            {
                sb.AppendFormat(" and convert(char(10), received_dt,111) >='{0}'", _startDt);
            }

            if (!string.IsNullOrEmpty(_endDt))
            {
                sb.AppendFormat(" and convert(char(10), received_dt,111) <='{0}' ", _endDt);
            }

            //if (!string.IsNullOrEmpty(_product))
            //{
            //    sb.AppendFormat(" and product ='{0}' ", _product);
            //}
            if (!string.IsNullOrEmpty(_Ra_No))
            {
                sb.AppendFormat(" and ra_no ='{0}'", _Ra_No);
            }

            if (!string.IsNullOrEmpty(_tooling))
            {
                sb.AppendFormat(" and tooling_no ='{0}'", _tooling);
            }
            if (!string.IsNullOrEmpty(_type))
            {
                sb.AppendFormat(" and test_type ='{0}'", _type);
            }

            if (!string.IsNullOrEmpty(_status))
            {
                sb.AppendFormat(" and l.status ='{0}'", _status);
            }


            if (!string.IsNullOrEmpty(_product))
            {
                sb.AppendFormat(" and product ='{0}' ", _product);
            }


            if (!string.IsNullOrEmpty(_program))
            {
                sb.AppendFormat(" and program ='{0}' ", _program);
            }


            return sb.ToString();
        }

        protected void Btn_Add_Click(object sender, EventArgs e)
        {
            base.Redirect_Add();
        }

        protected void DataList1_OnRenderCell(object sender, System.Data.DataRowView rs, SmoothEnterprise.Web.UI.WebControl.DataColumn column, SmoothEnterprise.Web.UI.WebControl.DataCell cell, EventArgs e)
        {
            bool isDisplay = getEditUser();

            if (IPQC_RaBase.isManage)
            {
                isDisplay = true;
            }

            if (column.ID.Contains("edit"))
            {
                if (isDisplay)
                {
                    cell.OutputHTML = "<a href=\"" + getEdit + "?rowid=" + rs["rowid"] + "&lab_id=" + rs["lab_id"] + "\"><img src=\"/Lib/Img/icon-edit.gif\" border=\"0\"></a>";
                }
            }

            if (column.ID.Contains("view"))
            {
                cell.OutputHTML = "<a href=\"" + getView + "?rowid=" + rs["rowid"] + "&lab_id=" + rs["lab_id"] + "\"><img src=\"/lib/img/icon-zoom.gif\" border=\"0\"></a>";
            }

            if (column.ID == "status")
            {
                //tranfer_status("0"), tranfer_status("1"), tranfer_status("2"), tranfer_status("3"), tranfer_status("4"), getStr("no_inspection")
                string Action = rs["status"].ToString();

                string html = "";

                if (!string.IsNullOrEmpty(Action))
                {
                    html = tranfer_status(Action);
                }
                else
                {
                    html = "<div style=\"color:red\" >" + getStr("no_inspection") + "</div>";
                }
                cell.OutputHTML = html;
            }

            if (column.ID == "result")
            {
                string show = "";

                if (!string.IsNullOrEmpty(rs["result"].ToString()))
                {
                    if (rs["status"].ToString() == "3") //�f�֧���
                    {
                        int situation = (int)rs["result"];
                        if (situation == 0)
                        {
                            show = "<font color=\"red\" >FAIL</font>";
                        }
                        else if (situation ==1)
                        {
                            show = "<font color=\"green\" >PASS</font>";
                            
                        }
                        else 
                        {
                            show = "<font color=\"#FF9F1C\" >OOC</font>";
                        }
                    }
                }

                cell.OutputHTML = show;
            }
        }

   

        protected void Btn_Del_Click(object sender, EventArgs e)
        {

        }

        private bool getEditUser()
        {
            bool isPass = false;
            using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate))
            {
                string sql = "select  * from eipe.dbo.ipqc_ra_mail where u_group='Maintain' ";
                rs.Open(sql);
                while (!rs.EOF)
                {
                    string logonid = rs["logonid"].ToString();

                    if (CurrentUser.LogonID.ToUpper() == logonid.ToUpper())
                    {
                        isPass = true;
                        break;
                    }
                    rs.MoveNext();
                }
            }

            return isPass;
        }

        public string getStr(string Key)
        {
            return GetLocalResourceObject(Key).ToString();
        }

        protected void btn_qry_Click(object sender, EventArgs e)
        {

        }
    }
}
