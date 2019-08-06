using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Net;
using System.Text;
using CNE;

namespace CNE
{
    public partial class CNEChk : SmoothEnterprise.Web.Page
    {
        public string Show;
        public string Error = "";

        string sDt;
        string eDt;
        string custem = "";
        Out2 outInfo;
        string  mail = "";
        bool diffect = false;
        protected void Page_Load(object sender, System.EventArgs e)
        {
            //Page.Title = "CNE List Page";
            if (!this.IsPostBack)
            {
                eDt = DateTime.Now.ToShortDateString();
                sDt = DateTime.Now.AddDays(-7).ToShortDateString();
                mail=Request.QueryString["mail"];

                
                Run(false);
            }
            else
            {
                custem = custmer.Text;
                eDt = txt_eDt.Text;
                sDt = txt_sDt.Text;
            }

            txt_eDt.Text = eDt;
            txt_sDt.Text = sDt;
            custmer.Text = custem;

        }


        protected void btn_Qty_Click(object sender, EventArgs e)
        {
            Run(false);
        }

        private void Run(bool isOut)
        {
            StringBuilder sb = new StringBuilder();

            StringBuilder sb_head = new StringBuilder();
            StringBuilder sb_head_tr = new StringBuilder();
            StringBuilder sb_head_td = new StringBuilder();
            StringBuilder sb_body_tr = new StringBuilder();
            

            DBTransfer db = new DBTransfer();

            sb.Append("select  max(occano) 'occano'  FROM EIPB.DBO.ERP_AXMI25 where isState='Complete' ");
            

            if (!string.IsNullOrEmpty(eDt))
            {
                sb.AppendFormat("and convert( char(10), occaud15,121) <='{0}' ", Convert.ToDateTime(eDt).ToString("yy/MM/dd"));
            }

            if (!string.IsNullOrEmpty(sDt))
            {
                sb.AppendFormat("and convert( char(10), occaud15,121) >='{0}' ", Convert.ToDateTime(sDt).ToString("yy/MM/dd"));
            }

            if (!string.IsNullOrEmpty(custem))
            {
                sb.AppendFormat("and occa01 like '{0}%' ", custem);
            }

            sb.Append("  group by occa01 ");

            Utility.log(sb.ToString());
            //float count = db.GetCount(sb.ToString());
            //lab_count.Text = "總筆數:" + count.ToString();

            using (SmoothEnterprise.Database.DataSet EIP = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead))
            {
                string sql = "select * FROM EIPB.DBO.ERP_AXMI25 where  occano in ( "+sb.ToString()+" ) order by occa01 "; 


                EIP.Open(sql);
                
                int i = 0;
                while (!EIP.EOF)
                {
                    outInfo = new Out2();
                    i++;
                    lab_current.Text = "目前巡查:" + i.ToString();
                    string rowno = EIP["rowno"].ToString();
                    string plant = EIP["PlantID"].ToString();
                    string occa01 = EIP["occa01"].ToString();
                    string action = EIP["occa00"].ToString().Split(':')[0]; // U:修改 只取第一個字元 U
                    string ERP_NO = EIP["occano"].ToString();
                    string status = EIP["isState"].ToString();
                    string custmer = EIP["occa01"].ToString();


                    //每一次都要清空
                    Dictionary<string, string> dc_EIP = new Dictionary<string, string>();

                    //只有一筆資料 
                    //收集EIP的資料
                    
                    foreach (DataColumn col in EIP.Columns)
                    {
                        string Key = col.ColumnName.ToUpper();
                        string Val = EIP[Key].ToString();
                        dc_EIP.Add(Key, Val);
                    
                    }

                    
                    SmoothEnterprise.Database.DataSet ERP = new SmoothEnterprise.Database.DataSet(SmoothEnterprise.Database.DataSetType.OpenRead);
                    {
                        StringBuilder erp_sql = new StringBuilder();
                        erp_sql.AppendFormat(" SELECT * FROM IP185.{0}.dbo.OCC_FILE ", plant);
                        erp_sql.AppendFormat(" WHERE 1=1   AND OCC01 = '{0}'", occa01);
                        ERP.Open(erp_sql.ToString());
                        
                        if (ERP.EOF && action == "I")
                        {
                            // 沒資料，以OCCA_FILE為主去比對網頁資料，然後新增
                            erp_sql = new StringBuilder();
                            erp_sql.AppendFormat(" SELECT * FROM IP185.{0}.dbo.OCCA_FILE ", plant);
                            erp_sql.AppendFormat(" WHERE occano = '{0}'", ERP_NO);
                            ERP.Open(erp_sql.ToString());
                        }
                        else
                        {
                            // 已新增，更新不同的欄位資料
                            action = "U";
                        }

                        if (!ERP.EOF)
                        {
                            //有資料

                            //只有一筆資料
                            //收集ERP的資料
                            Dictionary<string, string> dc_ERP = new Dictionary<string, string>();

                            foreach (DataColumn col in ERP.Columns)
                            {
                                string Key = col.ColumnName.ToUpper();
                                string Val = ERP[Key].ToString();
                                dc_ERP.Add(Key, Val);
                            }

                            StringBuilder sb_body_td = new StringBuilder();

                            string value = "";
                            foreach (KeyValuePair<string, string> item in dc_EIP)
                            {
                                value = "";
                                string col = item.Key;

                                string name = action == "I" ? col : col.Replace("OCCA", "OCC"); //欄位名稱大寫;

                                 

                                string td_ERP = "";
                                string td_EIP = "";
                                string bgcolor = " bgcolor='#ffffff'";
                                if (dc_ERP.ContainsKey(name)) //欄位是在ERP 
                                {
                                    string ERP_Val = dc_ERP[name].Trim();
                                    string EIP_Val = dc_EIP[col].Trim();

                                    if (col == "OCCA12") //創業日，只取日期
                                    {
                                        try
                                        {
                                            if (!string.IsNullOrEmpty(EIP_Val))
                                            {
                                                EIP_Val = Convert.ToDateTime(EIP_Val).ToShortDateString();
                                            }

                                            if (!string.IsNullOrEmpty(ERP_Val))
                                            {
                                                ERP_Val = Convert.ToDateTime(ERP_Val).ToShortDateString();
                                            }
                                        }
                                        catch (Exception ex)
                                        {
                                            bgcolor = " bgcolor='#81c0c0'";
                                            Error = Error + "創業日:" + ERP_NO + "," + EIP_Val + ERP_Val + "<br>";
                                        }
                                    }

                                    if (col == "OCCA1004")
                                    {
                                        EIP_Val = "2";
                                    }



                                    if (string.IsNullOrEmpty(EIP_Val))
                                    {
                                        EIP_Val = "NULL";
                                    }

                                    if (string.IsNullOrEmpty(ERP_Val))
                                    {
                                        ERP_Val = "NULL";
                                    }
                                    //值不相等

                                    bool isChange = true;
                                    if (col == "OCCAUSER" || col == "OCCAGRUP" || col == "OCCAUD15" || col == "OCCA1004" || col == "OCCAACTI") //例外，不更新的欄位
                                    {
                                        isChange = false;
                                    }

                                    Tansfer(col, ref EIP_Val,ref ERP_Val);

                                    

                                    if (!EIP_Val.Contains(ERP_Val) || EIP_Val!= ERP_Val)
                                    {
                                        if (ERP_NO == "101-1840001")
                                        {
                                            //Utility.log(col + "," + EIP_Val + "," + ERP_Val);
                                        }

                                        if (isChange)//不更新欄位
                                        {
                                            diffect = true;
                                               value = "<font color='#009393'> " + col + "</font><br><font color='red'> " + EIP_Val + "</font>" + "<br>" + "<font color='#484891'> " + ERP_Val + "</font>";

                                            EIP_Val = EIP_Val == "NULL" ? string.Empty : EIP_Val;
                                            outInfo.Add(plant, col, EIP_Val, ERP_NO, action);
                                            
                                        }
                                    }

                                    
                                }
                                if (!string.IsNullOrEmpty(value))
                                {
                                    sb_body_td.AppendFormat("<td {1} >{0}</td>", value, bgcolor);
                                }
                                //string td=sb_td.ToString();
                                //sb_tr.AppendFormat("<tr>{0}</tr>", td);
                            }

                     
                                sb_head_tr.AppendFormat("<tr><td>{4}</td><td><a href='{7}/ERP_AXMI25/ERP_AXMI25View.aspx?ROWNO={0}' Target='_blank' >{1}</a></td><td>{5}</td><td>{6}</td><td >{3}</td>{2}</tr>", rowno, ERP_NO, sb_body_td.ToString(), status, i.ToString(), custmer, action,Utility.LocalUrl);



                             
                            //sb_head.AppendFormat("<tr><td>{0}</td><td>{3}</td><td>{4}</td></tr>", i.ToString(), rowno, ERP_NO, status, sb_td.ToString());
                        }
                    }

                    //----------------輸出xml-------------------------
                    if (isOut)
                    {
                        if (outInfo.List.Count > 0 || action != "U")
                        {
                            OutXML("2", rowno, plant, action, ERP_NO);
                        }
                    }

                    EIP.MoveNext();
                }

                Show = "<table border='1'>" + sb_head_tr.ToString() + "</table>";

                if (mail.ToUpper() == "Y" )
                {
                    StringBuilder body = new StringBuilder();

                    
                    body.AppendFormat("Query Data form {0} to {1} <br><br><br>", sDt,eDt);
                    body.Append(Show);
                    string subject = string.Format(" {0} to {1} 客代異常報表 ",sDt,eDt);

                    mail = "herzog.lin@minaik.com.tw,yoyo.huang@minaik.com.tw;catherine.wu@minaik.com,carol.yeh@minaik.com.tw";
                    //mail = "carol.yeh@minaik.com.tw";

                    Utility.SendMail(mail, "eip1@minaik.com.tw", subject, body.ToString());
                }

                lab_count.Text = "總筆數:" +i.ToString();
            }
        }

