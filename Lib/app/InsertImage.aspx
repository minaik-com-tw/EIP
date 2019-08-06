<%@ page language="C#" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.App.InsertImage, App_Web_insertimage.aspx.ae7ca9bd" stylesheettheme="Default" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<HTML>
	<HEAD runat="server">
		<title>插入圖片</title>
		<meta http-equiv="Content-Type" content="text/html; charset=big5">
		<meta http-equiv="MSThemeCompatible" content="No">
		<base target="_self">

	<script>
		function onTabClick()
		{
			var o = event.srcElement;
			var o1=window.document.getElementById("validate");			
			if (!o1) return;
			
			if(o.innerText=="系統")
					o1.value="sys";
			else
					o1.value="other";
		}
	</script>
	</HEAD>
	<body id="bdy" onkeydown="if (event.keyCode==116){document.all.bt5.click();}" style="BACKGROUND: buttonface; COLOR: windowtext"
		onload="Init()">
		<form id="MainForm" method="post" runat="server">
			<table height="420" cellSpacing="1" cellPadding="2" width="100%" border="0">
				<TBODY>
					<tr>
						<td vAlign="top" height="250">
							<!--////////////////////////////////////////////////////-->
							<dl class="tabsheet" tabfontcolor="blue" tabcapalign="center" tabwidth="50" height="150px"
								width="400px" tabalign="left" sheetclass="tabsilverbody" tabclass="TabSilver">
								<dt tabclick="onTabClick" tabtitle="系統">
									<div id="imgsys" style="BORDER-RIGHT: #000000 1px solid; BORDER-TOP: #000000 1px solid; OVERFLOW: scroll; BORDER-LEFT: #000000 1px solid; WIDTH: 580px; LAYOUT-GRID-LINE: auto; BORDER-BOTTOM: #000000 1px solid; HEIGHT: 250px; BACKGROUND-COLOR: white"
										runat="server"></div>
									<dt tabclick="onTabClick" tabtitle="其他">
										<div id="imgother" style="BORDER-RIGHT: #000000 1px solid; BORDER-TOP: #000000 1px solid; OVERFLOW: scroll; BORDER-LEFT: #000000 1px solid; WIDTH: 580px; LAYOUT-GRID-LINE: auto; BORDER-BOTTOM: #000000 1px solid; HEIGHT: 250px; BACKGROUND-COLOR: white"
											runat="server"></div>
									</dt>
							</dl>
						</td>
					</tr>
					<!--/////////////////////////////////////////////////////////////-->
					<div id="Div1" runat="server"></div>
					<!--/////////////////////////////////////////////////////////////--><asp:literal id="Literal1" runat="server"></asp:literal>
					<tr>
						<td vAlign="top">
							<table Class="Normal" id="Table2" cellSpacing="1" cellPadding="2" width="100%" border="0">
								<tr>
									<td Class="NormalBold" noWrap >圖檔名稱 :<input id="validate" type="hidden" size="20" value="sys" name="validate">
									</td>
									<td><span id="txtFileName1"></span><input id="txtFileName" type="hidden" size="52">
									</td>
								</tr>
								<tr>
									<td Class="NormalBold">替代文字 :</td>
									<td><INPUT Class="Normal" id="txtAltText" style="WIDTH: 360px" onfocus="select()" name="txtAltText">
									</td>
								</tr>
								<tr>
									<td></td>
									<td><input Class="NormalBold" id="InputButton1" style="BORDER-RIGHT: #606060 1px solid; BORDER-TOP: #606060 1px solid; FONT-WEIGHT: bold; FONT-SIZE: 12px; BACKGROUND: #c8c8c8; FILTER: progid: DXImageTransform.Microsoft.gradient(gradienttype=0,startcolorstr=#55ffffff, endcolorstr=#55888888); BORDER-LEFT: #606060 1px solid; WIDTH: 100px; BORDER-BOTTOM: #606060 1px solid; FONT-FAMILY: 'Arial'"
											onclick="open_win();" type="button" value="上傳檔案" name="InputButton1">&nbsp;&nbsp;
										<SmoothEnterpriseWebControl:inputbutton id="bt5" runat="server" Font-Bold="True" Font-Size="12px" Font-Names="Arial" BorderStyle="Solid"
											BorderWidth="1px" BorderColor="#606060" BackColor="#C8C8C8" cssClass="NormalBold" Text="Refresh">
											<Gradient GradientEnd="" GradientType="Bottom" GradientBegin=""></Gradient>
										</SmoothEnterpriseWebControl:inputbutton></td>
								</tr>
							</table>
							<table id="Table1" cellSpacing="1" cellPadding="2" width="100%" border="0">
								<TBODY>
									<tr>
										<td Class="Normal" vAlign="top" width="460">
											<FIELDSET id="fldLayout" style="PADDING-RIGHT: 5px; PADDING-LEFT: 5px; PADDING-BOTTOM: 5px; WIDTH: 250px; PADDING-TOP: 5px; HEIGHT: 70px">
												<LEGEND id="lgdLayout">Layout</LEGEND>
												<table id="Table3" cellSpacing="1" cellPadding="2" width="100%" border="0">
													<tr>
														<td Class="NormalBold" width="120">Alignment :
														</td>
														<td><SELECT Class="Normal" id="selAlignment" size="1" name="selAlignment">
																<OPTION id="optNotSet" value="">Not set</OPTION>
																<OPTION id="optLeft" value="left">Left</OPTION>
																<OPTION id="optRight" value="right">Right</OPTION>
																<OPTION id="optTexttop" value="textTop">Texttop</OPTION>
																<OPTION id="optAbsMiddle" value="absMiddle">Absmiddle</OPTION>
																<OPTION id="optBaseline" value="baseline" selected>Baseline</OPTION>
																<OPTION id="optAbsBottom" value="absBottom">Absbottom</OPTION>
																<OPTION id="optBottom" value="bottom">Bottom</OPTION>
																<OPTION id="optMiddle" value="middle">Middle</OPTION>
																<OPTION id="optTop" value="top">Top</OPTION>
															</SELECT>
														</td>
													</tr>
													<tr>
														<td Class="NormalBold">Border Thickness:</td>
														<td><INPUT id="txtBorder" style="IME-MODE: disabled" onfocus="select()" maxLength="3" size="3"
																name="txtBorder">
														</td>
													</tr>
												</table>
											</FIELDSET>
											<FIELDSET id="fldSpacing" style="PADDING-RIGHT: 5px; PADDING-LEFT: 5px; PADDING-BOTTOM: 5px; WIDTH: 180px; PADDING-TOP: 5px; HEIGHT: 70px">
												<LEGEND id="lgdSpacing">Spacing</LEGEND>
												<table id="Table4" cellSpacing="1" cellPadding="2" width="100%" border="0">
													<tr>
														<td Class="NormalBold" width="100">Horizontal :
														</td>
														<td><INPUT id="txtHorizontal" style="IME-MODE: disabled" onfocus="select()" maxLength="3" size="3"
																name="txtHorizontal">
														</td>
													</tr>
													<tr>
														<td Class="NormalBold">Vertical :</td>
														<td><INPUT id="txtVertical" style="IME-MODE: disabled" onfocus="select()" maxLength="3" size="3"
																name="txtVertical"></td>
													</tr>
												</table>
											</FIELDSET>
										</td>
										<td vAlign="middle"><SmoothEnterpriseWebControl:inputbutton id="btnConfirm" runat="server" Font-Bold="True" Font-Size="12px" Font-Names="Arial"
												BorderStyle="Solid" BorderWidth="1px" BorderColor="#606060" BackColor="#C8C8C8" cssClass="NormalBold" Width="128px" Text="確認">
												<Gradient GradientEnd="" GradientType="Bottom" GradientBegin=""></Gradient>
											</SmoothEnterpriseWebControl:inputbutton><br>
											<SmoothEnterpriseWebControl:inputbutton id="btnClose" runat="server" Font-Bold="True" Font-Size="12px" Font-Names="Arial"
												BorderStyle="Solid" BorderWidth="1px" BorderColor="#606060" BackColor="#C8C8C8" cssClass="NormalBold" Width="128px"
												Text="取消">
												<Gradient GradientType="Bottom"></Gradient>
											</SmoothEnterpriseWebControl:inputbutton></td>
									</tr>
								</TBODY></table>
						</td>
					</tr>
				</TBODY></table>
			<script language="jscript">

