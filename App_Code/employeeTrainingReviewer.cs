//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:2.0.50727.4952
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

// This class library contains all the custom flow reviewer generating logic(s)
using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;


namespace employeeTraining.Flowwork {
    


    public class employeeTrainingNode1Reviewer {


       // public static string Constr2 = "Data Source=WEB242;Initial Catalog=EIPA;Persist Security Info=True;User ID=smooth;Password=mat2009";
        public static string Constr2=System.Web.Configuration.WebConfigurationManager.ConnectionStrings["EIPAConnectionString"].ConnectionString; 
		
		
        public void RunIUSql2(string sql2)
        {
            SqlConnection conn2 = new SqlConnection(Constr2);
            conn2.Open();

            SqlCommand query = new SqlCommand(sql2, conn2);
            query.ExecuteNonQuery();
            conn2.Close();
        }


        public virtual SmoothEnterprise.Flowwork.Control.FlowReviewerCollection CustomUser(System.Guid requestuid, object parameter, object arguments) {
            SmoothEnterprise.Flowwork.Control.FlowReviewerCollection rc = new SmoothEnterprise.Flowwork.Control.FlowReviewerCollection();
            // Put your code to generate custom reviewers
            // Example :
            // rc.Add(userid);
            // rc.Add(userid,text);
            //  
            // Get parameter value(s)
            // Example :
            // object value = SmoothEnterprise.Flowwork.Control.FlowReviewer.GetParameter(parameter,key);
            /*
            string USERA = "";
            System.Collections.Hashtable ht = parameter as System.Collections.Hashtable;
            if (ht != null)
            {
                USERA = ht["USER1"].ToString();
            }
            rc.Add(new System.Guid(USERA));
           


            string sq4 = "insert into  misbuffer2(caption)values('" + USERA + "��1�Ӹ`�I')";
            RunIUSql2(sq4);
            */

            SmoothEnterprise.Database.DataSet ds = new SmoothEnterprise.Database.DataSet();
            ds.Open("SELECT id FROM dguser WHERE  logonid = 'smooth'");
            while (!ds.EOF)
            {
                rc.Add(new System.Guid(ds["id"].ToString()));
                ds.MoveNext();
            }
            return rc; 
        }

   
    }
    
    public class employeeTrainingNode2Reviewer {
        
        public virtual SmoothEnterprise.Flowwork.Control.FlowReviewerCollection CustomUser(System.Guid requestuid, object parameter, object arguments) {
            SmoothEnterprise.Flowwork.Control.FlowReviewerCollection rc = new SmoothEnterprise.Flowwork.Control.FlowReviewerCollection();
            // Put your code to generate custom reviewers
            // Example :
            // rc.Add(userid);
            // rc.Add(userid,text);
            //  
            // Get parameter value(s)
            // Example :
            // object value = SmoothEnterprise.Flowwork.Control.FlowReviewer.GetParameter(parameter,key);
            /*
            string USERA = "";
            System.Collections.Hashtable ht = parameter as System.Collections.Hashtable;
            if (ht != null)
            {
                USERA = ht["USER2"].ToString();
            }
            rc.Add(new System.Guid(USERA));
            */
            SmoothEnterprise.Database.DataSet ds = new SmoothEnterprise.Database.DataSet();
            ds.Open("SELECT id FROM dguser WHERE  logonid = 'smooth'");
            while (!ds.EOF)
            {
                rc.Add(new System.Guid(ds["id"].ToString()));
                ds.MoveNext();
            }
            return rc;
        }
    }
    
    public class employeeTrainingNode3Reviewer {
        
        public virtual SmoothEnterprise.Flowwork.Control.FlowReviewerCollection CustomUser(System.Guid requestuid, object parameter, object arguments) {
            SmoothEnterprise.Flowwork.Control.FlowReviewerCollection rc = new SmoothEnterprise.Flowwork.Control.FlowReviewerCollection();
            // Put your code to generate custom reviewers
            // Example :
            // rc.Add(userid);
            // rc.Add(userid,text);
            //  
            // Get parameter value(s)
            // Example :
            // object value = SmoothEnterprise.Flowwork.Control.FlowReviewer.GetParameter(parameter,key);
            SmoothEnterprise.Database.DataSet ds = new SmoothEnterprise.Database.DataSet();
            //ds.Open("SELECT id FROM dguser WHERE  logonid = 'lm.huang' or logonid = 'yuhui.peng' or logonid = 'elaine.chiu'");
            ds.Open("SELECT id FROM dguser WHERE  logonid = 'smooth'");
            while (!ds.EOF)
            {
                rc.Add(new System.Guid(ds["id"].ToString()));
                ds.MoveNext();
            }
            return rc;
        }
    }
    
    public class employeeTrainingNode4Reviewer {
        
        public virtual SmoothEnterprise.Flowwork.Control.FlowReviewerCollection CustomUser(System.Guid requestuid, object parameter, object arguments) {
            SmoothEnterprise.Flowwork.Control.FlowReviewerCollection rc = new SmoothEnterprise.Flowwork.Control.FlowReviewerCollection();
            // Put your code to generate custom reviewers
            // Example :
            // rc.Add(userid);
            // rc.Add(userid,text);
            //  
            // Get parameter value(s)
            // Example :
            // object value = SmoothEnterprise.Flowwork.Control.FlowReviewer.GetParameter(parameter,key);
            SmoothEnterprise.Database.DataSet ds = new SmoothEnterprise.Database.DataSet();
            ds.Open("SELECT id FROM dguser WHERE  logonid = 'smooth'");
            while (!ds.EOF)
            {
                rc.Add(new System.Guid(ds["id"].ToString()));
                ds.MoveNext();
            }
            return rc;
        }
    }
    
