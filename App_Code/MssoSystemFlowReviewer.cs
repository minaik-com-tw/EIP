//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:2.0.50727.4959
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

// This class library contains all the custom flow reviewer generating logic(s)
using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

namespace MssoSystem.Flowwork {
    
    
    public class MssoSystemFlowNode1Reviewer {
        
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

            string USERA = "";
            string USERTITLE = "";
            int StrCount = 0;

            System.Collections.Hashtable ht = parameter as System.Collections.Hashtable;
            if (ht != null)
            {
                StrCount = Convert.ToInt16(ht["StrCount"].ToString());

                for (int i = 1; i <= StrCount; i++)
                {
                    USERA = ht["USER" + i.ToString()].ToString();
                    USERTITLE = ht["USERTITLE" + i.ToString()].ToString();
                    rc.Add(new System.Guid(USERA), USERTITLE);
                }
            }
            return rc;

            //return rc;
        }
    }
}
