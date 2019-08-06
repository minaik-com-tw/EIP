using System;
using System.Collections.Generic;
using System.Text;
using System.Web;
using System.Web.UI.WebControls;

/// <summary>
/// IPQC_Base 的摘要描述
/// </summary>
public class IPQC_Base : SmoothEnterprise.Web.Page
{
    public string accept = "";
    public string view = "";
    public string s1 = "width:50";
    public string s2 = "";

    public language lang = (language)1;
    protected int _status = 0;
    public IPQC_Base()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public static void setlevel(DropDownList cbo)
    {
        cbo.Items.Add(new ListItem("Select", ""));
        cbo.Items.Add(new ListItem("HOD ", "1"));
        cbo.Items.Add(new ListItem("Director", "2"));
        cbo.Items.Add(new ListItem("Advanced", "3"));
    }

    public static void getChkItem(DropDownList cbo)
    {
        cbo.Items.Add(new ListItem("NA", ""));
        cbo.Items.Add(new ListItem("合格", "合格"));
        cbo.Items.Add(new ListItem("不合格", "不合格"));
    }

    protected void getCommit(DropDownList cbo)
    {
        ListItem[] list = Utility.getOPItem("SELECT rowno 'id', value 'en', text 'tw'  FROM EIPE.DBO.IPQC_parameter where parameter = 'commit' order by seq", "", lang,false);

        
        cbo.Items.Clear();
        cbo.Items.AddRange(list);
        cbo.Items.RemoveAt(0);//delete select

    }

    public language CurrLang
    {
        get
        {
            language curr = (language)1;

            string langVal = Request.Form["ctl00$HeaderControl1$FIELD_language"];

            if (string.IsNullOrEmpty(langVal))
            {
                if (Request.Cookies["userLan"] != null)
                {
                    langVal = Request.Cookies["userLan"].Value;
                }
                else
                {
                    langVal = curr.ToString();
                }
            }

            if (langVal.Contains("en"))
            {
                curr = language.en;
            }

            if (langVal.Contains("tw"))
            {
                curr = language.tw;
            }
            return curr;
        }
    }


    protected void getView()
    {
        using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate))
        {

            string sql = "SELECT *,u.name 'user' FROM eipe.dbo.ipqc_flow F left join dguser u on f.uid=u.id WHERE F.ENABLE ='1' and f.mail=1 order by class , seq ";
            rs.Open(sql);
            StringBuilder sb = new StringBuilder();
            int i = 0;
            while (!rs.EOF)
            {
                sb.Append(" <div class=\"div_tr\" > ");

                sb.AppendFormat(" <div class=\"div_td col3 leve{1}\" style=\"height:36px;text-align: center\" >{0}:{2}</div></div> ", rs["text"].ToString(), rs["class"].ToString(), rs["user"]);
                rs.MoveNext();
                i++;
            }

            if (string.IsNullOrEmpty(sb.ToString()))
            {
                s1 = "width:100%";
                s2 = "display:none";
            }

            view = sb.ToString();
        }


    }

    protected void getflow(Panel p_list)
    {
        using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate))
        {
            string sql = "SELECT * FROM eipe.dbo.ipqc_flow F  WHERE enable='1' and mail='0' order by class , seq ";
             
            
            rs.Open(sql);
            StringBuilder sb = new StringBuilder();

            while (!rs.EOF)
            {

                string uid = rs["uid"].ToString();
                Dictionary<string, string> User = Utility.GetUIDInfo(uid);
                string seq = rs["class"] + "_" + rs["seq"];
                Panel tr = new Panel();
                tr.ID = "tr_" + seq;
                tr.CssClass = "div_tr ";
                tr.Style.Add("text-align", "center");
                tr.Style.Add("heigth", "35px");

                Panel td1 = new Panel();
                td1.CssClass = "div_td col3 leve" + rs["class"];
                Label lab_txt = new Label();
                lab_txt.Text = rs["text"].ToString() + " " + User["NAME"];

                td1.Controls.Add(lab_txt);


                Panel td2 = new Panel();
                td2.ID = "td_" + seq;
                td2.CssClass = "div_td col4 leve" + rs["class"];

                DropDownList cbo_select = new DropDownList();
                getCommit(cbo_select);
                cbo_select.ID = "cbo_" + seq;
                cbo_select.Enabled = false;

                string currPage = Request.Path.ToUpper();

                if ("{" + uid.ToUpper() + "}" == CurrentUser.ID.ToUpper() && currPage.Contains("VIEW.ASPX"))
                {
                    if (_status == 1)
                    {
                        cbo_select.Enabled = true;
                        cbo_select.CssClass = "require";
                    }  
                }


                if (!currPage.Contains("ADD.ASPX"))
                {
                    string qty = string.Format("select commit_id from eipe.dbo.ipqc_flow_record r  where ipqc_id='{0}' and flow_id='{1}'  ", Request.QueryString["ROWNO"], uid);
                    string commit_id = rs.ExecuteScalar(qty) == null ? string.Empty : rs.ExecuteScalar(qty).ToString();
                    
                    cbo_select.SelectedValue = commit_id;
                    if (!string.IsNullOrEmpty(commit_id))
                    {
                        cbo_select.Enabled = false;
                    }
                }

                td2.Controls.Add(cbo_select);

                tr.Controls.Add(td1);
                tr.Controls.Add(td2);
                p_list.Controls.Add(tr);
                //---------------

                rs.MoveNext();

            }

        }
    }



}
