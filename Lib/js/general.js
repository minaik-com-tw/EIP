
function SaveFocusNodeID(objid,focusID)
{
	if(objid!="")
	{
		var obj=window.document.getElementById(objid);
		if(!obj) return;
//		obj.addBehavior ("#default#userData");	
		
		obj.setAttribute("focusnode",focusID);
		obj.save(objid+"node_onfocus");
	}
}