//	window.document.body.style.backgroundColor="buttonface"; 
//	window.document.body.scroll="no";
//	window.document.body.onload=Init();
	
function _CloseOnEsc() {
  if (event.keyCode == 27) { window.close(); return; }
}

function _getTextRange(elm) {
  var r = elm.parentTextEdit.createTextRange();
  r.moveToElementText(elm);
  return r;
}

window.onerror = HandleError
//var imgSrc="imgsrc";
//var _editor_url = "editorurl";


function HandleError(message, url, line) {
  var str = "An error has occurred in this dialog." + "\n\n"
  + "Error: " + line + "\n" + message;
  alert(str);
  window.close();
  return true;
}


function Init() {
  var elmSelectedImage;
  var htmlSelectionControl = "Control";
  
  var globalDoc = window.dialogArguments;

  var grngMaster = globalDoc.selection.createRange();

  // event handlers  
  document.body.onkeypress = _CloseOnEsc;
  //btnOK.onclick = new Function("btnOKClick()");
    
  document.all.txtFileName.fImageLoaded = false;
  document.all.txtFileName.intImageWidth = 0;
  document.all.txtFileName.intImageHeight = 0;
  
  
  if (globalDoc.selection.type == htmlSelectionControl) {

    if (grngMaster.length == 1) {
      elmSelectedImage = grngMaster.item(0);
      if (elmSelectedImage.tagName == "IMG") {
        document.all.txtFileName.fImageLoaded = true;
        if (elmSelectedImage.src) {
          document.all.txtFileName.value          = elmSelectedImage.src.replace(/^[^*]*(\*\*\*)/, "$1");  // fix placeholder src values that editor converted to abs paths
          document.all.txtFileName.intImageHeight = elmSelectedImage.height;
          document.all.txtFileName.intImageWidth  = elmSelectedImage.width;
          document.all.txtVertical.value          = elmSelectedImage.vspace;
          document.all.txtHorizontal.value        = elmSelectedImage.hspace;
          document.all.txtBorder.value            = elmSelectedImage.border;
          document.all.txtAltText.value           = elmSelectedImage.alt;
          document.all.selAlignment.value         = elmSelectedImage.align;
        }
      }
    }
  }
 // txtFileName.value = txtFileName.value || "http://";
  //txtFileName.focus();
}

