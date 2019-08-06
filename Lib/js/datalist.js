<script language="javascript">

window.attachEvent("onload",init_hint);				

//===================Hint ========================//

var _left,_right,_top,_bottom;
var hintObj = null;
	
function init_hint()
{
    try
    {
        hintObj = document.createElement("div");
        hintObj.attachEvent("onmouseover",hint_onMouseOver);
	    hintObj.id= "hint-"+ window.document.uniqueID;
	    with(hintObj.style)
	    {
		    visibility="hidden";	
		    backgroundColor="#FFFFE7";
		    borderStyle = "solid";
		    borderWidth ="1px";
		    borderColor="black"; 
		    position='absolute';
		    paddingTop= "2px";
		    paddingLeft= "2px";
		    paddingRight= "2px";
		    fontSize = "12px";
		    top =0;
		    left =0;
		    filter = "alpha(opacity=80);";
		    width="auto";
		    zIndex=100;
	    }
	    window.document.body.appendChild(hintObj);	
	}
	catch (e)
	{
	}
}

function show_datahint()
{
   if (!hintObj) return;
   
   try
   {
       var x = window.event.x;
       var y = window.event.y;
       var elem = window.document.elementFromPoint( x, y );  

       if(elem.tagName=="INPUT" && elem.type=="text")
       {
		    if(elem.value!= (null | ""))
		    {
			    GetRectValue(elem);
			    if (x>=_left && x<=_right && y>=_top && y<=_bottom)
			    {
					    hintObj.style.width="auto";
					    hintObj.innerText=elem.value;
					    if(parseInt(hintObj.offsetWidth)>300)  hintObj.style.width='300px';
					    hintObj.style.top = window.document.body.scrollTop+ y +5+'px';
					    hintObj.style.left = window.document.body.scrollLeft + x + 5 +'px';			
					    hintObj.style.visibility="visible";			
			    }	
		    }	
       }
       else
       {
		    if (hintObj)	
		        hintObj.style.visibility="hidden";
       }
   }
   catch (e)
   {
   }
}

function hint_onMouseOver()
{
    try
    {
	    if (hintObj)	
	        hintObj.style.visibility="hidden";
	}
	catch (e)
	{
	}
}

function GetRectValue(obj)
{
    try
    {
	    if(obj)
	    {
		    var rect = obj.getClientRects()[0];
		    _left = rect.left;
		    _right = rect.right;
		    _top = rect.top;
		    _bottom = rect.bottom;
	    }
	}
	catch (e)
	{
	}
}

//=================DataList====================//
//////////////////////////////////
//    global variables    //
//////////////////////////////////

var d_num =0;
var dlobjs = new Array();
var arrHitTests = new Array();
var work_idx = -1;
var objArrow;

//---------------------------------//

//var oColArray = new Array()
var arrHitTest = new Array();
var bDragMode = null;
var objDragItem;
var objDragTable;
var ReadyState=false;
var iArrayHit;

var dragColor="#9d9d9d";
var titleColor="red";


function init_datalist_table(dlist_ID,cookie_ID)
{
    try
    {
	    if (dlist_ID==null) return;
	    var tblobj = document.getElementById(dlist_ID);  //The Target Table
	    if (!tblobj) return;
	    tblobj.setAttribute("_index",d_num);

	    //dlobjs[d_num]= tblobj;  //The Target Table
	    dlobjs[d_num] = new Array();   
	    dlobjs[d_num][0] = tblobj;   //the DataList self object
	    dlobjs[d_num][1] = cookie_ID;   //ths DataList cookiename storage
	    dlobjs[d_num][2] = dlobjs[d_num][0].rows[0];   //ths DataList headerRow 
	    dlobjs[d_num][3] = dlobjs[d_num][0].rows.length;   //ths DataList row count
	    dlobjs[d_num][4] = dlobjs[d_num][0].rows[0].children.length;   //ths DataList column count
	    dlobjs[d_num][5] = d_num;   //ths DataList Index
	    dlobjs[d_num][6] = 0;   //ths DataList Table Height
    	
	    if (cookie_ID!=null || cookie_ID !="") dlobjs[d_num][1]= cookie_ID;
	    dlobjs[d_num][0].attachEvent("onmousemove",dlist_onMouseMove);
	    dlobjs[d_num][0].attachEvent("onmouseup",dlist_onMouseUp);
    	
	    arrHitTests[d_num] = new Array();
	    InitHeader(d_num);
	    ReadyState=true;
	    d_num+=1;
	}
	catch (e)
	{
	}
}


