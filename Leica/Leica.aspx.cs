using System;
using System.Collections.Generic;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Leica_Leica : LeicaBase
{

    string _coustomer = "", _init_date = "", _init_user = "", _init_user_id = "", _module = "", _product = "", _picture = "", _version = "", _exception = "";
    string _verify = "", _question = "", _subject = "", _status = "", _dcc = "";
    string _sDt, _eDt, _custmer="";
    protected void Page_Load(object sender, EventArgs e)
    {
        btn_query.Text = getStr("query");
        Btn_add.Text = getStr("add");

        if (!IsPostBack)
        {
            Utility.getStatus(ddl_status, lang);
            OperatorKind(ddl_kind, true);
            OperatorResult(ddl_result, false);
            OperatorProduct(ddl_product, false);
            OperatorProgram(ddl_program, false);
            OperatorCustmer(ddl_custmer, false);

            _sDt = string.IsNullOrEmpty(this["sDt"]) ? DateTime.Now.AddDays(-14).ToShortDateString() : this["sDt"].ToString();
            _eDt = string.IsNullOrEmpty(this["eDt"]) ? DateTime.Now.ToShortDateString() : this["eDt"].ToString();
            _status = string.IsNullOrEmpty(this["status"]) ? "" : this["status"];

            _kind = string.IsNullOrEmpty(this["kind"]) ? "" : this["kind"];
            _result = string.IsNullOrEmpty(this["result"]) ? "" : this["result"];
            _product = string.IsNullOrEmpty(this["program"]) ? "" : this["program"];
            _program = string.IsNullOrEmpty(this["program"]) ? "" : this["program"];

            _h_operator = string.IsNullOrEmpty(this["operator"]) ? "" : this["operator"];
            _custmer= string.IsNullOrEmpty(this["custmer"]) ? "" : this["custmer"];


            Query();

        }
        else
        {


            _sDt = this.txt_sDt.Text;
            _eDt = this.txt_eDt.Text;
            _status = ddl_status.SelectedValue;

            _kind = ddl_kind.SelectedValue;
            _result = ddl_result.SelectedValue;
            _product = ddl_product.SelectedValue;
            _program = ddl_program.SelectedValue;
            _h_operator = txt_h_operator.Text;
            _custmer = ddl_custmer.SelectedValue; 

            this["sDt"] = _sDt;
            this["eDt"] = _eDt;
            this["status"] = _status;
            this["kind"] = _kind;
            this["result"] = _result;
            this["program"] = _product;
            this["program"] = _program;
            this["operator"] = _h_operator;
            this["custmer"] = _custmer;

        }

        this.txt_sDt.Text = _sDt;
        this.txt_eDt.Text = _eDt;
        ddl_status.SelectedValue = _status;
        ddl_kind.SelectedValue = _kind;
        ddl_result.SelectedValue = _result;
        ddl_product.SelectedValue = _product;
        ddl_program.SelectedValue = _program;
        txt_h_operator.Text = _h_operator;
        ddl_custmer.SelectedValue = _custmer ;
    }



    protected void DataList1_OnRenderCell(object sender, System.Data.DataRowView rs, SmoothEnterprise.Web.UI.WebControl.DataColumn column, SmoothEnterprise.Web.UI.WebControl.DataCell cell, System.EventArgs e)
    { 
        if (Utility.MIS_Manager(CurrentUser.LogonID))
        {
            cell.OutputHTML = List_Default(column.ID, rs["id"].ToString(), true);
        }
        else
        {
            bool isEdit = rs["create_user"].ToString().ToUpper() == CurrentUser.LogonID.ToUpper(); 
            cell.OutputHTML = List_Default(column.ID, rs["id"].ToString(), isEdit);
        }
 
 

        if (column.ID.ToUpper() == "STATUS")
        {
            cell.Value = tranfer_status(rs["status"].ToString());

        }

    }

    private void Query()
    {
        StringBuilder sb = new StringBuilder();
         
        if (!string.IsNullOrEmpty(_status))
        {
            sb.AppendFormat(" and status ='{0}' ", _status);
        }

        if (!string.IsNullOrEmpty(_sDt))
        {
            sb.AppendFormat(" and insp_dt >='{0}' ", _sDt);
        }

        if (!string.IsNullOrEmpty(_eDt))
        {
            sb.AppendFormat(" and insp_dt <='{0}' ", _eDt);
        }

        if (!string.IsNullOrEmpty(_product))
        {
            sb.AppendFormat(" and product ='{0}' ", _product);
        }

        if (!string.IsNullOrEmpty(_program))
        {
            sb.AppendFormat(" and program ='{0}' ", _program);
        }

        if (!string.IsNullOrEmpty(_kind))
        {
            sb.AppendFormat(" and kind ='{0}' ", _kind);
        }

        if (!string.IsNullOrEmpty(_result))
        {
            sb.AppendFormat(" and reqult ='{0}' ", _result);
        } 

        if (!string.IsNullOrEmpty(_h_operator))
        {
            sb.AppendFormat(" and h_operator ='{0}' ", _h_operator);
        }


        if (!string.IsNullOrEmpty(_custmer))
        {
            sb.AppendFormat(" and custmer ='{0}' ", _custmer);
        }


        StringBuilder sql = new StringBuilder();

        sql.AppendFormat("select  h.rowid 'id' , insp_no, pd.{0} 'product', pg.{0} 'program', h_operator,convert(nvarchar(10),insp_dt,121) 'insp_dt' ,h.status,k.{0} 'kind',r.{0} 'result'  ", CurrLang);
        sql.AppendFormat(" ,u.name 'operator',c.{0} 'custmer' from eipe.dbo.leica_head h  ", CurrLang);
        sql.Append(" left join eipe.dbo.leica_base b on h.rowid=b.head_id ");
        sql.Append(" left join eipe.dbo.sys_option pd on h.product=pd.rowid ");
        sql.Append(" left join eipe.dbo.sys_option pg on h.program=pg.rowid  ");
        sql.Append(" left join eipe.dbo.sys_option k on h.kind=k.rowid ");
        sql.Append(" left join eipe.dbo.sys_option r on h.result=r.rowid ");
        sql.Append(" left join eipe.dbo.sys_option c on h.custmer=r.rowid ");
        sql.Append(" left join eipa.dbo.dguser u on h.h_operator=u.logonid ");

        if (!string.IsNullOrEmpty(sb.ToString()))
        {
            sql.AppendFormat(" where 1=1 {0}",sb.ToString());
        }

        sql.AppendFormat(" group by h.rowid, insp_no,pg.{0},pd.{0},h_operator,insp_dt,h.status,k.{0},r.{0} ,u.name,c.{0}", CurrLang);
         
        DataList1.SQL = sql.ToString();

        Utility.Debug(sql.ToString());

    }


    protected void Btn_add_Click(object sender, EventArgs e)
    {
        Response.Redirect("LeicaApp.aspx");
    }


    protected void btn_query_Click(object sender, EventArgs e)
    {
        Query();
    }
}


