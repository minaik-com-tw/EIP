//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:2.0.50727.4200
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

// This class library contains all the custom flow reviewer generating logic(s)
using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Data.SqlClient;


namespace MAExper.Flowwork {
    
    
    public class MAExperFlowNode1Reviewer {

       /* public static string oradb = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["EIPAConnectionString"].ConnectionString;
        //���Ʈw���s�W/Update
        private void acttable(string sql)
        {
            SqlConnection conn1 = new SqlConnection(oradb);
            conn1.Open();

            SqlCommand ccom1 = new SqlCommand(sql, conn1);

            ccom1.ExecuteNonQuery();
            conn1.Close();

        }*/

        
        public virtual SmoothEnterprise.Flowwork.Control.FlowReviewerCollection select(System.Guid requestuid, object parameter, object arguments) {
            SmoothEnterprise.Flowwork.Control.FlowReviewerCollection rc = new SmoothEnterprise.Flowwork.Control.FlowReviewerCollection();
            
            System.Collections.Hashtable ht = parameter as System.Collections.Hashtable;
            string AppUid = ht["App1"].ToString();

           // string sq3 = "insert into  misbuffer2(caption)values('" + AppUid + "')";
           // acttable(sq3);

            rc.Add(new System.Guid(AppUid));
            return rc;
        }
    }
}