        private void upt_Temp(string Col, string Value, string Plant, string Action, string ERP_NO)
        {
             
            StringBuilder sb = new StringBuilder();
            sb.Append("INSERT INTO EIPB.dbo.ERP_AXMI25_TEMP ([ROWNO] ,[ID] ,[zone] ,[field_name] ,[field_value] ,[no] ,[apply_atrribute],[modify_user],[modify_date]) ");
            sb.AppendFormat("VALUES('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}') ", Guid.NewGuid(), Guid.NewGuid(), Plant, Col, Value, ERP_NO, Action, "system", DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss"));

            DBTransfer db = new DBTransfer();
            db.RunIUSql(sb.ToString());

        }
        private void OutXML(string contt, string rowno, string plant, string action, string erp_no)
        {
            //1.找出不同的值
            //2.存檔 
            StringBuilder sb = new StringBuilder();

            //完成審核後要加上去的 //依舊系統加入
            sb.AppendFormat("{0}|{1}|{2}|{3}|{4}\r\n", plant, "occa1004", contt, erp_no, action); //MINAIK|ta_occa24c|0.000000|101-1810001|U

            DBTransfer db = new DBTransfer();
            Utility.execDel(string.Format("delete EIPB.dbo.ERP_AXMI25_TEMP where NO='{0}' ", erp_no)); //存檔前先清空前次修改 只留最後一次修改的資料

            foreach (Out2 o in outInfo.List)
            {
                upt_Temp(o.Column, o.Value,o.Plant,o.Action,o.ERP_NO);
                sb.AppendFormat("{0}|{1}|{2}|{3}|{4}\r\n", o.Plant, o.Column, o.Value, o.ERP_NO, o.Action); //MINAIK|ta_occa24c|0.000000|101-1810001|U
                erp_no = o.ERP_NO;
                action = o.Action;
                plant = o.Plant;
            }
             
            //3.上傳FTP

            //檔案路徑 string path = "D:\\ERP_AXMI250"
            string path = "D:\\ERP_AXMI250";
            //檔案名稱 //MINAIK-U_axmi250_101-1810001
            string filename = string.Format("MINAIK-{0}_axmi250_{1}.txt", action, erp_no);


            string file = Path.Combine(path, filename);
            File.Delete(file);
            File.AppendAllText(file, sb.ToString());

            uploadtoFTP(file, @"ftp://192.168.0.250/" + filename, "4gl", "4gl");
            File.Delete(file);

        }

        private void Tansfer(string col, ref string EIP ,ref string ERP)
        {
            if (col == "OCCA55" || col == "OCCA06" || col == "TA_OCCA11" || col == "TA_OCCA21" )
            {

                string[] Val = EIP.Split(':');
                EIP = Val[0];
            }

            if (col == "OCCAUD15")
            {
                //Utility.log("OCCAUD15",EIP,ERP);
                EIP = Convert.ToDateTime(EIP).ToShortDateString();
                ERP = Convert.ToDateTime(ERP).ToShortDateString();
            }
        }
        protected void btn_OutXml_Click(object sender, EventArgs e)
        {
            Run(true);
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
                Response.Write(ex.Message + ex.StackTrace + "<br>");

                throw new Exception(ex.Message + "<br>" + ex.StackTrace);
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

    public class Out2
    {

        public string Plant; //廠區
        public string Column; //欄位名稱
        public string Value; //欄位內容
        public string ERP_NO; //單號
        public string Action; //申請性質

        private List<Out2> _list = new List<Out2>();

        /// </summary>
        /// <param name="plant">廠區</param>
        /// <param name="column">欄位名稱</param>
        /// <param name="value">欄位內容</param>
        /// <param name="erp_no">單號</param>
        /// <param name="action">申請性質</param>
        public void Add(string plant, string column, string value, string erp_no, string action)
        {
            Out2 o = new Out2();
            o.Plant = plant;
            o.Column = column;
            o.Value = value;
            o.ERP_NO = erp_no;
            o.Action = action;

            _list.Add(o);
        }

        public List<Out2> List
        {
            get
            {
                return _list;
            }
        }
    }

}