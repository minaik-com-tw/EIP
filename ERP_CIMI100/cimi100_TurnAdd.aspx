<%@ Page Language="C#" MasterPageFile="~/_site/layout/Template.master" AutoEventWireup="true" CodeFile="cimi100_TurnAdd.aspx.cs" Inherits="ERP_CIMI100.cimi100_TurnAdd" StylesheetTheme="Default" Culture="Auto" UICulture="Auto"%>

<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>

<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Security.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<header>

 <script src="jquery.autocomplete.js" type="text/javascript"></script>
 <link href="jquery.autocomplete.css" rel="stylesheet" type="text/css" />
 
    
    <script type="text/javascript">
     $(function() {

        AutoClick();
        AutoClick2()
        turntext();
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(AutoClick);  //防止UpdatePanel jQuery失效 
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(AutoClick2);  //防止UpdatePanel jQuery失效 
        Sys.WebForms.PageRequestManＣＥＲager.getInstance().add_endRequest(turntext);  //防止UpdatePanel jQuery失效 
       
        document.getElementById("ctl00_ContentPlaceHolder1_Button_UpdateItem").style.display = "none" ;
       
        
       
    });
    
    
    
    function AutoClick(){

        
            $("#FIELD_PartNo").autocomplete("ACDataSrc.aspx",   
            {
                delay: 5,
                width: 500,
                minChars: 1, //至少輸入幾個字元才開始給提示?
                matchSubset: false,
                matchContains: false,
                cacheLength: 0,
                noCache: true, //黑暗版自訂參數，每次都重新連後端查詢(適用總資料筆數很多時)
                onItemSelect: findValue,
                onFindValue: findValue,
                 formatItem: function(row) {
                    return "<div style='height:12px'><div style='float:left'>" + row[0] +
                          "</div><div style='float:right;padding-right:5px;'>" + 
                           row[1] + "/" + row[2] + "</div></div>";
                },
                autoFill: false,
                mustMatch: true //是否允許輸入提示清單上沒有的值?
            });
            
            
            function findValue(li) { //cima01的formatItem的資料代入相關欄位
//            $("#FIELD_DWG").val('');//一開始先清空,以免再次輸入影響判斷
//                if (li == null) return alert("No match!");
//                if($("#FIELD_DWG").attr("value")=="")  //因cima01與txtSymblo皆使用findValue,故判斷
//                {
                  
                  $("#FIELD_DWG").val(li.extra[1]);
                  $("#FIELD_Component").val(li.extra[0]);
  
//                }
            }

        

    }
    
   
    
    function AutoClick2(){

        
            $("#Textc_imi031").autocomplete("ACDataSrc3.aspx",   
            {
                delay: 5,
                width: 500,
                minChars: 1, //至少輸入幾個字元才開始給提示?
                matchSubset: false,
                matchContains: false,
                cacheLength: 0,
                noCache: true, //黑暗版自訂參數，每次都重新連後端查詢(適用總資料筆數很多時)
                onItemSelect: findValues,
                onFindValue: findValues,
                 formatItem: function(row) {
                    return "<div style='height:12px'><div style='float:left'>" + row[0] +
                          "</div><div style='float:right;padding-right:5px;'>" + 
                           row[0] + "/" + row[1] + "</div></div>";
                },
                autoFill: false,
                mustMatch: true //是否允許輸入提示清單上沒有的值?
            });
            
            
            function findValues(li) { //cima01的formatItem的資料代入相關欄位
                 // alert(li.extra[1]);
                 // alert(li.extra[0]);
                 // $("#Textc_imi03").val(li.extra[1]);
                  $("#Textc_imi031").val(li.extra[0]);
  
 
            }

        

    }
    
    
   
    
    
    
     function onGridViewRowSelected(rowIdx,class_no) {   //當gridview選擇修改時  rowIdx-->選擇列
 
         var rownumber=parseInt(rowIdx)+1;
         var gdview = document.getElementById("<%=GridView1.ClientID %>");
         document.getElementById("ctl00_ContentPlaceHolder1_rember_item").value=gdview.rows(rownumber).cells(2).innerText 
         $('#FIELD_PartNo').val(gdview.rows(rownumber).cells(3).innerText);
         $('#FIELD_Component').val(gdview.rows(rownumber).cells(4).innerText);
         $('#FIELD_DWG').val(gdview.rows(rownumber).cells(5).innerText);
         document.getElementById("ctl00_ContentPlaceHolder1_Button_UpdateItem").style.display = "block" ;  //顯示UPDATE ITEM按鈕
     
         if(class_no=="2")  //類別為拋轉才顯示,變更不顯示
         {
             var plantid = document.getElementById( "ctl00_ContentPlaceHolder1_CheckBoxList2").getElementsByTagName("input"); //廠區
             var ele=document.getElementById("ctl00_ContentPlaceHolder1_CheckBoxList2").getElementsByTagName("input");
              
              for(var i=0;i<ele.length;i++) //先把checkboxlist2做清除
              {
                   ele[i].checked=false;  
              }

              var myString =gdview.rows(rownumber).cells(6).innerText  //把checkboxlist2塞回去
              var splits = myString.split(",");
              var CheckBoxList = document.getElementById('ctl00_ContentPlaceHolder1_CheckBoxList2');
              var CheckBoxs = CheckBoxList.getElementsByTagName('input');
              var Labels = CheckBoxList.getElementsByTagName('Label');

              for(var i2=0;i2<splits.length;i2++)
              {
                 for (var i = 0; i < CheckBoxs.length; i++) 
                 {
                 

                    if(splits[i2]==Labels[i].innerHTML)
                    {
                     
                        CheckBoxs[i].checked=true;
                    }
                   
                 }
              }
        }
       
 

    }
    
    function turntext()  //如果拋轉2的話,不能修改品名規格
    {
        //js 取參數---------------------------------------------------------------------------
        var url=window.location.toString(); //取得當前網址
        var str=""; //參數中等號左邊的值
        var str_value=""; //參數中等號右邊的值
        if(url.indexOf("?")!=-1){
            //如果網址有"?"符號
            var ary=url.split("?")[1].split("&");
            //取得"?"右邊網址後利用"&"分割字串存入ary陣列 ["a=1","b=2","c=3"]
            for(var i in ary){
                //取得陣列長度去跑迴圈，如:網址有三個參數，則會跑三次
                str=ary[i].split("=")[0];
                //取得參數"="左邊的值存入str變數中
                if (str == "class_no") {
                //若str等於想要抓取參數 如:b
                    str_value = decodeURI(ary[i].split("=")[1]);
                    //取得b等號右邊的值並經過中文轉碼後存入str_value
                }
            }
        }
        //-------------------------------------------------------------------------------------
        if(str_value=="2")
        {
             document.getElementById('FIELD_Component').disabled=true;
             document.getElementById('FIELD_dwg').disabled=true;
        
        }  
    }
     
    </script>
