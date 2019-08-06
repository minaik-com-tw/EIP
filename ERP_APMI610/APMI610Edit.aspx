<%@ Page Language="C#" MasterPageFile="~/_site/layout/Template.master"  Debug="true"  AutoEventWireup="true" CodeFile="APMI610Edit.aspx.cs" Inherits="ERP_APMI610.APMI610Edit" StylesheetTheme="Default" Culture="Auto" UICulture="Auto"%>

<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Security.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<%@ Register Assembly="SmoothEnterprise.Flowwork, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Flowwork.Control" TagPrefix="SmoothEnterpriseControlFlowwork" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Flowwork, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Flowwork.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlFlowwork" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <script>
     function check(){
          //obj = document.getElementById("ctl00_ContentPlaceHolder1_List2");
         
          //strsel = obj.options[obj.selectedIndex].text;
          // alert(strsel);
          
          /* 2015/07/20 佩佩說要增加,當採購選擇其他就一定要輸入
          if(strsel=="其他"){
           if(document.getElementById("ctl00_ContentPlaceHolder1_InpPurDesc1").value.length<=0){
                 alert("當申請原因類別選擇其他,就應該輸入說明");
                 document.getElementById("ctl00_ContentPlaceHolder1_InpPurDesc1").focus();
             return false;
            }
   
         }
       
          */
          
         // 2015/07/31 佩佩又說不管怎樣就一定要輸入<很煩ㄝ,改來改去
          
         if(document.getElementById("ctl00_ContentPlaceHolder1_InpPurDesc1").value.length<=0){
                 alert("當申請原因類別選擇其他,就應該輸入說明");
                 document.getElementById("ctl00_ContentPlaceHolder1_InpPurDesc1").focus();
             return false;
         }      
        
        //alert(document.getElementById("ctl00_ContentPlaceHolder1_FIELD_pmca00").value);
        //alert(document.getElementById("ctl00_ContentPlaceHolder1_TexActi").value);
        //20151111 光棍節再加一個,就是若是有效變無效,就不需要輸入完因
        if((document.getElementById("ctl00_ContentPlaceHolder1_FIELD_pmca00").value=="V:生效否") &&
           (document.getElementById("ctl00_ContentPlaceHolder1_TexActi").value=="Y")){
            //若是有效變無效,就不需要輸入完因
           }else{
        if ((document.getElementById("ctl00_ContentPlaceHolder1_HidDay").value=="Y") && (document.getElementById("ctl00_ContentPlaceHolder1_InpPurDesc2").value.length<=0)){
                 alert("小於90天的付款原因為必填");
                 document.getElementById("ctl00_ContentPlaceHolder1_InpPurDesc2").focus();
             return false;
         } 
       }
        return true;
     }
 
 
 
 </script> 
  
  
  
  
  
    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server" Details="The desciption for this program"
		Caption="APMI610 Edit Page" Width="100%" CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px">
		<CaptionStyle Font-Bold="True" CssClass="Medium"></CaptionStyle>
		<DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray"></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>
    <table border="1" cellpadding="0" cellspacing="0" style="width: 884px">
        <tr>
            <td colspan="3" rowspan="3">
                <br />
                <br />
        <table>
        
           <tr>
            <td align="center" colspan="8">
                <asp:Image ID="img_icon" runat="server"  /> </td>
        </tr>
            <tr>
                <td align="center" colspan="8" style="height: 26px">
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="新細明體" Text="供應商代號申請單"></asp:Label></td>
            </tr>
            <tr>
                <td align="center" colspan="8">
                    <asp:Label ID="Label4" runat="server" CssClass="NormalBold" Height="25px"></asp:Label></td>
            </tr>
        
        <tr><td style="width: 65px; height: 25px;">
                <asp:Label ID="LABEL_pmca00" runat="server" CssClass="NormalBold" Text="類別"></asp:Label></td><td style="width: 184px">
                <SmoothEnterpriseWebControl:InputText id="FIELD_pmca00" runat="server" BackColor="White" CssClass="Normal" ErrorMessage="Please Input「類別」!!" MaxLength="10" BorderStyle="None" ReadOnly="True"  ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:InputText></td><td><asp:Label ID="LABEL_PlantID" runat="server" CssClass="NormalBold" Text="廠別"></asp:Label></td><td style="width: 105px"><SmoothEnterpriseWebControl:InputText id="FIELD_PlantID" runat="server" BackColor="White" CssClass="Normal" ErrorMessage="Please Input「PlantID」!!" MaxLength="15" BorderStyle="None" ReadOnly="True"  ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:InputText></td><td style="width: 78px"><asp:Label ID="LABEL_pmcano" runat="server" CssClass="NormalBold" Text="ERP單號"></asp:Label></td>
           <td style="width: 134px">
               <SmoothEnterpriseWebControl:InputText id="FIELD_pmcano" runat="server" BackColor="White" CssClass="Normal" ErrorMessage="Please Input「申請單號」!!" MaxLength="40" BorderStyle="None" ReadOnly="True"  ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                   <ErrorStyle BorderStyle="NotSet" CssClass="" />
               </SmoothEnterpriseWebControl:InputText></td>
           <td>
               <asp:Label ID="LABEL_pmcsn" runat="server" CssClass="NormalBold" Text="EIP單號"></asp:Label></td><td style="width: 5px"><SmoothEnterpriseWebControl:InputText id="FIELD_pmcsn" runat="server" BackColor="White" CssClass="Normal" ErrorMessage="Please Input「Pmcsn」!!" MaxLength="15" BorderStyle="None" ReadOnly="True"  ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
               <ErrorStyle BorderStyle="NotSet" CssClass="" />
           </SmoothEnterpriseWebControl:InputText></td></tr>
	   <tr><td style="width: 65px; height: 25px;"><asp:Label ID="LABEL_pmcaud15" runat="server" CssClass="NormalBold" Text="申請日期" Width="80px"></asp:Label></td><td style="width: 184px; height: 25px;"><SmoothEnterpriseWebControl:InputText id="FIELD_pmcaud15" runat="server" BackColor="White" CssClass="Normal" ErrorMessage="Please Input「申請日期」!!" MaxLength="10" BorderStyle="None" ReadOnly="True"  ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
           <ErrorStyle BorderStyle="NotSet" CssClass="" />
       </SmoothEnterpriseWebControl:InputText></td><td style="height: 25px"><asp:Label ID="LABEL_pmcauser" runat="server" CssClass="NormalBold" Text="資料所有者"></asp:Label></td><td style="width: 105px; height: 25px"><SmoothEnterpriseWebControl:InputText id="FIELD_pmcauser" runat="server" BackColor="White" CssClass="Normal" ErrorMessage="Please Input「資料所有者」!!" MaxLength="10" BorderStyle="None" ReadOnly="True"  ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
           <ErrorStyle BorderStyle="NotSet" CssClass="" />
       </SmoothEnterpriseWebControl:InputText></td><td style="width: 78px; height: 25px"><asp:Label ID="LABEL_pmcagrup" runat="server" CssClass="NormalBold" Text="資料所有部門" Width="108px"></asp:Label></td>
           <td style="width: 134px; height: 25px">
           <SmoothEnterpriseWebControl:InputText id="FIELD_pmcagrup" runat="server" BackColor="White" CssClass="Normal" ErrorMessage="Please Input「資料所有部門」!!" MaxLength="10" BorderStyle="None" ReadOnly="True"  ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
               <ErrorStyle BorderStyle="NotSet" CssClass="" />
           </SmoothEnterpriseWebControl:InputText></td>
           <td style="height: 25px">
               <asp:Label ID="Label11" runat="server" CssClass="NormalBold" Text="原有效碼"></asp:Label></td><td style="width: 5px; height: 25px;">
               <asp:Label ID="Labpmcaud01" runat="server" CssClass="NormalBold"></asp:Label></td></tr>
        <tr>
            <td colspan="8" style="height: 25px; background-color: #cac9de">
                <asp:Label ID="Label2" runat="server" CssClass="NormalBold" Text="廠商基本資料"></asp:Label></td>
        </tr>
        
        
         <tr>
            <td style="width: 65px; height: 25px">
                <asp:Label ID="LABEL_pmca24" runat="server" CssClass="NormalBold" Text="統一編號"></asp:Label></td>
            <td style="width: 184px; height: 16px">
                <SmoothEnterpriseWebControl:InputText id="FIELD_pmca24" runat="server" BackColor="White" CssClass="Normal" ErrorMessage="Please Input「統一編號」!!" MaxLength="20" BorderStyle="None" ReadOnly="True"  >
                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
            </SmoothEnterpriseWebControl:InputText></td>
            <td style="height: 16px">
                <asp:Label ID="LABEL_pmca03" runat="server" CssClass="NormalBold" Text="簡稱"></asp:Label></td>
            <td style="width: 105px; height: 16px">
                <SmoothEnterpriseWebControl:InputText id="FIELD_pmca03" runat="server" BackColor="White" CssClass="Normal" ErrorMessage="Please Input「簡稱」!!" MaxLength="30" BorderStyle="None" ReadOnly="True"  ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:InputText></td>
            <td style="width: 78px; height: 16px">
                <asp:Label ID="LABEL_pmca02" runat="server" CssClass="NormalBold" Text="廠商分類"></asp:Label></td>
            <td style="width: 134px; height: 16px">
                <SmoothEnterpriseWebControl:InputText id="FIELD_pmca02" runat="server" BackColor="White" CssClass="Normal" ErrorMessage="Please Input「廠商分類」!!" MaxLength="4" BorderStyle="None" ReadOnly="True"  ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:InputText></td>
            <td style="height: 16px">
                <asp:Label ID="LABEL_pmca14" runat="server" CssClass="NormalBold" Text="資料性質" Width="77px"></asp:Label></td>
            <td style="width: 5px; height: 16px">
                <SmoothEnterpriseWebControl:InputText id="FIELD_pmca14" runat="server" BackColor="White" CssClass="Normal" ErrorMessage="Please Input「資料性質」!!" MaxLength="20" BorderStyle="None" ReadOnly="True"  ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:InputText></td>
        </tr>
        
        
        
        <tr>
            <td style="width: 65px; height: 16px">
                <asp:Label ID="LABEL_pmca01" runat="server" CssClass="NormalBold" Text="供應廠商編號" Width="93px"></asp:Label></td>
            <td style="width: 184px; height: 16px">
                <SmoothEnterpriseWebControl:InputText id="FIELD_pmca01" runat="server" BackColor="White" CssClass="Normal" ErrorMessage="Please Input「供應廠商編號」!!" MaxLength="10" BorderStyle="None" ReadOnly="True"  ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:InputText></td>
            <td style="height: 16px">
                <asp:Label ID="LABEL_pmca30" runat="server" CssClass="NormalBold" Text="廠商性質"></asp:Label></td>
            <td style="width: 105px; height: 16px">
                <SmoothEnterpriseWebControl:InputText id="FIELD_pmca30" runat="server" BackColor="White" CssClass="Normal" ErrorMessage="Please Input「廠商性質」!!" MaxLength="30" BorderStyle="None" ReadOnly="True"  ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:InputText></td>
            <td style="width: 78px; height: 16px">
                <asp:Label ID="LABEL_pmca081" runat="server" CssClass="NormalBold" Text="全名"></asp:Label></td>
            <td colspan="2" style="height: 16px">
                <SmoothEnterpriseWebControl:InputText id="FIELD_pmca081" runat="server" BackColor="White" CssClass="Normal" ErrorMessage="Please Input「全名」!!" MaxLength="80" BorderStyle="None" ReadOnly="True" Width="269px"  >
                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                <ErrorStyle BorderStyle="NotSet" />
            </SmoothEnterpriseWebControl:InputText></td>
            <td style="width: 5px; height: 16px">
                <SmoothEnterpriseWebControl:InputText id="FIELD_pmca082" runat="server" BackColor="White" CssClass="Normal" ErrorMessage="Please Input「全名」!!" MaxLength="80" BorderStyle="None" ReadOnly="True"  >
                <ErrorStyle BorderStyle="NotSet" />
                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
            </SmoothEnterpriseWebControl:InputText></td>
        </tr>
            <tr>
                <td style="width: 65px; height: 16px">
                <asp:Label ID="LABEL_pmca04" runat="server" CssClass="NormalBold" Text="付款廠商編號" Width="106px"></asp:Label></td>
                <td style="width: 184px; height: 16px">
                <SmoothEnterpriseWebControl:InputText id="FIELD_pmca04" runat="server" BackColor="White" CssClass="Normal" ErrorMessage="Please Input「付款廠商編號」!!" MaxLength="10" BorderStyle="None" ReadOnly="True"  ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:InputText></td>
                <td style="height: 16px">
                <asp:Label ID="LABEL_pmca11" runat="server" CssClass="NormalBold" Text="傳真號碼" Width="73px"></asp:Label></td>
                <td style="width: 105px; height: 16px">
                <SmoothEnterpriseWebControl:InputText id="FIELD_pmca11" runat="server" BackColor="White" CssClass="Normal" ErrorMessage="Please Input「傳真號碼」!!" MaxLength="50" BorderStyle="None" ReadOnly="True"  ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:InputText></td>
                <td style="width: 78px; height: 16px">
                <asp:Label ID="LABEL_pmca10" runat="server" CssClass="NormalBold" Text="電話號碼" Width="81px"></asp:Label></td>
                <td style="width: 134px; height: 16px">
                <SmoothEnterpriseWebControl:InputText id="FIELD_pmca10" runat="server" BackColor="White" CssClass="Normal" ErrorMessage="Please Input「電話號碼」!!" MaxLength="50" BorderStyle="None" ReadOnly="True"  ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:InputText></td>
                <td style="height: 16px">
                    <asp:Label ID="Label10" runat="server" CssClass="NormalBold" Text="廠商類別" Width="72px"></asp:Label></td>
                <td style="width: 5px; height: 16px">
                    <SmoothEnterpriseWebControl:InputText ID="FIELD_ta_pmca40" runat="server" BackColor="White"
                        BorderStyle="None" CssClass="Normal" ErrorMessage="Please Input「電話號碼」!!" MaxLength="50"
                        ReadOnly="True">
                        <ErrorStyle BorderStyle="NotSet" />
                        <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                    </SmoothEnterpriseWebControl:InputText></td>
            </tr>
        <tr>
            <td style="width: 65px; height: 25px">
                <asp:Label ID="LABEL_pmca06" runat="server" CssClass="NormalBold" Text="區域代號"></asp:Label></td>
            <td style="width: 184px; height: 16px">
                <SmoothEnterpriseWebControl:InputText id="FIELD_gea02_0" runat="server" BackColor="White" CssClass="Normal" ErrorMessage="Please Input「區域」!!" MaxLength="20" BorderStyle="None" ReadOnly="True"  ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:InputText></td>
            <td style="height: 16px">
                <asp:Label ID="LABEL_pmca07" runat="server" CssClass="NormalBold" Text="國別代號" Width="74px"></asp:Label></td>
            <td style="width: 105px; height: 16px">
                <SmoothEnterpriseWebControl:InputText id="FIELD_geb02_1" runat="server" BackColor="White" CssClass="Normal" ErrorMessage="Please Input「國別」!!" MaxLength="20" BorderStyle="None" ReadOnly="True"  ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:InputText></td>
            <td style="width: 78px; height: 16px">
                <asp:Label ID="LABEL_pmca904" runat="server" CssClass="NormalBold" Text="郵遞區號 " Width="78px"></asp:Label></td>
            <td style="width: 134px; height: 16px">
                <SmoothEnterpriseWebControl:InputText id="FIELD_pmca904" runat="server" BackColor="White" CssClass="Normal" ErrorMessage="Please Input「郵遞區號 」!!" MaxLength="10" BorderStyle="None" ReadOnly="True"  ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:InputText></td>
            <td style="height: 16px">
                <asp:Label ID="Label8" runat="server" CssClass="NormalBold" Text="類別說明"></asp:Label></td>
            <td style="width: 5px; height: 16px">
                <SmoothEnterpriseWebControl:InputText ID="FIELD_ta_pmca41" runat="server" BackColor="White"
                    BorderStyle="None" CssClass="Normal" ErrorMessage="Please Input「電話號碼」!!" MaxLength="50"
                    ReadOnly="True">
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                </SmoothEnterpriseWebControl:InputText></td>
        </tr>
            <tr>
                <td style="width: 65px; height: 25px">
                </td>
                <td style="width: 184px; height: 16px">
                </td>
                <td style="height: 16px">
                </td>
                <td style="width: 105px; height: 16px">
                </td>
                <td style="width: 78px; height: 16px">
                </td>
                <td style="width: 134px; height: 16px">
                </td>
                <td style="height: 16px">
                    <asp:Label ID="Label12" runat="server" CssClass="NormalBold" Text="產業別"></asp:Label></td>
                <td style="width: 5px; height: 16px">
                    <SmoothEnterpriseWebControl:InputText ID="Inta_pmca42" runat="server" BackColor="White"
                    BorderStyle="None" CssClass="Normal" ErrorMessage="Please Input「電話號碼」!!" MaxLength="50"
                    ReadOnly="True">
                        <ErrorStyle BorderStyle="NotSet" />
                        <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                    </SmoothEnterpriseWebControl:InputText></td>
            </tr>
        <tr>
            <td style="width: 65px; height: 25px">
                <asp:Label ID="LABEL_pmca52" runat="server" CssClass="NormalBold" Text="辦公/聯絡地址" Width="98px"></asp:Label></td>
            <td style="height: 25px" colspan="6">
                <SmoothEnterpriseWebControl:InputText id="FIELD_pmca091" runat="server" BackColor="White" CssClass="Normal" ErrorMessage="Please Input「地址」!!" MaxLength="255" Width="647px" BorderStyle="None" ReadOnly="True"  ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:InputText></td>
            <td style="width: 5px; height: 25px">
               <asp:HiddenField ID="Repatt" runat="server" />
                </td>
        </tr>
            <tr>
                <td style="width: 65px; height: 25px">
                <asp:Label ID="LABEL_pmca091" runat="server" CssClass="NormalBold" Text="發票/登記地址" Width="111px"></asp:Label></td>
                <td colspan="6" style="height: 16px">
                <SmoothEnterpriseWebControl:InputText id="FIELD_pmca52" runat="server" BackColor="White" CssClass="Normal" ErrorMessage="Please Input「發票/折讓單地」!!" MaxLength="255" BorderStyle="None" ReadOnly="True" Width="647px"  ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:InputText></td>
                <td style="width: 5px; height: 16px">
                </td>
            </tr>
        <tr>
            <td colspan="8" style="height: 25px; background-color: #cac9de">
                <asp:Label ID="Label3" runat="server" CssClass="NormalBold" Text="交易資料"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 65px; height: 25px;">
                <asp:Label ID="LABEL_pmca17" runat="server" CssClass="NormalBold" Text="付款方式" Width="78px"></asp:Label></td>
            <td style="width: 184px">
                <SmoothEnterpriseWebControl:InputText id="FIELD_pmca17" runat="server" BackColor="White" CssClass="Normal" ErrorMessage="Please Input「付款方式」!!" MaxLength="10" BorderStyle="None" ReadOnly="True"  ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:InputText></td>
            <td>
                <asp:Label ID="LABEL_pmca22" runat="server" CssClass="NormalBold" Text="慣用幣別"></asp:Label></td>
            <td style="width: 105px">
                <SmoothEnterpriseWebControl:InputText id="FIELD_pmca22" runat="server" BackColor="White" CssClass="Normal" ErrorMessage="Please Input「採購幣別」!!" MaxLength="10" BorderStyle="None" ReadOnly="True"  ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:InputText></td>
            <td style="width: 78px">
                <asp:Label ID="LABEL_gec02_4" runat="server" CssClass="NormalBold" Text="慣用稅別" Width="63px"></asp:Label></td>
            <td style="width: 134px">
                <SmoothEnterpriseWebControl:InputText id="FIELD_gec02_4" runat="server" BackColor="White" CssClass="Normal" ErrorMessage="Please Input「稅別名稱」!!" MaxLength="20" BorderStyle="None" ReadOnly="True"  ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:InputText></td>
            <td>
            </td>
            <td style="width: 5px">
            </td>
        </tr>
        <tr>
            <td style="width: 65px; height: 25px;">
                </td>
            <td style="width: 184px"></td>
            <td>
                <asp:Label ID="LABEL_pmca911" runat="server" CssClass="NormalBold" Text="慣用語言" Width="89px"></asp:Label></td>
            <td style="width: 105px">
                <SmoothEnterpriseWebControl:InputText id="FIELD_pmca911" runat="server" BackColor="White" CssClass="Normal" ErrorMessage="Please Input「慣用語言別」!!" MaxLength="10" BorderStyle="None" ReadOnly="True"  ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:InputText></td>
            <td style="width: 78px">
                <asp:Label ID="LABEL_pmca49" runat="server" CssClass="NormalBold" Text="價格條件 " Width="87px"></asp:Label></td>
            <td colspan="3">
                <SmoothEnterpriseWebControl:InputText id="FIELD_oah02_5" runat="server" BackColor="White" CssClass="Normal" ErrorMessage="Please Input「慣用價格條件名稱 」!!" MaxLength="100" BorderStyle="None" ReadOnly="True" Width="289px"  ><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                </SmoothEnterpriseWebControl:InputText></td>
        </tr>
        <tr>
            <td style="height: 25px; background-color: #cac9de;" colspan="8">
                <asp:Label ID="Label6" runat="server" CssClass="NormalBold" ForeColor="Red" Text="採購人員作業"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 65px; height: 25px;">
                <asp:Label ID="LABEL_pmca23" runat="server" CssClass="NormalBold" Text="申請原因類別" Width="96px"></asp:Label></td>
            <td style="width: 184px; height: 25px;">
                <asp:DropDownList ID="List1" runat="server" CssClass="Normal" Width="136px">
                    <asp:ListItem Value="1">價格優勢</asp:ListItem>
                    <asp:ListItem Value="2">交期優勢</asp:ListItem>
                    <asp:ListItem Value="3">服務優勢</asp:ListItem>
                    <asp:ListItem Value="4">客戶指定</asp:ListItem>
                    <asp:ListItem Value="5">唯一供應商</asp:ListItem>
                    <asp:ListItem Value="X">其他</asp:ListItem>
                </asp:DropDownList><br />
                <asp:DropDownList ID="List2" runat="server" CssClass="Normal" Visible="False" Width="136px">
                    <asp:ListItem Value="1">銀行資料變更</asp:ListItem>
                    <asp:ListItem Value="2">付款條件變更</asp:ListItem>
                    <asp:ListItem Value="X">其他</asp:ListItem>
                </asp:DropDownList></td>
            <td style="height: 25px">
                <asp:Label ID="Label5" runat="server" CssClass="NormalBold" Text="說明"></asp:Label></td>
            <td colspan="4" style="height: 25px">
                <SmoothEnterpriseWebControl:InputText id="InpPurDesc1" runat="server" BackColor="White" CssClass="Normal" ErrorMessage="Please Input「統一編號」!!" MaxLength="150" Width="430px"  >
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                </SmoothEnterpriseWebControl:InputText></td>
            <td style="width: 5px; height: 25px;">
                </td>
        </tr>
            <tr>
            <td></td>
                <td colspan="2">
                    <asp:Label ID="Label7" runat="server" CssClass="NormalBold" Text="小於月結90天說明原因及每月交易金額"
                        Width="241px"></asp:Label></td>
                <td colspan="4" style="height: 25px">
                    <SmoothEnterpriseWebControl:InputText id="InpPurDesc2" runat="server" BackColor="White" CssClass="Normal" ErrorMessage="Please Input「統一編號」!!" MaxLength="150" Width="430px"  >
                        <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                    </SmoothEnterpriseWebControl:InputText></td>
                <td style="width: 5px; height: 25px">
                    <asp:HiddenField ID="HidDay" runat="server" />
                </td>
            </tr>
            <tr>
                <td style="width: 65px;" rowspan="2">
                    <asp:Label ID="Label45" runat="server" CssClass="NormalBold" Text="上傳檔案"></asp:Label></td>
                <td colspan="4">
                    <table style="width: 404px">
                        <tr>
                            <td>
                                <asp:FileUpload ID="FUP1" runat="server" CssClass="Normal" Width="350px" /></td>
                            <td>
                            </td>
                            <td style="width: 75px">
                            </td>
                        </tr>
                        <tr>
                            <td style="height: 25px">
                                <asp:FileUpload ID="FUP2" runat="server" CssClass="Normal" Width="350px" /></td>
                            <td style="height: 25px">
                            </td>
                            <td style="width: 75px; height: 25px;">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:FileUpload ID="FUP3" runat="server" CssClass="Normal" Width="350px" /></td>
                            <td>
                            </td>
                            <td style="width: 75px">
                            </td>
                        </tr>
                    </table>
                </td>
                <td colspan="3" valign="top">
                    <asp:Panel ID="Panel2" runat="server">
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td colspan="7">
                    <asp:Label ID="Label30" runat="server" CssClass="NormalBold" Text="檢附公司印鑑章(大小章)及發票章,匯款資料文件(銀行存摺影本)及公司變更登記"></asp:Label>
                    <asp:HiddenField ID="TexActi" runat="server" />
                </td>
            </tr>
            <tr>
                <td rowspan="1" style="width: 65px">
                    <asp:Label ID="Label9" runat="server" CssClass="NormalBold" Text="直屬主管"></asp:Label></td>
                <td colspan="7">
                    <SmoothEnterpriseWebControlEnterprise:PopupUser id="PopupUser1" runat="server" BackColor="#F0F0F0"
                        CssClass="Normal" DisplayField="name" FormatType="InputCombo" FormatValueField="logonid"
                        Gradient-GradientType="Top" ValueField="id">
                    </SmoothEnterpriseWebControlEnterprise:PopupUser></td>
            </tr>
	</table>
                <br />
            </td>
        </tr>
        <tr>
        </tr>
        <tr>
        </tr>
    </table>
    <br />
    <br />
    <table border="0" Class="Normal">
        <tr>
            <td>
                <SmoothEnterpriseControlFlowwork:FlowClient ID="FlowClient1" runat="server">
                </SmoothEnterpriseControlFlowwork:FlowClient>
                &nbsp;<SmoothEnterpriseWebControlFlowwork:FlowFeedbackViewer ID="FlowFeedbackViewer1"
                    runat="server" BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" CssClass="Normal"
                    Font-Size="11px" OnOnLoadHistory="FlowFeedbackViewer1_OnLoadHistory">
                    <Columns>
                        <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="No" Label="" />
                        <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="Node" Label="" />
                        <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="ReviewerPhoto"
                            Label="" />
                        <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="Reviewer" Label="" />
                        <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="Initdate" Label="" />
                        <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="Receivedate" Label="" />
                        <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="Reviewdate" Label="" />
                        <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="Result" Label="" />
                        <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="ResultIcon" Label="" />
                    </Columns>
                    <HistoryTemplate>
                        &nbsp;
                        <SmoothEnterpriseWebControl:InputText ID="S_Comment" runat="server" CssClass="Normal"
                            ForeColor="Red" Height="30px" Width="586px">
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                        </SmoothEnterpriseWebControl:InputText>
                        <asp:Image ID="Image1" runat="server" />&nbsp;
                        <asp:Image ID="Image2" runat="server" ImageUrl="~/gif/AppDeputy.png" />
                    </HistoryTemplate>
                </SmoothEnterpriseWebControlFlowwork:FlowFeedbackViewer>
            </td>
        </tr>
    </table>
	<table border="0" Class="Normal" style="width: 779px">
		<tr>
			<td style="height: 27px">
				<SmoothEnterpriseWebControl:InputButton ID="BUTTON_save" runat="server" Text="儲存" width="80px" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="BUTTON_save_Click" Height="25px"><Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" /></SmoothEnterpriseWebControl:InputButton>&nbsp;
                <SmoothEnterpriseWebControlFlowwork:SendRequestButton ID="BUTTON_SendRequest" runat="server"
                    BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px"
                    CssClass="normalbold" Flow="<%# FlowClient1 %>" Font-Bold="True" Font-Names="Arial"
                    Font-Size="12px" Gradient-GradientType="Bottom" Height="25px" OnClick="BUTTON_SendRequest_Click"
                    Text="送審" Width="80px" OnClientClick="return check()">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControlFlowwork:SendRequestButton>
                &nbsp;&nbsp;<SmoothEnterpriseWebControl:InputButton ID="ButStop" runat="server" BackColor="#C8C8C8"
                    BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold"
                    Font-Bold="True" Font-Names="Arial" Font-Size="12px" Height="25px" OnClick="ButStop_Click"
                    Text="中止" Width="80px">
                    <Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton>
                &nbsp;<SmoothEnterpriseWebControlFlowwork:RemindReviewerButton
                    ID="BUTTON_RemindReviewer" runat="server" BackColor="#C8C8C8" BorderColor="#606060"
                    BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" Font-Bold="True"
                    Font-Names="Arial" Font-Size="12px" Gradient-GradientType="Bottom" Height="25px"
                    Width="60px" Flow="<%# FlowClient1 %>" OnClick="BUTTON_RemindReviewer_Click">
                    <Gradient GradientBegin="" GradientEnd="" GradientType="Bottom" />
                </SmoothEnterpriseWebControlFlowwork:RemindReviewerButton>&nbsp;&nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp;&nbsp;<SmoothEnterpriseWebControl:InputButton ID="InputButton1" runat="server" Text="退回ERP" width="80px" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="InputButton1_Click" Height="25px">
                    <Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton>
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
				<SmoothEnterpriseWebControl:InputButton ID="BUTTON_back" runat="server" Text="回上頁" width="80px" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="BUTTON_back_Click" Height="25px"><Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" /></SmoothEnterpriseWebControl:InputButton>&nbsp;
			</td>
		</tr>
        <tr>
            <td style="height: 27px">
            </td>
        </tr>
        <tr>
            <td style="height: 27px">
            </td>
        </tr>
	</table>
</asp:Content>