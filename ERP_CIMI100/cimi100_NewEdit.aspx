<%@ Page Language="C#" MasterPageFile="~/_site/layout/Template.master" AutoEventWireup="true" CodeFile="cimi100_NewEdit.aspx.cs" Inherits="ERP_CIMI100.cimi100_NewEdit" StylesheetTheme="Default" Culture="Auto" UICulture="Auto"  EnableEventValidation="false"%>

<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Security.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>

<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="SmoothEnterprise.Flowwork, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Flowwork.Control" TagPrefix="SmoothEnterpriseControlFlowwork" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Flowwork, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Flowwork.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlFlowwork" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<head>

<script type="text/javascript" src="/PManagement/js/jquery.min.js"></script>
<script src="jquery.autocomplete.js" type="text/javascript"></script>
<link href="jquery.autocomplete.css" rel="stylesheet" type="text/css" />
<script language="javascript"  type="text/javascript" src="<%=ResolveClientUrl("~/sub.js")%>"></script>
    <style type="text/css">  
    .hiddencol   
    {
        display:none;
    }
    .viscol
    {
        display:block;
    }
    

   </style>
    <script language="javascript" type="text/javascript">
    $(function() {

        AutoClick();
        //turntext();
        //Sys.WebForms.PageRequestManager.getInstance().add_endRequest(AutoClick);  //防止UpdatePanel jQuery失效 
      
       divjs_2();
       document.getElementById("ctl00_ContentPlaceHolder1_w_all").style.display = 'none';
       document.getElementById("ctl00_ContentPlaceHolder1_w_all2").style.display = 'none';
       
    });
    
    
    
    function AutoClick(){
 
        
             $("#component").autocomplete("ACDataSrc2.aspx",   
            {
                extraParams: {PID:'component'},
                delay: 10,
                width: 500,
                minChars: 3, //至少輸入幾個字元才開始給提示?
                matchSubset: false,
                matchContains: false,
                cacheLength: 0,
                noCache: true, //黑暗版自訂參數，每次都重新連後端查詢(適用總資料筆數很多時)
                onItemSelect: findValuea,
                onFindValue: findValuea,
                 formatItem: function(row) {
                    return "<div style='height:12px'><div style='float:left'>" + row[1] +
                          "</div><div style='float:right;padding-right:5px;'>" + 
                           row[0] + "/" + row[2] + "</div></div>";
                },
                autoFill: false,
                mustMatch: false //是否允許輸入提示清單上沒有的值?
            });
            
            function findValuea(li) { 
                $("#component").val(li.extra[0]);
            }
            
//            $("#DWG").autocomplete("ACDataSrc2.aspx",   
//            {
//                extraParams: {PID:'DWG'},
//                delay: 10,
//                width: 500,
//                minChars: 3, //至少輸入幾個字元才開始給提示?
//                matchSubset: false,
//                matchContains: false,
//                cacheLength: 0,
//                noCache: true, //黑暗版自訂參數，每次都重新連後端查詢(適用總資料筆數很多時)
//                onItemSelect: findValueb,
//                onFindValue: findValueb,
//                 formatItem: function(row) {
//                    return "<div style='height:12px'><div style='float:left'>" + row[2] +
//                          "</div><div style='float:right;padding-right:5px;'>" + 
//                           row[0] + "/" + row[1] + "</div></div>";
//                },
//                autoFill: false,
//                mustMatch: false //是否允許輸入提示清單上沒有的值?
//            });
//             function findValueb(li) { 
//                $("#DWG").val(li.extra[1]);
//            }
            
            $("#f_partno").autocomplete("ACDataSrc2.aspx",   
            {
                extraParams: {PID:'f_partno'},
                delay: 10,
                width: 500,
                minChars: 1, //至少輸入幾個字元才開始給提示?
                matchSubset: false,
                matchContains: false,
                cacheLength: 0,
                noCache: true, //黑暗版自訂參數，每次都重新連後端查詢(適用總資料筆數很多時)
                onItemSelect: findValuex,
                onFindValue: findValuex,
                 formatItem: function(row) {
                    return "<div style='height:12px'><div style='float:left'>" + row[0] +
                          "</div><div style='float:right;padding-right:5px;'>" + 
                           row[1] + "/" + row[2]  + "</div></div>";
                },
                autoFill: false,
                mustMatch: false //是否允許輸入提示清單上沒有的值?
            });
            
            
            function findValuex(li) { 
               if (li == null) return alert("No match!"); 
                $("#f_component").val(li.extra[0]);
                $("#f_dwg").val(li.extra[1]);
            }
            
            
             autoauto('cate3','cate3_2','cate3',false);
            autoauto('Homemade_code','Homemade_code2','Homemade_code',true);
            autoauto('Customers_class','Customers_class2','Customers_class',true);
            autoauto('Model_class','Model_class2','Model_class',true);
            autoauto('A7','A7_2','Parts_Class',true);
            autoauto('G3','G3_2','Parts_Class',true);
            autoauto('S3','S3_2','Parts_Class',true);
            autoauto('AA7','AA7_2','Parts_Class',true);
            
            autoauto('TextFacSn','TextFacSn2','FacSn',true);
        

    }
    
    
    function autoauto(a1,b1,c1,d1)  //欄位名1,欄位名2,抓取的資料key
    {
        $("#"+a1).autocomplete("ACDataSrc_Complex.aspx",   
                {
                    extraParams: {PID:c1},
                    delay: 10,
                    width: 500,
                    minChars: 1, //至少輸入幾個字元才開始給提示?
                    matchSubset: false,
                    matchContains: false,
                    cacheLength: 0,
                    noCache: true, //黑暗版自訂參數，每次都重新連後端查詢(適用總資料筆數很多時)
                    onItemSelect: findValuea,
                    onFindValue: findValuea,
                     formatItem: function(row) {
                        return "<div style='height:12px'><div style='float:left'>" + row[0] +                            
                                "</div><div style='float:right;padding-right:5px;'>" +
                                row[1] + "/" + row[2] + "</div></div>";     
                    },
                    autoFill: false,
                    mustMatch: d1 //是否允許輸入提示清單上沒有的值?
                });
                
                
                function findValuea(li) { 
                   if (li == null) return alert("No match!"); 
                    $("#"+b1).val(li.extra[1]);
                }
    
    }
    
    //附檔檔案
     var allowed_attachments = 5 - 1;
	  var count_attachments = 0 + 1;
	  function addfile()
     {
	  
	    if (allowed_attachments <= 0)
	    {
	        return false;
	    }
	    else
	    {		    
	        count_attachments = count_attachments + 1 ;
	        var attid = "attach"+count_attachments;
            str = '<SmoothEnterpriseWebControl:InputFile runat="server" onchange="addfile()" BackColor="#F0F0F0" CssClass="Normal"> <Gradient GradientBegin="" GradientEnd="" GradientType="Top" /></SmoothEnterpriseWebControl:InputFile><br />';
           document.getElementById('uploadfiles').insertAdjacentHTML("beforeEnd",str)
            allowed_attachments = allowed_attachments - 1;
            return false;
        }    
     }
     
     
     function Getlength(strName)
     {
          var $spans = $('span[name="'+ strName +'"]');	
          var nowlength = $spans.length + 1;
          return nowlength;
         }
         
        function jsSelectIsExitItem(objSelect, objItemValue) {        
        var isExit = false;        
        for (var i = 0; i < objSelect.options.length; i++) {        
            if (objSelect.options[i].value == objItemValue) {        
                isExit = true;        
                break;        
            }        
        }        
        return isExit;        
     }         
   
       
    function jsAddItemToSelect(objSelect, objItemText, objItemValue) {        
             
        if (jsSelectIsExitItem(objSelect, objItemValue)) {        
            //alert("该Item的Value值已经存在"+objItemValue);        
        } else {        
            var varItem = new Option(objItemText, objItemValue);      
            objSelect.options.add(varItem);     
            //alert("成功加入");   
            
        }   
         objSelect.options.value=objItemValue;     
    }      
         
     
     function onGridViewRowSelected(rowIdx) {   //當gridview選擇修改時  rowIdx-->選擇列
     
         document.getElementById("ctl00_ContentPlaceHolder1_w_all").style.display = 'block';
         document.getElementById("ctl00_ContentPlaceHolder1_w_all2").style.display = 'block';

         var rownumber=parseInt(rowIdx)+1;
         var gdview = document.getElementById("<%=GridView1.ClientID %>");
         
         
         //全部隱形div  該項顯示-----------------------------------------------------------------
//         for (i=1;i<=29;i++) 
//         {
//           document.getElementById("ctl00_ContentPlaceHolder1_ww"+i).style.display = 'none';
//         }
//         
//         var coding=parseInt(gdview.rows(rownumber).cells(29).innerText);
//         document.getElementById("ctl00_ContentPlaceHolder1_ww"+coding).style.display = 'block';
         //---------------------------------------------------------------------------------------
         
////          jsAddItemToSelect(document.getElementById("ctl00_ContentPlaceHolder1_FIELD_Group"),gdview.rows(rownumber).cells(6).innerText+":"+gdview.rows(rownumber).cells(221).innerText,gdview.rows(rownumber).cells(6).innerText);
////          jsAddItemToSelect(document.getElementById("ctl00_ContentPlaceHolder1_FIELD_Group2"),gdview.rows(rownumber).cells(34).innerText+":"+gdview.rows(rownumber).cells(222).innerText,gdview.rows(rownumber).cells(34).innerText);
////          jsAddItemToSelect(document.getElementById("ctl00_ContentPlaceHolder1_FIELD_Coding_Class"),gdview.rows(rownumber).cells(29).innerText+":"+gdview.rows(rownumber).cells(223).innerText,gdview.rows(rownumber).cells(29).innerText);

         document.getElementById("ctl00_ContentPlaceHolder1_rember_item").value=gdview.rows(rownumber).cells(4).innerText.trim() 
//         //document.getElementById("ctl00_ContentPlaceHolder1_FIELD_Group").value=gdview.rows(rownumber).cells(6).innerText; 
//        // document.getElementById("ctl00_ContentPlaceHolder1_FIELD_product_class").value=gdview.rows(rownumber).cells(7).innerText; 
         document.getElementById("ctl00_ContentPlaceHolder1_FIELD_cate1").value=gdview.rows(rownumber).cells(8).innerText.trim(); 
         document.getElementById("ctl00_ContentPlaceHolder1_FIELD_cate2").value=gdview.rows(rownumber).cells(9).innerText.trim(); 
         $('#cate3').val(gdview.rows(rownumber).cells(10).innerText.trim());
         $('#cate3_2').val(gdview.rows(rownumber).cells(11).innerText.trim());

         document.getElementById("ctl00_ContentPlaceHolder1_FIELD_idel").value=gdview.rows(rownumber).cells(12).innerText.trim(); 
          var myString =gdview.rows(rownumber).cells(13).innerText.trim()  //把checkboxlist2塞回去
          var splits = myString.split(",");
          var CheckBoxList = document.getElementById('ctl00_ContentPlaceHolder1_p_plantid');
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
           $('#partno').val(gdview.rows(rownumber).cells(14).innerText.trim());
           $('#component').val(gdview.rows(rownumber).cells(15).innerText.trim());
           $('#DWG').val(gdview.rows(rownumber).cells(16).innerText.trim());
           $('#f_partno').val(gdview.rows(rownumber).cells(17).innerText.trim());
           $('#f_component').val(gdview.rows(rownumber).cells(18).innerText.trim());
           $('#f_dwg').val(gdview.rows(rownumber).cells(19).innerText.trim());
            document.getElementById("ctl00_ContentPlaceHolder1_FIELD_unit").value=gdview.rows(rownumber).cells(20).innerText.trim(); 
            if(gdview.rows(rownumber).cells(21).innerText=="Y")  document.getElementById("ctl00_ContentPlaceHolder1_FIELD_HSF").checked=true;
            document.getElementById("ctl00_ContentPlaceHolder1_FIELD_source_code").value=gdview.rows(rownumber).cells(22).innerText.trim(); 
            $('#Homemade_code').val(gdview.rows(rownumber).cells(23).innerText.trim());
            $('#Homemade_code2').val(gdview.rows(rownumber).cells(24).innerText.trim());
//            $('#Technology_code').val(gdview.rows(rownumber).cells(25).innerText);
//            $('#Technology_code2').val(gdview.rows(rownumber).cells(26).innerText);
            if(gdview.rows(rownumber).cells(27).innerText=="Y")  document.getElementById("ctl00_ContentPlaceHolder1_FIELD_IQC").checked=true;
            
            //document.getElementById("ctl00_ContentPlaceHolder1_FIELD_coding_class").value=gdview.rows(rownumber).cells(29).innerText;
            $('#Customers_class').val(gdview.rows(rownumber).cells(30).innerText.trim());
            $('#Customers_class2').val(gdview.rows(rownumber).cells(31).innerText.trim());
            $('#Model_class').val(gdview.rows(rownumber).cells(32).innerText.trim());
            $('#Model_class2').val(gdview.rows(rownumber).cells(33).innerText.trim());
            //document.getElementById("ctl00_ContentPlaceHolder1_FIELD_Group2").value=gdview.rows(rownumber).cells(34).innerText;
            
            $('#A7').val(gdview.rows(rownumber).cells(43).innerText.trim());
            $('#A7_2').val(gdview.rows(rownumber).cells(44).innerText.trim());
            document.getElementById("ctl00_ContentPlaceHolder1_A8").value=gdview.rows(rownumber).cells(45).innerText.trim(); 
            document.getElementById("ctl00_ContentPlaceHolder1_A9").value=gdview.rows(rownumber).cells(46).innerText.trim(); 
            
            document.getElementById("ctl00_ContentPlaceHolder1_B2").value=gdview.rows(rownumber).cells(48).innerText.trim(); 
            document.getElementById("ctl00_ContentPlaceHolder1_B4").value=gdview.rows(rownumber).cells(50).innerText.trim(); 
            
            document.getElementById("ctl00_ContentPlaceHolder1_C2").value=gdview.rows(rownumber).cells(53).innerText.trim(); 
            
            document.getElementById("ctl00_ContentPlaceHolder1_D2").value=gdview.rows(rownumber).cells(56).innerText.trim(); 
            
            document.getElementById("ctl00_ContentPlaceHolder1_E5").value=gdview.rows(rownumber).cells(63).innerText.trim(); 
            
            document.getElementById("ctl00_ContentPlaceHolder1_F4").value=gdview.rows(rownumber).cells(69).innerText.trim(); 
            document.getElementById("ctl00_ContentPlaceHolder1_F5").value=gdview.rows(rownumber).cells(70).innerText.trim();
            
            $('#G3').val(gdview.rows(rownumber).cells(74).innerText.trim());
            $('#G3_2').val(gdview.rows(rownumber).cells(75).innerText.trim());
            document.getElementById("ctl00_ContentPlaceHolder1_G4").value=gdview.rows(rownumber).cells(76).innerText.trim(); 
            document.getElementById("ctl00_ContentPlaceHolder1_G5").value=gdview.rows(rownumber).cells(77).innerText.trim(); 
            document.getElementById("ctl00_ContentPlaceHolder1_G6").value=gdview.rows(rownumber).cells(78).innerText.trim();  
            
            document.getElementById("ctl00_ContentPlaceHolder1_H2").value=gdview.rows(rownumber).cells(80).innerText.trim();
            
            document.getElementById("ctl00_ContentPlaceHolder1_I5").value=gdview.rows(rownumber).cells(85).innerText.trim(); 
            document.getElementById("ctl00_ContentPlaceHolder1_I7").value=gdview.rows(rownumber).cells(87).innerText.trim(); 
            
            document.getElementById("ctl00_ContentPlaceHolder1_J3").value=gdview.rows(rownumber).cells(91).innerText.trim(); 
            document.getElementById("ctl00_ContentPlaceHolder1_J5").value=gdview.rows(rownumber).cells(93).innerText.trim(); 
            document.getElementById("ctl00_ContentPlaceHolder1_J6").value=gdview.rows(rownumber).cells(94).innerText.trim();  
            
            document.getElementById("ctl00_ContentPlaceHolder1_K4").value=gdview.rows(rownumber).cells(98).innerText.trim(); 
            document.getElementById("ctl00_ContentPlaceHolder1_K7").value=gdview.rows(rownumber).cells(101).innerText.trim(); 
            
            document.getElementById("ctl00_ContentPlaceHolder1_L3").value=gdview.rows(rownumber).cells(104).innerText.trim(); 
            document.getElementById("ctl00_ContentPlaceHolder1_L4").value=gdview.rows(rownumber).cells(105).innerText.trim(); 
            document.getElementById("ctl00_ContentPlaceHolder1_L5").value=gdview.rows(rownumber).cells(106).innerText.trim();  
            document.getElementById("ctl00_ContentPlaceHolder1_L6").value=gdview.rows(rownumber).cells(107).innerText.trim(); 
            document.getElementById("ctl00_ContentPlaceHolder1_L7").value=gdview.rows(rownumber).cells(108).innerText.trim(); 
            
            document.getElementById("ctl00_ContentPlaceHolder1_M3").value=gdview.rows(rownumber).cells(111).innerText.trim(); 
            document.getElementById("ctl00_ContentPlaceHolder1_M5").value=gdview.rows(rownumber).cells(113).innerText.trim();  
            document.getElementById("ctl00_ContentPlaceHolder1_M6").value=gdview.rows(rownumber).cells(114).innerText.trim(); 
            document.getElementById("ctl00_ContentPlaceHolder1_M7").value=gdview.rows(rownumber).cells(115).innerText.trim(); 
            document.getElementById("ctl00_ContentPlaceHolder1_M8").value=gdview.rows(rownumber).cells(116).innerText.trim(); 
            
            document.getElementById("ctl00_ContentPlaceHolder1_N3").value=gdview.rows(rownumber).cells(119).innerText.trim(); 
            document.getElementById("ctl00_ContentPlaceHolder1_N4").value=gdview.rows(rownumber).cells(120).innerText.trim();  
            document.getElementById("ctl00_ContentPlaceHolder1_N5").value=gdview.rows(rownumber).cells(121).innerText.trim(); 
            document.getElementById("ctl00_ContentPlaceHolder1_N6").value=gdview.rows(rownumber).cells(122).innerText.trim(); 
            document.getElementById("ctl00_ContentPlaceHolder1_N7").value=gdview.rows(rownumber).cells(123).innerText.trim(); 
            document.getElementById("ctl00_ContentPlaceHolder1_N8").value=gdview.rows(rownumber).cells(124).innerText.trim();
            
            document.getElementById("ctl00_ContentPlaceHolder1_O3").value=gdview.rows(rownumber).cells(127).innerText.trim(); 
            document.getElementById("ctl00_ContentPlaceHolder1_O5").value=gdview.rows(rownumber).cells(129).innerText.trim();
            
            document.getElementById("ctl00_ContentPlaceHolder1_P3").value=gdview.rows(rownumber).cells(133).innerText.trim(); 
            document.getElementById("ctl00_ContentPlaceHolder1_P5").value=gdview.rows(rownumber).cells(135).innerText.trim(); 
            document.getElementById("ctl00_ContentPlaceHolder1_P6").value=gdview.rows(rownumber).cells(136).innerText.trim(); 
            
//            document.getElementById("ctl00_ContentPlaceHolder1_Q2").value=gdview.rows(rownumber).cells(139).innerText.trim(); 
//            document.getElementById("ctl00_ContentPlaceHolder1_Q3").value=gdview.rows(rownumber).cells(140).innerText.trim();  
//            document.getElementById("ctl00_ContentPlaceHolder1_Q4").value=gdview.rows(rownumber).cells(141).innerText.trim(); 
            document.getElementById("ctl00_ContentPlaceHolder1_Q5").value=gdview.rows(rownumber).cells(142).innerText.trim(); 
            document.getElementById("ctl00_ContentPlaceHolder1_Q6").value=gdview.rows(rownumber).cells(143).innerText.trim(); 
            
            document.getElementById("ctl00_ContentPlaceHolder1_R4").value=gdview.rows(rownumber).cells(151).innerText.trim();
            document.getElementById("ctl00_ContentPlaceHolder1_R5").value=gdview.rows(rownumber).cells(152).innerText.trim();
            
            $('#S3').val(gdview.rows(rownumber).cells(156).innerText.trim());
            $('#S3_2').val(gdview.rows(rownumber).cells(157).innerText.trim());
            document.getElementById("ctl00_ContentPlaceHolder1_S5").value=gdview.rows(rownumber).cells(159).innerText.trim(); 
            document.getElementById("ctl00_ContentPlaceHolder1_S6").value=gdview.rows(rownumber).cells(160).innerText.trim(); 
            
            document.getElementById("ctl00_ContentPlaceHolder1_T4").value=gdview.rows(rownumber).cells(166).innerText.trim(); 
            document.getElementById("ctl00_ContentPlaceHolder1_T5").value=gdview.rows(rownumber).cells(167).innerText.trim(); 
            
            document.getElementById("ctl00_ContentPlaceHolder1_U3").value=gdview.rows(rownumber).cells(171).innerText.trim(); 
            
            document.getElementById("ctl00_ContentPlaceHolder1_V4").value=gdview.rows(rownumber).cells(177).innerText.trim(); 
            document.getElementById("ctl00_ContentPlaceHolder1_V5").value=gdview.rows(rownumber).cells(178).innerText.trim(); 
            
            document.getElementById("ctl00_ContentPlaceHolder1_W2").value=gdview.rows(rownumber).cells(180).innerText.trim(); 
            
            document.getElementById("ctl00_ContentPlaceHolder1_X3").value=gdview.rows(rownumber).cells(183).innerText.trim(); 
            document.getElementById("ctl00_ContentPlaceHolder1_X4").value=gdview.rows(rownumber).cells(184).innerText.trim();  
            document.getElementById("ctl00_ContentPlaceHolder1_X5").value=gdview.rows(rownumber).cells(185).innerText.trim(); 
            document.getElementById("ctl00_ContentPlaceHolder1_X6").value=gdview.rows(rownumber).cells(186).innerText.trim(); 
            document.getElementById("ctl00_ContentPlaceHolder1_X7").value=gdview.rows(rownumber).cells(187).innerText.trim(); 

            document.getElementById("ctl00_ContentPlaceHolder1_Y3").value=gdview.rows(rownumber).cells(191).innerText.trim(); 
            document.getElementById("ctl00_ContentPlaceHolder1_Y5").value=gdview.rows(rownumber).cells(193).innerText.trim();  
            document.getElementById("ctl00_ContentPlaceHolder1_Y6").value=gdview.rows(rownumber).cells(194).innerText.trim(); 
            document.getElementById("ctl00_ContentPlaceHolder1_Y7").value=gdview.rows(rownumber).cells(195).innerText.trim(); 
            document.getElementById("ctl00_ContentPlaceHolder1_Y8").value=gdview.rows(rownumber).cells(196).innerText.trim();
 
            document.getElementById("ctl00_ContentPlaceHolder1_Z3").value=gdview.rows(rownumber).cells(200).innerText.trim(); 
            document.getElementById("ctl00_ContentPlaceHolder1_Z4").value=gdview.rows(rownumber).cells(201).innerText.trim();  
            document.getElementById("ctl00_ContentPlaceHolder1_Z5").value=gdview.rows(rownumber).cells(202).innerText.trim(); 
            document.getElementById("ctl00_ContentPlaceHolder1_Z6").value=gdview.rows(rownumber).cells(203).innerText.trim(); 
            document.getElementById("ctl00_ContentPlaceHolder1_Z7").value=gdview.rows(rownumber).cells(204).innerText.trim();
            document.getElementById("ctl00_ContentPlaceHolder1_Z8").value=gdview.rows(rownumber).cells(205).innerText.trim();

            $('#AA7').val(gdview.rows(rownumber).cells(215).innerText.trim());
            $('#AA7_2').val(gdview.rows(rownumber).cells(216).innerText.trim());
            document.getElementById("ctl00_ContentPlaceHolder1_AA8").value=gdview.rows(rownumber).cells(217).innerText.trim(); 
            document.getElementById("ctl00_ContentPlaceHolder1_AA9").value=gdview.rows(rownumber).cells(218).innerText.trim(); 
            document.getElementById("ctl00_ContentPlaceHolder1_AA10").value=gdview.rows(rownumber).cells(219).innerText.trim();
            
            document.getElementById("ctl00_ContentPlaceHolder1_FIELD_remark").value=gdview.rows(rownumber).cells(224).innerText.trim();

            document.getElementById("ctl00_ContentPlaceHolder1_AB6").value=gdview.rows(rownumber).cells(230).innerText.trim(); 
            
            document.getElementById("ctl00_ContentPlaceHolder1_AC2").value=gdview.rows(rownumber).cells(234).innerText.trim(); 
            document.getElementById("ctl00_ContentPlaceHolder1_AC4").value=gdview.rows(rownumber).cells(236).innerText.trim(); 
            document.getElementById("ctl00_ContentPlaceHolder1_AC6").value=gdview.rows(rownumber).cells(238).innerText.trim(); 
            document.getElementById("ctl00_ContentPlaceHolder1_AC7").value=gdview.rows(rownumber).cells(239).innerText.trim(); 
            
            
            document.getElementById("ctl00_ContentPlaceHolder1_AD3").value=gdview.rows(rownumber).cells(242).innerText.trim(); 
            document.getElementById("ctl00_ContentPlaceHolder1_AD5").value=gdview.rows(rownumber).cells(244).innerText.trim();  
            document.getElementById("ctl00_ContentPlaceHolder1_AD6").value=gdview.rows(rownumber).cells(245).innerText.trim(); 
            document.getElementById("ctl00_ContentPlaceHolder1_AD7").value=gdview.rows(rownumber).cells(246).innerText.trim(); 
            document.getElementById("ctl00_ContentPlaceHolder1_AD8").value=gdview.rows(rownumber).cells(247).innerText.trim();
     
     
            $('#TextCusSn').val(gdview.rows(rownumber).cells(248).innerText.trim());
            $('#TextCusVer').val(gdview.rows(rownumber).cells(249).innerText.trim());
            $('#TextFacSn').val(gdview.rows(rownumber).cells(250).innerText.trim());
            $('#TextFacSn2').val(gdview.rows(rownumber).cells(251).innerText.trim());

     }
           
     function divjs(a)
     {
     
        //全部隱形div  該項顯示-----------------------------------------------------------------
         for (i=1;i<=30;i++) 
         {
           document.getElementById("ctl00_ContentPlaceHolder1_ww"+i).style.display = 'none';
         }
         
         var coding=a;
         document.getElementById("ctl00_ContentPlaceHolder1_ww"+coding).style.display = 'block';
         //---------------------------------------------------------------------------------------

      }
     
     function divjs_2()
      {
      
         for (i=1;i<=30;i++) 
         {
           document.getElementById("ctl00_ContentPlaceHolder1_ww"+i).style.display = 'none';
         }
      }
     
    </script>





