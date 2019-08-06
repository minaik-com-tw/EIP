using System;
using System.Data.SqlClient;
using System.Text;
using System.Web.UI.WebControls;
using System.Collections.Generic;
using System.Web;
/// <summary>
/// OQC_Base 的摘要描述
/// </summary>

public class OQC_Base : SmoothEnterprise.Web.Page
{
    public List<Topaper> topaper;
    //ctl00$HeaderControl1$FIELD_language
    
    public OQC_Base()
    { 
    }

    /// <summary>
    ///查詢頁
    /// </summary>
    public static class Qty_cbo
    {
        public static readonly string model = " SELECT id,tw,en FROM EIPE.dbo.OQC_basehead where tpen='model' and  del='0'  order by en ";
        public static readonly string prod = "  SELECT id,tw,en FROM EIPE.dbo.OQC_basehead where tpen='proM' and del='0' order by en ";
        public static readonly string work = "  SELECT id,tw,en FROM EIPE.dbo.OQC_basehead where tpen='work' and del='0' order by en ";
        public static readonly string defect = " SELECT id,en,tw FROM EIPE.dbo.OQC_basehead where tpen='def' and del='0' order by en ";
    }

    /// <summary>
    /// 操作頁面
    /// </summary>
    public static class Input_cbo
    {
        public static readonly string model = " SELECT id,tw,en FROM EIPE.dbo.OQC_basehead where tpen='model' and display='1' and del='0'  order by en ";
        public static readonly string prod = "  SELECT id,tw,en FROM EIPE.dbo.OQC_basehead where tpen='proM' and display='1' and del='0' order by en ";
        public static readonly string work = "  SELECT id,tw,en FROM EIPE.dbo.OQC_basehead where tpen='work' and display='1' and del='0' order by en ";
        public static readonly string defect = " SELECT id,en,tw FROM EIPE.dbo.OQC_basehead where tpen='def' and display='1'  and del='0' order by en ";
        public static readonly string kind = "select tpen 'id' ,kind 'en' ,kind 'tw' from eipe.dbo.OQC_basehead  where kind is not null group by kind ,tpen";

    }



    #region Qty option 
    public static void getKind(DropDownList cbo)
    {
        cbo.Items.Clear();
        cbo.Items.AddRange(Utility.getOPItem(Input_cbo.kind, cbo.SelectedValue, language.en, false));

    }

    public void setbaseList(DropDownList Seletor, string SQL)
    {
        setbaseList(Seletor, SQL, "");
    }

    public void setbaseList(DropDownList Seletor, string SQL, string selected)
    {
        System.Web.UI.WebControls.ListItem[] List = new ListItem[0];
        SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
        try
        {
            rs.Open(SQL);

            int iCount = rs.Rows.Count + 1;
            List = new ListItem[(iCount)];

            List[0] = new ListItem("Select", "");

            int i = 0;
            while (!rs.EOF)
            {
                i += 1;
                List[i] = new ListItem(rs["tw"].ToString(), rs["id"].ToString());

                if (rs["id"].ToString() == selected)
                {
                    List[i].Selected = true;
                }
                rs.MoveNext();

            }

            rs.Close();
        }
        catch (Exception ex)
        {
            throw ex;
        }

        Seletor.Items.AddRange(List);

    }

    public ListItem[] setbaseheadItem(string SQL)
    {
        return setbaseheadItem(SQL);
    }

    public ListItem[] setbaseheadItem(string SQL, string selectValue)
    {
        System.Web.UI.WebControls.ListItem[] List = new ListItem[0];
        SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
        try
        {
            rs.Open(SQL);

            int iCount = rs.Rows.Count + 1;
            List = new ListItem[(iCount)];

            List[0] = new ListItem("Select", "");

            int i = 0;
            while (!rs.EOF)
            {
                i += 1;
                List[i] = new ListItem(rs["tw"].ToString(), rs["id"].ToString());

                if (rs["id"].ToString() == selectValue && !string.IsNullOrEmpty(selectValue))
                {
                    List[i].Selected = true;
                }

                rs.MoveNext();

            }

            rs.Close();
        }
        catch (Exception ex)
        {
            throw ex;
        }

        return List;

    }

