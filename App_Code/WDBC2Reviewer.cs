//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:2.0.50727.4211
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

// This class library contains all the custom flow reviewer generating logic(s)
namespace WDBC2.Flowwork {
    
    
    public class WDBC2Node1Reviewer {
        
        public virtual SmoothEnterprise.Flowwork.Control.FlowReviewerCollection select(System.Guid requestuid, object parameter, object arguments) {
            SmoothEnterprise.Flowwork.Control.FlowReviewerCollection rc = new SmoothEnterprise.Flowwork.Control.FlowReviewerCollection();
            string Uid = "";

            System.Collections.Hashtable ht = parameter as System.Collections.Hashtable;
            if (ht != null)
            {
                Uid = ht["USER1"].ToString();

            }
            rc.Add(new System.Guid(Uid));
            
            
            return rc;
        }
    }
    
    public class WDBC2Node2Reviewer {
        
        public virtual SmoothEnterprise.Flowwork.Control.FlowReviewerCollection select(System.Guid requestuid, object parameter, object arguments) {
            SmoothEnterprise.Flowwork.Control.FlowReviewerCollection rc = new SmoothEnterprise.Flowwork.Control.FlowReviewerCollection();

            string Uid = "";

            System.Collections.Hashtable ht = parameter as System.Collections.Hashtable;
            if (ht != null)
            {
                Uid = ht["USER2"].ToString();

            }
            rc.Add(new System.Guid(Uid));
            
            return rc;
        }
    }
    
    public class WDBC2Node3Reviewer {
        
        public virtual SmoothEnterprise.Flowwork.Control.FlowReviewerCollection select(System.Guid requestuid, object parameter, object arguments) {
            SmoothEnterprise.Flowwork.Control.FlowReviewerCollection rc = new SmoothEnterprise.Flowwork.Control.FlowReviewerCollection();

            string Uid = "";
            System.Collections.Hashtable ht = parameter as System.Collections.Hashtable;
            if (ht != null)  Uid = ht["USER3"].ToString();
          
            rc.Add(new System.Guid(Uid));


            return rc;
        }
    }
}