//------------------init header -------------
function InitHeader(n)
{
    try
    {
        for (var i=0; i<dlobjs[n][4] ; i++) 
        {
	        var clickCell = dlobjs[n][2].children[i];
	        clickCell.selectIndex = i;
        	
	        //arrHitTest[i] = new Array();
	        arrHitTests[n][i] = new Array();
        	
	        var column_id = clickCell.id.replace(dlobjs[n][0].id+"_","");
	        if (column_id!="")
	        {
		        clickCell.attachEvent("onmousedown",cell_onMouseDown);
		        clickCell.style.cursor="hand";
	        }
        }
    }
    catch (e)
    {
    }             
}

function InitHeader1(n)
{
    try
    {
        for (var i=0; i<dlobjs[n][4] ; i++) 
        {
	        var clickCell = dlobjs[n][2].children[i];
	        clickCell.selectIndex = i;
        } 
    }
    catch (e)
    {
    }
}

function init_thead_position(idx)
{
    try
    {
        var clickCell ;
        var tblHieght=0;

        for (var i=0; i<dlobjs[idx][3] ; i++) 
        {
	        var clickCell = dlobjs[idx][0].rows[i].children[1];	
	        GetRectValue(clickCell);
	        tblHieght+=_bottom-_top;
        }
        dlobjs[idx][6]=tblHieght;

        for (var i=0; i<dlobjs[idx][4] ; i++) 
        {
	        clickCell = dlobjs[idx][2].children[i];
	        GetRectValue(clickCell);
	        arrHitTests[idx][i][0] = document.body.scrollLeft+_left;
	        arrHitTests[idx][i][1] =  document.body.scrollTop+_top;
	        arrHitTests[idx][i][2] = clickCell;
	        arrHitTests[idx][i][3] = document.body.scrollLeft+_left+ (_right-_left);	
        } 
	}
	catch (e)
	{
	}
}

//// new  move column function ////
function moveColumn(from, to)
{
    try
    {
        if (from == to) return;

        var tblobj = dlobjs[work_idx][0];
        var theadrow= dlobjs[work_idx][2];
        var rowCount= dlobjs[work_idx][3];
        var colCount= dlobjs[work_idx][4];

        if (from < to)
        {
		        for( var j=0;j<rowCount;j++)
		        {
			        for (var i=0;i<=to;i++)
			        {
				        if (i==from)
				        {
					        var fromCell=tblobj.rows[j].children[i];
					        var oCloneNode = fromCell.cloneNode(true);
				        }	
				        else if(i==to)
				        {
					        var toCell=tblobj.rows[j].children[i];
					        toCell.insertAdjacentElement("afterEnd",oCloneNode);
				        }
			        }
		        }
		        ///delete the from column -------------
		        for( var j=0;j<rowCount;j++)
		        {
			        for (var i=0;i<tblobj.rows[j].children.length;i++)
			        {
				        var fromCell=tblobj.rows[j].children[i];
				        if (i==from) fromCell.removeNode(true);
			        }
		        }
        }
        else
        {
		        to = to -1;
		        for( var j=0;j<rowCount;j++)
		        {
			        for (var i=from; i>= to;i--)
			        {
				        if (i==from)
				        {
					        var fromCell=tblobj.rows[j].children[i];
					        var oCloneNode = fromCell.cloneNode(true);
				        }	
				        else if(i==to)
				        {
					        if(to>=0)
					        {
						        var toCell=tblobj.rows[j].children[i];
						        toCell.insertAdjacentElement("afterEnd",oCloneNode);
					        }
					        else
					        {
						        var toCell=tblobj.rows[j].children[0];
						        toCell.insertAdjacentElement("BeforeBegin",oCloneNode);
					        }
				        }
			        }
		        }
		        ///delete the from column -------------
		        for( var j=0;j<rowCount;j++)
		        {
			        for (var i=0;i<colCount+1;i++)
			        {
				        var fromCell=tblobj.rows[j].children[i];
				        if (i==from+1)	fromCell.removeNode(true);
			        }
		        }
        }

        for(var i = 0 ; i < theadrow.children.length; i++)
	        theadrow.children[i].selectIndex = i;
        InitHeader1(work_idx);	
        setColtoCookie();  //save to cookie
    }
    catch (e)
    {
    }
}

function dlist_onMouseUp(e)
{
	try
	{
	    if(!bDragMode)	return;
	    bDragMode = false;
	    var iSelected = objDragItem.selectIndex;
	    objDragItem.removeNode(true);
	    objDragItem = null;
	    objDragTable.removeNode(true);
	    objDragTable = null;
    	
    //	ChangeHeader(-1);
	    if( (iArrayHit - 1) < 0 || iSelected < 0) return;	// default faliure
	    if (!iArrayHit ) return;
    //	restoreColColor (iArrayHit - 1);

	    var column_id = dlobjs[work_idx][2].children[iArrayHit - 1].id.replace(dlobjs[work_idx][0].id+"_","");
	    if (column_id!="") moveColumn(iSelected, (iArrayHit - 1) );
	    // Reset our variables
	    iSelected = 0;
	    iArrayHit = -1;
	    work_idx = -1;
	    if (objArrow) objArrow.style.visibility="hidden";	
	    //objArrow.style.visibility="hidden";	
	}
	catch (e)
	{
	}
}