    public SqlDataReader Read(string SQL) //這裡是用「public SqlDataReader」
    {
        SqlConnection conn = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["EIPBConnectionString"].ConnectionString);
        conn.Open();
        SqlCommand cmd = new SqlCommand(SQL, conn);
        SqlDataReader rs = cmd.ExecuteReader();
        rs.Read();
        return rs;
    }

    public string showbaseheadItem(string SQL)
    {
        return showbaseheadItem(SQL, "");
    }

    public string showbaseheadItem(string SQL, string selectValue)
    {
        return showbaseheadItem(SQL, selectValue, true);
    }

    public string showbaseheadItem(string SQL, string selectValue, bool eng)
    {
        StringBuilder sb = new StringBuilder();
        using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead))
        {
            try
            {
                rs.Open(SQL);

                int iCount = rs.Rows.Count + 1;

                sb.Append("<option value=\"\">select</option>");

                while (!rs.EOF)
                {
                    //rs["tw"].ToString(), rs["id"].ToString()
                    string value = rs["id"].ToString();
                    string text = rs["tw"].ToString(); //中文
                    if (eng == true)
                    {
                        text = rs["en"].ToString(); //英文
                    }


                    if (value == selectValue)
                    {
                        sb.AppendFormat("<option value=\"{0}\" selected=\"true\" >{1}</option>", value, text);
                    }
                    else
                    {
                        sb.AppendFormat("<option value=\"{0}\">{1}</option>", value, text);
                    }

                    rs.MoveNext();

                }

                rs.Close();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        return sb.ToString();

    }

    public string outListText(string SQL, string selectValue, bool eng)
    {
        string Tag = "";
        using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead))
        {
            try
            {
                rs.Open(SQL);

                int iCount = rs.Rows.Count + 1;



                while (!rs.EOF)
                {
                    //rs["tw"].ToString(), rs["id"].ToString()
                    string value = rs["id"].ToString();
                    string text = rs["tw"].ToString(); //中文
                    if (eng == true)
                    {
                        text = rs["en"].ToString(); //英文
                    }


                    if (value == selectValue)
                    {
                        Tag = text;
                    }


                    rs.MoveNext();

                }

                rs.Close();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        return Tag;

    }

    public string SelectItem(string SQL, string selectValue)
    {
        return SelectItem(SQL, selectValue, false);
    }

    public string SelectItem(string SQL, string selectValue, bool Eng)
    {
        StringBuilder sb = new StringBuilder();
        using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead))
        {
            try
            {
                rs.Open(SQL);

                int iCount = rs.Rows.Count + 1;

                sb.Append("<option value=\"\">select</option>");

                while (!rs.EOF)
                {
                    //rs["tw"].ToString(), rs["id"].ToString()
                    string value = rs["id"].ToString();

                    string text = rs["tw"].ToString();

                    if (Eng == true)
                    {
                        text = rs["en"].ToString();
                    }

                    if (value == selectValue)
                    {
                        sb.AppendFormat("<option value=\"{0}\" selected=\"true\" >{1}</option>", value, text);
                    }
                    else
                    {
                        sb.AppendFormat("<option value=\"{0}\">{1}</option>", value, text);
                    }

                    rs.MoveNext();

                }

                rs.Close();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        return sb.ToString();

    }

    public virtual string SpectList(string oqc_id, bool eng)
    {
        StringBuilder sb = new StringBuilder();
        using (SqlConnection conn = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["EIPBConnectionString"].ConnectionString))
        {

            string sqlss = " SELECT OQC_bodySpec.*,dguser.logonid,dguser.name " +
       " FROM [EIPE].[dbo].OQC_bodySpec left join [EIPA].[dbo].dguser  ON OQC_bodySpec.userid_insp=dguser.id " +
       " where oqcid = '" + oqc_id + "' Order by specno ";
            conn.Open();
            SqlCommand cmd = new SqlCommand(sqlss, conn);
            SqlDataReader rd = cmd.ExecuteReader();

            string[] Tfatype = { "FA", "量產|mp", "客退品|rtv" };//文字 | 多國語言代碼
            string[] fatype = { "FA", "量產", "客退品" }; //value

            string[] Tinsp = { "VMI", "DIM" };  //文字 | 多國語言代碼
            string[] insp = { "VMI", "DIM" };//value

            string[] TdefType = { "重缺|Important", "主缺|Major", "次缺|Minor" };//文字 | 多國語言代碼
            string[] defType = { "重缺", "主缺", "次缺" };//value

            string[] Text = { "YES", "NO" };
            string[] Value = { "Y", "N" };
            string[] OK = { "OK", "NG" };


            int i = 0;
            while (rd.Read())
            {
                Spec item = new Spec();
                i++;

                item.machine = rd["machine"].ToString().Trim();
                item.part = rd["part"].ToString().Trim();
                item.fatp = rd["fatp"].ToString().Trim();
                item.th = rd["th"].ToString().Trim();
                item.insptp = rd["insptp"].ToString().Trim();
                item.totalqty = rd["totalqty"].ToString().Trim();
                item.samplingqty = rd["samplingqty"].ToString().Trim();
                item.ooc_ab = rd["ooc_ab"].ToString().Trim();
                item.ooc_item = rd["ooc_item"].ToString().Trim();
                item.ooc_ju = rd["ooc_ju"].ToString().Trim();
                item.specstatus = rd["specstatus"].ToString().Trim();
                item.prodate = rd["prodate"].ToString().Trim();
                item.userid_insp = rd["userid_insp"].ToString().Trim();
                item.logonid = rd["logonid"].ToString().Trim();
                item.name = rd["name"].ToString().Trim();
                item.orm = rd["orm"].ToString().Trim();
                item.barcodeno = rd["barcodeno"].ToString().Trim();
                item.remarkspec = rd["remarkspec"].ToString().Trim();
                item.remark = rd["remark"].ToString().Trim();

                DateTime dt = Convert.ToDateTime(item.prodate);

                sb.Append("<tr id=\"oqc_row_" + i + "\" align=\"center\" style=\"background-color: rgb(243, 241, 238);\" class=\"oqc_row\">");
                sb.Append(@"<td><p id=""oqc_sn_" + i + @""" class=""oqc oqc_itme"">" + i + "</p></td>");
                sb.Append("<td><select name=\"oqc_model\" id=\"oqc_model_" + i + "\" class=\"ML oqc\">" + getModel(item.machine) + "</select></td>");
                sb.Append("<td><select name=\"oqc_pord\" id=\"oqc_pord_" + i + "\" class=\"ML oqc\">" + getProd(item.part) + "</select></td>");
                sb.Append("<td><select name=\"oqc_fatype\" id=\"oqc_fatype_" + i + "\" class=\"oqc ML\">" + setList(Tfatype, fatype, item.fatp) + "</select></td>");
                sb.Append("<td><input name=\"oqc_th\" type=\"text\" id=\"oqc_the_" + i + "\" value=\"" + item.th + "\" style=\"width: 30px;\" class=\"oqc number\"></td>");
                sb.Append("<td><select name=\"oqc_insp\" id=\"oqc_insp\" class=\"ML oqc\">" + setList(Tinsp, insp, item.insptp) + "</select></td>");
                sb.Append("<td><input name=\"oqc_totalQ\" type=\"text\" id=\"oqc_totalQ_" + i + "\" value=\"" + item.totalqty + "\" style=\"width: 30px;\" class=\"oqc number\" onblur=\"getSmaple(" + i + ")\"></td>");
                sb.Append("<td><input name=\"oqc_sampleQ\" type=\"text\" id=\"oqc_sampleQ_" + i + "\" value=\"" + item.samplingqty + "\" style=\"width: 30px;\" class=\"oqc number\"></td>");
                sb.Append("<td><select name=\"oqc_ab\" id=\"oqc_ab_" + i + "\" class=\"ML oqc\">" + setList(Text, Value, item.ooc_ab) + "</select></td>");
                sb.Append("<td><input name=\"oqc_issue\" type=\"text\" id=\"oqc_issue_" + i + "\" value=\"" + item.ooc_item + "\" style=\"width: 20px;\" class=\"oqc number\"></td>");
                sb.Append("<td><select name=\"oqc_jdg\" id=\"oqc_jdg_" + i + "\" class=\"oqc ML\">" + setList(OK, OK, item.ooc_ju) + "</select></td>");
                //                sb.Append("<td><select name=\"oqc_oper\" selector='" + item.specstatus + "' id=\"oqc_oper_" + i + "\" class=\"ML oqc\"> </select></td>");
                sb.Append("<td><div name=\"oqc_oper\" id=\"oqc_oper_" + i + "\" class=\"ML oqc\" oper='" + item.specstatus + "' >" + item.specstatus + "</div></td>");
                sb.Append("<td><input name=\"oqc_bonDt\" type=\"text\" value=\"" + dt.ToShortDateString() + "\"  maxlength=\"10\"  id=\"" + item.prodate + "\" class=\"Normal\" FormatType=\"Date\" DateType=\"YYYYMMDD\" DateSeparator=\"/\" ButtonIconUrl=\"\" OnClickMore=\"\" FocusinColor=\"\" style=\"width:100px;background-color:#F0F0F0;behavior:url(/lib/htc/inputbox.htc);FILTER:progid:DXImageTransform.Microsoft.gradient(gradienttype=0,startcolorstr=#55888888, endcolorstr=#55ffffff);\" /></td>");
                //sb.Append(@"<td><input name =""oqc_user"" type =""text""  value=""" + item.logonid + @""" id=""txt_oqc_user" + i + @"""  Width=""60px""  FormatType=""InputCombo"" DateType =""YYYYMMDD"" DateSeparator ="" /"" ButtonIconUrl =""/lib/img/icon-man1.gif"" OnClickMore =""Rick_OpenShowModalDialog(" + i + @",this.value);"" style=""width:100px;background-color:#F0F0F0;behavior:url(/lib/htc/inputbox.htc);FILTER:progid:DXImageTransform.Microsoft.gradient(gradienttype=0,startcolorstr=#55888888, endcolorstr=#55ffffff);"" />");
                sb.Append(@"<td><input name =""oqc_user""  type =""text"" value=""" + item.userid_insp + @"""  id=""txt_oqc_user" + i + @"""  class=""Normal"" setformatvalue=""" + item.logonid + @""" formattype=""InputCombo"" dateseparator="" /"" buttoniconurl =""/lib/img/icon-man1.gif""  OnClickMore =""Rick_OpenShowModalDialog(" + i + @",this.value);""  focusincolor ="""" style=""background - color:#F0F0F0;behavior:url(/lib/htc/inputbox.htc);FILTER:;"" \> ");
                sb.Append(@"<input type=""Text"" id=""txt_oqc_user" + i + @"_display"" name=""txt_oqc_user_display"" width =""100px"" class=""Normal"" style ="" BACKGROUND-COLOR:transparent;BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: none"" readonly="""" value =""" + item.name + @""" ></td>");


                sb.Append("<td><div style=\"text-align: left\"><img src=\"img/add.png\" oqc_sn=\"" + i + "\"  height=\"20\" width=\"20\" id=\"oqc_row_" + i + "_top_add\"  class=\"top_5\"  ></div>");
                sb.Append("<div id =\"defect_body\">&nbsp;");
                /*******************************************/
                for (int x = 1; x <= 5; x++)
                {
                    if (!string.IsNullOrEmpty(rd["defectype_" + x].ToString()))
                    {
                        Defect def = new Defect();
                        def.def_type = rd["defectype_" + x].ToString().Trim();
                        def.def_item = rd["defect_" + x].ToString().Trim();
                        def.def_qty = rd["defectno_" + x].ToString().Trim();

                        sb.Append("<div id=\"oqc_" + i + "_defect_" + x + "\" class=\"top5\" style=\"float: left; text-align: left; vertical-align: middle;\">");
                        sb.Append("<input type=\"hidden\" class=\"defect\" id=\"oqc_" + i + "_defect_sn\" value=\"" + x + "\" name=\"oqc_" + i + "_defect_sn\">");
                        sb.Append("<select name=\"oqc_" + i + "_def_type\" id=\"oqc_" + i + "_def_type\" class=\"ML defect\" style=\"margin-bottom: 4px\">" + setList(TdefType, defType, def.def_type) + "</select>");
                        sb.Append("<select name=\"oqc_" + i + "_def_item\" id=\"oqc_" + i + "_def_item\" class=\"ML defect\">" + getDefect(def.def_item, eng) + "</ select > ");
                        sb.Append("<input name=\"oqc_" + i + "_def_qty\" type=\"text\" id=\"oqc_" + i + "_def_qty\" value=\"" + def.def_qty + "\" style=\"width: 30px; margin-top: 4px\" class=\"defect number\">");
                        sb.Append("<img src=\"img/del.png\" height=\"20\" width=\"20\" oqc_sn=\"" + i + "\" defect_sn=\"" + x + "\" class=\"top_del\" /></div>");
                    }
                }

                /*******************************************/
                // sb.Append("</div></td><td><input type=\"button\" id=\"oqc_del_"+i+"\" value=\"DEL\" onclick=\"oqc_row_del()\"  oqc_sn=\"" + i+1 + "\"  style=\"height: 22; background: #C8C8C8; font-size: 12px; font-weight: bold; border: solid 1px #000000\" onclick=\"oqc_row_del('" + i + "')\" /></td></tr>");
                sb.Append("</div></td>");
                sb.Append("<td><input name=\"oqc_remark\" type=\"text\" id=\"oqc_remark_" + i + "\" value=\"" + item.remark + "\" style=\"width: 100px;\" class=\"oqc\"></td>");
                sb.Append("<td><input type=\"button\" id=\"oqc_del_" + i + "\" value=\"DEL\"  style=\"height: 22; background: #C8C8C8; font-size: 12px; font-weight: bold; border: solid 1px #000000\" oqc_sn=\"" + i + "\" ></td></tr>");

            }

            conn.Close();
        }
        return sb.ToString();
    }

    public virtual string WorkList(string oqc_id)
    {
        StringBuilder sb = new StringBuilder();
        using (SqlConnection conn = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["EIPBConnectionString"].ConnectionString))
        {

            string sqlss = " SELECT * " +
                          " FROM EIPE.dbo.OQC_bodywork " +
                          " where oqcid = '" + oqc_id + "' Order by workitem ";
            conn.Open();
            SqlCommand cmd = new SqlCommand(sqlss, conn);
            SqlDataReader rd = cmd.ExecuteReader();

            int i = 0;
            while (rd.Read())
            {
                i++;
                Work workItem = new Work();

                workItem.id = rd["id"].ToString().Trim();
                workItem.oqcid = rd["oqcid"].ToString().Trim();
                workItem.remark = rd["remark"].ToString().Trim();
                workItem.timee = Convert.ToDateTime(rd["timee"]).ToString("yyyy/MM/dd HH:mm:ss");
                workItem.times = Convert.ToDateTime(rd["times"]).ToString("yyyy/MM/dd HH:mm:ss");
                workItem.workissue = rd["workissue"].ToString().Trim();
                workItem.workitem = rd["workitem"].ToString().Trim();

                sb.Append(" <tr id=\"work_row_" + i + "\" align=\"center\" style=\"background-color: #f3f1ee\"> ");
                sb.Append(" <td style=\"width: 60px\"><p id=\"work_sn_" + i + "\" class=\"work_row\">" + i + "</ p ></ td > ");
                sb.Append(" <td style=\"width: 150px\"><select name=\"work_item\" id=\"work_item_" + i + "\">" + getWork(workItem.workissue) + "</ select ></ td > ");
                sb.Append(" <td style=\"width: 150px\"><input type=\"text\" id=\"work_discript_" + i + "\" name=\"work_discript\" value=\"" + workItem.remark + "\" /></td> ");
                sb.Append(" <td style=\"width: 150px\"><input type=\"text\" name=\"work_startDt\" id=\"work_startDt_" + i + "\" value=\"" + workItem.times + "\" formattype=\"DateTime\" dateseparator=\"/\" class=\"Normal\" style=\"width: 150px; background-color: #F0F0F0; behavior: url(/lib/htc/inputbox.htc); filter: progid:DXImageTransform.Microsoft.gradient(gradienttype=0,startcolorstr=#55888888, endcolorstr=#55ffffff)\"></td> ");
                sb.Append(" <td style=\"width: 150px\"><input type=\"text\" name=\"work_endDt\" id=\"work_endDt_" + i + "\" value=\"" + workItem.timee + "\" formattype=\"DateTime\" dateseparator=\"/\" class=\"Normal\" style=\"width: 150px; background-color: #F0F0F0; behavior: url(/lib/htc/inputbox.htc); filter: progid:DXImageTransform.Microsoft.gradient(gradienttype=0,startcolorstr=#55888888, endcolorstr=#55ffffff)\"> ");
                sb.Append(" <td style=\"width: 100px\"><input type=\"button\" value=\"DEL\"  id=\"work_del_" + i + "\"   work_sn=\"" + i + "\" style=\"height: 22; background: #C8C8C8; font-size: 12px; font-weight: bold; border: solid 1px #000000\"></td></tr> ");


            }

            conn.Close();
        }
        return sb.ToString();
    }

    public virtual string ROMList(string oqc_id)
    {
        StringBuilder sb = new StringBuilder();

        using (SqlConnection conn = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["EIPBConnectionString"].ConnectionString))
        {
            string sqlss = "SELECT rowno " +
                                  ", headrowno " +
                                  ", ORM_Model " +
                                  ", ORM_Product " +
                                  ", ORM_th " +
                                  ", CASE WHEN ORM_orm  = 1 THEN 'True' ELSE 'False' END ORM, " +
                                  "   CASE WHEN ORM_FA = 1 THEN 'True' ELSE 'False' END FA, " +
                                  "  CASE WHEN ORM_DOE = 1 THEN 'True' ELSE 'False' END DOE " +
                              "FROM EIPE.dbo.OQC_bodyORM " +
                              "WHERE headrowno = '" + oqc_id + "'  ";

            conn.Open();
            SqlCommand cmd = new SqlCommand(sqlss, conn);
            SqlDataReader rd = cmd.ExecuteReader();

            int i = 0;
            while (rd.Read())
            {
                i++;
                Rom item = new Rom();

                item.rowno = rd["rowno"].ToString().Trim();
                item.headrowno = rd["headrowno"].ToString().Trim();
                item.ORM_DOE = bool.Parse(rd["DOE"].ToString().Trim());
                item.ORM_FA = bool.Parse(rd["FA"].ToString().Trim());
                item.ORM_orm = bool.Parse(rd["ORM"].ToString().Trim());
                item.ORM_Model = rd["ORM_Model"].ToString().Trim();
                item.ORM_Product = rd["ORM_Product"].ToString().Trim();
                item.ORM_th = rd["ORM_th"].ToString().Trim();

                string ROM = (item.ORM_orm == true) ? "checked" : "";
                string FA = (item.ORM_FA == true) ? "checked" : "";
                string DOE = (item.ORM_DOE == true) ? "checked" : "";


                sb.Append("<tr id=\"orm_row_" + i + "\" align=\"center\" style=\"background-color: rgb(243, 241, 238);\" class=\"orm\">");
                sb.Append("<td style=\"width: 60px\"><p id=\"orm_sn_" + i + "\" class=\"orm_item\">" + i + "</p></td>");
                sb.Append("<td style=\"width: 150px\"><select name=\"orm_model\" id=\"orm_model_" + i + "\" class=\"ML orm\">" + getModel(item.ORM_Model) + "</select>");
                sb.Append("<td style=\"width: 150px\"><select name=\"orm_prod\" id=\"orm_prod_" + i + "\" class=\"ML orm\"><option value=\"\">Select</option>" + getProd(item.ORM_Product) + "</select></td>");

                sb.Append("<td style=\"width: 150px\"><input type=\"text\" value=\"" + item.ORM_th + "\" id=\"orm_th_" + i + "\" name=\"orm_th\" class=\"orm number\" /></td>");
                sb.Append("<td style=\"width: 150px\"><input name=\"orm_rom\" id=\"orm_rom_" + i + "\" id=\"orm_rom_" + i + "\" " + ROM + " type=\"checkbox\" class=\"orm orm_check\">");
                sb.Append(@"<input type=""hidden"" id=""chk_orm_rom_" + i + @""" name=""chk_orm_rom"" value=""" + item.ORM_orm.ToString() + @""" class=""orm"" /></td>");
                sb.Append("<td style=\"width: 150px\"><input name=\"orm_fa\" id=\"orm_fa_" + i + "\" " + FA + " type=\"checkbox\" class=\"orm orm_check\">");
                sb.Append(@"<input type=""hidden"" id=""chk_orm_fa_" + i + @""" name =""chk_orm_fa"" value=""" + item.ORM_FA.ToString() + @""" class=""orm"" /></td>");
                sb.Append("<td style=\"width: 150px\"><input name=\"orm_doe\" id=\"orm_doe_" + i + "\" " + DOE + " type=\"checkbox\" class=\"orm orm_check\">");
                sb.Append(@"<input type=""hidden"" id=""chk_orm_doe_" + i + @""" name =""chk_orm_doe"" value=""" + item.ORM_DOE.ToString() + @""" class=""orm"" /></td>");

                sb.Append("<td style=\"width: 100px\"><input type=\"button\"  orm_sn=\"" + i + "\" id=\"orm_row_del_" + i + "\" value=\"DEL\" style=\"height: 22; background: #C8C8C8; font-size: 12px; font-weight: bold; border: solid 1px #000000\" /></td></tr>");
            }
            conn.Close();
        }
        return sb.ToString();
    }

    public virtual string BCList(string oqc_id)
    {
        StringBuilder sb = new StringBuilder();

        using (SqlConnection conn = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["EIPBConnectionString"].ConnectionString))
        {
            string sqlss = "SELECT * " +
                           " FROM EIPE.dbo.OQC_bodyBARCODE " +
                          " WHERE headrowno = '" + oqc_id + "'   ";

            conn.Open();
            SqlCommand cmd = new SqlCommand(sqlss, conn);
            SqlDataReader rd = cmd.ExecuteReader();

            int i = 0;
            while (rd.Read())
            {
                i++;
                BCode item = new BCode();

                item.BARCODE_barcode = rd["BARCODE_barcode"].ToString().Trim();
                item.BARCODE_Model = rd["BARCODE_Model"].ToString().Trim();
                item.BARCODE_Product = rd["BARCODE_Product"].ToString().Trim();
                item.BARCODE_th = rd["BARCODE_th"].ToString().Trim();
                item.headrowno = rd["headrowno"].ToString().Trim();
                item.rowno = rd["rowno"].ToString().Trim();

                item.Param = rd["Parameters"].ToString().Trim();
                item.Grade = rd["grade"].ToString().Trim();
                item.Remark = rd["remark"].ToString().Trim();

                string param = string.IsNullOrEmpty(item.Param) ? "&nbsp;" : item.Param;
                string grade = string.IsNullOrEmpty(item.Grade) ? "&nbsp;" : item.Grade;
                string remark = string.IsNullOrEmpty(item.Remark) ? "&nbsp;" : item.Remark;
                string barcode = item.BARCODE_barcode.Replace(";", "<br>");


                sb.Append("<tr id=\"bcode_row_" + i + "\" align=\"center\" style=\"background-color: #f3f1ee\">");
                sb.Append("<td style=\"width: 60px\"><p id=\"bcode_sn_" + i + "\" class=\"bcode_item Bcode\">" + i + "</p></td>");
                sb.Append("<td style=\"width: 150px\"><select name=\"bcode_model\" id=\"bcode_model_" + i + "\" class=\"ML Bcode\"><option value=\"\">Select</option>" + getModel(item.BARCODE_Model) + "</select></td>");
                sb.Append("<td style=\"width: 150px\"><select name=\"bcode_prod\" id=\"bcode_prod_" + i + "\" class=\"ML Bcode\"><option value=\"\">Select</option>" + getProd(item.BARCODE_Product) + "</select></td>");
                sb.Append("<td style=\"width: 150px\"><input type=\"text\" value=\"" + item.BARCODE_th + "\" id=\"bcode_th_" + i + "\" name=\"bcode_th\" cssclass=\"Bcode number\" /></td>");
                sb.Append("<td style=\"width: 150px\">");
                sb.Append("<img src='img/add.png' height='20' width='20' onclick='input_BARCODE(this)' id='bcode_img_" + i + "' class='Bcode' />");
                sb.Append("<input name=\"bcode_record\" id=\"bcode_record_" + i + "\" type=\"hidden\" value=\"" + item.BARCODE_barcode + "\" class=\"Bcode\" />");
                sb.Append("<div name=\"bcode_show\" id=\"bcode_show_" + i + "\" class=\"Bcode\" style=\"text-align: left\">" + barcode + "</div></td >");
                sb.Append("<td style=\"width: 150px\">" + ddl_grade(i, grade) + "</td>");
                sb.Append("<td><input type=\"text\" value=\"" + param + "\" id=\"txt_param_" + i + "\" name=\"txt_param\" cssclass=\"Bcode number\" />%</td>");
                sb.Append("<td><input type=\"text\" value=\"" + remark + "\" id=\"txt_remark_" + i + "\" name=\"txt_remark\" cssclass=\"Bcode number\" /></td>");


                sb.Append("<td style=\"width: 100px\"><input type=\"button\"  bcode_sn=\"" + i + "\"  value=\"DEL\"  onclick=\"bcode_row_del(" + i + ")\" style=\"height: 22; background: #C8C8C8; font-size: 12px; font-weight: bold; border: solid 1px #000000\" /></td></tr>");
            }



            conn.Close();
        }
        return sb.ToString();
    }

    public string getModel()
    {
        return getModel("");
    }

    public string getModel(string value)
    {
        return showbaseheadItem(OQC_Base.Qty_cbo.model, value);
    }

    public string getModelTxt(string value)
    {
        return outListText(OQC_Base.Qty_cbo.model, value, false);
    }

    public string getModelTxt(string value, bool eng)
    {
        return outListText(OQC_Base.Qty_cbo.model, value, eng);
    }

    public string getProd()
    {
        return getProd("");
    }

    public string getProdTxt()
    {
        return getProdTxt("");
    }

    public string getProd(string value)
    {
        return showbaseheadItem(OQC_Base.Qty_cbo.prod, value);
    }
    public string getProdTxt(string value)
    {

        return outListText(OQC_Base.Qty_cbo.prod, value, true);
    }

    public string getDefect(bool eng)
    {
        return getDefect("", eng);
    }

    public string getDefect()
    {
        return getDefect("", false);
    }

    public string getDefect(string value, bool Eng)
    {
        return showbaseheadItem(OQC_Base.Qty_cbo.defect, value, Eng);
    }

    public string getDefectTxt(string value)
    {
        return getDefectTxt(value, false);
    }

    public string getDefectTxt(string value, bool Eng)
    {
        return outListText(OQC_Base.Qty_cbo.defect, value, Eng);

    }

    public string getWork()
    {
        return getWork("");
    }

    public string getWork(string value)
    {
        return showbaseheadItem(OQC_Base.Qty_cbo.work, value);
    }

    public string getWork(string value, bool Eng)
    {
        return showbaseheadItem(OQC_Base.Qty_cbo.work, value, Eng);
    } 

    public string setList(string[] Text, string[] Value)
    {
        return setList(Text, Value, "");
    }

    public string setList(string[] Text, string[] Value, string selected)
    {
        StringBuilder sb = new StringBuilder();
        int i = 0;


        foreach (string item in Value)
        {
            string txt = Text[i];
            string Tag = "";
            if (Text[i].Contains("|"))
            {
                string[] tl = Text[i].Split('|');
                txt = tl[0];
                Tag = tl[1];
            }

            if (item == selected)
            {
                sb.AppendFormat("<option value=\"{0}\" ML_Tag=\"{2}\"  selected=\"true\" >{1}</option>", item, txt, Tag);
            }
            else
            {
                sb.AppendFormat("<option ML_Tag=\"{2}\" value=\"{0}\">{1}</option>", item, txt, Tag);
            }
            i++;
        }
        return sb.ToString();
    }

    public string outItemTxt(string[] Text, string[] Value, string selected)
    {
        string value = "";
        int i = 0;


        foreach (string item in Value)
        {

            if (item == selected)
            {
                value = Text[i];
            }

            i++;
        }
        return value;
    }


    public string ddl_grade(int i, string value)
    {
        string[] item = new string[6];
        item[0] = "Select";
        item[1] = "A";
        item[2] = "B";
        item[3] = "C";
        item[4] = "D";
        item[5] = "F";


        string option = setList(item, item, value);
        string list = "";

        if (i > 0)
        {
            list = string.Format("<select name='ddl_grade' id='ddl_grade_" + i + "' class=\"ML Bcode\">{1}</select>", i, option);
        }
        else
        {
            list = string.Format("<select name='ddl_grade' id='ddl_grade' class=\"ML Bcode\">{0}</select>", option);
        }

        return list;
    }



    #endregion Option

    #region Input Option

    public string Input_Model()
    {
        return showbaseheadItem(Input_cbo.model);
    }

    public string Input_Prod()
    {
        return showbaseheadItem(Input_cbo.prod);
    }

    public string Input_Defect(bool eng)
    {
        return showbaseheadItem(Input_cbo.defect, "", eng);

    }

    public string Input_Work(string value, bool Eng)
    {
        return showbaseheadItem(Input_cbo.work, value, Eng);
    }

    public static void Mail_Group(DropDownList cbo)
    {
        Mail_Group(cbo, false);
    }

    public static void Mail_Group(DropDownList cbo, bool selected)
    {
        cbo.Items.Add(new ListItem("OQC_report", "OQC_report"));
        cbo.Items.Add(new ListItem("SI", "SI"));
        cbo.Items.Add(new ListItem("SI_CC", "SI_cc"));



    }


    #endregion Input Option

    #region//預設抽樣方法
    public ListItem[] setSample()
    {
        int iCount = 0;
        ListItem[] Item = new ListItem[0];
        SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);

        string sampling = "  SELECT * " +
                          "  FROM EIPE.dbo.OQC_basehead " +
                          "  WHERE TPEN='sampling' and display='1' " +
                          "  order by en,hds";

        rs.Open(sampling);

        iCount = rs.Rows.Count;
        Item = new ListItem[(iCount)];
        int i = 0;

        while (!rs.EOF)
        {
            Item[i] = new ListItem(rs["tw"].ToString(), rs["id"].ToString());

            rs.MoveNext();
            i++;
        }
        rs.Close();
        return Item;
    }
    #endregion

    public string NotItem()
    {
        StringBuilder sb = new StringBuilder();

        sb.Append("<td colspan=\"19\" align=\"center\" style=\"height: 4 0px\">");
        sb.Append("<asp:Label ID=\"Label26\" runat=\"server\" meta:resourcekey=\"Label26Resource1\" Text=\"尚未增加項次\" Font-Size=\"X-Small\" ForeColor=\"Red\"Font-Bold=\"True\">");
        sb.Append("</asp:Label></td>");

        return sb.ToString();
    }

    public virtual string Summary(string Whereis)
    {

        //StringBuilder sb = new StringBuilder();

        StringBuilder sb = new StringBuilder();


        sb.Append(" SELECT machine, part,m.tw 'model', p.tw 'product', totalqty, samplingqty, insprow, defrow, defqty, ");
        sb.Append(" CASE WHEN z.maketype = 2 THEN 'CSA' WHEN z.maketype = 10 THEN '成型' END 'maketype',maketype 'make_type', ");
        sb.Append(" CASE WHEN defqty > 0 THEN Round(( Cast(defqty AS FLOAT) / Cast( totalqty AS FLOAT) ) , 4) ELSE 0 END 'DefRatio', ");
        sb.Append(" CASE WHEN defrow > 0 THEN Round(1 - ( Cast(defrow AS FLOAT) / Cast( totalqty AS FLOAT) ), 4) ELSE 0 END 'LAR', ");
        sb.Append(" CASE WHEN defqty > 0 THEN Round(( Cast(defqty AS FLOAT) / Cast( totalqty AS FLOAT) ) * 1000000,0) ELSE 0 END 'DDPM', ");
        sb.Append(" CASE WHEN z.rework >0 THEN 'Y' ELSE 'N' END 'rework' FROM ( ");
        sb.Append(" SELECT maketype , machine, part,sum(totalqty)totalqty,sum(samplingqty)samplingqty,SUM(defqty) defqty, ");
        sb.Append(" SUM(insprow)insprow,SUM(rework) 'rework',sum(defrow)'defrow'  from ( ");
        sb.Append(" SELECT h.maketype , s.machine, s.part, s.totalqty, s.samplingqty, Isnull(x.defqty, 0) 'defqty', 1 'insprow', ");
        sb.Append(" CASE WHEN s.specstatus = '判退' THEN 1 ELSE 0 END 'rework', CASE WHEN x.defqty > 0 THEN 1 ELSE 0 END 'defrow' ");
        sb.Append(" FROM eipe.dbo.oqc_bodyspec s LEFT JOIN (SELECT Sum(d.defqty) 'defqty', d.specid FROM eipe.dbo.oqc_bodydefect d GROUP BY specid)x ");
        sb.Append(" ON x.specid = s.id LEFT JOIN eipe.dbo.oqc_head h ON h.id = s.oqcid WHERE h.status = 'C' {0} ");
        sb.Append(" )g  group by maketype , machine, part )z  LEFT JOIN EIPE.dbo.OQC_basehead m ON z.machine = m.id ");
        sb.Append(" LEFT JOIN EIPE.dbo.OQC_basehead p ON z.part = p.id order by model,product ");

        string Cmd = string.Format(sb.ToString(), Whereis);

        return Cmd;
    }

    public virtual string TotqlQty(string Whereis)
    {

        StringBuilder sb = new StringBuilder();

        sb.Append(" select totalqty,samplingqty,defqty,insprow,defrow, ");
        sb.Append(" CASE WHEN defqty = 0 THEN 0 ELSE Round((Cast(defqty AS FLOAT) / Cast(totalqty AS FLOAT))*100, 4) END 'DefRatio',  ");
        sb.Append(" CASE WHEN defrow = 0 THEN 0 ELSE (1-Round(Cast(defrow AS FLOAT) / Cast(insprow AS FLOAT), 4)) END 'LAR',  ");
        sb.Append(" CASE WHEN defrow = 0 THEN 0 ELSE Round(( Cast(defqty AS FLOAT) / Cast( totalqty AS FLOAT) ) * 1000000,0) END 'DPPM'  ");
        sb.Append(" from (select sum(totalqty) 'totalqty',sum(samplingqty) 'samplingqty',sum(defqty) 'defqty'");
        sb.Append(" ,sum(insprow) 'insprow',sum(defrow) 'defrow',case when sum(rework)>0 then 'Y'else 'N' end 'rework' from (");
        sb.Append(" SELECT s.totalqty,s.samplingqty,Isnull(x.defqty, 0) 'defqty',1 'insprow',");
        sb.Append(" CASE WHEN s.specstatus = '重工' THEN 1 ELSE 0 END 'rework', ");
        sb.Append(" CASE WHEN x.defqty > 0 THEN 1 ELSE 0 END 'defrow' FROM eipe.dbo.oqc_bodyspec s ");
        sb.Append(" LEFT JOIN (SELECT Sum(d.defqty) 'defqty',d.specid FROM eipe.dbo.oqc_bodydefect d GROUP BY specid)x ON x.specid = s.id ");
        sb.Append(" LEFT JOIN eipe.dbo.oqc_head h ON h.id = s.oqcid WHERE h.status = 'C' {0} ) x) y");

        string Cmd = string.Format(sb.ToString(), Whereis);

        return Cmd;
    }
}
public class Topaper
{
    public string Week;
    public string Inspect_Dt;
    public string Inspect_No;
    public string Seq;
    public string Model;
    public string Product;
    public string Th;
    public string Total;
    public string Sample;
    public string DefQty;
    public string Reason;

