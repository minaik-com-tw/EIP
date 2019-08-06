using System;
using System.Text;
using System.Web.UI.WebControls;


namespace IPQC_Ra
{
    public partial class IPQC_Ra : MABase
    {
        string _applicant = "", _Ra_No = "", _receivedDt = "", _tooling = "", _startDt = "", _endDt = "", _program = "";
        string _product = "", _type = "", _status = "";
        public void Page_Load(object sender, EventArgs e)
        {

            lang = CurrLang;

            IPQC_RaBase Baseic = new IPQC_RaBase();
            Baseic.lang = lang;
             
            Baseic.getTestType(cbo_type);
            Baseic.getProduct(ddl_product);
            Baseic.getProgram(ddl_program);

            Utility.getStatus(ddl_status, lang);

            if (!IsPostBack)
            {
                //  _applicant = txt_applicant.Text;
                _startDt = DateTime.Now.AddDays(-14).ToString("yyyy/MM/dd");
                _endDt = DateTime.Now.ToString("yyyy/MM/dd");



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
                _status = ddl_status.Text;


            } 
            txt_startDt.Text = _startDt;
            txt_endDt.Text = _endDt;
            btn_add.Text = getStr("add");
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
            sb.Append(" SELECT TOP (300) h.rowid ,h.ra_no,h.equipment,h.tooling_no,convert(char(10),h.manufacture_dt,111) 'manufacture_dt',convert(char(10),h.received_dt,111) 'received_dt',sample,du.{1} 'data_nuit',m.{1} 'material' ");
            sb.Append(" ,h.status 'status', u.id 'user_id',u.name 'Applicant',tt.{1} 'test_type',ti.{1} 'test_item' ,pt.{1} 'product',pg.{1} 'program' ,");
            sb.Append(" d.dept_nm,h.dispatch_no ,l.status  'status2', l.result ,l.rowid 'lab_id' ");
            sb.Append(" FROM EIPE.dbo.IPQC_Ra_Head h");
            sb.Append(" left join eipe.dbo.ipqc_ra_option tt on tt.rowid= h.test_type ");
            sb.Append(" left join eipe.dbo.ipqc_ra_option ti on ti.rowid= h.test_item ");
            sb.Append(" left join eipe.dbo.ipqc_ra_option pt on pt.rowid= h.product ");
            sb.Append(" left join eipe.dbo.ipqc_ra_option pg on pg.rowid= h.program ");
            sb.Append(" left join eipe.dbo.ipqc_ra_option du on du.rowid= h.data_nuit ");
            sb.Append(" left join eipe.dbo.ipqc_ra_option m on m.rowid= h.material ");
            sb.Append(" left join eipe.dbo.IPQC_Ra_Lab l on h.rowid=l.head_id ");
            sb.Append(" left join eipa.dbo.dguser u on u.id= h.employee ");
            sb.Append(" left join eipa.dbo.lea_hm1dept10 d on d.dept_no= h.applied_dep where 1=1 {0} order by h.ra_no ,manufacture_dt desc ");

            string seach = string.Format(sb.ToString(), limit(), lang.ToString());
            DataList1.SQL = seach;

        }

        private string limit()
        {
            StringBuilder sb = new StringBuilder();

        
            if (!string.IsNullOrEmpty(_startDt))
            {
                sb.AppendFormat(" and convert(char(10), received_dt,111) >='{0}'", _startDt);
            }

            if (!string.IsNullOrEmpty(_endDt))
            {
                sb.AppendFormat(" and convert(char(10), received_dt,111) <='{0}' ", _endDt);
            }

            if (!string.IsNullOrEmpty(_product))
            {
                sb.AppendFormat(" and product ='{0}' ", _product);
            }


            if (!string.IsNullOrEmpty(_program))
            {
                sb.AppendFormat(" and program ='{0}' ", _program);
            }

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
                sb.AppendFormat(" and h.status ='{0}'", _status);
            }




            return sb.ToString();
        }

        protected void Btn_Add_Click(object sender, EventArgs e)
        {
            base.Redirect_Add();
        }

        protected void DataList1_OnRenderCell(object sender, System.Data.DataRowView rs, SmoothEnterprise.Web.UI.WebControl.DataColumn column, SmoothEnterprise.Web.UI.WebControl.DataCell cell, EventArgs e)
        {



            if (column.ID.Contains("edit"))
            {
                cell.OutputHTML = "<a href=\"" + getEdit + "?rowid=" + rs["rowid"] + "\"><img src=\"/Lib/Img/icon-edit.gif\" border=\"0\"></a>";
            }

            if (column.ID.Contains("view"))
            {
                cell.OutputHTML = "<a href=\"" + getView + "?rowid=" + rs["rowid"] + "\"><img src=\"/lib/img/icon-zoom.gif\" border=\"0\"></a>";
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
                cell.Value = "";
            }

            if (column.ID == "status2")
            {
                //tranfer_status("0"), tranfer_status("1"), tranfer_status("2"), tranfer_status("3"), tranfer_status("4"), getStr("no_inspection")
                string Action = rs["status2"].ToString();

                string html = "";

                if (!string.IsNullOrEmpty(Action))
                {
                    string lab_id = rs["lab_id"].ToString();

                    if (!string.IsNullOrEmpty(lab_id))
                    {
                        html = @"<a href=../ipqc_ra/lab/labview.aspx?rowid=" + rs["rowid"] + "&lab_id=" + rs["lab_id"] + " title='"+getStr("view2") +"' \">" + tranfer_status(Action) + "</a>";

                    }
                     
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
                    //if (rs["status2"].ToString() == "3") //審核完畢
                    //{
                    //    bool isPass = (bool)rs["result"];
                    //    if (isPass)
                    //    {
                    //        show = "<font color=\"green\" >PASS</font>";
                    //    }
                    //    else
                    //    {
                    //        show = "<font color=\"red\" >FAIL</font>";
                    //    }
                    //}

                    if (rs["status"].ToString() == "3") //審核完畢
                    {
                        int situation = (int)rs["result"];
                        if (situation == 0)
                        {
                            show = "<font color=\"red\" >FAIL</font>";
                        }
                        else if (situation == 1)
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

        public string getStr(string key)
        {
            return this.GetLocalResourceObject(key).ToString();
        }



        protected void Btn_Query_Click(object sender, EventArgs e)
        {

        }
    }


}
