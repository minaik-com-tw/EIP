using System;
using System.Text;
namespace Color
{
    public partial class ColorEdit : SmoothEnterprise.Web.Page
    {
        string _rowid, _up, _down, _upper, _lower;


        protected void Page_Load(object sender, EventArgs e)
        {
            _rowid = Request.QueryString["rowid"];
            if (!IsPostBack)
            {
                getInfo();
            }
            else
            {
                _up = txt_up.Text;
                _down = txt_down.Text;
                _upper = txt_upcolor.Value;
                _lower = txt_downcolor.Value;

            }
            lab_downcolor.Text = _lower; ;
            lab_downcolor.Style.Add("background-color", _lower);
            lab_downcolor.Style.Add("color", "#fff");

            lab_upcolor.Text = _upper;
            lab_upcolor.Style.Add("background-color", _upper);
            lab_upcolor.Style.Add("color", "#fff");
        }

        private void getInfo()
        {
            using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead))
            {
                StringBuilder sb = new StringBuilder();
                sb.Append(" select c.*,o.en,o.rowid 'productid' from eipe.dbo.ipqc_ra_option o left join eipe.dbo.ipqc_ra_color  c on o.rowid=c.product_id where o.rowid='" + _rowid + "'");

                rs.Open(sb.ToString());

                if (!rs.EOF)
                {
                    txt_up.Text = rs["up"].ToString();
                    txt_down.Text = rs["down"].ToString();
                    lab_upcolor.Text = rs["upper"].ToString();
                    lab_downcolor.Text = rs["lower"].ToString(); 
                    lab_product.Text = rs["en"].ToString();
                    _upper= rs["upper"].ToString();
                    _lower= rs["lower"].ToString();


                }
            }
        }

        protected void Btn_Save_Click(object sender, EventArgs e)
        {
            using (SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate))
            {
                string sql = " select * from eipe.dbo.ipqc_ra_color where product_id='" + _rowid + "'";
                rs.Open(sql);

                if (!rs.EOF)
                {//有資料
                    rs["up"] = _up;
                    rs["down"] = _down;
                    rs["upper"] = _upper;
                    rs["lower"] = _lower;
                }
                else
                {//null
                    rs.Add();
                    rs["product_id"] = _rowid;
                    rs["up"] = _up;
                    rs["down"] = _down;
                    rs["upper"] = _upper;
                    rs["lower"] = _lower;
                }

                rs.Update();
                rs.Close(); 
            }
        }
    }
}