function _isValidNumber(txtBox) {
  var val = parseInt(txtBox);
  if (isNaN(val) || val < 0 || val > 999) { return false; }
  return true;
}


function btnOKClick() {

  var elmImage;
  var intAlignment;
  var htmlSelectionControl = "Control";
  var globalDoc = window.dialogArguments;
  var grngMaster = globalDoc.selection.createRange();
  
  // error checking

  if (document.all.txtFileName.value =="") { 
    alert("Please chose a image file.");
    return;
  }
  if (document.all.txtHorizontal.value && !_isValidNumber(document.all.txtHorizontal.value)) {
    alert("Horizontal spacing must be a number between 0 and 999.");
    document.all.txtHorizontal.focus();
    return;
  }
  if (document.all.txtBorder.value && !_isValidNumber(document.all.txtBorder.value)) {
    alert("Border thickness must be a number between 0 and 999.");
    document.all.txtBorder.focus();
    return;
  }
  if (document.all.txtVertical.value && !_isValidNumber(document.all.txtVertical.value)) {
    alert("Vertical spacing must be a number between 0 and 999.");
    document.all.txtVertical.focus();
    return;
  }

  // delete selected content and replace with image
  if (globalDoc.selection.type == htmlSelectionControl && !document.all.txtFileName.fImageLoaded) {
    grngMaster.execCommand('Delete');
    grngMaster = globalDoc.selection.createRange();
  }
    
  idstr = "\" id=\"556e697175657e537472696e67";     // new image creation ID
  if (!document.all.txtFileName.fImageLoaded) 
  {
    grngMaster.execCommand("InsertImage", false, idstr);
    elmImage = globalDoc.all['556e697175657e537472696e67'];
    elmImage.removeAttribute("id");
    elmImage.removeAttribute("src");
    grngMaster.moveStart("character", -1);
  } 
  else
  {
    elmImage = grngMaster.item(0);
    if (elmImage.src != document.all.txtFileName.value) 
    {
		
      grngMaster.execCommand('Delete');
      grngMaster = globalDoc.selection.createRange();
      grngMaster.execCommand("InsertImage", false, idstr);
      elmImage = globalDoc.all['556e697175657e537472696e67'];
      elmImage.removeAttribute("id");
      elmImage.removeAttribute("src");
      grngMaster.moveStart("character", -1);
      document.all.txtFileName.fImageLoaded = false;
    }
    grngMaster = _getTextRange(elmImage);
  }

  if (document.all.txtFileName.fImageLoaded) {
    elmImage.style.width = document.all.txtFileName.intImageWidth;
    elmImage.style.height = document.all.txtFileName.intImageHeight;
  }

  if (document.all.txtFileName.value.length > 2040) {
    document.all.txtFileName.value = document.all.txtFileName.value.substring(0,2040);
  }
  
//  elmImage.src = txtFileName.value;
	
	var imgpath=""
	var o=window.document.getElementById("validate")
	if (o.value=="sys")
		//imgpath=(imgSrc+"/"+document.all.txtFileName1.innerText).replace("//","/");
		imgpath=(imgSrc1+document.all.txtFileName1.innerText);
	else	
	    imgpath = document.all.txtFileName.value;

  elmImage.src =imgpath;
  
  if (document.all.txtHorizontal.value != "") { elmImage.hspace = parseInt(document.all.txtHorizontal.value); }
  else                           { elmImage.hspace = 0; }

  if (document.all.txtVertical.value != "") { elmImage.vspace = parseInt(document.all.txtVertical.value); }
  else                         { elmImage.vspace = 0; }
  
  elmImage.alt = document.all.txtAltText.value;

  if (document.all.txtBorder.value != "") { elmImage.border = parseInt(document.all.txtBorder.value); }
  else                       { elmImage.border = 0; }

  elmImage.align = document.all.selAlignment.value;
  grngMaster.collapse(false);
  grngMaster.select();
  window.close();
}