function getDlistIndex(obj)
{
    try
    {
	    var src =obj;
	    while (src.tagName != "TABLE") 
		    src = src.parentElement;

	    var n=src.getAttribute("_index");
	    if(n!=null || n!="") 
		    return n;
	    else
		    return -1;
	}
	catch (e)
	{
	}
}

function cell_onMouseDown(e)
{
    try
    {
	    var src 	= e.srcElement;
	    if (bDragMode) return;
	    bDragMode 	= true;

	    work_idx = getDlistIndex(src)
	    eval("__"+dlobjs[work_idx][0].id+"_clearselect()");
	    //eval("__"+tblobj.id+"_clearselect()");
	    init_thead_position(work_idx);
    	
	    while (src.tagName != "TD") 
		    src = src.parentElement;
    	
	    //create the dragging arrow
	    if (!objArrow)
	    {
		    objArrow = document.createElement("DIV");
		    objArrow.innerHTML="<table cellpadding=0 cellspacing=0 height=100% border=0><tr><td valign=top><img src='\\lib\\img\\icon-arrowdown.gif '></td></tr><tr><td valign=bottom><img src='\\lib\\img\\icon-arrowup.gif '></td></tr></table>";	
		    window.document.body.appendChild(objArrow);
		    with(objArrow.style)
		    {
			    position 	= "absolute";
			    left = Math.round(parseInt((arrHitTests[work_idx][src.selectIndex][0]+arrHitTests[work_idx][src.selectIndex][3]))/2);
			    top = arrHitTests[work_idx][src.selectIndex][1]-12;
			    //display	= "block";
			    visibility = "hidden";
			    zIndex = 0;
		    }
	    }	
	    objArrow.style.height=dlobjs[work_idx][6] + 30;
    	
	    //--------------- create the Dragging Column Table --------------------//
	    //objDragTable = initColumnTable(src,src.selectIndex);
	    objDragTable = initColumnTable(src);
	    objDragItem = objDragTable;
	    //objDragItem = document.createElement("DIV");
	    objDragItem.selectIndex	= src.selectIndex;
	    GetRectValue(src)	;
	    with (objDragItem.style)
	    {
 		    filter = "alpha(opacity=60);"
		    height	= src.currentStyle.height;
		    backgroundColor="white";
		    width 	= _right -_left;
		    position 	= "absolute";
		    y = document.body.scrollTop + _top;
		    x = document.body.scrollLeft + _left;
 		    //borderStyle	= "outset";
 		    borderWidth	= "1px";
		    display	= "none";
		    zIndex = 9;
	    }
	    src.insertBefore(objDragItem);
    //	objDragItem.insertAdjacentElement("beforeEnd",objDragTable);
    }
    catch (e)
    {
    }
}

function dlist_onMouseMove(e)
{
    try
    {
        var src=e.srcElement;

        if(!bDragMode || !objDragItem) return;	// If we aren't dragging or our object
        // Hardcoded value for height difference
        var midWObj = objDragItem.style.posWidth / 2;
        var midHObj = 12;

        if (midWObj=="NaN" )
        midWObj=50;
        // Save mouse's position in the document
        var intTop = e.clientY + document.body.scrollTop;
        var intLeft = e.clientX + document.body.scrollLeft;

        var cx=0,cy=0;
        var elCurrent = objDragItem.offsetParent;
        while (elCurrent.offsetParent != null) 
        {
         cx += elCurrent.offsetTop;
         cy += elCurrent.offsetLeft;
         elCurrent = elCurrent.offsetParent;
        }

        objDragItem.style.pixelTop  = intTop  - cx - midHObj;
        objDragItem.style.pixelLeft = intLeft - cy - midWObj;

        if(objDragItem.style.display == "none") objDragItem.style.display = "";

        iArrayHit = CheckHit(intTop , intLeft , src);

        if (objArrow && (iArrayHit!=-1))
        {
        objArrow.style.left = Math.round(parseInt((arrHitTests[work_idx][iArrayHit-1][0]+arrHitTests[work_idx][iArrayHit-1][3]))/2);
        objArrow.style.top = arrHitTests[work_idx][iArrayHit-1][1]-15;
        if (objArrow.style.visibility=="hidden") objArrow.style.visibility="visible";	
        }

        e.cancelBubble = false;
        e.returnValue = false;
    }
    catch (e)
    {
    }
}

