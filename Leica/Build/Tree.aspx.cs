using System;
using System.Text;
namespace Leical_Build
{
    public partial class Tree : System.Web.UI.Page
    {
        string[] tree = LeicaBase.tree_level;
        protected void Page_Load(object sender, EventArgs e)
        {
            tree_view();
        }

        private void tree_view()
        {
            StringBuilder sb = new StringBuilder();
            using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead))
            {
                try
                {
                    int level = tree.Length;
                    string next_tag = tree[level-2];
                    string sql = "select * from eipe.dbo.Sys_Option where main ='Leica'and kind='Kind' and display='1' order by en ";
                    rs.Open(sql);

                    while (!rs.EOF)
                    {
                        string childer = Child_Node(rs["rowid"].ToString(), rs["rowid"].ToString(), level-2); //自已的下一階

                        string cls = string.IsNullOrEmpty(childer) ? "fas fa-folder " : "fas fa-folder-plus";

                        sb.AppendFormat("<li><i class='ann_header {5}'></i><a level='{0}' class='' href='#' prv='{1}' id='{1}' next_tag='{2}' >{3}</a>{4}</li>", level, rs["rowid"], next_tag, rs["tw"], childer, cls);
                        rs.MoveNext();
                    }

                    rs.Close();
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }

            lab_tree.Text = string.Format("<ul class='tree_show' style='display: block'>{0}</ul>", sb.ToString());

        }

        private string Child_Node(string parent_id,string prv, int level)
        {
            StringBuilder sb = new StringBuilder();
            using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead))
            {
                try
                {

                    string seq = prv;
                    string sql = string.Format("select j.rowid,s.tw from eipe.dbo.leica_join j left join eipe.dbo.Sys_Option s on j.item_id=s.rowid where parent_id='{0}' and s.display='1'  order by en ", parent_id);
                    rs.Open(sql);

                    while (!rs.EOF)
                    {
                        if (level > 0)
                        {
                            seq = seq + ","+ rs["rowid"].ToString();
                            string next = tree[level - 1];
                            string childer = Child_Node(rs["rowid"].ToString(), seq, level-1);
                            string cls = string.IsNullOrEmpty(childer) ? "fas fa-folder " : "fas fa-folder-plus";
                            sb.AppendFormat("<li><i class='ann_header {5} '></i><a level='{0}' href='#' prv='{6}' id='{1}' next_tag='{2}' >{3}</a>{4}</li>", level, rs["rowid"], next, rs["tw"], childer,cls, seq);
                        }
                        else
                        {
                            sb.AppendFormat("<li><i class='fa fa-file'></i><span>{0}</span></li>", rs["tw"]);
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

            string Node = "";
            if (!string.IsNullOrEmpty(sb.ToString()))
            {
                Node = string.Format("<ul  style='display:none' >{0}</ul>", sb.ToString());
            }

            return Node;
        }


    }
}