</head>
    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server" Details="The desciption for this program"
		Caption="cimi100_New Edit Page" Width="100%" CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px">
		<CaptionStyle Font-Bold="True" CssClass="Medium"></CaptionStyle>
		<DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray"></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>
	<table cellpadding="0" cellspacing="0" style="vertical-align: top; width: 1285px;
        height: 70px">
        <tr>
            <td align="center" colspan="2" style="width: 100%; height: 23px">
                &nbsp;<asp:Label ID="FIELD_companyname" runat="server" CssClass="NormalBold" Font-Size="Medium"
                    meta:resourcekey="Label1Resource1a" Text="銘異集團料件系統" Width="500px"></asp:Label></td>
        </tr>
        <tr>
            <td align="center" colspan="2" style="width: 100%; height: 23px; text-align: center">
                <asp:Label ID="title" runat="server" CssClass="NormalBold" Font-Size="Medium" meta:resourcekey="Label2Resource1"
                    Text="料件申請單" Width="500px"></asp:Label></td>
        </tr>
        <tr>
           <td style="width: 357px; height: 21px">
                <asp:Label ID="NOTEXT" runat="server" CssClass="NormalBold" Font-Names="新細明體" Font-Size="9pt"
                    meta:resourcekey="Label34Resource2" Text="單&nbsp; 號"></asp:Label><asp:Label ID="FIELD_NO"
                        runat="server" Font-Bold="False" Font-Size="10pt" ForeColor="Red" Text="123"
                        Width="140px"></asp:Label></td>
            <td style="width: 1285px; height: 21px; text-align: right">
                &nbsp;<asp:Label ID="Label4a" runat="server" CssClass="NormalBold" Font-Names="新細明體"
                    Font-Size="9pt" meta:resourcekey="Label34Resource3" Text="廠&nbsp; 區"></asp:Label>&nbsp;
                <asp:Label ID="FIELD_plantid" runat="server" Font-Bold="False" Font-Size="10pt" Text="mat"
                    Width="90px"></asp:Label>&nbsp;
                <asp:Label ID="Label9" runat="server" CssClass="NormalBold" Font-Names="新細明體" Font-Size="9pt"
                    meta:resourcekey="Label34Resource4" Text=" &nbsp;申 &nbsp;請 &nbsp;人"></asp:Label>&nbsp;
                <asp:Label ID="FIELD_add_user" runat="server" Font-Bold="False" Font-Size="10pt"
                    Text="ann" Width="90px"></asp:Label>
                &nbsp;
            </td>
        </tr>
        <tr style="font-size: 10pt; font-family: Times New Roman">
            <td align="right" colspan="2" style="width: 100%; height: 29px; text-align: right">
                <table border="1" bordercolor="silver" cellpadding="0" cellspacing="0" style="width: 1285px;
                    border-collapse: collapse; height: auto">
                    <tr>
                        <td style="width: 83%; text-align: left">
                            <table style="width: 104%; height: 1px">
                                 <tr>
                                    <td colspan="4" style="height: 20px; background-color: slategray; text-align: center">
                                        &nbsp;<asp:Image ID="Image2" runat="server" Height="22px" ImageUrl="~/ERP_CXMT310/img/list.png"
                                            Width="23px" />
                                        <asp:Label ID="Label292" runat="server" Font-Bold="True" Font-Names="新細明體" Font-Size="11pt"
                                            ForeColor="MintCream" meta:resourcekey="Label29Resource1a" Text="申&nbsp;請&nbsp;內&nbsp;容"
                                            Width="82px"></asp:Label></td>
                                </tr>
                                <tr style="font-size: 10pt">
                                    <td id="table1_1" colspan="4" rowspan="6" style="text-align: left;">
                                        <table style="width: 100%; height: 1px;">
                                            <tr>
                                                <td colspan="2" style="vertical-align: top;">
                                                   
                                                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                                                    </asp:ScriptManager>
                                                    <div id="w_all" runat="server" style="text-align: left">
                                                            <table style="width: 100%; height: 300px;">
                                                                <tr>
                                                                    <td style="width: 50%; height: 225px">
                                                                        <table border="0" style="border-right: goldenrod 1px solid; border-top: goldenrod 1px solid;
                                                                            border-left: goldenrod 1px solid; width: 100%; border-bottom: goldenrod 1px solid;
                                                                            height: 100%">
                                                                            <tr>
                                                                                 <td style="width: 100%; height: 99px; vertical-align: top;">
                                                                                    <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; height: 419px">
                                                                                        <tr>
                                                                                            <td colspan="4" style="width: 100%; height: 20px; background-color: #ffcc66">
                                                                                                <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="11pt" Text="基本資料"  meta:resourcekey="Label3Resource1"></asp:Label></td>
                                                                                        </tr>
                                                                                        <tr style="font-size: 12pt">
                                                                                            <td style="width: 109px; background-color: gainsboro; height: 25px;">
                                                                                                <span style="color: #ff0033">*</span><asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="10pt" Text="產品別"  meta:resourcekey="Label1Resource1"
                                                                                                    Width="90px" ForeColor="#000000"></asp:Label></td>
                                                                                            <td style="width: 25px; height: 25px;">
                                                                                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                                                                    <ContentTemplate>
                                                                                                <asp:DropDownList ID="FIELD_product_class" runat="server" meta:resourcekey="FIELD_class_noResource1"
                                                                                                    Width="160px" OnSelectedIndexChanged="FIELD_product_class_SelectedIndexChanged" AutoPostBack="True">
                                                                                                    <asp:ListItem></asp:ListItem>
                                                                                                </asp:DropDownList>
                                                                                                    </ContentTemplate>
                                                                                                </asp:UpdatePanel>
                                                                                                <span style="color: #ff0033"></span>
                                                                                            </td>
                                                                                            <td style="width: 98px; background-color: gainsboro; height: 25px; color: #ff0033;">
                                                                                                <span style="color: #ff0033">*</span><asp:Label ID="Label20" runat="server" Font-Bold="True" Font-Size="10pt" Text="庫存單位"  meta:resourcekey="Label20Resource1"
                                                                                                    Width="59px" ForeColor="#000000"></asp:Label></td>
                                                                                            <td style="width: 210px; height: 25px; color: #ff0033;">
                                                                                                <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                                                                                                    <ContentTemplate>
                                                                                                        &nbsp;<asp:DropDownList ID="FIELD_Unit" runat="server" meta:resourcekey="FIELD_class_noResource1"
                                                                                                    Width="115px">
                                                                                                    <asp:ListItem></asp:ListItem>
                                                                                                </asp:DropDownList>
                                                                                                    </ContentTemplate>
                                                                                                </asp:UpdatePanel>
                                                                                                <span style="color: #ff0033"></span>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr style="font-size: 12pt; color: #ff0033">
                                                                                            <td style="background-color: gainsboro; height: 25px; width: 109px;">
                                                                                                <span style="color: #ff0033">*</span><asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="10pt" Text="分群碼"  meta:resourcekey="Label6Resource1"
                                                                                                    Width="90px" ForeColor="#000000"></asp:Label></td>
                                                                                            <td style="height: 25px; color: #ff0033;">
                                                                                                <asp:UpdatePanel ID="UpdatePanel3" runat="server" >
                                                                                                    <ContentTemplate>
                                                                                                        &nbsp;<asp:DropDownList ID="FIELD_Group" runat="server" meta:resourcekey="FIELD_class_noResource1"
                                                                                                    Width="160px" AutoPostBack="True" OnSelectedIndexChanged="FIELD_Group_SelectedIndexChanged">
                                                                                                    <asp:ListItem></asp:ListItem>
                                                                                                </asp:DropDownList>
                                                                                                    </ContentTemplate>
                                                                                                </asp:UpdatePanel>
                                                                                                <span style="color: #ff0033"></span>
                                                                                            </td>
                                                                                            <td style="width: 98px; background-color: gainsboro; height: 25px; color: #ff0033;">
                                                                                                <span></span><span style="color: #ff0033">*</span><asp:Label ID="Label21" runat="server" Font-Bold="True" Font-Size="10pt" Text="HSF"
                                                                                                    Width="74px" ForeColor="#000000"></asp:Label></td>
                                                                                            <td style="width: 210px; height: 25px; color: #ff0033;">
                                                                                                <asp:UpdatePanel ID="UpdatePanel7" runat="server">
                                                                                                    <ContentTemplate>
                                                                                                        <asp:CheckBox ID="FIELD_HSF" runat="server" />
                                                                                                    </ContentTemplate>
                                                                                                </asp:UpdatePanel>
                                                                                                <span style="color: #ff0033"></span>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr style="font-size: 12pt; color: #ff0033">
                                                                                            <td style="background-color: gainsboro; height: 25px; width: 109px;">
                                                                                                <span style="color: #ff0033">*</span><asp:Label ID="Label11" runat="server" Font-Bold="True" Font-Size="10pt" Text="交易方式"  meta:resourcekey="Label11Resource1"
                                                                                                    Width="90px" ForeColor="#000000"></asp:Label></td>
                                                                                            <td style="height: 25px;">
                                                                                                <asp:UpdatePanel ID="UpdatePanel4" runat="server" >
                                                                                                    <ContentTemplate>
                                                                                                        <span style="color: #ff0033">&nbsp;</span><asp:DropDownList ID="FIELD_Group2" runat="server" meta:resourcekey="FIELD_class_noResource1"
                                                                                                    Width="160px" AutoPostBack="True" OnSelectedIndexChanged="FIELD_Group2_SelectedIndexChanged">
                                                                                                    <asp:ListItem></asp:ListItem>
                                                                                                </asp:DropDownList><span style="color: #ff0033"> </span>
                                                                                                    </ContentTemplate>
                                                                                                </asp:UpdatePanel>
                                                                                            </td>
                                                                                            <td style="width: 98px; background-color: gainsboro; height: 25px;">
                                                                                                <span style="color: #ff0033">*</span><asp:Label ID="Label22" runat="server" Font-Bold="True" Font-Size="10pt" Text="IQC"
                                                                                                    Width="59px" ForeColor="#000000"></asp:Label></td>
                                                                                            <td style="width: 210px; height: 25px;">
                                                                                                <asp:UpdatePanel ID="UpdatePanel8" runat="server">
                                                                                                    <ContentTemplate>
                                                                                                        <asp:CheckBox ID="FIELD_IQC" runat="server" />
                                                                                                    </ContentTemplate>
                                                                                                </asp:UpdatePanel>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr style="font-size: 12pt">
                                                                                            <td style="background-color: gainsboro; height: 25px; width: 109px;">
                                                                                                <span style="color: #ff0033">*</span><asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Size="10pt" Text="副分群碼" meta:resourcekey="Label7Resource1"
                                                                                                    Width="90px"></asp:Label></td>
                                                                                            <td style="height: 25px;">
                                                                                                <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                                                                                                    <ContentTemplate>
                                                                                                        &nbsp;<asp:DropDownList ID="FIELD_Coding_Class" runat="server" meta:resourcekey="FIELD_class_noResource1"
                                                                                                    Width="160px" AutoPostBack="True" OnSelectedIndexChanged="FIELD_Coding_Class_SelectedIndexChanged">
                                                                                                    <asp:ListItem></asp:ListItem>
                                                                                                </asp:DropDownList>
                                                                                                    </ContentTemplate>
                                                                                                </asp:UpdatePanel>
                                                                                            </td>
                                                                                            <td style="width: 98px; background-color: gainsboro; height: 25px;">
                                                                                                <span style="color: #ff0033">*</span><asp:Label ID="Label15" runat="server" Font-Bold="True" Font-Size="10pt" Text="來源碼" meta:resourcekey="Label15Resource1"
                                                                                                    Width="86px"></asp:Label>
                                                                                            </td>
                                                                                            <td style="width: 210px; height: 25px;">
                                                                                                <asp:UpdatePanel ID="UpdatePanel9" runat="server">
                                                                                                    <ContentTemplate>
                                                                                                        <asp:DropDownList ID="FIELD_Source_code" runat="server" meta:resourcekey="FIELD_class_noResource1"
                                                                                                    Width="115px">
                                                                                                    <asp:ListItem></asp:ListItem>
                                                                                                    <asp:ListItem Value="P">P:採購料件</asp:ListItem>
                                                                                                    <asp:ListItem Value="M">M:自製料件</asp:ListItem>
                                                                                                </asp:DropDownList>
                                                                                                    </ContentTemplate>
                                                                                                </asp:UpdatePanel>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr style="font-size: 12pt">
                                                                                            <td style="height: 25px; background-color: gainsboro; width: 109px;">
                                                                                                <span style="color: #ff0033">*</span><asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="10pt" Text="品名"  meta:resourcekey="componenta"
                                                                                                    Width="90px"></asp:Label></td>
                                                                                            <td style="height: 25px">
                                                                                                &nbsp;<input id="component"  name="component" style="border-left-color: gainsboro;
                                                                                                    border-bottom-color: gainsboro; width: 200px; border-top-style: solid; border-top-color: gainsboro;
                                                                                                    border-right-style: solid; border-left-style: solid; background-color: whitesmoke;
                                                                                                    border-right-color: gainsboro; border-bottom-style: solid" type="textbox" /></td>
                                                                                            <td style="width: 98px; height: 25px; background-color: gainsboro">
                                                                                                <span style="color: gainsboro">*</span><asp:Label ID="Label14" runat="server" Font-Bold="True" Font-Size="10pt" Text="客戶別" meta:resourcekey="Label14Resource1"
                                                                                                    Width="90px"></asp:Label></td>
                                                                                            <td style="width: 210px; height: 25px">
                                                                                                &nbsp;<input id="Customers_class"  name="Customers_class" style="border-left-color: gainsboro;
                                                                                                    border-bottom-color: gainsboro; width: 83px; border-top-style: solid; border-top-color: gainsboro;
                                                                                                    border-right-style: solid; border-left-style: solid; background-color: whitesmoke;
                                                                                                    border-right-color: gainsboro; border-bottom-style: solid" type="textbox" />
                                                                                                <input id="Customers_class2" name="Customers_class2"  disabled="disabled" style="border-left-color: gainsboro;
                                                                                                    border-bottom-color: gainsboro; width: 100px; border-top-style: solid; border-top-color: gainsboro;
                                                                                                    border-right-style: solid; border-left-style: solid; background-color: whitesmoke;
                                                                                                    border-right-color: gainsboro; border-bottom-style: solid" type="textbox" /></td>
                                                                                        </tr>
                                                                                        <tr style="font-size: 12pt">
                                                                                            <td style="background-color: gainsboro; height: 25px; width: 109px;">
                                                                                                &nbsp;
                                                                                                <asp:Label ID="Label10" runat="server" Font-Bold="True" Font-Size="10pt" Text="規格" meta:resourcekey="Label10Resource1"
                                                                                                    Width="90px"></asp:Label></td>
                                                                                            <td style="height: 25px;">
                                                                                                &nbsp;<input id="DWG"  name="DWG" style="border-left-color: gainsboro;
                                                                                                    border-bottom-color: gainsboro; width: 199px; border-top-style: solid; border-top-color: gainsboro;
                                                                                                    border-right-style: solid; border-left-style: solid; background-color: whitesmoke;
                                                                                                    border-right-color: gainsboro; border-bottom-style: solid" type="textbox" /></td>
                                                                                            <td style="width: 98px; background-color: gainsboro; height: 25px;">
                                                                                                <span style="color: #dcdcdc">*</span><asp:Label ID="Label12" runat="server" Font-Bold="True" Font-Size="10pt" Text="機種別" meta:resourcekey="Label12Resource1"
                                                                                                    Width="90px"></asp:Label></td>
                                                                                            <td style="width: 210px; height: 25px;">
                                                                                                &nbsp;<input id="Model_class"  name="Model_class" style="border-left-color: gainsboro;
                                                                                                    border-bottom-color: gainsboro; width: 83px; border-top-style: solid; border-top-color: gainsboro;
                                                                                                    border-right-style: solid; border-left-style: solid; background-color: whitesmoke;
                                                                                                    border-right-color: gainsboro; border-bottom-style: solid" type="textbox" />
                                                                                                <input id="Model_class2"  name="Model_class2"  disabled="disabled" style="border-left-color: gainsboro;
                                                                                                    border-bottom-color: gainsboro; width: 100px; border-top-style: solid; border-top-color: gainsboro;
                                                                                                    border-right-style: solid; border-left-style: solid; background-color: whitesmoke;
                                                                                                    border-right-color: gainsboro; border-bottom-style: solid" type="textbox" /></td>
                                                                                        </tr>
                                                                                        <tr style="font-size: 12pt">
                                                                                            <td style="background-color: gainsboro; height: 25px; width: 109px;">
                                                                                                <span style="color: #ff0033">*</span><asp:Label ID="Label17" runat="server" Font-Bold="True" Font-Size="10pt" Text="生產廠別" meta:resourcekey="Label17Resource1"
                                                                                                    Width="90px"></asp:Label></td>
                                                                                            <td colspan="3" style="height: 25px">
                                                                                                <asp:UpdatePanel ID="UpdatePanel10" runat="server">
                                                                                                    <ContentTemplate>
                                                                                                <asp:CheckBoxList ID="p_plantid" runat="server" Font-Size="9pt" Height="15px"
                                                                                                    name="CheckBoxList2" RepeatColumns="10" RepeatDirection="Horizontal">
                                                                                                </asp:CheckBoxList>
                                                                                                    </ContentTemplate>
                                                                                                </asp:UpdatePanel>
                                                                                                <input id="PK1" runat="server" type="hidden" />
                                                                                                <input id="rember_item" runat="server" style="width: 83px" text="rember_item" type="hidden" /></td>
                                                                                        </tr>
                                                                                        <tr style="font-size: 12pt">
                                                                                            <td colspan="4" style="background-color: #ffcc66; height: 20px;">
                                                                                                <asp:Label ID="Label16" runat="server" Font-Bold="True" Font-Size="11pt" Text="編碼資料"   meta:resourcekey="Label161Resource1"></asp:Label></td>
                                                                                        </tr>
                                                                                        <tr style="font-size: 12pt">
                                                                                            <td colspan="4" style="vertical-align: top; height: 68px">
                                                                                           
                                                                                                
                                                                                                 <div id="ww1" runat="server" style="text-align: left">
                                                                                                <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; height: 55px;">
                                                                                                    <tr>
                                                                                                        <td style="width: 95px; background-color: gainsboro; height: 25px;">
                                                                                                            <span style="color: #ff0033">*</span><asp:Label ID="Label18" runat="server" Font-Bold="True" Font-Size="10pt" Text="1零件別"  meta:resourcekey="Label16Resource1"
                                                                                                                Width="85px"></asp:Label></td>
                                                                                                        <td style="width: 493px; height: 25px;">
                                                                                                            &nbsp;<input id="A7" name="A7"  style="border-left-color: gainsboro; 
                                                                                                    border-bottom-color: gainsboro; width: 100px; border-top-style: solid; border-top-color: gainsboro;
                                                                                                    border-right-style: solid; border-left-style: solid; background-color: whitesmoke;
                                                                                                    border-right-color: gainsboro; border-bottom-style: solid" type="textbox" />
                                                                                                            <input id="A7_2" name="A7_2"  disabled="disabled" style="border-left-color: gainsboro;
                                                                                                    border-bottom-color: gainsboro; width: 256px; border-top-style: solid; border-top-color: gainsboro;
                                                                                                    border-right-style: solid; border-left-style: solid; background-color: whitesmoke;
                                                                                                    border-right-color: gainsboro; border-bottom-style: solid" type="textbox" /></td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td style="width: 95px; background-color: gainsboro; height: 25px;">
                                                                                                            &nbsp;
                                                                                                            <asp:Label ID="LabelA5" runat="server" Font-Bold="True" Font-Size="10pt" Text="版次(非必填)"  meta:resourcekey="LabelA5Resource1"
                                                                                                                Width="90px"></asp:Label></td>
                                                                                                        <td style="width: 493px; height: 25px;">
                                                                                                            &nbsp;<asp:TextBox ID="A8" runat="server" MaxLength="2" Width="40px"></asp:TextBox></td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td style="width: 95px; background-color: gainsboro; height: 25px;">
                                                                                                            <span style="color: #ff0033">*</span><asp:Label ID="Label19" runat="server" Font-Bold="True" Font-Size="10pt" Text="料別"  meta:resourcekey="Label19Resource1"
                                                                                                                Width="85px"></asp:Label></td>
                                                                                                        <td style="width: 493px; height: 25px;">
                                                                                                            &nbsp;<asp:TextBox ID="A9" runat="server" MaxLength="1" Width="40px"></asp:TextBox></td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                                </div>
                                                                                                 <div id="ww2" runat="server" style="text-align: left">
                                                                                                <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; height: 52px;">
                                                                                                    <tr>
                                                                                                        <td style="width: 100px; background-color: gainsboro; height: 25px;">
                                                                                                            <span style="color: #ff0033">*</span><asp:Label ID="Label23" runat="server" Font-Bold="True" Font-Size="10pt" Text="2包材分類"  meta:resourcekey="Label23Resource1"
                                                                                                                Width="90px"></asp:Label></td>
                                                                                                        <td style="width: 493px">
                                                                                                            &nbsp;<asp:DropDownList ID="B2" runat="server" meta:resourcekey="FIELD_class_noResource1"
                                                                                                    Width="115px">
                                                                                                                <asp:ListItem></asp:ListItem>
                                                                                                            </asp:DropDownList></td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td style="width: 100px; background-color: gainsboro; height: 10px;">
                                                                                                            <span style="color: #ff0033">*</span><asp:Label ID="Label24" runat="server" Font-Bold="True" Font-Size="10pt" Text="是否為硬碟"  meta:resourcekey="Label24Resource1"
                                                                                                                Width="90px"></asp:Label></td>
                                                                                                        <td style="width: 493px; height: 10px;">
                                                                                                            &nbsp;<asp:DropDownList ID="B4" runat="server" meta:resourcekey="FIELD_class_noResource1"
                                                                                                    Width="115px">
                                                                                                                <asp:ListItem></asp:ListItem>
                                                                                                                <asp:ListItem Value="1">Y</asp:ListItem>
                                                                                                                <asp:ListItem Value="2">N</asp:ListItem>
                                                                                                            </asp:DropDownList></td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                                </div>
                                                                                                <div id="ww3" runat="server" style="text-align: left">
                                                                                                <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; height: 24px;">
                                                                                                    <tr>
                                                                                                        <td style="width: 100px; background-color: gainsboro; height: 25px;">
                                                                                                            <span style="color: #ff0033">*</span><asp:Label ID="Label25" runat="server" Font-Bold="True" Font-Size="10pt" Text="3消耗分類"  meta:resourcekey="Label25Resource1"
                                                                                                                Width="90px"></asp:Label></td>
                                                                                                        <td style="width: 493px; height: 25px;">
                                                                                                            &nbsp;<asp:DropDownList ID="C2" runat="server" meta:resourcekey="FIELD_class_noResource1"
                                                                                                    Width="115px">
                                                                                                                <asp:ListItem></asp:ListItem>
                                                                                                            </asp:DropDownList></td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                                </div>
                                                                                                <div id="ww4" runat="server" style="text-align: left">
                                                                                                <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; height: 24px;">
                                                                                                    <tr>
                                                                                                        <td style="width: 100px; background-color: gainsboro; height: 25px;">
                                                                                                            <span style="color: #ff0033">*</span><asp:Label ID="Label26" runat="server" Font-Bold="True" Font-Size="10pt" Text="4客戶圖號"  meta:resourcekey="Label26Resource1"
                                                                                                                Width="90px"></asp:Label></td>
                                                                                                        <td style="width: 493px; height: 25px;">
                                                                                                            &nbsp;<asp:TextBox ID="D2" runat="server" MaxLength="19" Width="180px"></asp:TextBox></td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                                </div>
                                                                                                <div id="ww5" runat="server" style="text-align: left">
                                                                                                <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; height: 24px;">
                                                                                                    <tr>
                                                                                                        <td style="width: 100px; background-color: gainsboro; height: 25px;">
                                                                                                            <span style="color: #ff0033">*</span><asp:Label ID="Label30" runat="server" Font-Bold="True" Font-Size="10pt" Text="5部門碼"  meta:resourcekey="Label30Resource1"
                                                                                                                Width="90px"></asp:Label></td>
                                                                                                        <td style="width: 493px; height: 25px;">
                                                                                                            &nbsp;<asp:DropDownList ID="E5" runat="server" meta:resourcekey="FIELD_class_noResource1"
                                                                                                    Width="115px">
                                                                                                                <asp:ListItem></asp:ListItem>
                                                                                                            </asp:DropDownList></td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                                </div>
                                                                                                <div id="ww6" runat="server" style="text-align: left">
                                                                                                <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; height: 55px;">
                                                                                                    <tr>
                                                                                                        <td style="width: 100px; background-color: gainsboro; height: 25px;">
                                                                                                            &nbsp;
                                                                                                            <asp:Label ID="Label32" runat="server" Font-Bold="True" Font-Size="10pt" Text="6流水碼(非必填)"  meta:resourcekey="Label32Resource1"
                                                                                                                Width="92px"></asp:Label></td>
                                                                                                        <td style="width: 493px; height: 25px;">
                                                                                                            &nbsp;<asp:TextBox ID="F4" runat="server" MaxLength="2" Width="55px"></asp:TextBox></td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td style="width: 100px; background-color: gainsboro; height: 25px;">
                                                                                                            <span style="color: #ff0033">*</span><asp:Label ID="Label33" runat="server" Font-Bold="True" Font-Size="10pt" Text="設變流水碼"  meta:resourcekey="Label33Resource1"
                                                                                                                Width="90px"></asp:Label></td>
                                                                                                        <td style="width: 493px; height: 25px;">
                                                                                                            &nbsp;<asp:TextBox ID="F5" runat="server" MaxLength="2" Width="54px"></asp:TextBox></td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                                </div>
                                                                                                
                                                                                                <div id="ww7" runat="server" style="text-align: left">
                                                                                                <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; height: 55px;">
                                                                                                    <tr>
                                                                                                        <td style="width: 100px; background-color: gainsboro; height: 25px;">
                                                                                                            <span style="color: #ff0033">*</span><asp:Label ID="Label102" runat="server" Font-Bold="True" Font-Size="10pt" Text="7零件別"  meta:resourcekey="Label102Resource1"
                                                                                                                Width="90px"></asp:Label></td>
                                                                                                        <td style="width: 493px; height: 25px;">
                                                                                                            &nbsp;<input id="G3" name="G3" style="border-left-color: gainsboro;
                                                                                                    border-bottom-color: gainsboro; width: 100px; border-top-style: solid; border-top-color: gainsboro;
                                                                                                    border-right-style: solid; border-left-style: solid; background-color: whitesmoke;
                                                                                                    border-right-color: gainsboro; border-bottom-style: solid" type="textbox" />
                                                                                                            <input id="G3_2" name="G3_2"  disabled="disabled" style="border-left-color: gainsboro;
                                                                                                    border-bottom-color: gainsboro; width: 256px; border-top-style: solid; border-top-color: gainsboro;
                                                                                                    border-right-style: solid; border-left-style: solid; background-color: whitesmoke;
                                                                                                    border-right-color: gainsboro; border-bottom-style: solid" type="textbox" /></td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td style="width: 100px; height: 25px; background-color: gainsboro">
                                                                                                            <span style="color: #ff0033">*</span><asp:Label ID="Label34" runat="server" Font-Bold="True" Font-Size="10pt" Text="7版次別"  meta:resourcekey="Label34Resource1"
                                                                                                                Width="90px"></asp:Label></td>
                                                                                                        <td style="width: 493px; height: 25px">
                                                                                                            &nbsp;<asp:TextBox ID="G4" runat="server" MaxLength="1" Width="40px"></asp:TextBox></td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td style="width: 100px; background-color: gainsboro; height: 25px;">
                                                                                                            <span style="color: #ff0033">*</span><asp:Label ID="Label35" runat="server" Font-Bold="True" Font-Size="10pt" Text="料別"  meta:resourcekey="Label35Resource1"
                                                                                                                Width="90px"></asp:Label></td>
                                                                                                        <td style="width: 493px; height: 25px;">
                                                                                                            &nbsp;<asp:TextBox ID="G5" runat="server" MaxLength="1" Width="40px"></asp:TextBox></td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td style="width: 100px; background-color: gainsboro; height: 25px;">
                                                                                                            <span style="color: #ff0033">*</span><asp:Label ID="Label36" runat="server" Font-Bold="True" Font-Size="10pt" Text="套別"  meta:resourcekey="Label36Resource1"
                                                                                                                Width="90px"></asp:Label></td>
                                                                                                        <td style="width: 493px; height: 25px;">
                                                                                                            &nbsp;<asp:TextBox ID="G6" runat="server" MaxLength="1" Width="40px"></asp:TextBox></td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                                </div>
                                                                                                <div id="ww8" runat="server" style="text-align: left">
                                                                                                <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; height: 24px;">
                                                                                                    <tr>
                                                                                                        <td style="width: 100px; background-color: gainsboro; height: 25px;">
                                                                                                            <span style="color: #ff0033">*</span><asp:Label ID="Label37" runat="server" Font-Bold="True" Font-Size="10pt" Text="8客戶圖號"  meta:resourcekey="Label37Resource1"
                                                                                                                Width="90px"></asp:Label></td>
                                                                                                        <td style="width: 493px; height: 25px;">
                                                                                                            &nbsp;<asp:TextBox ID="H2" runat="server" MaxLength="19" Width="180px"></asp:TextBox></td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                                </div>
                                                                                                 <div id="ww9" runat="server" style="text-align: left">
                                                                                                <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; height: 55px;">
                                                                                                    <tr>
                                                                                                        <td style="width: 100px; background-color: gainsboro; height: 25px;">
                                                                                                            <span style="color: #ff0033">*</span><asp:Label ID="Label38" runat="server" Font-Bold="True" Font-Size="10pt" Text="9原料產品別"  meta:resourcekey="Label38Resource1"
                                                                                                                Width="90px"></asp:Label></td>
                                                                                                        <td style="width: 493px; height: 25px;">
                                                                                                            &nbsp;<asp:DropDownList ID="I5" runat="server" meta:resourcekey="FIELD_class_noResource1"
                                                                                                    Width="115px">
                                                                                                                <asp:ListItem></asp:ListItem>
                                                                                                            </asp:DropDownList></td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td style="width: 100px; background-color: gainsboro; height: 25px;">
                                                                                                            <span style="color: #ff0033">*</span><asp:Label ID="Label39" runat="server" Font-Bold="True" Font-Size="10pt" Text="原料分類"  meta:resourcekey="Label39Resource1"
                                                                                                                Width="90px"></asp:Label></td>
                                                                                                        <td style="width: 493px; height: 25px;">
                                                                                                            &nbsp;<asp:DropDownList ID="I7" runat="server" meta:resourcekey="FIELD_class_noResource1"
                                                                                                    Width="115px">
                                                                                                                <asp:ListItem></asp:ListItem>
                                                                                                            </asp:DropDownList></td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                                </div>
                                                                                                 <div id="ww10" runat="server" style="text-align: left">
                                                                                                <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; height: 55px;">
                                                                                                    <tr>
                                                                                                        <td style="width: 106px; background-color: gainsboro; height: 25px;">
                                                                                                            <span style="color: #ff0033">*</span><asp:Label ID="Label40" runat="server" Font-Bold="True" Font-Size="10pt" Text="10MATC產品別"  meta:resourcekey="Label40Resource1"
                                                                                                                Width="93px"></asp:Label></td>
                                                                                                        <td style="width: 493px; height: 25px;">
                                                                                                            &nbsp;<asp:DropDownList ID="J3" runat="server" meta:resourcekey="FIELD_class_noResource1"
                                                                                                    Width="115px">
                                                                                                                <asp:ListItem></asp:ListItem>
                                                                                                            </asp:DropDownList></td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td style="width: 106px; background-color: gainsboro; height: 25px;">
                                                                                                            <span style="color: #ff0033">*</span><asp:Label ID="Label44" runat="server" Font-Bold="True" Font-Size="10pt" Text="寬度"  meta:resourcekey="Label44Resource1"
                                                                                                                Width="90px"></asp:Label></td>
                                                                                                        <td style="width: 493px; height: 25px;">
                                                                                                            &nbsp;<asp:TextBox ID="J5" runat="server" MaxLength="3" Width="40px"></asp:TextBox></td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td style="width: 106px; background-color: gainsboro; height: 25px;">
                                                                                                            <span style="color: #ff0033">*</span><asp:Label ID="Label45" runat="server" Font-Bold="True" Font-Size="10pt" Text="厚度"  meta:resourcekey="Label45Resource1"
                                                                                                                Width="90px"></asp:Label></td>
                                                                                                        <td style="width: 493px; height: 25px;">
                                                                                                            &nbsp;<asp:TextBox ID="J6" runat="server" MaxLength="4" Width="69px"></asp:TextBox></td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                                </div>
                                                                                                 <div id="ww11" runat="server" style="text-align: left">
                                                                                                <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; height: 55px;">
                                                                                                    <tr>
                                                                                                        <td style="width: 100px; background-color: gainsboro; height: 25px;">
                                                                                                            <span style="color: #ff0033">*</span><asp:Label ID="Label46" runat="server" Font-Bold="True" Font-Size="10pt" Text="11化學分類"  meta:resourcekey="Label46Resource1"
                                                                                                                Width="90px"></asp:Label></td>
                                                                                                        <td style="width: 493px; height: 25px;">
                                                                                                            &nbsp;<asp:DropDownList ID="K4" runat="server" meta:resourcekey="FIELD_class_noResource1"
                                                                                                    Width="115px">
                                                                                                                <asp:ListItem></asp:ListItem>
                                                                                                            </asp:DropDownList></td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td style="width: 100px; background-color: gainsboro; height: 25px;">
                                                                                                            <span style="color: #ff0033">*</span><asp:Label ID="Label47" runat="server" Font-Bold="True" Font-Size="10pt" Text="型號流水碼"  meta:resourcekey="Label47Resource1"
                                                                                                                Width="90px"></asp:Label></td>
                                                                                                        <td style="width: 493px; height: 25px;">
                                                                                                            &nbsp;<asp:TextBox ID="K7" runat="server" MaxLength="1" Width="40px"></asp:TextBox></td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                                </div>
                                                                                                 <div id="ww12" runat="server" style="text-align: left">
                                                                                                <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; height: 55px;">
                                                                                                    <tr>
                                                                                                        <td style="width: 100px; background-color: gainsboro; height: 25px;">
                                                                                                            <span style="color: #ff0033">*</span><asp:Label ID="Label49" runat="server" Font-Bold="True" Font-Size="10pt" Text="12材質區分"  meta:resourcekey="Label49Resource1"
                                                                                                                Width="90px"></asp:Label></td>
                                                                                                        <td style="width: 493px; height: 25px;">
                                                                                                            &nbsp;<asp:DropDownList ID="L3" runat="server" meta:resourcekey="FIELD_class_noResource1"
                                                                                                    Width="115px">
                                                                                                                <asp:ListItem></asp:ListItem>
                                                                                                            </asp:DropDownList></td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td style="width: 100px; background-color: gainsboro; height: 25px;">
                                                                                                            <span style="color: #ff0033">*</span><asp:Label ID="Label50" runat="server" Font-Bold="True" Font-Size="10pt" Text="亮度/型態"  meta:resourcekey="Label50Resource1"
                                                                                                                Width="90px"></asp:Label></td>
                                                                                                        <td style="width: 493px; height: 25px;">
                                                                                                            &nbsp;<asp:DropDownList ID="L4" runat="server" meta:resourcekey="FIELD_class_noResource1"
                                                                                                    Width="115px">
                                                                                                                <asp:ListItem></asp:ListItem>
                                                                                                            </asp:DropDownList></td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td style="width: 100px; background-color: gainsboro; height: 25px;">
                                                                                                            <span style="color: #ff0033">*</span><asp:Label ID="Label51" runat="server" Font-Bold="True" Font-Size="10pt" Text="料厚"  meta:resourcekey="Label51Resource1"
                                                                                                                Width="90px"></asp:Label></td>
                                                                                                        <td style="width: 493px; height: 25px;">
                                                                                                            &nbsp;<asp:TextBox ID="L5" runat="server" MaxLength="4" Width="80px"></asp:TextBox></td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td style="width: 100px; background-color: gainsboro; height: 25px;">
                                                                                                            <span style="color: #ff0033">*</span><asp:Label ID="Label52" runat="server" Font-Bold="True" Font-Size="10pt" Text="料寬"  meta:resourcekey="Label52Resource1"
                                                                                                                Width="90px"></asp:Label></td>
                                                                                                        <td style="width: 493px; height: 25px;">
                                                                                                            &nbsp;<asp:TextBox ID="L6" runat="server" MaxLength="3" Width="62px"></asp:TextBox></td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td style="width: 100px; height: 25px; background-color: gainsboro">
                                                                                                            <span style="color: #ff0033">*</span><asp:Label ID="Label48" runat="server" Font-Bold="True" Font-Size="10pt" Text="硬度"  meta:resourcekey="Label48Resource1"
                                                                                                                Width="90px"></asp:Label></td>
                                                                                                        <td style="width: 493px; height: 25px">
                                                                                                            &nbsp;<asp:TextBox ID="L7" runat="server" MaxLength="2" Width="62px"></asp:TextBox></td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                                </div>
                                                                                                 <div id="ww13" runat="server" style="text-align: left">
                                                                                                <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; height: 55px;">
                                                                                                    <tr>
                                                                                                        <td style="width: 100px; background-color: gainsboro; height: 25px;">
                                                                                                            <span style="color: #ff0033">*</span><asp:Label ID="Label53" runat="server" Font-Bold="True" Font-Size="10pt" Text="13鐵材材質"  meta:resourcekey="Label53Resource1"
                                                                                                                Width="90px"></asp:Label></td>
                                                                                                        <td style="width: 493px; height: 25px;">
                                                                                                            &nbsp;<asp:DropDownList ID="M3" runat="server" meta:resourcekey="FIELD_class_noResource1"
                                                                                                    Width="115px">
                                                                                                                <asp:ListItem></asp:ListItem>
                                                                                                            </asp:DropDownList></td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td style="width: 100px; background-color: gainsboro; height: 25px;">
                                                                                                            <span style="color: #ff0033">*</span><asp:Label ID="Label54" runat="server" Font-Bold="True" Font-Size="10pt" Text="亮型/型態"  meta:resourcekey="Label54Resource1"
                                                                                                                Width="90px"></asp:Label></td>
                                                                                                        <td style="width: 493px; height: 25px;">
                                                                                                            &nbsp;<asp:DropDownList ID="M5" runat="server" meta:resourcekey="FIELD_class_noResource1"
                                                                                                    Width="115px">
                                                                                                                <asp:ListItem></asp:ListItem>
                                                                                                            </asp:DropDownList></td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td style="width: 100px; background-color: gainsboro; height: 25px;">
                                                                                                            <span style="color: #ff0033">*</span><asp:Label ID="Label55" runat="server" Font-Bold="True" Font-Size="10pt" Text="料厚"  meta:resourcekey="Label55Resource1"
                                                                                                                Width="90px"></asp:Label></td>
                                                                                                        <td style="width: 493px; height: 25px;">
                                                                                                            &nbsp;<asp:TextBox ID="M6" runat="server" MaxLength="4" Width="80px"></asp:TextBox></td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td style="width: 100px; background-color: gainsboro; height: 25px;">
                                                                                                            <span style="color: #ff0033">*</span><asp:Label ID="Label56" runat="server" Font-Bold="True" Font-Size="10pt" Text="料寬"  meta:resourcekey="Label56Resource1"
                                                                                                                Width="90px"></asp:Label></td>
                                                                                                        <td style="width: 493px; height: 25px;">
                                                                                                            &nbsp;<asp:TextBox ID="M7" runat="server" MaxLength="3" Width="62px"></asp:TextBox></td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td style="width: 100px; height: 25px; background-color: gainsboro">
                                                                                                            <span style="color: #ff0033">*</span><asp:Label ID="Label57" runat="server" Font-Bold="True" Font-Size="10pt" Text="硬度"  meta:resourcekey="Label57Resource1"
                                                                                                                Width="90px"></asp:Label></td>
                                                                                                        <td style="width: 493px; height: 25px">
                                                                                                            &nbsp;<asp:TextBox ID="M8" runat="server" MaxLength="2" Width="62px"></asp:TextBox></td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                                </div>
                                                                                                 <div id="ww14" runat="server" style="text-align: left">
                                                                                                <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; height: 55px;">
                                                                                                    <tr>
                                                                                                        <td style="width: 100px; background-color: gainsboro; height: 25px;">
                                                                                                            <span style="color: #ff0033">*</span><asp:Label ID="Label58" runat="server" Font-Bold="True" Font-Size="10pt" Text="14鐵材材質"  meta:resourcekey="Label58Resource1"
                                                                                                                Width="90px"></asp:Label></td>
                                                                                                        <td style="width: 493px; height: 25px;">
                                                                                                            &nbsp;<asp:DropDownList ID="N3" runat="server" meta:resourcekey="FIELD_class_noResource1"
                                                                                                    Width="115px">
                                                                                                                <asp:ListItem></asp:ListItem>
                                                                                                            </asp:DropDownList></td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td style="width: 100px; background-color: gainsboro; height: 25px;">
                                                                                                            <span style="color: #ff0033">*</span><asp:Label ID="Label63" runat="server" Font-Bold="True" Font-Size="10pt" Text="膠種"  meta:resourcekey="Label63Resource1"
                                                                                                                Width="90px"></asp:Label></td>
                                                                                                        <td style="width: 493px; height: 25px;">
                                                                                                            &nbsp;<asp:DropDownList ID="N4" runat="server" meta:resourcekey="FIELD_class_noResource1"
                                                                                                    Width="115px">
                                                                                                                <asp:ListItem></asp:ListItem>
                                                                                                            </asp:DropDownList></td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td style="width: 100px; background-color: gainsboro; height: 25px;">
                                                                                                            <span style="color: #ff0033">*</span><asp:Label ID="Label59" runat="server" Font-Bold="True" Font-Size="10pt" Text="亮型/型態"  meta:resourcekey="Label59Resource1"
                                                                                                                Width="90px"></asp:Label></td>
                                                                                                        <td style="width: 493px; height: 25px;">
                                                                                                            &nbsp;<asp:DropDownList ID="N5" runat="server" meta:resourcekey="FIELD_class_noResource1"
                                                                                                    Width="115px">
                                                                                                                <asp:ListItem></asp:ListItem>
                                                                                                            </asp:DropDownList></td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td style="width: 100px; background-color: gainsboro; height: 25px;">
                                                                                                            <span style="color: #ff0033">*</span><asp:Label ID="Label60" runat="server" Font-Bold="True" Font-Size="10pt" Text="料厚"  meta:resourcekey="Label60Resource1"
                                                                                                                Width="90px"></asp:Label></td>
                                                                                                        <td style="width: 493px; height: 25px;">
                                                                                                            &nbsp;<asp:TextBox ID="N6" runat="server" MaxLength="4" Width="80px"></asp:TextBox></td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td style="width: 100px; background-color: gainsboro; height: 25px;">
                                                                                                            <span style="color: #ff0033">*</span><asp:Label ID="Label61" runat="server" Font-Bold="True" Font-Size="10pt" Text="料寬"  meta:resourcekey="Label61Resource1"
                                                                                                                Width="90px"></asp:Label></td>
                                                                                                        <td style="width: 493px; height: 25px;">
                                                                                                            &nbsp;<asp:TextBox ID="N7" runat="server" MaxLength="3" Width="62px"></asp:TextBox></td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td style="width: 100px; height: 25px; background-color: gainsboro">
                                                                                                            <span style="color: #ff0033">*</span><asp:Label ID="Label62" runat="server" Font-Bold="True" Font-Size="10pt" Text="硬度"  meta:resourcekey="Label62Resource1"
                                                                                                                Width="90px"></asp:Label></td>
                                                                                                        <td style="width: 493px; height: 25px">
                                                                                                            &nbsp;<asp:TextBox ID="N8" runat="server" MaxLength="2" Width="62px"></asp:TextBox></td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                                </div>
                                                                                                 <div id="ww15" runat="server" style="text-align: left">
                                                                                                <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; height: 55px;">
                                                                                                    <tr>
                                                                                                        <td style="width: 100px; background-color: gainsboro; height: 25px;">
                                                                                                            <span style="color: #ff0033">*</span><asp:Label ID="Label64" runat="server" Font-Bold="True" Font-Size="10pt" Text="15PET+膠種"  meta:resourcekey="Label64Resource1"
                                                                                                                Width="90px"></asp:Label></td>
                                                                                                        <td style="width: 493px; height: 25px;">
                                                                                                            &nbsp;<asp:DropDownList ID="O3" runat="server" meta:resourcekey="FIELD_class_noResource1"
                                                                                                    Width="115px">
                                                                                                                <asp:ListItem></asp:ListItem>
                                                                                                            </asp:DropDownList></td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td style="width: 100px; background-color: gainsboro; height: 25px;">
                                                                                                            <span style="color: #ff0033">*</span><asp:Label ID="Label65" runat="server" Font-Bold="True" Font-Size="10pt" Text="料寬"  meta:resourcekey="Label65Resource1"
                                                                                                                Width="90px"></asp:Label></td>
                                                                                                        <td style="width: 493px; height: 25px;">
                                                                                                            &nbsp;<asp:TextBox ID="O5" runat="server" MaxLength="3" Width="78px"></asp:TextBox></td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                                </div>
                                                                                                <div id="ww16" runat="server" style="text-align: left">
                                                                                                <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; height: 55px;">
                                                                                                    <tr>
                                                                                                        <td style="width: 100px; background-color: gainsboro; height: 25px;">
                                                                                                            <span style="color: #ff0033">*</span><asp:Label ID="Label66" runat="server" Font-Bold="True" Font-Size="10pt" Text="16PET+膠種"  meta:resourcekey="Label66Resource1"
                                                                                                                Width="90px"></asp:Label></td>
                                                                                                        <td style="width: 493px; height: 25px;">
                                                                                                            &nbsp;<asp:DropDownList ID="P3" runat="server" meta:resourcekey="FIELD_class_noResource1"
                                                                                                    Width="115px">
                                                                                                                <asp:ListItem></asp:ListItem>
                                                                                                            </asp:DropDownList></td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td style="width: 100px; height: 25px; background-color: gainsboro">
                                                                                                            <span style="color: #ff0033">*</span><asp:Label ID="Label68" runat="server" Font-Bold="True" Font-Size="10pt" Text="料厚"  meta:resourcekey="Label68Resource1"
                                                                                                                Width="90px"></asp:Label></td>
                                                                                                        <td style="width: 493px; height: 25px">
                                                                                                            &nbsp;<asp:TextBox ID="P5" runat="server" MaxLength="4" Width="80px"></asp:TextBox></td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td style="width: 100px; background-color: gainsboro; height: 25px;">
                                                                                                            <span style="color: #ff0033">*</span><asp:Label ID="Label67" runat="server" Font-Bold="True" Font-Size="10pt" Text="料寬"  meta:resourcekey="Label67Resource1"
                                                                                                                Width="90px"></asp:Label></td>
                                                                                                        <td style="width: 493px; height: 25px;">
                                                                                                            &nbsp;<asp:TextBox ID="P6" runat="server" MaxLength="3" Width="62px"></asp:TextBox></td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                                </div>
                                                                                                <div id="ww17" runat="server" style="text-align: left">
                                                                                                <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; height: 55px;">
                                                                                                    <tr>
                                                                                                        <td style="width: 100px; background-color: gainsboro; height: 25px;">
                                                                                                            <span style="color: #ff0033">*</span><asp:Label ID="Label69" runat="server" Font-Bold="True" Font-Size="10pt" Text="17自動化大分類"  meta:resourcekey="Label69Resource1"
                                                                                                                Width="90px"></asp:Label></td>
                                                                                                        <td style="width: 493px; height: 25px;">
                                                                                                            <asp:UpdatePanel ID="UpdatePanel17" runat="server">
                                                                                                                <ContentTemplate>
                                                                                                                    <asp:DropDownList ID="Q2" runat="server" meta:resourcekey="FIELD_class_noResource1"
                                                                                                    Width="115px" AutoPostBack="True" OnSelectedIndexChanged="Q2_SelectedIndexChanged">
                                                                                                                <asp:ListItem></asp:ListItem>
                                                                                                            </asp:DropDownList>
                                                                                                                </ContentTemplate>
                                                                                                            </asp:UpdatePanel>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td style="width: 100px; height: 25px; background-color: gainsboro">
                                                                                                            <span style="color: #ff0033">*</span><asp:Label ID="Label70" runat="server" Font-Bold="True" Font-Size="10pt" Text="產業別"  meta:resourcekey="Label70Resource1"
                                                                                                                Width="90px"></asp:Label></td>
                                                                                                        <td style="width: 493px; height: 25px">
                                                                                                            <asp:UpdatePanel ID="UpdatePanel15" runat="server">
                                                                                                                <ContentTemplate>
                                                                                                                    <asp:DropDownList ID="Q3" runat="server" meta:resourcekey="FIELD_class_noResource1"
                                                                                                    Width="115px" AutoPostBack="True" OnSelectedIndexChanged="Q3_SelectedIndexChanged">
                                                                                                                <asp:ListItem></asp:ListItem>
                                                                                                            </asp:DropDownList>
                                                                                                                </ContentTemplate>
                                                                                                            </asp:UpdatePanel>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td style="width: 100px; height: 25px; background-color: gainsboro">
                                                                                                            <span style="color: #ff0033">*</span><asp:Label ID="Label71" runat="server" Font-Bold="True" Font-Size="10pt" Text="機台流水碼"  meta:resourcekey="Label71Resource1"
                                                                                                                Width="90px"></asp:Label></td>
                                                                                                        <td style="width: 493px; height: 25px">
                                                                                                            <asp:UpdatePanel ID="UpdatePanel16" runat="server">
                                                                                                                <ContentTemplate>
                                                                                                                    <asp:DropDownList ID="Q4" runat="server" meta:resourcekey="FIELD_class_noResource1"
                                                                                                    Width="150px" AutoPostBack="True">
                                                                                                                <asp:ListItem></asp:ListItem>
                                                                                                            </asp:DropDownList>
                                                                                                                </ContentTemplate>
                                                                                                            </asp:UpdatePanel>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td style="width: 100px; height: 25px; background-color: gainsboro">
                                                                                                            <span style="color: #ff0033">*</span><asp:Label ID="Label72" runat="server" Font-Bold="True" Font-Size="10pt" Text="機台中分類"  meta:resourcekey="Label72Resource1"
                                                                                                                Width="90px"></asp:Label></td>
                                                                                                        <td style="width: 493px; height: 25px">
                                                                                                            &nbsp;<asp:TextBox ID="Q5" runat="server" MaxLength="2" Width="40px"></asp:TextBox></td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td style="width: 100px; height: 25px; background-color: gainsboro">
                                                                                                            <span style="color: #ff0033">*</span><asp:Label ID="Label101" runat="server" Font-Bold="True" Font-Size="10pt" Text="機台小分類"  meta:resourcekey="Label101Resource1"
                                                                                                                Width="90px"></asp:Label></td>
                                                                                                        <td style="width: 493px; height: 25px">
                                                                                                            &nbsp;<asp:TextBox ID="Q6" runat="server" MaxLength="2" Width="40px"></asp:TextBox></td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                                </div>
                                                                                                <div id="ww18" runat="server" style="text-align: left">
                                                                                                <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; height: 24px;">
                                                                                                 <tr>
                                                                                                        <td style="width: 100px; background-color: gainsboro; height: 25px;">
                                                                                                            <span style="color: #ff0033">*</span><asp:Label ID="Label5SS" runat="server" Font-Bold="True" Font-Size="10pt" Text="18流水碼(非必填)"  meta:resourcekey="Label5SSResource1"
                                                                                                                Width="90px"></asp:Label></td>
                                                                                                        <td style="width: 493px; height: 25px;">
                                                                                                            &nbsp;<asp:TextBox ID="R4" runat="server" MaxLength="2" Width="62px"></asp:TextBox></td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td style="width: 100px; background-color: gainsboro; height: 25px;">
                                                                                                            <span style="color: #ff0033">*</span><asp:Label ID="Label73" runat="server" Font-Bold="True" Font-Size="10pt" Text="設變流水碼"  meta:resourcekey="Label73Resource1"
                                                                                                                Width="90px"></asp:Label></td>
                                                                                                        <td style="width: 493px; height: 25px;">
                                                                                                            &nbsp;<asp:TextBox ID="R5" runat="server" MaxLength="2" Width="62px"></asp:TextBox></td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                                </div>
                                                                                                <div id="ww19" runat="server" style="text-align: left">
                                                                                                <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; height: 55px;">
                                                                                                    <tr>
                                                                                                        <td style="width: 100px; background-color: gainsboro; height: 25px;">
                                                                                                            <span style="color: #ff0033">*</span><asp:Label ID="Label74" runat="server" Font-Bold="True" Font-Size="10pt" Text="19零件別"  meta:resourcekey="Label74Resource1"
                                                                                                                Width="90px"></asp:Label></td>
                                                                                                        <td style="width: 493px; height: 25px;">
                                                                                                            &nbsp;<input id="S3" name="S3" style="border-left-color: gainsboro;
                                                                                                    border-bottom-color: gainsboro; width: 100px; border-top-style: solid; border-top-color: gainsboro;
                                                                                                    border-right-style: solid; border-left-style: solid; background-color: whitesmoke;
                                                                                                    border-right-color: gainsboro; border-bottom-style: solid" type="textbox" />
                                                                                                            <input id="S3_2" name="S3_2"  disabled="disabled" style="border-left-color: gainsboro;
                                                                                                    border-bottom-color: gainsboro; width: 256px; border-top-style: solid; border-top-color: gainsboro;
                                                                                                    border-right-style: solid; border-left-style: solid; background-color: whitesmoke;
                                                                                                    border-right-color: gainsboro; border-bottom-style: solid" type="textbox" /></td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td style="width: 100px; background-color: gainsboro; height: 25px;">
                                                                                                            <span style="color: #ff0033">*</span><asp:Label ID="Label75" runat="server" Font-Bold="True" Font-Size="10pt" Text="料別"  meta:resourcekey="Label75Resource1"
                                                                                                                Width="90px"></asp:Label></td>
                                                                                                        <td style="width: 493px; height: 25px;">
                                                                                                            &nbsp;<asp:TextBox ID="S5" runat="server" MaxLength="1" Width="45px"></asp:TextBox></td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td style="width: 100px; height: 25px; background-color: gainsboro">
                                                                                                            <span style="color: #ff0033">*</span><asp:Label ID="Label5s" runat="server" Font-Bold="True" Font-Size="10pt" Text="套別"  meta:resourcekey="Label5sResource1"
                                                                                                                Width="90px"></asp:Label></td>
                                                                                                        <td style="width: 493px; height: 25px">
                                                                                                            &nbsp;<asp:TextBox ID="S6" runat="server" MaxLength="1" Width="45px"></asp:TextBox></td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                                </div>
                                                                                                <div id="ww20" runat="server" style="text-align: left">
                                                                                                <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; height: 24px;">
                                                                                                <tr>
                                                                                                        <td style="width: 100px; background-color: gainsboro; height: 25px;">
                                                                                                            <span style="color: #ff0033">*</span><asp:Label ID="Label5SX" runat="server" Font-Bold="True" Font-Size="10pt" Text="20流水碼(非必填)"  meta:resourcekey="Label5SXResource1"
                                                                                                                Width="90px"></asp:Label></td>
                                                                                                        <td style="width: 493px; height: 25px;">
                                                                                                            &nbsp;<asp:TextBox ID="T4" runat="server" MaxLength="2" Width="40px"></asp:TextBox></td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td style="width: 100px; background-color: gainsboro; height: 25px;">
                                                                                                            <span style="color: #ff0033">*</span><asp:Label ID="Label76" runat="server" Font-Bold="True" Font-Size="10pt" Text="設變流水碼"  meta:resourcekey="Label76Resource1"
                                                                                                                Width="90px"></asp:Label></td>
                                                                                                        <td style="width: 493px; height: 25px;">
                                                                                                            &nbsp;<asp:TextBox ID="T5" runat="server" MaxLength="2" Width="40px"></asp:TextBox></td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                                </div>
                                                                                                <div id="ww21" runat="server" style="text-align: left">
                                                                                                <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; height: 24px;">
                                                                                                    <tr>
                                                                                                        <td style="width: 100px; background-color: gainsboro; height: 25px;">
                                                                                                            <span style="color: #ff0033">*</span><asp:Label ID="Label77" runat="server" Font-Bold="True" Font-Size="10pt" Text="21產品種類"  meta:resourcekey="Label77Resource1"
                                                                                                                Width="90px"></asp:Label></td>
                                                                                                        <td style="width: 493px; height: 25px;">
                                                                                                            &nbsp;<asp:DropDownList ID="U3" runat="server" meta:resourcekey="FIELD_class_noResource1"
                                                                                                    Width="115px">
                                                                                                                <asp:ListItem></asp:ListItem>
                                                                                                            </asp:DropDownList></td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                                </div>
                                                                                                <div id="ww22" runat="server" style="text-align: left">
                                                                                                <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; height: 55px;">
                                                                                                    <tr>
                                                                                                        <td style="width: 100px; background-color: gainsboro; height: 25px;">
                                                                                                            <span style="color: #ff0033">*</span><asp:Label ID="Label78" runat="server" Font-Bold="True" Font-Size="10pt" Text="22電子料種類"  meta:resourcekey="Label78Resource1"
                                                                                                                Width="90px"></asp:Label></td>
                                                                                                        <td style="width: 493px; height: 25px;">
                                                                                                            &nbsp;<asp:DropDownList ID="V4" runat="server" meta:resourcekey="FIELD_class_noResource1"
                                                                                                    Width="115px">
                                                                                                                <asp:ListItem></asp:ListItem>
                                                                                                            </asp:DropDownList></td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td style="width: 100px; background-color: gainsboro; height: 25px;">
                                                                                                            <span style="color: #ff0033">*</span><asp:Label ID="Label79" runat="server" Font-Bold="True" Font-Size="10pt" Text="電子類編碼"  meta:resourcekey="Label79Resource1"
                                                                                                                Width="90px"></asp:Label></td>
                                                                                                        <td style="width: 493px; height: 25px;">
                                                                                                            &nbsp;<asp:TextBox ID="V5" runat="server" MaxLength="12" Width="180px"></asp:TextBox></td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                                </div>
                                                                                                <div id="ww23" runat="server" style="text-align: left">
                                                                                                <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; height: 24px;">
                                                                                                    <tr>
                                                                                                        <td style="width: 100px; background-color: gainsboro; height: 25px;">
                                                                                                            <span style="color: #ff0033">*</span><asp:Label ID="Label80" runat="server" Font-Bold="True" Font-Size="10pt" Text="23客戶圖號"  meta:resourcekey="Label80Resource1"
                                                                                                                Width="90px"></asp:Label></td>
                                                                                                        <td style="width: 493px; height: 25px;">
                                                                                                            &nbsp;<asp:TextBox ID="W2" runat="server" MaxLength="19" Width="180px"></asp:TextBox></td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                                </div>
                                                                                                <div id="ww24" runat="server" style="text-align: left">
                                                                                                <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; height: 55px;">
                                                                                                    <tr>
                                                                                                        <td style="width: 100px; background-color: gainsboro; height: 25px;">
                                                                                                            <span style="color: #ff0033">*</span><asp:Label ID="Label81" runat="server" Font-Bold="True" Font-Size="10pt" Text="24材質區分"  meta:resourcekey="Label81Resource1"
                                                                                                                Width="90px"></asp:Label></td>
                                                                                                        <td style="width: 493px; height: 25px;">
                                                                                                            &nbsp;<asp:DropDownList ID="X3" runat="server" meta:resourcekey="FIELD_class_noResource1"
                                                                                                    Width="115px">
                                                                                                                <asp:ListItem></asp:ListItem>
                                                                                                            </asp:DropDownList></td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td style="width: 100px; background-color: gainsboro; height: 25px;">
                                                                                                            <span style="color: #ff0033">*</span><asp:Label ID="Label82" runat="server" Font-Bold="True" Font-Size="10pt" Text="亮型/型態"  meta:resourcekey="Label82Resource1"
                                                                                                                Width="90px"></asp:Label></td>
                                                                                                        <td style="width: 493px; height: 25px;">
                                                                                                            &nbsp;<asp:DropDownList ID="X4" runat="server" meta:resourcekey="FIELD_class_noResource1"
                                                                                                    Width="115px">
                                                                                                                <asp:ListItem></asp:ListItem>
                                                                                                            </asp:DropDownList></td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td style="width: 100px; background-color: gainsboro; height: 25px;">
                                                                                                            <span style="color: #ff0033">*</span><asp:Label ID="Label83" runat="server" Font-Bold="True" Font-Size="10pt" Text="料厚"  meta:resourcekey="Label83Resource1"
                                                                                                                Width="90px"></asp:Label></td>
                                                                                                        <td style="width: 493px; height: 25px;">
                                                                                                            &nbsp;<asp:TextBox ID="X5" runat="server" MaxLength="4" Width="80px"></asp:TextBox></td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td style="width: 100px; background-color: gainsboro; height: 25px;">
                                                                                                            <span style="color: #ff0033">*</span><asp:Label ID="Label84" runat="server" Font-Bold="True" Font-Size="10pt" Text="料寬"  meta:resourcekey="Label84Resource1"
                                                                                                                Width="90px"></asp:Label></td>
                                                                                                        <td style="width: 493px; height: 25px;">
                                                                                                            &nbsp;<asp:TextBox ID="X6" runat="server" MaxLength="3" Width="62px"></asp:TextBox></td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td style="width: 100px; height: 25px; background-color: gainsboro">
                                                                                                            <span style="color: #ff0033">*</span><asp:Label ID="Label85" runat="server" Font-Bold="True" Font-Size="10pt" Text="硬度"  meta:resourcekey="Label85Resource1"
                                                                                                                Width="90px"></asp:Label></td>
                                                                                                        <td style="width: 493px; height: 25px">
                                                                                                            &nbsp;<asp:TextBox ID="X7" runat="server" MaxLength="2" Width="62px"></asp:TextBox></td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                                </div>
                                                                                                <div id="ww25" runat="server" style="text-align: left">
                                                                                                <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; height: 55px;">
                                                                                                    <tr>
                                                                                                        <td style="width: 100px; background-color: gainsboro; height: 25px;">
                                                                                                            <span style="color: #ff0033">*</span><asp:Label ID="Label86" runat="server" Font-Bold="True" Font-Size="10pt" Text="25材質區分"  meta:resourcekey="Label86Resource1"
                                                                                                                Width="90px"></asp:Label></td>
                                                                                                        <td style="width: 493px">
                                                                                                            &nbsp;<asp:DropDownList ID="Y3" runat="server" meta:resourcekey="FIELD_class_noResource1"
                                                                                                    Width="115px">
                                                                                                                <asp:ListItem></asp:ListItem>
                                                                                                            </asp:DropDownList></td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td style="width: 100px; background-color: gainsboro; height: 25px;">
                                                                                                            <span style="color: #ff0033">*</span><asp:Label ID="Label87" runat="server" Font-Bold="True" Font-Size="10pt" Text="亮型/型態"  meta:resourcekey="Label87Resource1"
                                                                                                                Width="90px"></asp:Label></td>
                                                                                                        <td style="width: 493px">
                                                                                                            &nbsp;<asp:DropDownList ID="Y5" runat="server" meta:resourcekey="FIELD_class_noResource1"
                                                                                                    Width="115px">
                                                                                                                <asp:ListItem></asp:ListItem>
                                                                                                            </asp:DropDownList></td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td style="width: 100px; background-color: gainsboro; height: 25px;">
                                                                                                            <span style="color: #ff0033">*</span><asp:Label ID="Label88" runat="server" Font-Bold="True" Font-Size="10pt" Text="料厚"  meta:resourcekey="Label88Resource1"
                                                                                                                Width="90px"></asp:Label></td>
                                                                                                        <td style="width: 493px">
                                                                                                            &nbsp;<asp:TextBox ID="Y6" runat="server" MaxLength="4" Width="80px"></asp:TextBox></td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td style="width: 100px; background-color: gainsboro; height: 25px;">
                                                                                                            <span style="color: #ff0033">*</span><asp:Label ID="Label89" runat="server" Font-Bold="True" Font-Size="10pt" Text="料寬"  meta:resourcekey="Label89Resource1"
                                                                                                                Width="90px"></asp:Label></td>
                                                                                                        <td style="width: 493px;">
                                                                                                            &nbsp;<asp:TextBox ID="Y7" runat="server" MaxLength="3" Width="62px"></asp:TextBox></td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td style="width: 100px; height: 25px; background-color: gainsboro">
                                                                                                            <span style="color: #ff0033">*</span><asp:Label ID="Label90" runat="server" Font-Bold="True" Font-Size="10pt" Text="硬度"  meta:resourcekey="Label90Resource1"
                                                                                                                Width="90px"></asp:Label></td>
                                                                                                        <td style="width: 493px;">
                                                                                                            &nbsp;<asp:TextBox ID="Y8" runat="server" MaxLength="2" Width="62px"></asp:TextBox></td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                                </div>
                                                                                                <div id="ww26" runat="server" style="text-align: left">
                                                                                                <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; height: 55px;">
                                                                                                    <tr>
                                                                                                        <td style="width: 100px; background-color: gainsboro; height: 25px;">
                                                                                                            <span style="color: #ff0033">*</span><asp:Label ID="Label91" runat="server" Font-Bold="True" Font-Size="10pt" Text="26鐵材材質"  meta:resourcekey="Label91Resource1"
                                                                                                                Width="90px"></asp:Label></td>
                                                                                                        <td style="width: 493px; height: 25px;">
                                                                                                            &nbsp;<asp:DropDownList ID="Z3" runat="server" meta:resourcekey="FIELD_class_noResource1"
                                                                                                    Width="115px">
                                                                                                                <asp:ListItem></asp:ListItem>
                                                                                                            </asp:DropDownList></td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td style="width: 100px; background-color: gainsboro; height: 25px;">
                                                                                                            <span style="color: #ff0033">*</span><asp:Label ID="Label92" runat="server" Font-Bold="True" Font-Size="10pt" Text="膠種"  meta:resourcekey="Label92Resource1"
                                                                                                                Width="90px"></asp:Label></td>
                                                                                                        <td style="width: 493px; height: 25px;">
                                                                                                            &nbsp;<asp:DropDownList ID="Z4" runat="server" meta:resourcekey="FIELD_class_noResource1"
                                                                                                    Width="115px">
                                                                                                                <asp:ListItem></asp:ListItem>
                                                                                                            </asp:DropDownList></td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td style="width: 100px; background-color: gainsboro; height: 25px;">
                                                                                                            <span style="color: #ff0033">*</span><asp:Label ID="Label93" runat="server" Font-Bold="True" Font-Size="10pt" Text="亮型/型態"  meta:resourcekey="Label93Resource1"
                                                                                                                Width="90px"></asp:Label></td>
                                                                                                        <td style="width: 493px; height: 25px;">
                                                                                                            &nbsp;<asp:DropDownList ID="Z5" runat="server" meta:resourcekey="FIELD_class_noResource1"
                                                                                                    Width="115px">
                                                                                                                <asp:ListItem></asp:ListItem>
                                                                                                            </asp:DropDownList></td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td style="width: 100px; background-color: gainsboro; height: 25px;">
                                                                                                            <span style="color: #ff0033">*</span><asp:Label ID="Label94" runat="server" Font-Bold="True" Font-Size="10pt" Text="料厚"  meta:resourcekey="Label94Resource1"
                                                                                                                Width="90px"></asp:Label></td>
                                                                                                        <td style="width: 493px; height: 25px;">
                                                                                                            &nbsp;<asp:TextBox ID="Z6" runat="server" MaxLength="4" Width="80px"></asp:TextBox></td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td style="width: 100px; background-color: gainsboro; height: 25px;">
                                                                                                            <span style="color: #ff0033">*</span><asp:Label ID="Label95" runat="server" Font-Bold="True" Font-Size="10pt" Text="料寬"  meta:resourcekey="Label95Resource1"
                                                                                                                Width="90px"></asp:Label></td>
                                                                                                        <td style="width: 493px; height: 25px;">
                                                                                                            &nbsp;<asp:TextBox ID="Z7" runat="server" MaxLength="3" Width="62px"></asp:TextBox></td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td style="width: 100px; height: 25px; background-color: gainsboro">
                                                                                                            <span style="color: #ff0033">*</span><asp:Label ID="Label96" runat="server" Font-Bold="True" Font-Size="10pt" Text="硬度"  meta:resourcekey="Label96Resource1"
                                                                                                                Width="90px"></asp:Label></td>
                                                                                                        <td style="width: 493px; height: 25px">
                                                                                                            &nbsp;<asp:TextBox ID="Z8" runat="server" MaxLength="2" Width="62px"></asp:TextBox></td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                                </div>
                                                                                                
                                                                                                <div id="ww27" runat="server" style="text-align: left">
                                                                                                <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; height: 55px;">
                                                                                                    <tr>
                                                                                                        <td style="width: 100px; background-color: gainsboro; height: 25px;">
                                                                                                            <span style="color: #ff0033">*</span><asp:Label ID="Label97" runat="server" Font-Bold="True" Font-Size="10pt" Text="27零件別"  meta:resourcekey="Label97Resource1"
                                                                                                                Width="90px"></asp:Label></td>
                                                                                                        <td style="width: 493px; height: 25px;">
                                                                                                            &nbsp;<input id="AA7" name="AA7" style="border-left-color: gainsboro;
                                                                                                    border-bottom-color: gainsboro; width: 100px; border-top-style: solid; border-top-color: gainsboro;
                                                                                                    border-right-style: solid; border-left-style: solid; background-color: whitesmoke;
                                                                                                    border-right-color: gainsboro; border-bottom-style: solid" type="textbox" />
                                                                                                            <input id="AA7_2" name="AA7_2"  disabled="disabled" style="border-left-color: gainsboro;
                                                                                                    border-bottom-color: gainsboro; width: 256px; border-top-style: solid; border-top-color: gainsboro;
                                                                                                    border-right-style: solid; border-left-style: solid; background-color: whitesmoke;
                                                                                                    border-right-color: gainsboro; border-bottom-style: solid" type="textbox" /></td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td style="width: 100px; background-color: gainsboro; height: 25px;">
                                                                                                            <span style="color: #ff0033">*</span><asp:Label ID="Label98" runat="server" Font-Bold="True" Font-Size="10pt" Text="版次"  meta:resourcekey="Label98Resource1"
                                                                                                                Width="90px"></asp:Label></td>
                                                                                                        <td style="width: 493px; height: 25px;">
                                                                                                            &nbsp;<asp:TextBox ID="AA8" runat="server" MaxLength="2" Width="62px"></asp:TextBox></td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td style="width: 100px; background-color: gainsboro; height: 25px;">
                                                                                                            <span style="color: #ff0033">*</span><asp:Label ID="Label99" runat="server" Font-Bold="True" Font-Size="10pt" Text="供應商"  meta:resourcekey="Label99Resource1"
                                                                                                                Width="90px"></asp:Label></td>
                                                                                                        <td style="width: 493px; height: 25px;">
                                                                                                            &nbsp;<asp:TextBox ID="AA9" runat="server" MaxLength="2" Width="61px"></asp:TextBox></td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td style="width: 100px; background-color: gainsboro; height: 25px;">
                                                                                                            <span style="color: #ff0033">*</span><asp:Label ID="Label100" runat="server" Font-Bold="True" Font-Size="10pt" Text="回收"  meta:resourcekey="Label100Resource1"
                                                                                                                Width="90px"></asp:Label></td>
                                                                                                        <td style="width: 493px; height: 25px;">
                                                                                                            &nbsp;<asp:TextBox ID="AA10" runat="server" MaxLength="1" Width="33px"></asp:TextBox></td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                                </div>
                                                                                                 <div id="ww28" runat="server" style="text-align: left">
                                                                                                <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; height: 24px;">
                                                                                                    <tr>
                                                                                                        <td style="width: 100px; background-color: gainsboro; height: 25px;">
                                                                                                            <span style="color: #ff0033">*</span><asp:Label ID="Label103" runat="server" Font-Bold="True" Font-Size="10pt" Text="28塑膠種類"  meta:resourcekey="Label103Resource1"
                                                                                                                Width="90px"></asp:Label></td>
                                                                                                        <td style="width: 493px; height: 25px;">
                                                                                                            &nbsp;<asp:DropDownList ID="AB6" runat="server" meta:resourcekey="FIELD_class_noResource1"
                                                                                                    Width="115px">
                                                                                                                <asp:ListItem></asp:ListItem>
                                                                                                            </asp:DropDownList></td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                                </div>
                                                                                                 <div id="ww29" runat="server" style="text-align: left">
                                                                                                    <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; height: 55px;">
                                                                                                        <tr>
                                                                                                            <td style="width: 100px; background-color: gainsboro; height: 25px;">
                                                                                                                <span style="color: #ff0033">*</span><asp:Label ID="Label105" runat="server" Font-Bold="True" Font-Size="10pt" Text="29包材分類"  meta:resourcekey="Label105Resource1"
                                                                                                                    Width="90px"></asp:Label></td>
                                                                                                            <td style="width: 493px; height: 25px;">
                                                                                                                &nbsp;<asp:DropDownList ID="AC2" runat="server" meta:resourcekey="FIELD_class_noResource1"
                                                                                                    Width="115px">
                                                                                                                    <asp:ListItem></asp:ListItem>
                                                                                                                </asp:DropDownList></td>
                                                                                                        </tr>
                                                                                                        <tr>
                                                                                                            <td style="width: 100px; background-color: gainsboro; height: 25px;">
                                                                                                                <span style="color: #ff0033">*</span><asp:Label ID="Label106" runat="server" Font-Bold="True" Font-Size="10pt" Text="是否為硬碟"  meta:resourcekey="Label106Resource1"
                                                                                                                    Width="90px"></asp:Label></td>
                                                                                                            <td style="width: 493px; height: 25px;">
                                                                                                                &nbsp;<asp:DropDownList ID="AC4" runat="server" meta:resourcekey="FIELD_class_noResource1"
                                                                                                    Width="115px">
                                                                                                                    <asp:ListItem></asp:ListItem>
                                                                                                                    <asp:ListItem Value="1">Y</asp:ListItem>
                                                                                                                    <asp:ListItem Value="2">N</asp:ListItem>
                                                                                                                </asp:DropDownList></td>
                                                                                                        </tr>
                                                                                                        <tr>
                                                                                                            <td style="width: 100px; background-color: gainsboro; height: 25px;">
                                                                                                                <span style="color: #ff0033">*</span><asp:Label ID="Label104" runat="server" Font-Bold="True" Font-Size="10pt" Text="版次"  meta:resourcekey="Label104Resource1"
                                                                                                                    Width="90px"></asp:Label></td>
                                                                                                            <td style="width: 493px; height: 25px;">
                                                                                                                &nbsp;<asp:TextBox ID="AC6" runat="server" MaxLength="2" Width="61px"></asp:TextBox></td>
                                                                                                        </tr>
                                                                                                        <tr>
                                                                                                            <td style="width: 100px; background-color: gainsboro; height: 25px;">
                                                                                                                <span style="color: #ff0033">*</span><asp:Label ID="Label107" runat="server" Font-Bold="True" Font-Size="10pt" Text="料別"  meta:resourcekey="Label107Resource1"
                                                                                                                    Width="90px"></asp:Label></td>
                                                                                                            <td style="width: 493px; height: 25px;">
                                                                                                                &nbsp;<asp:TextBox ID="AC7" runat="server" MaxLength="1" Width="33px"></asp:TextBox></td>
                                                                                                        </tr>
                                                                                                    </table>
                                                                                                     </div>
                                                                                                     
                                                                                                    
                                                                                               
                                                                                                  <div id="ww30" runat="server" style="text-align: left">
                                                                                                <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; height: 55px;">
                                                                                                   
                                                                                                        <tr>
                                                                                                            <td style="width: 100px; height: 25px; background-color: gainsboro">
                                                                                                                <asp:Label ID="Label108" runat="server" Font-Bold="True" Font-Size="10pt" meta:resourcekey="Label86Resource1"
                                                                                                                    Text="30材質區分" Width="90px"></asp:Label></td>
                                                                                                            <td style="width: 493px; height: 25px">
                                                                                                                <asp:DropDownList ID="AD3" runat="server" meta:resourcekey="FIELD_class_noResource1"
                                                                                                    Width="115px">
                                                                                                                    <asp:ListItem></asp:ListItem>
                                                                                                                </asp:DropDownList></td>
                                                                                                        </tr>
                                                                                                        <tr>
                                                                                                            <td style="width: 100px; height: 25px; background-color: gainsboro">
                                                                                                                <asp:Label ID="Label109" runat="server" Font-Bold="True" Font-Size="10pt" meta:resourcekey="Label87Resource1"
                                                                                                                    Text="亮型/型態" Width="90px"></asp:Label></td>
                                                                                                            <td style="width: 493px; height: 25px">
                                                                                                                <asp:DropDownList ID="AD5" runat="server" meta:resourcekey="FIELD_class_noResource1"
                                                                                                    Width="115px">
                                                                                                                    <asp:ListItem></asp:ListItem>
                                                                                                                </asp:DropDownList></td>
                                                                                                        </tr>
                                                                                                        <tr>
                                                                                                            <td style="width: 100px; height: 25px; background-color: gainsboro">
                                                                                                                <asp:Label ID="Label110" runat="server" Font-Bold="True" Font-Size="10pt" meta:resourcekey="Label88Resource1"
                                                                                                                    Text="料厚" Width="90px"></asp:Label></td>
                                                                                                            <td style="width: 493px; height: 25px">
                                                                                                                <asp:TextBox ID="AD6" runat="server" MaxLength="4" Width="80px"></asp:TextBox></td>
                                                                                                        </tr>
                                                                                                        <tr>
                                                                                                            <td style="width: 100px; height: 25px; background-color: gainsboro">
                                                                                                                <asp:Label ID="Label111" runat="server" Font-Bold="True" Font-Size="10pt" meta:resourcekey="Label89Resource1"
                                                                                                                    Text="料寬" Width="90px"></asp:Label></td>
                                                                                                            <td style="width: 493px; height: 25px">
                                                                                                                <asp:TextBox ID="AD7" runat="server" MaxLength="3" Width="62px"></asp:TextBox></td>
                                                                                                        </tr>
                                                                                                        <tr>
                                                                                                            <td style="width: 100px; height: 25px; background-color: gainsboro">
                                                                                                                <asp:Label ID="Label112" runat="server" Font-Bold="True" Font-Size="10pt" meta:resourcekey="Label90Resource1"
                                                                                                                    Text="硬度" Width="90px"></asp:Label></td>
                                                                                                            <td style="width: 493px; height: 25px">
                                                                                                                <asp:TextBox ID="AD8" runat="server" MaxLength="2" Width="62px"></asp:TextBox></td>
                                                                                                        </tr>
                                                                                                        <tr>
                                                                                                            <td style="width: 100px; height: 25px; background-color: gainsboro">
                                                                                                            </td>
                                                                                                            <td style="width: 493px; height: 25px">
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                        <tr>
                                                                                                            <td style="width: 100px; height: 25px; background-color: gainsboro">
                                                                                                            </td>
                                                                                                            <td style="width: 493px; height: 25px">
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                        <tr>
                                                                                                            <td style="width: 100px; height: 25px; background-color: gainsboro">
                                                                                                            </td>
                                                                                                            <td style="width: 493px; height: 25px">
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                    </table>
                                                                                                     </div>
                                                                                               
                                                                                               
                                                                                               
                                                                                                
                                                                                               
                                                                                                </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                        <br />
                                                                        <br />
                                                                        <br />
                                                                        <br />
                                                                    </td>
                                                                    <td style="width: 600px; height: 225px; font-size: 12pt;">
                                                                        <table border="0" style="border-right: goldenrod 1px solid; border-top: goldenrod 1px solid;
                                                                            border-left: goldenrod 1px solid; width: 100%; border-bottom: goldenrod 1px solid;
                                                                            height: 100%">
                                                                            <tr>
                                                                                <td style="width: 50%; height: 100px; vertical-align: top; text-align: right;">
                                                                                    <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; height: 370px">
                                                                                        <tr>
                                                                                            <td colspan="2" style="height: 20px; background-color: #ffcc66">
                                                                                                <asp:Label ID="Label31" runat="server" Font-Bold="True" Font-Size="11pt" meta:resourcekey="Label31Resource1"
                                                                                                    Text="帳務資料"></asp:Label></td>
                                                                                        </tr>
                                                                                        <tr style="font-size: 12pt">
                                                                                            <td style="height: 20px; background-color: gainsboro">
                                                                                                <span style="color: #ff0033">*</span><asp:Label ID="Label27" runat="server" Font-Bold="True" Font-Size="10pt" meta:resourcekey="Label27Resource1"
                                                                                                    Text="閒置分群" Width="90px"></asp:Label></td>
                                                                                            <td>
                                                                                                <asp:UpdatePanel ID="UpdatePanel11" runat="server">
                                                                                                    <ContentTemplate>
                                                                                                        <asp:DropDownList ID="FIELD_idel" runat="server" meta:resourcekey="FIELD_class_noResource1"
                                                                                                            Width="115px">
                                                                                                            <asp:ListItem></asp:ListItem>
                                                                                                        </asp:DropDownList>
                                                                                                    </ContentTemplate>
                                                                                                </asp:UpdatePanel>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td style="height: 20px; background-color: gainsboro">
                                                                                                <span style="color: #ff0033">*</span><asp:Label ID="Label28" runat="server" Font-Bold="True" Font-Size="10pt" meta:resourcekey="Label28Resource1"
                                                                                                    Text="產品大類" Width="90px"></asp:Label></td>
                                                                                            <td>
                                                                                                <asp:UpdatePanel ID="UpdatePanel12" runat="server">
                                                                                                    <ContentTemplate>
                                                                                                        <asp:DropDownList ID="FIELD_cate1" runat="server" meta:resourcekey="FIELD_class_noResource1"
                                                                                                            Width="115px">
                                                                                                            <asp:ListItem></asp:ListItem>
                                                                                                        </asp:DropDownList>
                                                                                                    </ContentTemplate>
                                                                                                </asp:UpdatePanel>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td style="height: 20px; background-color: gainsboro">
                                                                                                <span style="color: #ff0033">*</span><asp:Label ID="Label41" runat="server" Font-Bold="True" Font-Size="10pt" meta:resourcekey="Label41Resource1"
                                                                                                    Text="產品中類" Width="90px"></asp:Label></td>
                                                                                            <td>
                                                                                                <asp:UpdatePanel ID="UpdatePanel13" runat="server">
                                                                                                    <ContentTemplate>
                                                                                                        <asp:DropDownList ID="FIELD_cate2" runat="server" meta:resourcekey="FIELD_class_noResource1"
                                                                                                            Width="115px">
                                                                                                            <asp:ListItem></asp:ListItem>
                                                                                                        </asp:DropDownList>
                                                                                                    </ContentTemplate>
                                                                                                </asp:UpdatePanel>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td style="height: 20px; background-color: gainsboro">
                                                                                                &nbsp;
                                                                                                <asp:Label ID="Label42" runat="server" Font-Bold="True" Font-Size="10pt" meta:resourcekey="Label42Resource1"
                                                                                                    Text="產品小類" Width="90px"></asp:Label></td>
                                                                                            <td>
                                                                                                &nbsp;<input id="cate3" name="cate3" style="border-left-color: gainsboro; border-bottom-color: gainsboro;
                                                                                                    width: 93px; border-top-style: solid; border-top-color: gainsboro; border-right-style: solid;
                                                                                                    border-left-style: solid; background-color: whitesmoke; border-right-color: gainsboro;
                                                                                                    border-bottom-style: solid" type="textbox" />
                                                                                                <input id="cate3_2" name="cate3_2"   style="border-left-color: gainsboro; border-bottom-color: gainsboro;
                                                                                                    width: 207px; border-top-style: solid; border-top-color: gainsboro; border-right-style: solid;
                                                                                                    border-left-style: solid; background-color: whitesmoke; border-right-color: gainsboro;
                                                                                                    border-bottom-style: solid" type="textbox" /></td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td style="height: 20px; background-color: gainsboro">
                                                                                                &nbsp;
                                                                                                <asp:Label ID="Label43" runat="server" Font-Bold="True" Font-Size="10pt" meta:resourcekey="Label43Resource1"
                                                                                                    Text="預測料號/品名/規格" Width="123px"></asp:Label></td>
                                                                                            <td>
                                                                                                &nbsp;<input id="f_partno" name="f_partno" style="border-left-color: gainsboro; border-bottom-color: gainsboro;
                                                                                                    width: 128px; border-top-style: solid; border-top-color: gainsboro; border-right-style: solid;
                                                                                                    border-left-style: solid; background-color: whitesmoke; border-right-color: gainsboro;
                                                                                                    border-bottom-style: solid" type="textbox" />
                                                                                                <input id="f_component" name="f_component"  style="border-left-color: gainsboro; border-bottom-color: gainsboro;
                                                                                                    width: 159px; border-top-style: solid; border-top-color: gainsboro; border-right-style: solid;
                                                                                                    border-left-style: solid; background-color: whitesmoke; border-right-color: gainsboro;
                                                                                                    border-bottom-style: solid" type="textbox" />
                                                                                                <input id="f_dwg" name="f_dwg"   style="border-left-color: gainsboro; border-bottom-color: gainsboro;
                                                                                                    width: 159px; border-top-style: solid; border-top-color: gainsboro; border-right-style: solid;
                                                                                                    border-left-style: solid; background-color: whitesmoke; border-right-color: gainsboro;
                                                                                                    border-bottom-style: solid" type="textbox" />&nbsp;
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td style="height: 20px; background-color: gainsboro">
                                                                                                &nbsp;
                                                                                                <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Size="10pt" meta:resourcekey="Label8Resource1"
                                                                                                    Text="自製產品代碼" Width="90px"></asp:Label></td>
                                                                                            <td>
                                                                                                &nbsp;<input id="Homemade_code" name="Homemade_code" style="border-left-color: gainsboro;
                                                                                                    border-bottom-color: gainsboro; width: 95px; border-top-style: solid; border-top-color: gainsboro;
                                                                                                    border-right-style: solid; border-left-style: solid; background-color: whitesmoke;
                                                                                                    border-right-color: gainsboro; border-bottom-style: solid" type="textbox" />
                                                                                                <input id="Homemade_code2"  disabled="disabled" name="Homemade_code2" style="border-left-color: gainsboro;
                                                                                                    border-bottom-color: gainsboro; width: 327px; border-top-style: solid; border-top-color: gainsboro;
                                                                                                    border-right-style: solid; border-left-style: solid; background-color: whitesmoke;
                                                                                                    border-right-color: gainsboro; border-bottom-style: solid" type="textbox" /></td>
                                                                                        </tr>
                                                                                        
                                                                                        
                                                                                          <tr>
                                                                                            <td style="height: 20px; background-color: gainsboro">
                                                                                                &nbsp;
                                                                                                <asp:Label ID="LabCus" runat="server" Font-Bold="True" Font-Size="10pt" Text="客戶料號"></asp:Label></td>
                                                                                            <td>
                                                                                               
                                                                                                        &nbsp;<input id="TextCusSn"  name="TextCusSn" style="border-left-color: gainsboro;
                                                                                                    border-bottom-color: gainsboro; width: 200px; border-top-style: solid; border-top-color: gainsboro;
                                                                                                    border-right-style: solid; border-left-style: solid; background-color: whitesmoke;
                                                                                                    border-right-color: gainsboro; border-bottom-style: solid" type="textbox" />
                                                                                                  
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td style="height: 22px; background-color: gainsboro">
                                                                                                &nbsp;
                                                                                                <asp:Label ID="Label13" runat="server" Font-Bold="True" Font-Size="10pt" Text="版本"></asp:Label></td>
                                                                                            <td style="height: 22px">
                                                                                               
                                                                                                        &nbsp;<input id="TextCusVer"  name="TextCusVer" style="border-left-color: gainsboro;
                                                                                                    border-bottom-color: gainsboro; width: 200px; border-top-style: solid; border-top-color: gainsboro;
                                                                                                    border-right-style: solid; border-left-style: solid; background-color: whitesmoke;
                                                                                                    border-right-color: gainsboro; border-bottom-style: solid" type="textbox" />
                                                                                                   
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td style="height: 20px; background-color: gainsboro">
                                                                                                &nbsp;&nbsp;<br />
                                                                                                &nbsp;<asp:Label ID="Label114" runat="server" Font-Bold="True" Font-Size="10pt" Text="廠牌/廠牌名稱"></asp:Label></td>
                                                                                            <td>
                                                                                                &nbsp;<input id="TextFacSn" name="TextFacSn" style="border-left-color: gainsboro;
                                                                                                    border-bottom-color: gainsboro; width: 95px; border-top-style: solid; border-top-color: gainsboro;
                                                                                                    border-right-style: solid; border-left-style: solid; background-color: whitesmoke;
                                                                                                    border-right-color: gainsboro; border-bottom-style: solid" type="textbox" /><input id="TextFacSn2" name="TextFacSn2"  disabled="disabled" style="border-left-color: gainsboro;
                                                                                                    border-bottom-color: gainsboro; width: 327px; border-top-style: solid; border-top-color: gainsboro;
                                                                                                    border-right-style: solid; border-left-style: solid; background-color: whitesmoke;
                                                                                                    border-right-color: gainsboro; border-bottom-style: solid" type="textbox" /></td>
                                                                                        </tr>
                                                                                        
                                                                                        
                                                                                        
                                                                                        
                                                                                        
                                                                                        
                                                                                        
                                                                                        
                                                                                        
                                                                                        
                                                                                        <tr>
                                                                                            <td style="height: 50px; background-color: gainsboro">
                                                                                                &nbsp;
                                                                                                <asp:Label ID="Label108x" runat="server" Font-Bold="True" Font-Size="10pt" meta:resourcekey="remark"
                                                                                                    Text="備註" Width="90px"></asp:Label></td>
                                                                                            <td>
                                                                                                <asp:UpdatePanel ID="UpdatePanel14" runat="server">
                                                                                                    <ContentTemplate>
                                                                                                        <SmoothEnterpriseWebControl:InputText ID="FIELD_remark" runat="server" Height="67px"
                                                                                                            TextMode="MultiLine" Width="430px">
                                                                                                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                                                                                                            <Gradient GradientBegin="" GradientEnd="" />
                                                                                                        </SmoothEnterpriseWebControl:InputText>
                                                                                                    </ContentTemplate>
                                                                                                </asp:UpdatePanel>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            </div>
                                                        <div id="w_all2" runat="server" style="text-align: left">
                                                    <asp:UpdatePanel ID="UpdatePanel18" runat="server">
                                                        <ContentTemplate>
                                                    <SmoothEnterpriseWebControl:InputButton ID="Button_AddItem" runat="server" BackColor="#C8C8C8" 
 
                                                        BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold"
                                                        Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="Button_AddItem_Click"
                                                        Text="Add Item" Width="80px"  >
                                                        <Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" />
                                                    </SmoothEnterpriseWebControl:InputButton><SmoothEnterpriseWebControl:InputButton
                                                        ID="Button_UpdateItem" runat="server" BackColor="#C8C8C8" BorderColor="#606060"
                                                        BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" Font-Bold="True"
                                                        Font-Names="Arial" Font-Size="12px" OnClick="Button_UpdateItem_Click" Text="Update Item" 
                                                        Width="80px">
                                                        <Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" />
                                                    </SmoothEnterpriseWebControl:InputButton>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                          
                                                       </div>
                                                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                                        <ContentTemplate>
                                                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="3"
                                                        DataKeyNames="item,elapsedTicks" DataSourceID="SqlDataSource1" Font-Size="10pt" GridLines="None" Height="1px" OnRowDataBound="GridView1_RowDataBound"
                                                        OnRowDeleting="GridView1_RowDeleting" Width="1250px" OnRowCommand="GridView1_RowCommand" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellSpacing="1" >
                                                        <Columns>
                                                           <asp:CommandField ButtonType="Image" DeleteImageUrl="~/shipment/img/button_drop.png"
                                                                            ShowDeleteButton="True" >
                                                                            <ItemStyle HorizontalAlign="Center"  />
                                                                        </asp:CommandField>
                                                            <asp:buttonfield buttontype="Image"  ImageUrl="~/shipment/img/edit.gif"
                                                              commandname="editA" 
                                                              />
                                                              
                                                            
                                                            <asp:buttonfield buttontype="Image"  ImageUrl="~/shipment/img/page_copy.png"
                                                              commandname="Add" 
                                                               />



                                                                                                                       <asp:BoundField DataField="no" HeaderText="no" SortExpression="no"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="item" HeaderText="item" ReadOnly="True" SortExpression="item" />
                                                            <asp:BoundField DataField="elapsedTicks" HeaderText="elapsedTicks" ReadOnly="True"
                                                                SortExpression="elapsedTicks" > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="group_code" HeaderText="group_code" SortExpression="group_code"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="product_class" HeaderText="product_class" SortExpression="product_class"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="cate1" HeaderText="cate1" SortExpression="cate1"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="cate2" HeaderText="cate2" SortExpression="cate2"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="cate3" HeaderText="cate3" SortExpression="cate3"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="cate3_2" HeaderText="cate3_2" SortExpression="cate3_2"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="idle" HeaderText="idle" SortExpression="idle"   > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="p_plantid" HeaderText="生產廠區" SortExpression="p_plantid" meta:resourcekey="p_plantid"  />
                                                            <asp:BoundField DataField="partno" HeaderText="料號" SortExpression="partno" meta:resourcekey="partno"  /> 
                                                            <asp:BoundField DataField="component" HeaderText="品名" SortExpression="component" meta:resourcekey="component" />
                                                            <asp:BoundField DataField="dwg" HeaderText="規格" SortExpression="dwg" meta:resourcekey="dwg" />
                                                            <asp:BoundField DataField="f_partno" HeaderText="預測料號" SortExpression="f_partno" meta:resourcekey="f_partno" />
                                                            <asp:BoundField DataField="f_component" HeaderText="f_component" SortExpression="f_component"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="f_dwg" HeaderText="f_dwg" SortExpression="f_dwg"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="unit" HeaderText="庫存單位" SortExpression="unit" meta:resourcekey="unit"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="hsf" HeaderText="HSF" SortExpression="hsf"   > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="source_code" HeaderText="來源碼" SortExpression="source_code" meta:resourcekey="source_code"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="homemade_code" HeaderText="homemade_code" SortExpression="homemade_code"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="homemade_code2" HeaderText="homemade_code2" SortExpression="homemade_code2"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="technology_code" HeaderText="technology_code" SortExpression="technology_code"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="technology_code2" HeaderText="technology_code2" SortExpression="technology_code2"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="iqc" HeaderText="IQC" SortExpression="iqc"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="erp_identical" HeaderText="erp_identical" SortExpression="erp_identical"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="coding_class" HeaderText="coding_class" SortExpression="coding_class"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="Customers_class" HeaderText="Customers_class" SortExpression="Customers_class"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="Customers_class2" HeaderText="Customers_class2" SortExpression="Customers_class2"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="Model_class" HeaderText="Model_class" SortExpression="Model_class"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="Model_class2" HeaderText="Model_class2" SortExpression="Model_class2"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="group_code2" HeaderText="group_code2" SortExpression="group_code2"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="A1" HeaderText="A1" SortExpression="A1"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="A2" HeaderText="A2" SortExpression="A2"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="A3" HeaderText="A3" SortExpression="A3"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="A3_2" HeaderText="A3_2" SortExpression="A3_2"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="A4" HeaderText="A4" SortExpression="A4"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="A5" HeaderText="A5" SortExpression="A5"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="A6" HeaderText="A6" SortExpression="A6"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="A6_2" HeaderText="A6_2" SortExpression="A6_2"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="A7" HeaderText="A7" SortExpression="A7"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="A7_2" HeaderText="A7_2" SortExpression="A7_2"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="A8" HeaderText="A8" SortExpression="A8"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="A9" HeaderText="A9" SortExpression="A9"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="B1" HeaderText="B1" SortExpression="B1"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="B2" HeaderText="B2" SortExpression="B2"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="B3" HeaderText="B3" SortExpression="B3"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="B4" HeaderText="B4" SortExpression="B4"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="B5" HeaderText="B5" SortExpression="B5"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="C1" HeaderText="C1" SortExpression="C1"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="C2" HeaderText="C2" SortExpression="C2"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="C3" HeaderText="C3" SortExpression="C3"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="D1" HeaderText="D1" SortExpression="D1"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="D2" HeaderText="D2" SortExpression="D2"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="E1" HeaderText="E1" SortExpression="E1"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="E2" HeaderText="E2" SortExpression="E2"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="E2_2" HeaderText="E2_2" SortExpression="E2_2"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="E3" HeaderText="E3" SortExpression="E3"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="E3_2" HeaderText="E3_2" SortExpression="E3_2"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="E4" HeaderText="E4" SortExpression="E4"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="E5" HeaderText="E5" SortExpression="E5"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="F1" HeaderText="F1" SortExpression="F1"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="F2" HeaderText="F2" SortExpression="F2"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="F2_2" HeaderText="F2_2" SortExpression="F2_2"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="F3" HeaderText="F3" SortExpression="F3"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="F3_2" HeaderText="F3_2" SortExpression="F3_2"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="F4" HeaderText="F4" SortExpression="F4"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="F5" HeaderText="F5" SortExpression="F5"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="G1" HeaderText="G1" SortExpression="G1"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="G2" HeaderText="G2" SortExpression="G2"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="G2_2" HeaderText="G2_2" SortExpression="G2_2"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="G3" HeaderText="G3" SortExpression="G3"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="G3_2" HeaderText="G3_2" SortExpression="G3_2"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="G4" HeaderText="G4" SortExpression="G4"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="G5" HeaderText="G5" SortExpression="G5"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="G6" HeaderText="G6" SortExpression="G6"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="H1" HeaderText="H1" SortExpression="H1"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="H2" HeaderText="H2" SortExpression="H2"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="I1" HeaderText="I1" SortExpression="I1"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="I2" HeaderText="I2" SortExpression="I2"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="I3" HeaderText="I3" SortExpression="I3"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="I4" HeaderText="I4" SortExpression="I4"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="I5" HeaderText="I5" SortExpression="I5"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="I6" HeaderText="I6" SortExpression="I6"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="I7" HeaderText="I7" SortExpression="I7"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="I8" HeaderText="I8" SortExpression="I8"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="J1" HeaderText="J1" SortExpression="J1"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="J2" HeaderText="J2" SortExpression="J2"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="J3" HeaderText="J3" SortExpression="J3"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="J4" HeaderText="J4" SortExpression="J4"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="J5" HeaderText="J5" SortExpression="J5"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="J6" HeaderText="J6" SortExpression="J6"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="K1" HeaderText="K1" SortExpression="K1"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="K2" HeaderText="K2" SortExpression="K2"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="K3" HeaderText="K3" SortExpression="K3"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="K4" HeaderText="K4" SortExpression="K4"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="K5" HeaderText="K5" SortExpression="K5"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="K6" HeaderText="K6" SortExpression="K6"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="K7" HeaderText="K7" SortExpression="K7"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="L1" HeaderText="L1" SortExpression="L1"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="L2" HeaderText="L2" SortExpression="L2"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="L3" HeaderText="L3" SortExpression="L3"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="L4" HeaderText="L4" SortExpression="L4"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="L5" HeaderText="L5" SortExpression="L5"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="L6" HeaderText="L6" SortExpression="L6"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="L7" HeaderText="L7" SortExpression="L7"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="M1" HeaderText="M1" SortExpression="M1"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="M2" HeaderText="M2" SortExpression="M2"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="M3" HeaderText="M3" SortExpression="M3"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="M4" HeaderText="M4" SortExpression="M4"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="M5" HeaderText="M5" SortExpression="M5"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="M6" HeaderText="M6" SortExpression="M6"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="M7" HeaderText="M7" SortExpression="M7"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="M8" HeaderText="M8" SortExpression="M8"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="N1" HeaderText="N1" SortExpression="N1"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="N2" HeaderText="N2" SortExpression="N2"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="N3" HeaderText="N3" SortExpression="N3"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="N4" HeaderText="N4" SortExpression="N4"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="N5" HeaderText="N5" SortExpression="N5"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="N6" HeaderText="N6" SortExpression="N6"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="N7" HeaderText="N7" SortExpression="N7"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="N8" HeaderText="N8" SortExpression="N8"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="O1" HeaderText="O1" SortExpression="O1"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="O2" HeaderText="O2" SortExpression="O2"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="O3" HeaderText="O3" SortExpression="O3"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="O4" HeaderText="O4" SortExpression="O4"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="O5" HeaderText="O5" SortExpression="O5"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="O6" HeaderText="O6" SortExpression="O6"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="P1" HeaderText="P1" SortExpression="P1"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="P2" HeaderText="P2" SortExpression="P2"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="P3" HeaderText="P3" SortExpression="P3"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="P4" HeaderText="P4" SortExpression="P4"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="P5" HeaderText="P5" SortExpression="P5"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="P6" HeaderText="P6" SortExpression="P6"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="P7" HeaderText="P7" SortExpression="P7"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="Q1" HeaderText="Q1" SortExpression="Q1"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="Q2" HeaderText="Q2" SortExpression="Q2"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="Q3" HeaderText="Q3" SortExpression="Q3"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="Q4" HeaderText="Q4" SortExpression="Q4"  meta:resourcekey="Q4"  />
                                                            <asp:BoundField DataField="Q5" HeaderText="Q5" SortExpression="Q5"  meta:resourcekey="Q5"  />
                                                            <asp:BoundField DataField="Q6" HeaderText="Q6" SortExpression="Q6"  meta:resourcekey="Q6"  />
                                                            <asp:BoundField DataField="Q7" HeaderText="Q7" SortExpression="Q7"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="Q8" HeaderText="Q8" SortExpression="Q8"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="R1" HeaderText="R1" SortExpression="R1"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="R2" HeaderText="R2" SortExpression="R2"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="R2_2" HeaderText="R2_2" SortExpression="R2_2"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="R3" HeaderText="R3" SortExpression="R3"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="R3_2" HeaderText="R3_2" SortExpression="R3_2"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="R4" HeaderText="R4" SortExpression="R4"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="R5" HeaderText="R5" SortExpression="R5"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="S1" HeaderText="S1" SortExpression="S1"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="S2" HeaderText="S2" SortExpression="S2"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="S2_2" HeaderText="S2_2" SortExpression="S2_2"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="S3" HeaderText="S3" SortExpression="S3"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="S3_2" HeaderText="S3_2" SortExpression="S3_2"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="S4" HeaderText="S4" SortExpression="S4"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="S5" HeaderText="S5" SortExpression="S5"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="S6" HeaderText="S6" SortExpression="S6"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="T1" HeaderText="T1" SortExpression="T1"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="T2" HeaderText="T2" SortExpression="T2"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="T2_2" HeaderText="T2_2" SortExpression="T2_2"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="T3" HeaderText="T3" SortExpression="T3"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="T3_2" HeaderText="T3_2" SortExpression="T3_2"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="T4" HeaderText="T4" SortExpression="T4"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="T5" HeaderText="T5" SortExpression="T5"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="U1" HeaderText="U1" SortExpression="U1"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="U2" HeaderText="U2" SortExpression="U2"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="U2_2" HeaderText="U2_2" SortExpression="U2_2"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="U3" HeaderText="U3" SortExpression="U3"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="U4" HeaderText="U4" SortExpression="U4"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="U5" HeaderText="U5" SortExpression="U5"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="V1" HeaderText="V1" SortExpression="V1"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="V2" HeaderText="V2" SortExpression="V2"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="V3" HeaderText="V3" SortExpression="V3"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="V4" HeaderText="V4" SortExpression="V4"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="V5" HeaderText="V5" SortExpression="V5"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="W1" HeaderText="W1" SortExpression="W1"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="W2" HeaderText="W2" SortExpression="W2"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="X1" HeaderText="X1" SortExpression="X1"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="X2" HeaderText="X2" SortExpression="X2"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="X3" HeaderText="X3" SortExpression="X3"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="X4" HeaderText="X4" SortExpression="X4"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="X5" HeaderText="X5" SortExpression="X5"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="X6" HeaderText="X6" SortExpression="X6"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="X7" HeaderText="X7" SortExpression="X7"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="X8" HeaderText="X8" SortExpression="X8"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="Y1" HeaderText="Y1" SortExpression="Y1"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="Y2" HeaderText="Y2" SortExpression="Y2"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="Y3" HeaderText="Y3" SortExpression="Y3"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="Y4" HeaderText="Y4" SortExpression="Y4"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="Y5" HeaderText="Y5" SortExpression="Y5"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="Y6" HeaderText="Y6" SortExpression="Y6"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="Y7" HeaderText="Y7" SortExpression="Y7"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="Y8" HeaderText="Y8" SortExpression="Y8"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="Y9" HeaderText="Y9" SortExpression="Y9"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="Z1" HeaderText="Z1" SortExpression="Z1"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="Z2" HeaderText="Z2" SortExpression="Z2"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="Z3" HeaderText="Z3" SortExpression="Z3"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="Z4" HeaderText="Z4" SortExpression="Z4"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="Z5" HeaderText="Z5" SortExpression="Z5"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="Z6" HeaderText="Z6" SortExpression="Z6"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="Z7" HeaderText="Z7" SortExpression="Z7"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="Z8" HeaderText="Z8" SortExpression="Z8"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="Z9" HeaderText="Z9" SortExpression="Z9"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="AA1" HeaderText="AA1" SortExpression="AA1"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="AA2" HeaderText="AA2" SortExpression="AA2"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="AA3" HeaderText="AA3" SortExpression="AA3"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="AA3_2" HeaderText="AA3_2" SortExpression="AA3_2"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="AA4" HeaderText="AA4" SortExpression="AA4"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="AA5" HeaderText="AA5" SortExpression="AA5"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="AA6" HeaderText="AA6" SortExpression="AA6"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="AA6_2" HeaderText="AA6_2" SortExpression="AA6_2"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="AA7" HeaderText="AA7" SortExpression="AA7"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="AA7_2" HeaderText="AA7_2" SortExpression="AA7_2"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="AA8" HeaderText="AA8" SortExpression="AA8"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="AA9" HeaderText="AA9" SortExpression="AA9"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="AA10" HeaderText="AA10" SortExpression="AA10"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="dname" HeaderText="產品別" SortExpression="name" meta:resourcekey="dname" />
                                                            <asp:BoundField DataField="imz02" HeaderText="分群碼" SortExpression="imz02"  meta:resourcekey="imz02"  />
                                                            <asp:BoundField DataField="ename" HeaderText="交易方式" SortExpression="ename"  meta:resourcekey="ename" />
                                                            <asp:BoundField DataField="cname" HeaderText="副分群碼" SortExpression="cname"  meta:resourcekey="cname" />
                                                            <asp:BoundField DataField="remark" HeaderText="備註" SortExpression="remark"  meta:resourcekey="remarka"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="AB1" HeaderText="AB1" SortExpression="AB1"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="AB2" HeaderText="AB2" SortExpression="AB2"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="AB3" HeaderText="AB3" SortExpression="AB3"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="AB4" HeaderText="AB4" SortExpression="AB4"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="AB5" HeaderText="AB5" SortExpression="AB5"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="AB6" HeaderText="AB6" SortExpression="AB6"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="AB7" HeaderText="AB7" SortExpression="AB7"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="AB8" HeaderText="AB8" SortExpression="AB8"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            
                                                            <asp:BoundField DataField="AC1" HeaderText="AC1" SortExpression="AC1"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="AC2" HeaderText="AC2" SortExpression="AC2"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="AC3" HeaderText="AC3" SortExpression="AC3"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="AC4" HeaderText="AC4" SortExpression="AC4"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="AC5" HeaderText="AC5" SortExpression="AC5"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="AC6" HeaderText="AC6" SortExpression="AC6"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="AC7" HeaderText="AC7" SortExpression="AC7"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 

                                                             <asp:BoundField DataField="AD1" HeaderText="AD1" SortExpression="AD1"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="AD2" HeaderText="AD2" SortExpression="AD2"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="AD3" HeaderText="AD3" SortExpression="AD3"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="AD4" HeaderText="AD4" SortExpression="AD4"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="AD5" HeaderText="AD5" SortExpression="AD5"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="AD6" HeaderText="AD6" SortExpression="AD6"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="AD7" HeaderText="AD7" SortExpression="AD7"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="AD8" HeaderText="AD8" SortExpression="AD8"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            
                                                             <asp:BoundField DataField="tc_imi02" HeaderText="tc_imi02" SortExpression="tc_imi02"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                            <asp:BoundField DataField="tc_imi021" HeaderText="tc_imi021" SortExpression="tc_imi021"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                             <asp:BoundField DataField="tc_imi03" HeaderText="tc_imi03" SortExpression="tc_imi03"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                           <asp:BoundField DataField="tc_imi031" HeaderText="tc_imi031" SortExpression="tc_imi031"  > <HeaderStyle CssClass="hiddencol"    />  <ItemStyle CssClass="hiddencol" /> </asp:BoundField> 
                                                           
                                                            
                                                        </Columns>
                                                        <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                                                        <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                                                        <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                                                        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                                                        <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                                                    </asp:GridView>
                                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EIPAConnectionString %>"
                                                        SelectCommand="select no, item, elapsedTicks, group_code, product_class, cate1, cate2, cate3, cate3_2, idle,CASE  WHEN p_plantid ='' THEN p_plantid  
                                                                    ELSE  SUBSTRING(REPLACE(p_plantid,'@', ','), 0, LEN(p_plantid)) END  p_plantid, partno, component, dwg, f_partno, f_component, f_dwg, unit, 
                                                                     hsf, source_code, homemade_code, homemade_code2, technology_code, technology_code2, iqc, erp_identical, coding_class, Customers_class, Customers_class2,  
                                                                    Model_class, Model_class2, group_code2, A1, A2, A3, A3_2, A4, A5, A6, A6_2, A7, A7_2, A8, A9, B1, B2, B3, B4, B5, C1, C2, C3, D1, D2, E1, E2, E2_2, E3, E3_2, E4, E5,  
                                                                    F1, F2, F2_2, F3, F3_2, F4, F5, G1, G2, G2_2, G3, G3_2, G4, G5, G6, H1, H2, I1, I2, I3, I4, I5, I6, I7, I8, J1, J2, J3, J4, J5, J6, K1, K2, K3, K4, K5, K6, K7, L1, L2, L3, L4, L5, 
                                                                    L6, L7, M1, M2, M3, M4, M5, M6, M7, M8, N1, N2, N3, N4, N5, N6, N7, N8, O1, O2, O3, O4, O5, O6, P1, P2, P3, P4, P5, P6, P7, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8, R1, R2, 
                                                                    R2_2, R3, R3_2, R4, R5, S1, S2, S2_2, S3, S3_2, S4, S5, S6, T1, T2, T2_2, T3, T3_2, T4, T5, U1, U2, U2_2, U3, U4, U5, V1, V2, V3, V4, V5, W1, W2, X1, X2, X3, X4, X5, 
                                                                    X6, X7, X8, Y1, Y2, Y3, Y4, Y5, Y6, Y7, Y8, Y9, Z1, Z2, Z3, Z4, Z5, Z6, Z7, Z8, Z9, AA1, AA2, AA3, AA3_2, AA4, AA5, AA6, AA6_2, AA7, AA7_2, AA8, AA9, AA10, 
                                                                    imz02,c.name cname,d.name dname ,e.name ename,remark, AB1, AB2, AB3, AB4, AB5, AB6, AB7, AB8, AC1, AC2, AC3, AB3_2, AC4, AC5, AC6, AC7
                                                                    from eipb.dbo.cimi100_new a 
                                                                    left join  [192.168.0.185].MINAIK.dbo.IMZ_FILE b on a.group_code=imz01 COLLATE Chinese_Taiwan_Stroke_CS_AS 
                                                                    left join  cimi100_base c on c.class_no='Coding_Class' and a.Coding_Class=c.bass_no 
                                                                    left join  cimi100_base d on d.class_no='Product_class' and a.product_class=d.bass_no
                                                                    left join  cimi100_base e on e.class_no='Transaction_class' and a.group_code2=e.bass_no" 
                                                         DeleteCommand="DELETE FROM eipb.dbo.cimi100_new WHERE (item = @item) AND (elapsedTicks = @elapsedTicks)">
                                                        <DeleteParameters>
                                                            <asp:Parameter Name="item" />
                                                            <asp:Parameter Name="elapsedTicks" />
                                                        </DeleteParameters>
                                                    </asp:SqlDataSource>
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
                            <table style="width: 100%">
                                    <tr>
                                        <td colspan="4" style="height: 20px; background-color: slategray; text-align: center">
                                            &nbsp;<asp:Image ID="Image31" runat="server" Height="22px" ImageUrl="~/ERP_CXMT310/img/list.png"
                                                Width="23px" />
                                            <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Names="新細明體" Font-Size="11pt"
                                                ForeColor="MintCream" meta:resourcekey="Label29Resource1" Text="附  加  檔  案"
                                                Width="82px"></asp:Label></td>
                                    </tr>
                                </table>
                                <table border="0" cellpadding="0" cellspacing="0" style="width: 802px; height: 1px">
                                    <tr>
                                        <td style="width: 4px; background-color: gainsboro">
                                            <asp:Label ID="Labe102" runat="server" Font-Bold="True" Font-Size="11pt" Text="附加檔案"  meta:resourcekey="Label29Resource1"
                                                Width="90px"></asp:Label>
                                        </td>
                                        <td colspan="3" style="width: 667px" id="uploadfiles">
                                            <SmoothEnterpriseWebControl:InputFile ID="attach1" runat="server" BackColor="#F0F0F0"
                                                CssClass="Normal" onchange="addfile()">
                                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                            </SmoothEnterpriseWebControl:InputFile>
                                            &nbsp;&nbsp;
                                            <br />
                                            <asp:CheckBoxList ID="CheckBoxFile" runat="server" Font-Size="X-Small">
                                            </asp:CheckBoxList></td>
                                    </tr>
                                </table>
                           <div id="div1" runat="server" style="text-align: left">
                                <table style="width: 100%">
                                    <tr>
                                        <td colspan="4" style="height: 20px; background-color: slategray; text-align: center">
                                            &nbsp;<asp:Image ID="Image1" runat="server" Height="22px" ImageUrl="~/ERP_CXMT310/img/list.png"
                                                Width="23px" />
                                            <asp:Label ID="Label29" runat="server" Font-Bold="True" Font-Names="新細明體" Font-Size="11pt"
                                                ForeColor="MintCream" meta:resourcekey="Label29Resource1x" Text="簽&nbsp;核&nbsp;相&nbsp;關"
                                                Width="82px"></asp:Label></td>
                                    </tr>
                                </table>
                                <table border="0" cellpadding="0" cellspacing="0" style="width: 802px; height: 1px">
                                    <tr>
                                        <td style="width: 4px; background-color: gainsboro">
                                            <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="11pt" Text="所屬文管" meta:resourcekey="Label29Resource1s"
                                                Width="90px"></asp:Label>
                                        </td>
                                        <td colspan="3" style="width: 667px">
                                            <SmoothEnterpriseWebControlEnterprise:PopupUser id="FIELD_DCC" runat="server" BackColor="#F0F0F0"
                                                CssClass="Normal" DisplayField="name" FormatType="InputCombo" FormatValueField="logonid"
                                                Gradient-GradientType="Top" ValueField="id">
                                                <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
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
                <SmoothEnterpriseControlFlowwork:FlowClient ID="FlowClient1" runat="server" TypeName="sharflow12_2.Flowwork.sharflow12_21">
                </SmoothEnterpriseControlFlowwork:FlowClient>
                 <SmoothEnterpriseWebControlFlowwork:FlowFeedbackViewer ID="FlowFeedbackViewer1" runat="server"
                    BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" CssClass="Normal"
                    Font-Size="11px" OnOnLoadHistory="FlowFeedbackViewer1_OnLoadHistory">
                    <Columns>
                        <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="No" CustomKey="" Label=""></SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
                        <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="Node" CustomKey="" Label="">
                        </SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
                        <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="ReviewerPhoto" CustomKey="" Label="">
                        </SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
                        <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="Reviewer" CustomKey="" Label="">
                        </SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
                        <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="Initdate" CustomKey="" Label="">
                        </SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
                        <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="Receivedate" CustomKey="" Label="">
                        </SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
                        <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="Reviewdate" CustomKey="" Label="">
                        </SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
                        <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="Result" CustomKey="" Label="">
                        </SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
                        <SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn FieldName="ResultIcon" CustomKey="" Label="">
                        </SmoothEnterpriseWebControlFlowwork:FlowFeedbackColumn>
                    </Columns>
                    <HistoryTemplate>
                        <SmoothEnterpriseWebControl:InputText ID="Show_Comment" runat="server" BackColor="#F0F0F0"
                            CssClass="Normal" Width="400px" ForeColor="Red">
                            <ErrorStyle BorderStyle="NotSet" />
                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                        </SmoothEnterpriseWebControl:InputText><asp:Image ID="Image1" runat="server" />
                    </HistoryTemplate>
                </SmoothEnterpriseWebControlFlowwork:FlowFeedbackViewer>
            </td>
        </tr>
    </table>
	<table border="0" Class="Normal">
		<tr>
			<td style="height: 24px">
				<SmoothEnterpriseWebControl:InputButton ID="BUTTON_save" runat="server"  meta:resourcekey="BUTTON_saveResource1" Text="儲存" width="80px" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="BUTTON_save_Click"><Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" /></SmoothEnterpriseWebControl:InputButton>&nbsp;&nbsp;<SmoothEnterpriseWebControlFlowwork:SendRequestButton ID="BUTTON_SendRequest" runat="server"
                    BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px"
                    CssClass="NormalBold" Flow="<%# FlowClient1 %>" Font-Bold="True" Font-Names="Arial"
                    Font-Size="12px" gradient-gradienttype="Bottom" Width="60px" Height="22px" OnClick="BUTTON_SendRequest_Click">
                    <Gradient GradientType="Bottom" GradientBegin="" GradientEnd=""></Gradient>
                </SmoothEnterpriseWebControlFlowwork:SendRequestButton>&nbsp;<SmoothEnterpriseWebControlFlowwork:StopRequestButton ID="BUTTON_StopRequest" runat="server"
                    BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px"
                    CssClass="NormalBold" Flow="<%# FlowClient1 %>" Font-Bold="True" Font-Names="Arial"
                    Font-Size="12px" gradient-gradienttype="Bottom" Width="60px" Height="22px" OnClick="BUTTON_StopRequest_Click">
                    <Gradient GradientType="Bottom" GradientBegin="" GradientEnd=""></Gradient>
                </SmoothEnterpriseWebControlFlowwork:StopRequestButton><SmoothEnterpriseWebControl:InputButton
                    ID="InputButton1" runat="server" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid"
                    BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px"
                    OnClick="InputButton1_Click" RunAtCient="False" Text="催審" Width="80px"  meta:resourcekey="BUTTON_caResource1">
                    <Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton><SmoothEnterpriseWebControl:InputButton
                    ID="InputButton2" runat="server" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid"
                    BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px"
                    OnClick="InputButton2_Click" Text="作廢"  meta:resourcekey="BUTTON_vResource1"
                    Width="80px">
                    <Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" />
                </SmoothEnterpriseWebControl:InputButton>
                &nbsp;
				<SmoothEnterpriseWebControl:InputButton ID="BUTTON_back" runat="server"  meta:resourcekey="BUTTON_backResource1" Text="回上頁" width="80px" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="BUTTON_back_Click"><Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" /></SmoothEnterpriseWebControl:InputButton>&nbsp;
			</td>
		</tr>
	</table>
</asp:Content>