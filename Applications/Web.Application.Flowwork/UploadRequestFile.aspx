<%@ page language="C#" masterpagefile="~/_site/layout/Program.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Flowwork.UploadRequestFile, App_Web_uploadrequestfile.aspx.cdcab7d2" title="Untitled Page" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">    
	<table Class="NormalBold" border="0">
		<tr>
			<td>
				<asp:Label id="LABEL_upload1" runat="server" Text="請按 瀏覽 鍵選擇要上傳之檔案 ....." meta:resourcekey="LABEL_upload1Resource1"></asp:Label>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<asp:Label id="FIELD_errmsg" runat="server" Font-Bold="True" Visible="False" ForeColor="Red" meta:resourcekey="FIELD_errmsgResource1"></asp:Label>
			</td>
		</tr>
		<tr>
			<td><FONT color="#ff0066">
					<asp:Label id="LABEL_upload2" runat="server" Text="檔案名稱不能包含下列字元(/,\,&,?,%,#,=,!,@,..)" meta:resourcekey="LABEL_upload2Resource1"></asp:Label>&nbsp;</FONT>
			</td>
		</tr>
		<tr>
			<td><SmoothEnterpriseWebControl:InputFile id="InputFile1" runat="server" cssClass="NormalBold" backcolor="#F0F0F0"
					Width="496px" meta:resourcekey="InputFile1Resource1"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient></SmoothEnterpriseWebControl:InputFile></td>
		</tr>
		<tr>
			<td>
				<asp:CheckBox id="Check_Cover" runat="server" CssClass="NormalBold" Visible="False" meta:resourcekey="Check_CoverResource1"></asp:CheckBox>
				<asp:Label id="LABEL_replacefile" runat="server" Visible="False" Text="取代舊檔案" meta:resourcekey="LABEL_replacefileResource1"></asp:Label></td>
		</tr>
	</table>
	<SmoothEnterpriseWebControl:InputButton id="StartUploadButton" runat="server" cssClass="NormalBold" Font-Bold="True" Font-Size="12px"
		Font-Names="Arial" BorderStyle="Solid" BorderWidth="1px" BorderColor="#606060" BackColor="#C8C8C8" Text="開始上傳檔案" OnClick="StartUploadButton_Click" meta:resourcekey="StartUploadButtonResource1" RunAtCient="False">
		<Gradient GradientEnd="" GradientType="Bottom" GradientBegin=""></Gradient>
	</SmoothEnterpriseWebControl:InputButton>
	<asp:Label id="HiddenJs" runat="server" meta:resourcekey="HiddenJsResource1"></asp:Label>
</asp:Content>

