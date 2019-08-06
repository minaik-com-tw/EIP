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
/// Summary description for EIPSysSha
/// </summary>
public class EIPSysSha
{
	public EIPSysSha()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    //根據輸入的單別,年月
    //Output 單號
    public string GetNewSn(string SN, string YM)
    {

        DBTransfer ds2 = new DBTransfer();
        float p1 = ds2.GetCount("SELECT ISNULL(MAX(Number),0)+1 FROM  [EIPB].[dbo].[papdetail] where PID='" + SN + "' and YM='" + YM + "'");
        string FAID = SN + "-" + YM + p1.ToString("0000");
        if (p1 == 1)
        {//表示這筆記錄是不存在

            ds2.RunIUSql("insert into [EIPB].[dbo].[papdetail] values('" + SN + "','" + YM + "'," + p1 + ",'" + FAID + "')");
        }
        else
        {//更新紀錄

            ds2.RunIUSql("update [EIPB].[dbo].[papdetail] set Number=Number+1,FAID='" + FAID + "' where PID='" + SN + "' and YM='" + YM + "'");
        }

        return FAID;
    }

    public string GetNewSn(string SN,string YM,string dbName,string tableName)
    {

        DBTransfer ds2 = new DBTransfer();
        float p1 = ds2.GetCount("SELECT ISNULL(MAX(Number),0)+1 FROM  "+dbName+".[dbo]."+tableName+" where PID='" + SN + "' and YM='" + YM + "'");
        string FAID = SN + "-" + YM + p1.ToString("000");
        if (p1 == 1)
        {//表示這筆記錄是不存在

            ds2.RunIUSql("insert into " + dbName + ".[dbo]." + tableName + " values('" + SN + "','" + YM + "'," + p1 + ",'" + FAID + "')");
        }
        else
        {//更新紀錄

            ds2.RunIUSql("update " + dbName + ".[dbo]." + tableName + " set Number=Number+1,FAID='" + FAID + "' where PID='" + SN + "' and YM='" + YM + "'");
        }

        return FAID;
    }
}