    public class employeeTrainingNode5Reviewer {


        public static string Constr1 =System.Web.Configuration.WebConfigurationManager.ConnectionStrings["EIPAConnectionString"].ConnectionString; 
		
 		//"Data Source=WEB242;Initial Catalog=EIPA;Persist Security Info=True;User ID=smooth;Password=mat2009";

        public void RunIUSql(string sql)
        {
            SqlConnection conn1 = new SqlConnection(Constr1);
            conn1.Open();

            SqlCommand query = new SqlCommand(sql, conn1);
            query.ExecuteNonQuery();
            conn1.Close();
        }

        public virtual SmoothEnterprise.Flowwork.Control.FlowReviewerCollection CustomUser(System.Guid requestuid, object parameter, object arguments) {
            SmoothEnterprise.Flowwork.Control.FlowReviewerCollection rc = new SmoothEnterprise.Flowwork.Control.FlowReviewerCollection();
            // Put your code to generate custom reviewers
            // Example :
            // rc.Add(userid);
            // rc.Add(userid,text);
            //  
            // Get parameter value(s)
            // Example :
            // object value = SmoothEnterprise.Flowwork.Control.FlowReviewer.GetParameter(parameter,key);
            /*
            string USERA = "";
            System.Collections.Hashtable ht = parameter as System.Collections.Hashtable;
            if (ht != null)
            {
                USERA = ht["USER2"].ToString();
            }
            rc.Add(new System.Guid(USERA));



            string sq3 = "insert into  misbuffer2(caption)values('" + USERA + "��2�Ӹ`�I')";
            RunIUSql(sq3);
            */

            SmoothEnterprise.Database.DataSet ds = new SmoothEnterprise.Database.DataSet();
            ds.Open("SELECT id FROM dguser WHERE  logonid = 'smooth'");
            while (!ds.EOF)
            {
                rc.Add(new System.Guid(ds["id"].ToString()));
                ds.MoveNext();
            }
            return rc;             
        }
    }
    
    public class employeeTrainingNode6Reviewer {
        
        public virtual SmoothEnterprise.Flowwork.Control.FlowReviewerCollection CustomUser(System.Guid requestuid, object parameter, object arguments) {
            SmoothEnterprise.Flowwork.Control.FlowReviewerCollection rc = new SmoothEnterprise.Flowwork.Control.FlowReviewerCollection();
            // Put your code to generate custom reviewers
            // Example :
            // rc.Add(userid);
            // rc.Add(userid,text);
            //  
            // Get parameter value(s)
            // Example :
            // object value = SmoothEnterprise.Flowwork.Control.FlowReviewer.GetParameter(parameter,key);
            SmoothEnterprise.Database.DataSet ds = new SmoothEnterprise.Database.DataSet();
            
            //ds.Open("SELECT id FROM dguser WHERE  logonid = 'lm.huang' or logonid = 'yuhui.peng' or logonid = 'elaine.chiu'");
            ds.Open("SELECT id FROM dguser WHERE  logonid = 'smooth'");
            while (!ds.EOF)
            {
                rc.Add(new System.Guid(ds["id"].ToString()));
                ds.MoveNext();
            }
            return rc;
        }
    }
    
    public class employeeTrainingNode7Reviewer {
        
        public virtual SmoothEnterprise.Flowwork.Control.FlowReviewerCollection CustomUser(System.Guid requestuid, object parameter, object arguments) {
            SmoothEnterprise.Flowwork.Control.FlowReviewerCollection rc = new SmoothEnterprise.Flowwork.Control.FlowReviewerCollection();
            // Put your code to generate custom reviewers
            // Example :
            // rc.Add(userid);
            // rc.Add(userid,text);
            //  
            // Get parameter value(s)
            // Example :
            // object value = SmoothEnterprise.Flowwork.Control.FlowReviewer.GetParameter(parameter,key);
            SmoothEnterprise.Database.DataSet ds = new SmoothEnterprise.Database.DataSet();
            ds.Open("SELECT id FROM dguser WHERE  logonid = 'smooth'");
            while (!ds.EOF)
            {
                rc.Add(new System.Guid(ds["id"].ToString()));
                ds.MoveNext();
            }
            return rc;
        }
    }
    
    public class employeeTrainingNode8Reviewer {
        
        public virtual SmoothEnterprise.Flowwork.Control.FlowReviewerCollection CustomUser(System.Guid requestuid, object parameter, object arguments) {
            SmoothEnterprise.Flowwork.Control.FlowReviewerCollection rc = new SmoothEnterprise.Flowwork.Control.FlowReviewerCollection();
            // Put your code to generate custom reviewers
            // Example :
            // rc.Add(userid);
            // rc.Add(userid,text);
            //  
            // Get parameter value(s)
            // Example :
            // object value = SmoothEnterprise.Flowwork.Control.FlowReviewer.GetParameter(parameter,key);
            SmoothEnterprise.Database.DataSet ds = new SmoothEnterprise.Database.DataSet();
            ds.Open("SELECT id FROM dguser WHERE  logonid = 'smooth'");
            while (!ds.EOF)
            {
                rc.Add(new System.Guid(ds["id"].ToString()));
                ds.MoveNext();
            }
            return rc;
        }
    }
}