function CheckHit(y,x,e)
{
    try
    {
	    midWObj = objDragItem.style.posWidth / 2;
	    midHObj = 12;
	    if (midWObj=="NaN" ) midWObj=50;
	    if( (y > (arrHitTests[work_idx][0][1] + dlobjs[work_idx][6]) ) || ( y < (arrHitTests[work_idx][0][1]) ) )
	    {
    //		ChangeHeader(-1);
		    return -1;
	    }

	    for(var i=0; i < dlobjs[work_idx][4]; i++)
	    {
		    if( (x > arrHitTests[work_idx][i][0]) &&  (x < arrHitTests[work_idx][i][3] )) 
		    {
    //			ChangeHeader(i);
			    return i + 1;
		    }
	    }
	}
	catch (e)
	{
	}
	return -1;
	
}

///// save column seq to cookie ////
function setColtoCookie()
{
    try
    {
	    var tblobj_cookie_id =dlobjs[work_idx][1];
	    if (!tblobj_cookie_id) return;

	    var tblobj = dlobjs[work_idx][0];
	    var theadrow= dlobjs[work_idx][2];
	    var rowCount= dlobjs[work_idx][3];
	    var colCount= dlobjs[work_idx][4];
    	
	    var cookieSeq=""
	    for (var i=0;i<colCount; i++)
	    {
		    var column_id = theadrow.children[i].id.replace(tblobj.id+"_","");
		    if (column_id!="" && column_id!=null)
		    {
			    cookieSeq+= column_id;
			    if(i<theadrow.children.length-1) cookieSeq+= ",";
		    }
    //		oColArray[i]=column_id;
	    }	
	    SetCookie(tblobj_cookie_id,cookieSeq);
	}
	catch (e)
	{
	}
}

function	 SetCookie(sName,sValue)
{
    try
    {
	    var expDate = new Date();
	    expDate.setMonth( expDate.getMonth()+1);
	    document.cookie = sName + "=" + sValue + "; expires=" + expDate.toGMTString();
	}
	catch (e)
	{
	}
}

function GetCookie(sName)
{
    try
    {
        var aCookie = document.cookie.split("; ");
        for (var i=0; i < aCookie.length; i++)
        {
        var aCrumb = aCookie[i].split("=");
        if (sName == aCrumb[0]) 
	        return unescape(aCrumb[1]);
        }
    }
    catch (e)
    {
    }
    return null;
}

//---- Reset the drag column table  ----
function initColumnTable(s)
{
    try
    {
	    var index=s.selectIndex;
    	
	    while (s.tagName != "TABLE") 
		    s = s.parentElement;
    		
	    var tblobj=s;
	    var dragTable = document.createElement("table");
    	
	    dragTable.width="100%";
	    dragTable.cellSpacing = tblobj.cellSpacing;
	    dragTable.style.cssText=tblobj.style.cssText;
	    dragTable.className = tblobj.className;
	    //dragTable.cellSpacing=1;
	    dragTable.cellPadding=tblobj.cellPadding;
	    dragTable.border = tblobj.border;
	    dragTable.height = dlobjs[work_idx][6] ;
    	
	    var colCount=tblobj.rows[0].children.length;
	    var rowCount=tblobj.rows.length;
    	
	    for (var i=0;i<colCount;i++)
	    {
		    for (var j=0; j<rowCount; j++)
		    {
			    if (i==index)
			    {
				    var fromTD = tblobj.rows[j].children[i];
				    var oCloneNode = fromTD.cloneNode(true);
				    var iRow = dragTable.insertRow();
				    iRow.align = tblobj.rows[j].align;
				    iRow.bgColor = tblobj.rows[j].bgColor;
				    iRow.className = tblobj.rows[j].className;
				    iRow.style.cssText = tblobj.rows[j].style.cssText ;
				    iRow.insertAdjacentElement("beforeEnd",oCloneNode);
			    }
		    }
	    }
	    return dragTable;
	}
	catch (e)
	{
	}
}

function ChangeHeader(iChange)
{
////-------------- 此部份還處理不好 (當 column 拖曳時的顏色變化)-------------////
return;

	for(var y = 0; y < arrHitTest.length; y++)
	{
			
		if (arrHitTest[y][2].currentStyle.backgroundColor == dragColor)
		{
		    arrHitTest[y][2].style.backgroundColor = titleColor;
		}  
		else
		{
				 //arrHitTest[y][2].style.backgroundColor ="WHITE";
		}
	}
	if(iChange == "-1") return; 
	
//	arrHitTest[iChange][2].style.backgroundColor = dragColor;
}


</script>
