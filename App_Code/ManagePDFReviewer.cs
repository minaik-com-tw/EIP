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
namespace ManagePDF.Flowwork {
    
    
    public class ManagePDFNode1Reviewer {
        
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
            //lovely.hung
            ds.Open("SELECT id FROM dguser WHERE  logonid = 'nancy.wei' or logonid = 'lovely.hung' or logonid = 'evonne.yang' or logonid = 'dove.lin'");
            while (!ds.EOF)
            {
                rc.Add(new System.Guid(ds["id"].ToString()));
                ds.MoveNext();
            }
            return rc;
        }
    }
}
