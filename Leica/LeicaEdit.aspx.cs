using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Leica
{
    public partial class LeicaEdit : LeicaBase
    {
        string _rowid = "", _kind = "", _operator = "", _insp_date;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                InitUI();
            }
            else
            {
                string logoind = txt_operator.Text;
                Dictionary<string, string> Users = Utility.GetUserInfo(logoind);
                _operator = Users["ID"];
            }

            Dictionary<string, string> Us = Utility.GetUIDInfo(_operator);
            txt_operator.Text = Us["LOGONID"];
            txt_inspDt.Text = _insp_date;
        }

        private void InitUI()
        {
            _insp_date = DateTime.Now.ToShortDateString();
            txt_inspDt.Text = _insp_date;
            _operator = CurrentUser.ID;
            OperatorKind(ddl_kind, false);
         
        }

        protected void ddl_kind_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}