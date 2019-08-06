using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using SmoothEnterprise.Security.UI.WebControl;
using SmoothEnterprise.Web.UI.HTMLControl;


/// <summary>
/// Summary description for ContainerTreeNode
/// </summary>
/// <summary>
/// Summary description for ContainerTreeNode
/// </summary>
public class ContainerTreeNode : TreeNode
{
    TreeView m_pOwnerTreeView = null;
    protected internal ContainerTreeNode(TreeView pOwnerTreeView, bool bIsRoot)
        : base(pOwnerTreeView, bIsRoot)
    {
        m_pOwnerTreeView = pOwnerTreeView;
    }

    public TreeView OwnerTreeView
    {
        get { return m_pOwnerTreeView; }
    }

    public ContainerTreeNode(string str)
    {
        base.Text = str;
    }

    protected WebControl m_pPreRenderControl = null;
    protected WebControl m_pPostRenderControl = null;

    public WebControl PreRenderContainer
    {
        get { return m_pPreRenderControl; }
    }
    public WebControl PostRenderContainer
    {
        get { return m_pPostRenderControl; }
    }
    public ControlCollection PreRenderControls
    {
        get
        {
            if (m_pPreRenderControl == null)
            {
                m_pPreRenderControl = new WebControl(HtmlTextWriterTag.Nobr);
                m_pPreRenderControl.ID = "PreRender";
            }
            return m_pPreRenderControl.Controls;
        }
    }
    public ControlCollection PostRenderControls
    {
        get
        {
            if (m_pPostRenderControl == null)
            {
                m_pPostRenderControl = new WebControl(HtmlTextWriterTag.Nobr);
                m_pPostRenderControl.ID = "PostRender";
            }
            return m_pPostRenderControl.Controls;
        }
    }

    protected override void RenderPreText(HtmlTextWriter writer)
    {
        base.RenderPreText(writer);

        if (m_pPreRenderControl != null)
            m_pPreRenderControl.RenderControl(writer);
    }
    protected override void RenderPostText(HtmlTextWriter writer)
    {
        if (m_pPostRenderControl != null)
            m_pPostRenderControl.RenderControl(writer);

        base.RenderPostText(writer);
    }
}
