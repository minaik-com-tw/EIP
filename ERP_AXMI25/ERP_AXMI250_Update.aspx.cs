using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Net;

public partial class ERP_AXMI25_ERP_AXMI250_Update : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            try
            {
                SmoothEnterprise.Database.DataSet rs = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenUpdate);
                string savesql = "SELECT * FROM EIPB.DBO.ERP_AXMI250_UPDATE_SAVE WHERE 1=0 ";
                rs.Open(savesql);

                SmoothEnterprise.Database.DataSet dss = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                string sql = "EXEC EIPB.DBO.[ERP_AXMI250_SP] 2 ";
                dss.Open(sql);
                string occano = "";
                //int FILE_COUNT = 0;
                while (!dss.EOF /*&& (FILE_COUNT < 4)*/)
                {
                    //FILE_COUNT++;
                    occano = dss["occano"].ToString();
                    //Response.Write(occano + "<BR/>");
                    string filename = "MINAIK-U_axmi250_" + occano + ".txt";
                    string path = "D:\\ERP_AXMI250\\updatefile";//"D:\\test\\test_rage.txt";            
                    string fullfilename = path + "\\" + filename;

                    FileStream fn = new FileStream(fullfilename, FileMode.OpenOrCreate, FileAccess.ReadWrite);
                    StreamWriter file = new StreamWriter(fn, System.Text.Encoding.Unicode);
                    SmoothEnterprise.Database.DataSet dr = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                    string drsql = "EXEC EIPB.DBO.[ERP_AXMI250_SP] 1,'" + occano + "'";
                    dr.Open(drsql);



                    while (!dr.EOF)
                    {
                        rs.Add();
                        rs["rowno"] = Guid.NewGuid();
                        rs["occ_field_name"] = dr["OCC_FIELD_NAME"].ToString();
                        rs["occ_value"] = dr["occ_value"].ToString();
                        rs["occano"] = occano;
                        rs["occ01"] = dr["CUSTOMER_NO"].ToString();
                        rs["updatetime"] = System.DateTime.Now;
                        file.WriteLine("MINAIK|" + dr["OCCA_FIELD_NAME"].ToString().ToLower() + "|" + dr["OCCA_VALUE"].ToString() + "|" + occano + "|U");
                        rs.Update();
                        dr.MoveNext();
                    }
                    dr.Close();
                    dr.Dispose();
                    file.Close();
                    fn.Close();
                    uploadtoFTP(fullfilename, @"ftp://192.168.0.250/" + filename, "4gl", "4gl");
                    File.Delete(fullfilename);
                    dss.MoveNext();
                }
                rs.Close();
                rs.Dispose();
                dss.Close();
                dss.Dispose();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }
    }

    private bool uploadtoFTP(string fileName, string uploadUrl, string UserName, string Password)
    {
        Stream requestStream = null;
        FileStream fileStream = null;
        FtpWebResponse uploadResponse = null;
        try
        {
            FtpWebRequest uploadRequest = (FtpWebRequest)WebRequest.Create(uploadUrl);
            uploadRequest.Method = WebRequestMethods.Ftp.UploadFile;//設定Method上傳檔案
            uploadRequest.Proxy = null;

            if (UserName.Length > 0)//如果需要帳號登入
            {
                NetworkCredential nc = new NetworkCredential(UserName, Password);
                uploadRequest.Credentials = nc; //設定帳號
            }

            requestStream = uploadRequest.GetRequestStream();
            fileStream = File.Open(fileName, FileMode.Open);
            byte[] buffer = new byte[1024];
            int bytesRead;
            //Response.Write("開始上傳資料流");
            while (true)
            {//開始上傳資料流
                bytesRead = fileStream.Read(buffer, 0, buffer.Length);
                if (bytesRead == 0)
                    break;
                requestStream.Write(buffer, 0, bytesRead);
            }
            //Response.Write("結束上傳資料流");
            requestStream.Close();
            uploadResponse = (FtpWebResponse)uploadRequest.GetResponse();
            return true;
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
        finally
        {
            if (uploadResponse != null)
                uploadResponse.Close();
            if (fileStream != null)
                fileStream.Close();
            if (requestStream != null)
                requestStream.Close();
        }
    }
}