//opener = window.dialogArguments;
//alert(opener);
//window.opener. 
//alert(window.self .opener.document.all.inputhtml2 );

//var _editor_url = window.opener._editor_url;
//var objname     = location.search.substring(1,location.search.length);

//var o=eval("window.self.opener.document.all."+objname);
//alert(o.imgSrc);
//alert(objname);


function selectimg(o)
{
	if(!o) return;
	//alert(o.src);
	var e=window.document.getElementById("txtFileName"); 
	var e1=window.document.getElementById("txtFileName1"); 
	if (e && e1)	{
		e1.innerText=o.id;
		e.value=o.src;
	}
	// + " Size:"+o.imgWidth+" x "+o.imgHeight;
}


function selectimg1(o)
{
	if(!o) return;
	var e=window.document.getElementById("txtFileName"); 
	var e1=window.document.getElementById("txtFileName1"); 
	if (e && e1)	{
		e1.innerText=o.alt;
		e.value=o.value;
	}
}



function img_mouseout(o)
{
	if (o)	o.style.borderColor="#333333";
}
function img_mouseover(o)
{
	if (o)	o.style.borderColor="blue";
}

function img_dbclick(o)
{
	selectimg(o);
	
	btnOKClick();
}

function img_dbclick1(o)
{
	selectimg1(o);
	btnOKClick();
}

function open_win()
{
	//var a=window.open(_editor_url + "popups/imgupload1.aspx?imgsrc="+imgSrc+"&userid="+_currentuserid,"","Width=450,height=250");
	var a=window.open("/Lib/App/ImgUpload.aspx?imgsrc="+imgSrc+"&userid="+_currentuserid,"","Width=450,height=250");
}

		var imgs = document.getElementsByName("sysimgs");
		var j=0;
		for (var i=0;i<imgs.length;i++)
		{
			j++;
			if(imgs(i).width>100)
			{
				 imgs(i).width=100;
			 }
		} 
	
			</script>
		</form>
	</body>
</HTML>
