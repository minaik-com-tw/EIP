<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Calendar.CalendarCategoryAdd, App_Web_calendarcategoryadd.aspx.cdcab7d2" theme="Default" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.WebControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">    
    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server" Details="The desciption for this program"
		Caption="Program Name" Width="100%" CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px" IconHeight="" IconWidth="" meta:resourcekey="ContentDescriptorResource1">
		<CaptionStyle Font-Bold="True" CssClass="Medium" BorderStyle="NotSet"></CaptionStyle>
		<DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray" BorderStyle="NotSet" CssClass=""></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>
	<script>
function chg_style(stylevalue)
{
	var o=document.getElementById("style_table") ;
	if (o)
	{
		o.style.cssText=stylevalue;
	}
}
	</script>

	<table border="0" Class="Normal">
		<tr>
			<td valign="top"><table>
					<tr>
						<td Class="NormalBold">
						    <asp:Label ID="LABEL_category" runat="server" Text="類別名稱" meta:resourcekey="LABEL_categoryResource1"></asp:Label></td>
					</tr>
					<tr>
						<td><SmoothEnterpriseWebControl:InputText id="FIELD_category" runat="server"  BackColor="#F0F0F0"
								CssClass="Normal" ErrorMessage="請輸入「類別名稱」!!" tabIndex="101" MaxLength="50" Width="280px" Required="True" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" FormatType="None" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_categoryResource1" OnClickMore="" Personalize="False"><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControl:inputtext></td>
					</tr>
					<tr>
						<td Class="NormalBold">
						    <asp:Label ID="LABEL_eventstyle" runat="server" Text="樣式" meta:resourcekey="LABEL_eventstyleResource1"></asp:Label></td>
					</tr>
					<tr>
						<td>
							<!--
							<select name="select_style" id="select_style" required style="BACKGROUND:#f0f0f0;FILTER:progid:DXImageTransform.Microsoft.gradient(gradienttype=0,startcolorstr=#55888888, endcolorstr=#55ffffff);BEHAVIOR:url(/lib/htc/ComboSelect.htc)"
								Class="Normal">
								<option value="BORDER: #3333ff 1px solid;  FONT-SIZE: 12px; FILTER: progid:DXImageTransform.Microsoft.gradient(gradienttype=0,startcolorstr=#ffffffff, endcolorstr=#aa3333ff);  BACKGROUND-COLOR: #9999ff"
									style="BORDER-RIGHT: #3333ff 1px solid; BORDER-TOP: #3333ff 1px solid; FONT-SIZE: 12px; FILTER: progid: DXImageTransform.Microsoft.gradient(gradienttype=0,startcolorstr=#ffffffff, endcolorstr=#aa3333ff); BORDER-LEFT: #3333ff 1px solid; BORDER-BOTTOM: #3333ff 1px solid; BACKGROUND-COLOR: #9999ff"
									selected>Abc</option>
								<option value="BORDER: #ff0033 1px solid; FONT-WEIGHT: bold; FONT-SIZE: 12px; BACKGROUND: #ffe4e1; FILTER: progid:DXImageTransform.Microsoft.gradient(gradienttype=0,startcolorstr=#ffffa0a0, endcolorstr=#ffffe4e1); FONT-FAMILY: 'Tahoma'"
									style="BORDER-RIGHT: #ff0033 1px solid; BORDER-TOP: #ff0033 1px solid; FONT-WEIGHT: bold; FONT-SIZE: 12px; BACKGROUND: #ffe4e1; FILTER: progid: DXImageTransform.Microsoft.gradient(gradienttype=0,startcolorstr=#ffffa0a0, endcolorstr=#ffffe4e1); BORDER-LEFT: #ff0033 1px solid; BORDER-BOTTOM: #ff0033 1px solid; FONT-FAMILY: 'Tahoma'">Abc</option>
								<option value="BORDER: chocolate 1px solid; FONT-SIZE: 12px; FILTER: progid:DXImageTransform.Microsoft.gradient(gradienttype=0,startcolorstr=#ffffff, endcolorstr=#ffffa256); FONT-FAMILY: Tahoma; BACKGROUND-COLOR: #ffd44b"
									style="BORDER-RIGHT: chocolate 1px solid; BORDER-TOP: chocolate 1px solid; FONT-SIZE: 12px; FILTER: progid: DXImageTransform.Microsoft.gradient(gradienttype=0,startcolorstr=#ffffff, endcolorstr=#ffffa256); BORDER-LEFT: chocolate 1px solid; BORDER-BOTTOM: chocolate 1px solid; FONT-FAMILY: Tahoma; BACKGROUND-COLOR: #ffd44b">Abc</option>
								<option value="BORDER: #aaaa66 1px solid; FONT-SIZE: 12px; BACKGROUND: #ddddaa; FILTER: progid:DXImageTransform.Microsoft.gradient(gradienttype=0,startcolorstr=#aaeeeeaa, endcolorstr=#88999933)"
									style="BORDER-RIGHT: #aaaa66 1px solid; BORDER-TOP: #aaaa66 1px solid; FONT-SIZE: 12px; BACKGROUND: #ddddaa; FILTER: progid: DXImageTransform.Microsoft.gradient(gradienttype=0,startcolorstr=#aaeeeeaa, endcolorstr=#88999933); BORDER-LEFT: #aaaa66 1px solid; BORDER-BOTTOM: #aaaa66 1px solid">Abc</option>
								<option value="BORDER: olivedrab 1px solid;  FONT-SIZE: 12px; BACKGROUND: greenyellow; FILTER: progid:DXImageTransform.Microsoft.gradient(gradienttype=0,startcolorstr=#fff4f4f4, endcolorstr=#ff9acd32); COLOR: #000000;FONT-FAMILY: 'Tahoma'"
									style="BORDER-RIGHT: olivedrab 1px solid; BORDER-TOP: olivedrab 1px solid; FONT-SIZE: 12px; BACKGROUND: greenyellow; FILTER: progid: DXImageTransform.Microsoft.gradient(gradienttype=0,startcolorstr=#fff4f4f4, endcolorstr=#ff9acd32); BORDER-LEFT: olivedrab 1px solid; COLOR: #000000; BORDER-BOTTOM: olivedrab 1px solid; FONT-FAMILY: 'Tahoma'">Abc</option>
								<option value="BORDER: #8989ff 1px solid;  FONT-SIZE: 12px; BACKGROUND: #dedeff; FILTER: progid:DXImageTransform.Microsoft.gradient(gradienttype=0,startcolorstr=#ffeeeeff, endcolorstr=#cc7878ff);"
									style="BORDER-RIGHT: #8989ff 1px solid; BORDER-TOP: #8989ff 1px solid; FONT-SIZE: 12px; BACKGROUND: #dedeff; FILTER: progid: DXImageTransform.Microsoft.gradient(gradienttype=0,startcolorstr=#ffeeeeff, endcolorstr=#cc7878ff); BORDER-LEFT: #8989ff 1px solid; BORDER-BOTTOM: #8989ff 1px solid">Abc</option>
								<option value="BORDER: #ffa6a1 1px solid;  FONT-SIZE: 12px; BACKGROUND: #ffe4e1; FILTER: progid:DXImageTransform.Microsoft.gradient(gradienttype=0,startcolorstr=#fffff8f5, endcolorstr=#ffffe1d6);"
									style="BORDER-RIGHT: #ffa6a1 1px solid; BORDER-TOP: #ffa6a1 1px solid; FONT-SIZE: 12px; BACKGROUND: #ffe4e1; FILTER: progid: DXImageTransform.Microsoft.gradient(gradienttype=0,startcolorstr=#fffff8f5, endcolorstr=#ffffe1d6); BORDER-LEFT: #ffa6a1 1px solid; BORDER-BOTTOM: #ffa6a1 1px solid">Abc</option>
							</select>-->
							<table cellpadding="0" cellspacing="0">
								<tr>
									<td>
										<SmoothEnterpriseWebControl:InputSelect id="InputSelect_Style" runat="server"  cssClass="Normal" backcolor="#F0F0F0"
											ItemAll-Value="%" Required="True" onchange="chg_style(this.value);" ItemNoneDisplayed="True" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="%" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="InputSelect_StyleResource1" Mode="Single" TextBoxStyle="ThreeDStyle" Value="">
											<Items>
												<SmoothEnterpriseWebControl:SelectItem BorderStyle="Solid" BorderWidth="1px" Gradient-GradientEnd="170, 51, 51, 255" 
													Gradient-GradientBegin="White" BackColor="#9999FF" Selected="False" RowHeight="18" Value="BORDER: #3333ff 1px solid;  FONT-SIZE: 12px; FILTER: progid:DXImageTransform.Microsoft.gradient(gradienttype=0,startcolorstr=#ffffffff, endcolorstr=#aa3333ff);  BACKGROUND-COLOR: #9999ff;padding: 0 0 0 0;"
													BorderColor="#3333FF" IconUrl="" Text="Style A" GroupText="" ID="selectItem1" IsValid="True" CookieID=""
													ErrorMessage="" style="FILTER:progid:DXImageTransform.Microsoft.gradient(gradienttype=0,startcolorstr=#55ffffff, endcolorstr=#553333ff);background-color:#9999ff;border-color:#3333ff;border-width:1px;border-style:Solid;" meta:resourcekey="selectItem1Resource1" runat="server"></SmoothEnterpriseWebControl:SelectItem>
												<SmoothEnterpriseWebControl:SelectItem BorderStyle="Solid" BorderWidth="1px" Gradient-GradientEnd="MistyRose" Gradient-GradientLevel="100"
													 Gradient-GradientBegin="255, 160, 160" BackColor="MistyRose" Selected="False"
													RowHeight="18" Value="BORDER: #ff0033 1px solid; FONT-WEIGHT: bold; FONT-SIZE: 12px; BACKGROUND: #ffe4e1; FILTER: progid:DXImageTransform.Microsoft.gradient(gradienttype=0,startcolorstr=#ffffa0a0, endcolorstr=#ffffe4e1); FONT-FAMILY: 'Tahoma';padding: 0 0 0 0;"
													BorderColor="#FF0033" IconUrl="" Text="Style B" GroupText="" ID="selectItem5" IsValid="True" CookieID=""
													ErrorMessage="" style="FILTER:progid:DXImageTransform.Microsoft.gradient(gradienttype=0,startcolorstr=#100ffa0a0, endcolorstr=#100ffe4e1);background-color:#ffe4e1;border-color:#ff0033;border-width:1px;border-style:Solid;" meta:resourcekey="selectItem5Resource1" runat="server"></SmoothEnterpriseWebControl:SelectItem>
												<SmoothEnterpriseWebControl:SelectItem BorderStyle="Solid" BorderWidth="1px" Gradient-GradientEnd="255, 162, 86" 
													Gradient-GradientBegin="White" BackColor="#FFD44B" Selected="False" RowHeight="18" Font-Names="Tahoma" Value="BORDER: chocolate 1px solid; FONT-SIZE: 12px; FILTER: progid:DXImageTransform.Microsoft.gradient(gradienttype=0,startcolorstr=#ffffff, endcolorstr=#ffffa256); FONT-FAMILY: Tahoma; BACKGROUND-COLOR: #ffd44b;padding: 0 0 0 0;"
													BorderColor="Chocolate" IconUrl="" Text="Style C" GroupText="" ID="style3" IsValid="True" CookieID="" ErrorMessage=""
													style="FILTER:progid:DXImageTransform.Microsoft.gradient(gradienttype=0,startcolorstr=#55ffffff, endcolorstr=#55ffa256);background-color:#ffd44b;border-color:#d2691e;border-width:1px;border-style:Solid;font-family:Tahoma;font-weight:normal;" meta:resourcekey="style3Resource1" runat="server"></SmoothEnterpriseWebControl:SelectItem>
												<SmoothEnterpriseWebControl:SelectItem BorderStyle="Solid" BorderWidth="1px" Gradient-GradientEnd="136, 153, 153, 51" 
													Gradient-GradientBegin="170, 238, 238, 170" BackColor="#DDDDAA" Selected="False" RowHeight="18" Value="BORDER: #aaaa66 1px solid; FONT-SIZE: 12px; BACKGROUND: #ddddaa; FILTER: progid:DXImageTransform.Microsoft.gradient(gradienttype=0,startcolorstr=#aaeeeeaa, endcolorstr=#88999933);padding: 0 0 0 0;"
													BorderColor="#AAAA66" IconUrl="" Text="Style D" GroupText="" ID="Style4" IsValid="True" CookieID="" ErrorMessage=""
													style="FILTER:progid:DXImageTransform.Microsoft.gradient(gradienttype=0,startcolorstr=#55eeeeaa, endcolorstr=#55999933);background-color:#ddddaa;border-color:#aaaa66;border-width:1px;border-style:Solid;" meta:resourcekey="Style4Resource1" runat="server"></SmoothEnterpriseWebControl:SelectItem>
												<SmoothEnterpriseWebControl:SelectItem BorderStyle="Solid" BorderWidth="1px" Gradient-GradientEnd="YellowGreen" 
													Gradient-GradientBegin="244, 244, 244" BackColor="GreenYellow" Selected="False" RowHeight="18" Value="BORDER: olivedrab 1px solid;  FONT-SIZE: 12px; BACKGROUND: greenyellow; FILTER: progid:DXImageTransform.Microsoft.gradient(gradienttype=0,startcolorstr=#fff4f4f4, endcolorstr=#ff9acd32); COLOR: #000000;FONT-FAMILY: 'Tahoma';padding: 0 0 0 0;"
													BorderColor="OliveDrab" IconUrl="" Text="Style E" GroupText="" ID="selectItem15" IsValid="True" CookieID=""
													ErrorMessage="" style="FILTER:progid:DXImageTransform.Microsoft.gradient(gradienttype=0,startcolorstr=#55f4f4f4, endcolorstr=#559acd32);background-color:#adff2f;border-color:#6b8e23;border-width:1px;border-style:Solid;" meta:resourcekey="selectItem15Resource1" runat="server"></SmoothEnterpriseWebControl:SelectItem>
												<SmoothEnterpriseWebControl:SelectItem BorderStyle="Solid" BorderWidth="1px" Gradient-GradientEnd="255, 225, 214" 
													Gradient-GradientBegin="255, 248, 245" BackColor="MistyRose" Selected="False" RowHeight="18" Value="BORDER: #ffa6a1 1px solid;  FONT-SIZE: 12px; BACKGROUND: #ffe4e1; FILTER: progid:DXImageTransform.Microsoft.gradient(gradienttype=0,startcolorstr=#fffff8f5, endcolorstr=#ffffe1d6);padding: 0 0 0 0;"
													BorderColor="#FFA6A1" IconUrl="" Text="Style F" GroupText="" ID="selectItem51" IsValid="True" CookieID=""
													ErrorMessage="" style="FILTER:progid:DXImageTransform.Microsoft.gradient(gradienttype=0,startcolorstr=#55fff8f5, endcolorstr=#55ffe1d6);background-color:#ffe4e1;border-color:#ffa6a1;border-width:1px;border-style:Solid;" meta:resourcekey="selectItem51Resource1" runat="server"></SmoothEnterpriseWebControl:SelectItem>
												<SmoothEnterpriseWebControl:SelectItem BorderStyle="Solid" BorderWidth="1px" Gradient-GradientEnd="204, 120, 120, 255"
													 Gradient-GradientBegin="238, 238, 255" BackColor="#DEDEFF" Selected="False" RowHeight="18"
													Value="BORDER: #8989ff 1px solid;  FONT-SIZE: 12px; BACKGROUND: #dedeff; FILTER: progid:DXImageTransform.Microsoft.gradient(gradienttype=0,startcolorstr=#ffeeeeff, endcolorstr=#cc7878ff);padding: 0 0 0 0;"
													BorderColor="#8989FF" IconUrl="" Text="Style G" GroupText="" ID="selectItem5g" ErrorMessage="" IsValid="True"
													CookieID="" style="FILTER:progid:DXImageTransform.Microsoft.gradient(gradienttype=0,startcolorstr=#55eeeeff, endcolorstr=#557878ff);background-color:#dedeff;border-color:#8989ff;border-width:1px;border-style:Solid;" meta:resourcekey="selectItem5gResource1" runat="server"></SmoothEnterpriseWebControl:SelectItem>
											</Items>
										<Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                        </SmoothEnterpriseWebControl:InputSelect>
									</td>
									<td>
										<table id="style_table" Class="Normal" cellpadding="0" cellspacing="0">
											<tr>
												<td><asp:Label ID="LABEL_style" runat="server" Text="樣式" meta:resourcekey="LABEL_styleResource1"></asp:Label></td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
							<SmoothEnterpriseWebControl:InputSelect id="InputSelect_Style2" runat="server"  ItemAll-Value="%" backcolor="#F0F0F0"
								cssClass="Normal" Visible="False" ButtonClick="True" ButtonIconUrl="/lib/img/icon-downarrow.gif" Editable="False" ErrorMessage="" FadeSpeed="NoFade" IsValid="True" ItemAll-GroupText="" ItemAll-IconUrl="" ItemAll-RowHeight="18" ItemAll-Selected="False" ItemAll-Text="%" ItemNone-GroupText="" ItemNone-IconUrl="" ItemNone-RowHeight="18" ItemNone-Selected="False" ItemNone-Text="" ListPosition="Vertical" meta:resourcekey="InputSelect_Style2Resource1" Mode="Single" TextBoxStyle="ThreeDStyle" Value=""><Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:InputSelect>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<table border="0" Class="Normal">
		<tr>
			<td>
				<SmoothEnterpriseWebControl:InputButton id="BUTTON_save" runat="server" width="80px" Text="儲存" Gradient-GradientType="Bottom"
					CssClass="NormalBold" BackColor="#C8C8C8" BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid" Font-Names="Arial"
					Font-Size="12px" Font-Bold="True" OnClick="BUTTON_save_Click" meta:resourcekey="BUTTON_saveResource1" RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton>&nbsp;
				<SmoothEnterpriseWebControl:InputButton id="BUTTON_savenext" runat="server" Text="儲存後繼續操作" Gradient-GradientType="Bottom"
					CssClass="NormalBold" BackColor="#C8C8C8" BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid" Font-Names="Arial"
					Font-Size="12px" Font-Bold="True" OnClick="BUTTON_save_Click" meta:resourcekey="BUTTON_savenextResource1" RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton>&nbsp;
				<SmoothEnterpriseWebControl:InputButton id="BUTTON_back" runat="server" width="80px" Text="回上頁" Gradient-GradientType="Bottom"
					CssClass="NormalBold" BackColor="#C8C8C8" BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid" Font-Names="Arial"
					Font-Size="12px" Font-Bold="True" OnClick="BUTTON_back_Click" meta:resourcekey="BUTTON_backResource1" RunAtCient="False">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton>
			</td>
		</tr>
	</table>
</asp:Content>
