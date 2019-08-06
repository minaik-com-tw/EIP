using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections;

//20130103 ann 簽核展階層,原依人員跑, 改依組織跑

/// <summary>
/// Summary description for managerlevel
/// </summary>
public class managerlevel
{
	public managerlevel()
	{

	}

    public string manager(string id)   //代入id-->取得此id的主管id與職稱
    {
        string mainstring = "";
        SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
        rs.Open("select a.id aid,b.uid uid,pid,d.lname lname from dguser a left join dggroup b on a.gid=b.id " +
                "left join dguser c on b.uid=c.id "+
                "left join dglevel d on c.levid=d.lnid " +
                "  where a.id='"+id+"'");
        if (!rs.EOF)
        {
            if (rs["uid"].ToString() == rs["aid"].ToString())
            {
                SmoothEnterprise.Database.DataSet rs2 = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                rs2.Open("  select uid,c.lname lname from dggroup a left join dguser b on a.uid=b.id "+
                         "left join dglevel c on b.levid=c.lnid " +
                         "  where a.id='"+rs["pid"].ToString()+"'");
                if (!rs2.EOF)
                {
                    mainstring = rs2["uid"].ToString() +"@"+ rs2["lname"].ToString();
                }
            }
            else
            {
                mainstring = rs["uid"].ToString() + "@" + rs["lname"].ToString();
            }
        }

        return mainstring;
    }



   

    public ArrayList manager(string id, int level) //代入id-->取得此id的主管id/職稱/階層
    {
        ArrayList all = new ArrayList();
        string[] sb = new string[4];
        string[] ib = new string[4];
        ib = getdeprtid(id);
        sb = getdeprtid(id);

        if (sb[0].ToString().ToUpper() != id.ToString().ToUpper()) all.Add(sb[0] + "@" + sb[1] + "@" + sb[2] + "@" + sb[3]);
        //all.Add(sb[0] + "@" + sb[1] + "@" + sb[2] + "@" + sb[3]);

        while (int.Parse(sb[1]) < level)
        {
            sb = getdeprtid2(ib[3]);     //20130103 ann 改
            ib = sb;
            all.Add(sb[0] + "@" + sb[1] + "@" + sb[2] + "@" + sb[3]);
        }


        return all;


    }



    private string[] getdeprtid(string ID)  //跑第一次時所得相關資訊 20130103 ann 改依組織跑
    {

        string[] rid = new string[4];
        SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
        rs.Open("select a.id aid,b.uid uid,a.gid gid,d.lname lname,lshort,pid from dguser a left join dggroup b on a.gid=b.id " +
                "left join dguser c on b.uid=c.id " +
                "left join dglevel d on c.levid=d.lnid " +
                "  where a.id='" + ID + "'");
        if (!rs.EOF)
        {

            rid[0] = rs["uid"].ToString(); //簽核人員id
            rid[1] = rs["lshort"].ToString();//簽核人員層級
            rid[2] = rs["lname"].ToString();//該簽核人員職稱
            rid[3] = rs["gid"].ToString();//人員group

        }

        return rid;


    }

    private string[] getdeprtid2(string ID)      //20130103 ann 改依組織跑
    {

        string[] rid = new string[4];
        SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
        rs.Open("  select b.uid,d.lname lname,lshort,b.id pid from dggroup a" +
                "  left join dggroup b on a.pid=b.id" +
                "  left join dguser c on b.uid=c.id" +
                "  left join dglevel d on c.levid=d.lnid" +
                "  where a.id='" + ID + "'");
        if (!rs.EOF)
        {
            rid[0] = rs["uid"].ToString(); //簽核人員id
            rid[1] = rs["lshort"].ToString();//簽核人員層級
            rid[2] = rs["lname"].ToString();//該簽核人員職稱
            rid[3] = rs["pid"].ToString();//人員group

        }
        return rid;


    }
}
