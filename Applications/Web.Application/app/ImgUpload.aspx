<%@ page language="C#" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.App.ImgUpload, App_Web_imgupload.aspx.ae7ca9bd" stylesheettheme="Default" %>

<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<html>
<head id="HEAD1" runat="server">
    <title>插入圖片</title>
    <meta http-equiv="Content-Type" content="text/html; charset=big5">
    <meta http-equiv="MSThemeCompatible" content="No">
    <base target="_self">

    <script language="jscript">
			window.moveTo(screen.width/2 - 225,screen.height/2-220);
			window.document.body.style.backgroundColor="buttonface"; 
			
			function checkFileName(filevalue)
			{
				
				if(filevalue=="") {
						MainForm.btnUpload.disabled=true;
						return;
				}
				
					var valuearray=filevalue.split("\\");
					var FileName=valuearray[valuearray.length-1];
					var strarray=FileName.split(".");
					var extName=strarray[strarray.length-1].toLowerCase();
					if(extName!="jpg" && extName!="gif" && extName!="png" && extName!="bmp" && extName!="jpeg")
					{
						alert("Please upload the image file !");
						MainForm.btnUpload.disabled=true;
					}	
					else
					{
						MainForm.btnUpload.disabled=false;
						var o= document.getElementById("imgName");
						if (o)	o.value=FileName;
					}
			}
			
			
			function winclose()
			{
				//window.opener.ReLoad1.click();
				if (window.opener)
					window.opener.document.all.bt5.click();
				window.close();
			}
    </script>

</head>
<body>
    <form id="MainForm" runat="server">
        <fieldset id="fldSpacing" style="padding-right: 5px; padding-left: 5px; padding-bottom: 5px;
            padding-top: 5px">
            <legend Class="Normal" id="lgdSpacing">圖檔上傳</legend>
            <table>
                <tr>
                    <td Class="NormalBold" nowrap width="80">
                        請選取檔案 :</td>
                    <td>
                        <SmoothEnterpriseWebControl:InputFile ID="imgFile1" runat="server"
                            BackColor="#F0F0F0" Width="312px" CssClass="Normal" onchange="checkFileName(this.value);">
                        </SmoothEnterpriseWebControl:InputFile></td>
                </tr>
                <tr>
                    <td Class="NormalBold">
                        圖片名稱 :</td>
                    <td>
                        <SmoothEnterpriseWebControl:InputText ID="imgName" runat="server" BackColor="#F0F0F0"
                            Width="312px" CssClass="Normal" ErrorMessage="請輸入圖片名稱" Required="True">
                        </SmoothEnterpriseWebControl:InputText></td>
                </tr>
                <tr>
                    <td Class="NormalBold">
                        圖檔分類 :</td>
                    <td>
                        <SmoothEnterpriseWebControl:InputSelect ID="imgCategory1" runat="server" BackColor="#F0F0F0"
                            CssClass="Normal">
                            <Items>
                                <SmoothEnterpriseWebControl:SelectItem RowHeight="18" Text="- 未指定圖檔分類 -" Selected="False"
                                    Value="" IconUrl="" GroupText=""></SmoothEnterpriseWebControl:SelectItem>
                            </Items>
                        </SmoothEnterpriseWebControl:InputSelect>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td>
                        <asp:Label Class="Normal" ID="lblShow" runat="server" ForeColor="Blue"></asp:Label></td>
                </tr>
            </table>
        </fieldset>
        <table id="Table1" cellspacing="1" cellpadding="1" width="100%" border="0">
            <tr>
                <td align="right">
                    <asp:Literal ID="Literal1" runat="server"></asp:Literal><SmoothEnterpriseWebControl:InputButton
                        ID="btnUpload" runat="server" Width="100px" CssClass="NormalBold" Text="上傳" Enabled="False"
                         BackColor="#C8C8C8" BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid"
                        Font-Names="Arial" Font-Size="12px" Font-Bold="True" OnClick="btnUpload_Click">
                        <Gradient GradientEnd="" GradientBegin=""></Gradient>
                    </SmoothEnterpriseWebControl:InputButton><SmoothEnterpriseWebControl:InputButton
                        ID="btnClose" runat="server" Width="100px" CssClass="NormalBold" Text="取消" 
                        BackColor="#C8C8C8" BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid"
                        Font-Names="Arial" Font-Size="12px" Font-Bold="True" RunAtCient="true">
                        <Gradient GradientEnd="" GradientBegin=""></Gradient>
                    </SmoothEnterpriseWebControl:InputButton></td>
            </tr>
        </table>
    </form>
</body>
</html>
