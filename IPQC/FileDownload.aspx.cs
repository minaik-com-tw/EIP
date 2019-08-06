using System;
using System.Net;
using System.IO;

namespace ManagePDF
{

    public partial class PDFDownLoad : SmoothEnterprise.Web.Page

    {
        private string db1 = ""; //db主位置 
        private string db2 = ""; //db副位置
        private string db3 = ""; //db副2位置
        protected void Page_Load(object sender, EventArgs e)
        {

            if (base.Request.QueryString["ID"] != null)
            {
                try
                {
                    SmoothEnterprise.Database.DataSet attch = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);

                    attch.Open("SELECT * " +
                               "   FROM EIPE.DBO.IPQC_File " +
                               "  WHERE ID = '" + Request.QueryString["id"].ToString() + "'");
                    if (!attch.EOF)
                    {
                        try
                        {

                            //outputStream = new FileStream(temppdf, FileMode.Create);
                            // Get the object used to communicate with the server.
                            FtpWebRequest request = (FtpWebRequest)WebRequest.Create(@"ftp://ftp.minaik.com.tw/WQDP/IPQC/" + attch["filename"].ToString());
                            request.Method = WebRequestMethods.Ftp.DownloadFile;

                            // This example assumes the FTP site uses anonymous logon.
                            request.Credentials = new NetworkCredential("minaik", "mat2015");
                            FtpWebResponse response = (FtpWebResponse)request.GetResponse();
                            Stream responseStream = response.GetResponseStream();
                            //StreamReader reader = new StreamReader(responseStream);


                            Response.ContentType = "application/octet-stream";
                            Response.BinaryWrite(ReadyFully(responseStream));
                            Response.AddHeader("content-disposition", "inline;filename=" + attch["filename"].ToString());
                            //    Response.ContentType = "application/pdf";

                        }
                        catch
                        {
                            
                            Response.Flush();
                            Response.End();
                        }
                        finally
                        {
                            Response.Flush();
                            Response.End();
                        }



                    }
                    attch.Close();
                    Response.End();
                }
                catch
                {
                }
            }
            else
            {
                Response.End();
            }

        }
        protected byte[] ReadyFully(Stream input)
        {
            byte[] byteArray = new byte[16 * 1024];
            using (MemoryStream mSteram = new MemoryStream())
            {
                int bit;
                while ((bit = input.Read(byteArray, 0, byteArray.Length)) > 0)
                {
                    mSteram.Write(byteArray, 0, bit);
                }
                return mSteram.ToArray();
            }
        }

        private void DownloadFile(string  Dfile ,string fileName)
        {
            


            //設定要下載的檔案路徑 及 儲存的檔名
            string path = Dfile;
            
            //宣告並建立WebClient物件
            WebClient wc = new WebClient();
            //載入要下載的檔案
            byte[] b = wc.DownloadData(path);
            //清除Response內的HTML
            Response.Clear();
            //設定標頭檔資訊 attachment 是本文章的關鍵字
            Response.AddHeader("Content-Disposition", "attachment;filename=" + fileName);
            //開始輸出讀取到的檔案
            Response.BinaryWrite(b);
            //一定要加入這一行，否則會持續把Web內的HTML文字也輸出。
            Response.End();

        }

    }
}