</header>



    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server" Details="The desciption for this program"
		Caption="cimi100 Add Page" Width="100%" CssClass="Normal" Gradient="None" Height="100px" PaddingSpace="5px" IconHeight="" IconWidth="" meta:resourcekey="ContentDescriptorResource1">
		<CaptionStyle Font-Bold="True" CssClass="Medium" BorderStyle="NotSet"></CaptionStyle>
		<DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray" BorderStyle="NotSet" CssClass=""></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>
    <table cellpadding="0" cellspacing="0" style="width: 800px; height: 70px; vertical-align: top;">
        <tr>
            <td align="center" colspan="2" style="width: 100%; height: 23px">
                &nbsp;<asp:Label ID="FIELD_companyname" runat="server" CssClass="NormalBold" Font-Size="Medium"
                    meta:resourcekey="FIELD_companynameResource1" Text="銘異集團料件系統" Width="500px"></asp:Label></td>
        </tr>
        <tr>
            <td align="center" colspan="2" style="width: 100%; height: 23px; text-align: center">
                <asp:Label ID="title" runat="server" CssClass="NormalBold" Font-Size="Medium" meta:resourcekey="Label2Resource1"
                    Text="料件拋轉/變更申請單." Width="500px"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 357px; height: 21px">
                </td>
            <td style="width: 800px; height: 21px; text-align: right">
                &nbsp;<asp:Label ID="Label4a" runat="server" CssClass="NormalBold" Font-Names="新細明體"
                    Font-Size="9pt" meta:resourcekey="Label4aResource1" Text="廠&nbsp; 區"></asp:Label>&nbsp;
                <asp:Label ID="FIELD_plantid" runat="server" Font-Bold="False" Font-Size="10pt" Text="mat"
                    Width="90px" ></asp:Label>&nbsp;
                <asp:Label ID="Label9" runat="server" CssClass="NormalBold" Font-Names="新細明體" Font-Size="9pt"
                    meta:resourcekey="Label9Resource1" Text=" &nbsp;申 &nbsp;請 &nbsp;人"></asp:Label>&nbsp;
                <asp:Label ID="FIELD_add_user" runat="server" Font-Bold="False" Font-Size="10pt"
                    Text="ann" Width="90px" meta:resourcekey="FIELD_add_userResource1"></asp:Label>
                &nbsp;
            </td>
        </tr>
        <tr style="font-size: 10pt; font-family: Times New Roman">
            <td align="right" colspan="2" style="width: 100%; height: 29px; text-align: right">
                <table border="1" bordercolor="silver" cellpadding="0" cellspacing="0" style="width: 788px;
                    border-collapse: collapse; height: auto">
                    <tr>
                        <td style="width: 83%; text-align: right">
                            <table style="width: 100%; height: 1px;">
                                <tr>
                                    <td colspan="4" style="height: 20px; background-color: slategray; text-align: center">
                                        &nbsp;<asp:Image ID="Image2" runat="server" Height="22px" ImageUrl="~/ERP_CXMT310/img/list.png"
                                            Width="23px" meta:resourcekey="Image2Resource1" />
                                        <asp:Label ID="Label292" runat="server" Font-Bold="True" Font-Names="新細明體" Font-Size="11pt"
                                            ForeColor="MintCream" meta:resourcekey="Label29Resource1" Text="申&nbsp;請&nbsp;內&nbsp;容"
                                            Width="82px"></asp:Label></td>
                                </tr>
                                <tr style="font-size: 10pt">
                                    <td id="table1_1" colspan="4" rowspan="6" style="text-align: left">
                                        <table style="width: 100%">
                                            <tr>
                                                <td colspan="2" style="height: autopx">
                                                    <asp:ScriptManager id="ScriptManager1" runat="server">
                                                    </asp:ScriptManager>
                                                    <asp:UpdatePanel id="UpdatePanel1" runat="server">
                                                        <ContentTemplate>
                                                                <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; height: auto">
                                                                    <tr>
                                                                        <td style="width: 4px; background-color: gainsboro; height: 24px;">
                                                                            <asp:Label ID="Label52" runat="server" Font-Bold="True" Font-Size="11pt"  meta:resourcekey="Label52Resource1" Text="料號"
                                                                                Width="90px"></asp:Label>
                                                                        </td>
                                                                        <td colspan="3" style="width: 795px; height: 24px;">
                                                                            &nbsp;
                                                                            <input id="FIELD_PartNo" autocomplete="off" name="FIELD_PartNo" style="width: 300px;
                                                                                background-color: #ffffcc" type="textbox" /></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="width: 4px; background-color: gainsboro">
                                                                            <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="11pt" Text="品名" meta:resourcekey="Label6Resource1"
                                                                                Width="90px"></asp:Label></td>
                                                                        <td colspan="3" style="width: 795px; height: 24px;">
                                                                            &nbsp;
                                                                            <input id="FIELD_Component" autocomplete="off" name="FIELD_Component"  style="width: 300px; 
                                                                                background-color: #ffffcc" type="textbox" /></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="width: 4px; background-color: gainsboro; height: 18px;">
                                                                            <asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Size="11pt" Text="規格" meta:resourcekey="Label7Resource1"
                                                                                Width="90px"></asp:Label></td>
                                                                        <td colspan="3" style="width: 795px; height: 18px;">
                                                                            &nbsp;
                                                                            <input id="FIELD_DWG" autocomplete="off" name="FIELD_DWG" style="width: 300px; background-color: #ffffcc"
                                                                                type="textbox" /></td>
                                                                    </tr>
                                                                    
                                                                     <tr>
                                                                    <td style="width: 4px; height: 18px; background-color: gainsboro">
                                                                        <asp:Label ID="LabelT1" runat="server" Font-Bold="True" Font-Size="11pt" meta:resourcekey="LabelT1Resource1"
                                                                            Text="客戶料號" Width="90px"></asp:Label></td>
                                                                    <td colspan="3" style="width: 795px; height: 18px">
                                                                        &nbsp;
                                                                        <input id="Textc_imi02" autocomplete="off" name="Textc_imi02" style="width: 300px; background-color: #ffffcc"
                                                                            type="textbox" /></td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="width: 4px; height: 18px; background-color: gainsboro">
                                                                        <asp:Label ID="LabelT2" runat="server" Font-Bold="True" Font-Size="11pt" meta:resourcekey="LabelT2Resource1"
                                                                            Text="版本" Width="90px"></asp:Label></td>
                                                                    <td colspan="3" style="width: 795px; height: 18px">
                                                                        &nbsp;
                                                                        <input id="Textc_imi021" autocomplete="off" name="Textc_imi021" style="width: 300px; background-color: #ffffcc"
                                                                            type="textbox" /></td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="width: 4px; height: 18px; background-color: gainsboro">
                                                                        <asp:Label ID="LabelT4" runat="server" Font-Bold="True" Font-Size="11pt" meta:resourcekey="LabelT4Resource1"
                                                                            Text="廠牌名稱" Width="90px"></asp:Label></td>
                                                                    <td colspan="3" style="width: 795px; height: 18px">
                                                                        &nbsp;
                                                                        <input id="Textc_imi031" autocomplete="off" name="Textc_imi031" style="width: 300px; background-color: #ffffcc"
                                                                            type="textbox" /></td>
                                                                </tr>
                                                                   <!-- <tr>
                                                                        <td style="width: 4px; height: 18px; background-color: gainsboro">
                                                                        <asp:Label ID="LabelT3" runat="server" Font-Bold="True" Font-Size="11pt" meta:resourcekey="LabelT3Resource1"
                                                                            Text="廠牌" Width="90px"></asp:Label></td>
                                                                        <td colspan="3" style="width: 795px; height: 18px">
                                                                            &nbsp;
                                                                        <input id="Textc_imi03" autocomplete="off" name="Textc_imi03" style="width: 300px; background-color: #ffffcc"
                                                                            type="textbox" /></td>
                                                                    </tr> !-->
                                                                <tr>
                                                                    <td style="width: 4px; height: 18px; background-color: gainsboro">
                                                                        </td>
                                                                    <td colspan="3" style="width: 795px; height: 18px">
                                                                        &nbsp;
                                                                        </td>
                                                                </tr>
                                                                    
                                                                    
                                                                    
                                                                    
                                                                    
                                                                    <tr>
                                                                        <td style="width: 4px; background-color: gainsboro">
                                                                            <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Size="11pt" Text="拋轉廠區" meta:resourcekey="Label8Resource1"
                                                                                Width="90px"></asp:Label></td>
                                                                        <td colspan="3" style="width: 795px">
                                                                            <asp:CheckBoxList ID="CheckBoxList2" name="CheckBoxList2" runat="server" Font-Size="9pt" RepeatColumns="10"
                                                                                RepeatDirection="Horizontal" meta:resourcekey="CheckBoxList2Resource1">
                                                                            </asp:CheckBoxList></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="width: 4px; background-color: gainsboro">
                                                                            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="11pt" Text="需求日期" meta:resourcekey="Label1Resource1"
                                                                                Width="90px" Visible="False"></asp:Label></td>
                                                                        <td colspan="3" style="width: 795px">
                                                                            <SmoothEnterpriseWebControl:InputText ID="FIELD_need_date" runat="server" BackColor="#F0F0F0"
                                                                                CssClass="Normal" ErrorMessage="Please Input「Need_date」!!" FormatType="Date" Visible="False" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" FocusColor="" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_need_dateResource1" OnClickMore="" Personalize="False" Required="False">
                                                                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                                                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                                                            </SmoothEnterpriseWebControl:InputText></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="width: 4px; background-color: gainsboro">
                                                                        </td>
                                                                        <td colspan="3" style="width: 795px">
                                                                            <input id="PK1" runat="server" type="hidden" /></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                        </td>
                                                                        <td colspan="3" style="width: 795px; text-align: right">
                                                                            <SmoothEnterpriseWebControl:InputButton ID="Button_AddItem" runat="server" BackColor="#C8C8C8"
                                                                                BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold"
                                                                                Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="Button_AddItem_Click"
                                                                                Text="Add Item." Width="80px" meta:resourcekey="Button_AddItemResource1" RunAtCient="False">
                                                                                <Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" />
                                                                            </SmoothEnterpriseWebControl:InputButton><SmoothEnterpriseWebControl:InputButton
                                                                                ID="Button_UpdateItem" runat="server" BackColor="#C8C8C8" BorderColor="#606060"
                                                                                BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" Font-Bold="True"
                                                                                Font-Names="Arial" Font-Size="12px" OnClick="Button_UpdateItem_Click" Text="Update Item."
                                                                                Width="80px" meta:resourcekey="Button_UpdateItemResource1" RunAtCient="False">
                                                                                <Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" />
                                                                            </SmoothEnterpriseWebControl:InputButton><input id="rember_item" runat="server" style="width: 83px"
                                                                                text="rember_item" type="hidden" /></td>
                                                                    </tr>
                                                                </table>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr style="font-family: Times New Roman">
                                </tr>
                                <tr style="font-family: Times New Roman">
                                </tr>
                                <tr style="font-family: Times New Roman">
                                </tr>
                                <tr style="font-family: Times New Roman">
                                </tr>
                                <tr style="font-family: Times New Roman">
                                </tr>
                            </table>
                            <asp:UpdatePanel id="UpdatePanel2" runat="server">
                                <ContentTemplate>
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" Font-Size="10pt"
                                ForeColor="#333333" GridLines="None" OnRowDataBound="GridView1_RowDataBound"
                                OnRowDeleting="GridView1_RowDeleting" Width="800px" DataKeyNames="item,elapsedticks" Height="1px" meta:resourcekey="GridView1Resource1">
                                <RowStyle BackColor="#E3EAEB" />
                                <Columns>

                                        <asp:CommandField ButtonType="Image" DeleteImageUrl="~/shipment/img/button_drop.png"
                                        ShowDeleteButton="True" meta:resourcekey="CommandFieldResource1" >
                                        <ItemStyle HorizontalAlign="Center"  />
                                    </asp:CommandField>
                                    <asp:TemplateField ShowHeader="False" meta:resourcekey="TemplateFieldResource1">
                            <ItemTemplate>
                                <asp:Image ID="Image3" runat="server" CausesValidation="false" CommandName="EditModel"
                                    ImageUrl="~/shipment/img/edit.gif" meta:resourcekey="Image3Resource1" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center"  />
                        </asp:TemplateField>
                                    <asp:BoundField DataField="elapsedticks" HeaderText="elapsedticks" SortExpression="elapsedticks" Visible="False" meta:resourcekey="BoundFieldResource1" >
                                         <HeaderStyle CssClass="hiddencol"  />
                                        <ItemStyle CssClass="hiddencol"  />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="item" HeaderText="項次" SortExpression="item" meta:resourcekey="itemResource1" />
                                    <asp:BoundField DataField="partno" HeaderText="料號" SortExpression="partno" meta:resourcekey="partnoResource1" />
                                    <asp:BoundField DataField="component" HeaderText="品名" SortExpression="component" meta:resourcekey="componentResource1" />
                                    <asp:BoundField DataField="dwg" HeaderText="規格" SortExpression="dwg" meta:resourcekey="dwgResource1" />
                                    <asp:BoundField DataField="turn_plantid" HeaderText="拋轉廠區" SortExpression="turn_plantid" meta:resourcekey="turn_plantidResource1" />
                                </Columns>
                                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <EditRowStyle BackColor="#7C6F57" />
                                <AlternatingRowStyle BackColor="White" />
                            </asp:GridView>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            &nbsp;&nbsp;
                           
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EIPAConnectionString %>" SelectCommand="SELECT elapsedticks,[item], [partno], [component], [dwg], [turn_plantid] FROM eipb.dbo.cimi100_turn" DeleteCommand="DELETE FROM eipb.dbo.cimi100_turn WHERE (item = @item) AND (elapsedTicks = @elapsedTicks)">
                                <DeleteParameters>
                                    <asp:Parameter Name="item" />
                                    <asp:Parameter Name="elapsedTicks" />
                                </DeleteParameters>
                               
                            </asp:SqlDataSource>
                             <div id="div1" runat="server">
                             <table style="width: 100%">
                    <tr>
                        <td colspan="4" style="height: 20px; background-color: slategray; text-align: center">
                            &nbsp;<asp:Image ID="Image1" runat="server" Height="22px" ImageUrl="~/ERP_CXMT310/img/list.png"
                                            Width="23px" meta:resourcekey="Image1Resource1" />
                            <asp:Label ID="Label29" runat="server" Font-Bold="True" Font-Names="新細明體" Font-Size="11pt"
                                ForeColor="MintCream" meta:resourcekey="Label29Resource1" Text="簽&nbsp;核&nbsp;相&nbsp;關"
                                Width="82px"></asp:Label></td>
                    </tr>
                </table>
                            <table border="0" cellpadding="0" cellspacing="0" style="width: 802px; height: 1px" >
                                <tr>
                                    <td style="width: 4px; background-color: gainsboro;">
                                        <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="11pt" Text="所屬文管" meta:resourcekey="Label5Resource1"
                                            Width="90px"></asp:Label>
                                    </td>
                                    <td colspan="3" style="width: 667px;">
                                        <SmoothEnterpriseWebControlEnterprise:PopupUser id="FIELD_DCC" runat="server" BackColor="#F0F0F0"
                                            CssClass="Normal" DisplayField="name" FormatType="InputCombo" FormatValueField="logonid"
                                            Gradient-GradientType="Top" ValueField="id" AuthType="" ButtonClick="True" ButtonIconUrl="" DateSeparator="Slash" DateType="YYYYMMDD" DisplayFieldHidden="False" ErrorMessage="" FocusColor="" HiddenMode="False" HTMLMode="Advance" IsValid="True" meta:resourcekey="FIELD_DCCResource1" OnClickMore="" Personalize="False" Required="False">
                                            <gradient gradientbegin="" gradientend="" gradienttype="Top"></gradient>
                                            <errorstyle borderstyle="NotSet" />
                                        </SmoothEnterpriseWebControlEnterprise:PopupUser></td>
                                </tr>
                            </table>
                            </div>
                        
                        </td>
                    </tr>
                </table>
                <br />
                <br />
                <table style="width: 100%">
                    <tr>
                        <td colspan="2">
                        </td>
                    </tr>
                </table>
                <br />
                <br />
                <br />
                <br />
            </td>
        </tr>
    </table>
	<table border="0" Class="Normal">
		<tr>
			<td>
				<SmoothEnterpriseWebControl:InputButton ID="BUTTON_save" runat="server" Text="儲存" meta:resourcekey="BUTTON_saveResource1" width="80px" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="BUTTON_save_Click" RunAtCient="False"><Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" /></SmoothEnterpriseWebControl:InputButton>&nbsp;
				&nbsp;<SmoothEnterpriseWebControl:InputButton ID="BUTTON_back" runat="server" Text="回上頁" meta:resourcekey="BUTTON_backResource1" width="80px" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="BUTTON_back_Click" RunAtCient="False"><Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" /></SmoothEnterpriseWebControl:InputButton>
			</td>
		</tr>
	</table>
</asp:Content>