    public string BomDt;
    public string Result;
    public string Inspector;
    public string oqcuser;


}


#region datatype

public class Spec
{
    public string machine;
    public string part;
    public string fatp;
    public string th;
    public string insptp;
    public string totalqty;
    public string samplingqty;
    public string ooc_ab;
    public string ooc_item;
    public string ooc_ju;
    public string specstatus;
    public string prodate;
    public string userid_insp;
    public string logonid;
    public string name;
    public string orm;
    public string barcodeno;
    public string remarkspec;
    public string remark;
    public List<Defect> defect = new List<Defect>();

}

public class Defect
{
    public string def_qty;
    public string def_item;
    public string def_type;
}

public class Work
{
    public string id;
    public string oqcid;
    public string workitem;
    public string workissue;
    public string remark;
    public string times;
    public string timee;
}
public class BCode
{
    public string rowno;
    public string headrowno;
    public string BARCODE_Model;
    public string BARCODE_th;
    public string BARCODE_Product;
    public string BARCODE_barcode;
    public string Grade;
    public string Param;
    public string Remark;

}
public class Rom
{
    public string rowno;
    public string headrowno;
    public string ORM_Model;
    public string ORM_Product;
    public string ORM_th;
    public bool ORM_orm;
    public bool ORM_FA;
    public bool ORM_DOE;

}
#endregion