using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

/// <summary>
/// Summary description for PubFunction
/// </summary>
public class PubFunction
{
	public PubFunction()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    //取出該部門簽核者
    public string GetAppUid(string uid)
    {
        DBTransfer ds = new DBTransfer();
        //部門id
        string gid=ds.GetTopfile("select gid from dguser where id='"+uid+"'");
        //
        string appid = ds.GetTopfile("select uid from dggroup where id='" + gid + "'");
        if (appid.ToUpper() == uid.ToUpper())
        {
           //
            string pid = ds.GetTopfile("select pid from dggroup where id='" + gid + "'");
             appid = ds.GetTopfile("select uid from dggroup where id='" + pid + "'");
        }
        return appid;

    }



}
