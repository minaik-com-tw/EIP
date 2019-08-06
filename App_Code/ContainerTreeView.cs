using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

/// <summary>
/// Summary description for ContainerTreeView
/// </summary>
[ToolboxData("<{0}:ContainerTreeView runat=server></{0}:ContainerTreeView>")]
public class ContainerTreeView : TreeView, INamingContainer
{
    public ContainerTreeView()
        : base()
    {
        PathSeparator = ClientIDSeparator;
    }


    protected override void OnInit(EventArgs e)
    {
        // Initialize Child Controls
        RecurseUpdateNodes(Nodes);


        base.OnInit(e);
    }


    protected const String s_strNodeValueSeparator = "_TV_";
    protected virtual void RecurseUpdateNodes(TreeNodeCollection parrNodes)
    {
        if (parrNodes == null || parrNodes.Count == 0)
            return;


        foreach (TreeNode pNode in parrNodes)
        {
            ContainerTreeNode pContainerNode = pNode as ContainerTreeNode;
            if (pContainerNode != null)
            {
                // update node pre / post rendering control IDs id
                if (pContainerNode.PreRenderContainer != null)
                {
                    pContainerNode.PreRenderContainer.ID = pContainerNode.PreRenderContainer.ID.Insert(0, pNode.ValuePath + s_strNodeValueSeparator);
                    Controls.Add(pContainerNode.PreRenderContainer);
                }
                if (pContainerNode.PostRenderContainer != null)
                {
                    pContainerNode.PostRenderContainer.ID = pContainerNode.PostRenderContainer.ID.Insert(0, pNode.ValuePath + s_strNodeValueSeparator);
                    Controls.Add(pContainerNode.PostRenderContainer);
                }
            }


            // update children
            RecurseUpdateNodes(pNode.ChildNodes);
        }
    }


    public ContainerTreeNode CreateTreeNode()
    {
        return new ContainerTreeNode(this, false);
    }
    protected override TreeNode CreateNode()
    {
        return CreateTreeNode();
    }


    // collection of child controls
    protected override ControlCollection CreateControlCollection()
    {
        return new ControlCollection(this);
    }
    protected override void RenderChildren(HtmlTextWriter writer)
    {
        // do not render children as they will be rendered within treeview nodes
        // base.RenderChildren(writer);
    }
}
