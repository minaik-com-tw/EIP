<%@ Page Language="C#" MasterPageFile="~/_site/layout/Template.master" AutoEventWireup="true" CodeFile="EngineeringTestAdd.aspx.cs" Inherits="EngineeringTest.EngineeringTestAdd" StylesheetTheme="Default" Culture="Auto" UICulture="Auto"  validateRequest="false"%>

<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Security.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<head>
    <script type="text/javascript" src="/EngineeringTest/styles/jquery.min.js"></script>
    <script type="text/javascript" src="src/jquery.tokeninput.js"></script>

    <link rel="stylesheet" href="styles/token-input.css" type="text/css" />
    <link rel="stylesheet" href="styles/token-input-facebook.css" type="text/css" />
    <script src="jquery.autocomplete.js" type="text/javascript"></script>
    <link href="jquery.autocomplete.css" rel="stylesheet" type="text/css" />
    
    <script language="javascript"  type="text/javascript" src="<%=ResolveClientUrl("~/sub.js")%>"></script>
    
    <script language="javascript" type="text/javascript">  
    

    
function j1(){ 

     
    if (document.getElementById("ctl00_ContentPlaceHolder1_FIELD_lsend").value.length==0)
    {
        alert('請輸入直屬主管')
        return false;  
    }
    if (document.getElementById("ctl00_ContentPlaceHolder1_FIELD_pmcsend").value.length==0)
    {
        alert('請輸入生管單位')
        return false;  
    }
    if(document.getElementById("module_no").value.length==0)
    {
        alert('請輸入模具編號')
        return false;
    }
    if(document.getElementById("ctl00_ContentPlaceHolder1_FEILD_obj").value == "0")
    {
        alert('請選取試模目的')
        return false;
    }
    //alert (document.getElementById("ctl00_ContentPlaceHolder1_flow_type").value)
    if (document.getElementById("ctl00_ContentPlaceHolder1_flow_type").value=="2" && document.getElementById("ctl00_ContentPlaceHolder1_FIELD_makesend").value.length==0 )
    {
        alert('請輸入製造單位')
        return false;  
    }
     if (document.getElementById("ctl00_ContentPlaceHolder1_flow_type").value=="3" && document.getElementById("ctl00_ContentPlaceHolder1_FIELD_workssend").value.length==0 )
    {
        alert('請輸入工程單位')
        return false;  
    }
    if (document.getElementById("ctl00_ContentPlaceHolder1_flow_type").value=="4" )
    {
    
        if (document.getElementById("ctl00_ContentPlaceHolder1_FIELD_makesend").value.length==0)
       {
         alert('請輸入製造單位')
         return false;  
       }
       if (document.getElementById("ctl00_ContentPlaceHolder1_FIELD_workssend").value.length==0)
       {
         alert('請輸入工程單位')
         return false;  
       }
    }
    if(document.getElementById("ctl00_ContentPlaceHolder1_flow_type").value=="5")
    {
        if (document.getElementById("ctl00_ContentPlaceHolder1_FIELD_makesend").value.length==0)
        {
            alert('請輸入製造單位')
            return false;  
        }
        if (document.getElementById("ctl00_ContentPlaceHolder1_FIELD_workssend").value.length==0)
        {
            alert('請輸入工程單位')
            return false;  
        }        
        if (document.getElementById("ctl00_ContentPlaceHolder1_FIELD_lsend").value.length==0)
        {
            alert('請輸入直屬主管')
            return false;  
        }
        if (document.getElementById("ctl00_ContentPlaceHolder1_FIELD_pmcsend").value.length==0)
        {
            alert('請輸入生管單位')
            return false;  
        }       
    }    
    //檢查工程試作單上的附件編號和抽樣計劃
    function CheckMustInput(){
        var isHideTr = $('#table2').closest('tr') ;
        if(isHideTr.is(':hidden'))
            return true;
        if($("#table2 > tbody > tr").length != 0){
            var resolution = $("input[Name='resolution']");
            var describe = $("input[Name='describe']");
            for(var i = 0 ;i < resolution.length ; i ++){
                if(resolution[i].value.length == 0){
                    alert('請輸入附件編號');
                    return false;
                }
            }
            
            for(var j = 0 ; j < describe.length ; j ++){
                if(describe[j].value.length == 0 ){
                    alert('請輸入抽樣計劃');
                    return false;
                }
            }
        }        
        return true;
                        
    }
    
    if(!CheckMustInput()){
        return false;
    }
    

}


</script> 
    
<style type="text/css">
	.d1{
		background-color:yellow;
		color:blue;
		font-size:18px;
	}
	

}



</style>

    <script type="text/javascript">
        $(function() {
        //$("tab1").hide();
        //選項說明: http://docs.jquery.com/Plugins/Autocomplete/autocomplete#url_or_dataoptions
            $("#cima01").autocomplete("ACDataSrc.aspx",   //撈成品資料(有bom表的)
            {
                delay: 10,
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
            
            $("#cima01").blur(function(){
                if($("#cima01").val().substr(0,1) == '9' ){
                    $("#ctl00_ContentPlaceHolder1_FIELD_ISNOTORNULL").attr('checked', true);
                }else{
                    $("#ctl00_ContentPlaceHolder1_FIELD_ISNOTORNULL").attr('checked', false);
                }
            });
            
            
            function findValue(li) { //cima01的formatItem的資料代入相關欄位
            $("#cima02").val('');//一開始先清空,以免再次輸入影響判斷
                if (li == null) return alert("No match!");
                if($("#cima02").attr("value")=="")  //因cima01與txtSymblo皆使用findValue,故判斷
                {

                  $("#cima02").val(li.extra[0]);
                  $("#cima03").val(li.extra[1]);
  
                }else{
                //alert($("#cima02").attr("value"));
                  $("#txtSymbol").val(li.extra[0]);
                  $("#txtCName").val(li.extra[1]);
                
                }
                $("#cima01").blur();
            }
            

            $("#cima02").attr('readonly',true);   //設唯讀不能更改
            $("#txtCName").attr('readonly',true);
            
            
            $("#txtSymbol").autocomplete("ACDataSrc2.aspx",  //撈ima資料
            {
                delay: 10,
                width: 450,
                minChars: 1, //至少輸入幾個字元才開始給提示?
                matchSubset: false,
                matchContains: false,
                cacheLength: 0, 
                noCache: false, //黑暗版自訂參數，每次都重新連後端查詢(適用總資料筆數很多時)
                onItemSelect: findValue,
                onFindValue: findValue,
                formatItem: function (row) {
                    return "<div style='height:12px'><div style='float:left'>" + row[0] +
                            "</div><div style='float:right;padding-right:5px;'>" +
                             row[2] + "</div></div>";
                },
                autoFill: false,
                mustMatch: false //是否允許輸入提示清單上沒有的值?
            });

　　　　　　
            $("#email").autocomplete("ACDataSrc3.aspx", //撈dguser mail資料
            {
                delay: 10,
                width: 450,
                minChars: 1, //至少輸入幾個字元才開始給提示?
                matchSubset: false,
                matchContains: false,
                cacheLength: 0, 
                noCache: true, //黑暗版自訂參數，每次都重新連後端查詢(適用總資料筆數很多時)
//                onItemSelect: findValue,
//                onFindValue: findValue,
                formatItem: function(row) {
                    return "<div style='height:12px'><div style='float:left'>" + row[0] +
                            "</div><div style='float:right;padding-right:5px;'>" +
                             row[2] + "</div></div>";
                },
                autoFill: false,
                mustMatch: true //是否允許輸入提示清單上沒有的值?
            });

            $("#module_no").autocomplete("ACDataSrc4.aspx",  //撈ima資料
            {
                delay: 10,
                width: 450,
                minChars: 1, //至少輸入幾個字元才開始給提示?
                matchSubset: false,
                matchContains: false,
                cacheLength: 0, 
                noCache: true, //黑暗版自訂參數，每次都重新連後端查詢(適用總資料筆數很多時)
                onItemSelect: findModule,
                onFindValue: findModule,
                formatItem: function(row) {
                    return "<div style='height:12px'><div style='float:left'>" + row[0] +
                            "</div><div style='float:right;padding-right:5px;'>" +
                             row[1]  + "</div></div>";
                },
                autoFill: false,
                mustMatch: false //是否允許輸入提示清單上沒有的值?
            });            
            
            function findModule(li) { //cima01的formatItem的資料代入相關欄位
            $("#module_no").val('');//一開始先清空,以免再次輸入影響判斷
                if (li == null) return alert("No match!");
                if($("#module_no").attr("value")=="")  //因cima01與txtSymblo皆使用findValue,故判斷
                {
                  $("#module_no").val(li.selectValue);
                }
            }            
           

        });


        
$(document).ready(function(){
	
	$('#btnAdd').click(function(){  //新增欄位
	
	
		if   ($('table').find('tr:eq(1)').is( ":hidden ")) //如果第一欄己被隱藏,要先show出來才能被複製
		{ 
		  //alert("hidden")
		  $('table').find('tr:eq(1)').show();
		  var hidecheck='1';  //判斷第一行是否被隱藏
		}
		//複製一份出來
		var tt=$('#tbd tr[subid="EditZone"]').clone();


		//取得DataZone的個數
		var dzcnt=$('#idx').val();
		var NewIndex=parseInt(dzcnt,10)+1;
		$('#idx').val(NewIndex);
		
		//修改subid
		$(tt).attr('subid','DataZone');
		$(tt).attr('subid2','DataZone' + NewIndex);
		
		//將欄位訊息清空
		$('#txtSymbol',tt)
		.attr('value','')
		.attr('id','txtSymbol'+NewIndex)
		.attr('readonly',false)
		
		$('#txtCName',tt)
		.attr('value','')
		.attr('id','txtCName'+NewIndex)
		.attr('readonly',true)
		
		$('#Quantity',tt).attr('value','')
		
		$('#btnDel',tt)
		.attr('id','btnDel'+NewIndex)
		.attr('subindex',NewIndex)
		.bind('click',rDel);
		
		$('#Unit',tt)
		.attr('value','')
		.attr('id','Unit'+NewIndex)

		//加入複製出來的項目
		$('#tbd').append(tt);
		
		
		if(hidecheck=='1')
		{
		  $('table').find('tr:eq(1)').hide(); //如果第一行曾被隱藏過,要再隱藏起來
		}

		
		$('#txtSymbol'+NewIndex).focus();

        $("#txtSymbol"+NewIndex).autocomplete("ACDataSrc2.aspx",
        {
            delay: 10,
            width: 450,
            minChars: 1, //至少輸入幾個字元才開始給提示?
            matchSubset: false,
            matchContains: false,
            cacheLength: 0, 
            noCache: false, //黑暗版自訂參數，每次都重新連後端查詢(適用總資料筆數很多時)
            onItemSelect: findValue,
            onFindValue: findValue,
            formatItem: function(row) {
                return "<div style='height:12px'><div style='float:left'>" + row[0] +
                        "</div><div style='float:right;padding-right:5px;'>" +
                        row[1] + "/" + row[2] + "</div></div>";
            },
            autoFill: false,
            mustMatch: false //是否允許輸入提示清單上沒有的值?
        });
         function findValue(li) {
            if (li == null) return alert("No match!");
            //$("#txtSymbol"+NewIndex).val(li.extra[0]);
            $("#txtCName"+NewIndex).val(li.extra[0]);
            $("#Unit"+NewIndex).val(li.extra[1]);
        }
		
	});
	
	
	
	
	
	$('#btnAdd2').click(function(){                                //email
		//複製一份出來
		var tt=$('#tbd2 tr[subid="EditZone2"]').clone();
		
		//取得DataZone的個數
		var dzcnt=$('#idx2').val();
		var NewIndex=parseInt(dzcnt,10)+1;
		$('#idx2').val(NewIndex);
		//alert(NewIndex);
		//修改subid
		$(tt).attr('subid','DataZone2');
		$(tt).attr('subid2','DataZone2' + NewIndex);
		
		$('#btnAdd2',tt)
			.attr('id','btnDel2'+NewIndex)
			.attr('value','<Img Src=Image/delete.png Height=15px Width=15px>')
			.attr('subindex',NewIndex)
			.bind('click',rDel2);		
		
		//加入複製出來的項目
		$('#tbd2').append(tt);
		
		$('#email',tt)
		.attr('value','')
		.attr('id','email'+NewIndex)
		.attr('readonly',false)



        $("#email"+NewIndex).autocomplete("ACDataSrc3.aspx",
        {
            delay: 10,
            width: 450,
            minChars: 1, //至少輸入幾個字元才開始給提示?
            matchSubset: false,
            matchContains: false,
            cacheLength: 0, 
            noCache: true, //黑暗版自訂參數，每次都重新連後端查詢(適用總資料筆數很多時)
            formatItem: function(row) {
                return "<div style='height:12px'><div style='float:left'>" + row[0] +
                        "</div><div style='float:right;padding-right:5px;'>" +
                         row[2] + "</div></div>";
            },
            autoFill: false,
            mustMatch: true //是否允許輸入提示清單上沒有的值?
        });

		
	});
	
	
})

function rDel(){ //刪除料件table的某列

	var xidx=$(this).attr('subindex');
	$('tr[subid2="DataZone' + xidx + '"]').remove();
	var dzcnt2=$('#idx').val();
	$("#idx").val(dzcnt2-1);

}

function rDel2(){ //刪除email table的某列
	var xidx=$(this).attr('subindex');
	$('tr[subid2="DataZone2' + xidx + '"]').remove();
	var dzcnt2=$('#idx2').val();
	$("#idx2").val(dzcnt2-1);
}

function rDel3(){ //將第一列隱藏(因第一列有參數不得刪除,也不能刪除)
   $('table').find('tr:eq(1)').hide();
    $("#txtSymbol").val('')
    $("#txtCName").val('')
    $("#Quantity").val('')
    $("#Unit").val('')
}

$(document).ready(function(){
    $("input").not( $(":button") ).keypress(function (evt) {
        if (evt.keyCode == 13) {
            if ($(this).attr("type") !== 'submit'){
                var fields = $(this).parents('form:eq(0),body').find('button, input, textarea, select');
                var index = fields.index( this );
                if ( index > -1 && ( index + 1 ) < fields.length ) {
                    fields.eq( index + 1 ).focus();
                   
                }
                $(this).blur();
                return false;
            }

        }
    });
    
}); 

$(document).ready(function(){
    $("input").not( $(":button") ).keypress(function (evt) {
        if (evt.keyCode == 13) {
            if ($(this).attr("type") !== 'submit'){
                var fields = $(this).parents('form:eq(0),body').find('button, input, textarea, select');
                var index = fields.index( this );
                if ( index > -1 && ( index + 1 ) < fields.length ) {
                    fields.eq( index + 1 ).focus();
                   
                }
                $(this).blur();
                return false;
            }

        }
    });
    
}); 



function getData2(){  //清空數據



   $('table').find('tr:eq(1)').show();//清空的話原本第一行可能隱藏,要show出來
   for (xidx=1; xidx<=$('#idx').val(); xidx=xidx+1)

    {
    
        $('tr[subid2="DataZone' + xidx + '"]').remove();
        
    }

    $("#cima01").val('')
    $("#cima02").val('')
    $("#cima03").val('')
    $("#rev").val('')
    $("#oduction_amount").val('')
    $("#delivers_amount").val('')
    $("#txtSymbol").val('')
    $("#txtCName").val('')
    $("#Quantity").val('')
    $("#Unit").val('')
    $("#idx").val('0')
    $('#Button1').attr('disabled',false)
    $('#Button2').attr('disabled',true)
    $("#cima02").attr('readonly',false);   //設唯讀不能更改
    $("#txtCName").attr('readonly',false);
    $('#cima01').attr('readonly',false)
    $('#cima02').attr('readonly',false)
     document.getElementById('tab1').style.display = "none";


}

//ashx傳回json數據-----------------------------------------------------------------------------------------

function getData(){

if($('#cima01').val()=="")
{
alert("請輸入成品料號");
}

else if($('#cima03').val()=="")
{
 alert("請輸入成品規格");

}

else if($('#oduction_amount').val()=="" || isNaN(document.getElementById('oduction_amount').value)==true)
{
 alert("請輸入生產數量或確認輸入格試是否正確");

}
else if($('#delivers_amount').val()=="" || isNaN(document.getElementById('delivers_amount').value)==true)
{
 alert("請輸入送樣數量或確認輸入格試是否正確");

}
else if(document.getElementById("ctl00_ContentPlaceHolder1_FIELD_expect_date").value.length==0)
{
alert("請輸入預計完成日期");
}
else{

    document.getElementById('tab1').style.display = "inline";
    var a=  document.getElementById('cima01').value; //成品料號
    var b=  document.getElementById('oduction_amount').value;  //生產數量

    $("#list").html("");//清空列表中的数据
   //发送ajax请求
    $.getJSON(
    "jsondata.ashx?id=",//产生JSON数据的服务端页面
    {name:a,age:20,ss:b,jj:20},//向服务器发出的查询字符串（此参数可选）
   //对返回的JSON数据进行处理，本例以列表的形式呈现
    function(json){
   //循环取json中的数据,并呈现在列表中
    $.each(json,function(i){
    if (i==0)
    {
    //如果為第一列
        $("#txtSymbol").val(json[i].name) //接收json值
        $("#txtCName").val(json[i].age.replace('&','"'))
        $("#Quantity").val(json[i].ss)
        $("#Unit").val(json[i].jj)
        $('#Button1').attr('disabled','disabled')
        $('#cima01').attr('readonly',true)
        $('#cima02').attr('readonly',true)
        $('#btnDel').bind('click',rDel3);	 

    }else{
    
    //第二列以後
        $("#list").append(json[i].name+"&nbsp; "+json[i].age)
        var tt=$('#tbd tr[subid="EditZone"]').clone();
		
		//取得DataZone的個數
		var dzcnt=$('#idx').val();
		var NewIndex=parseInt(dzcnt,10)+1;
		$('#idx').val(NewIndex);
		
		//修改subid
		$(tt).attr('subid','DataZone');
		$(tt).attr('subid2','DataZone' + NewIndex);
		
		//修改按鈕id,name,value,bind click事件
		$('#btnAdd',tt)
			.attr('id','btnDel'+NewIndex)
			.attr('value','<Img Src=Image/delete.png Height=15px Width=15px>')
			.attr('subindex',NewIndex)
			.bind('click',rDel);	
			
		
				
		$('#txtSymbol',tt)
		    .attr('value',json[i].name)
		    .attr('readonly',true);
		    

		$('#txtCName',tt)
		    .attr('value',json[i].age.replace('&','"'));
		$('#Quantity',tt)
		    .attr('value',json[i].ss);
		$('#Unit',tt)
		    .attr('value',json[i].jj);
		
		
		//加入複製出來的項目
		$('#tbd').append(tt);
		
		$('#btnDel',tt)
			.attr('id','btnDel'+NewIndex)
			.attr('subindex',NewIndex)
			.bind('click',rDel);	

		
		//新增完將焦點停留在第一個視窗
		$('input:text:first').focus();
		}
      
    
    })
    })
    }
    }
    
//------------------------------------------------------------------------------------------    


// 20130520 代入NPI專案小組成員

function getData3(){
    
  if($('#project_no').val()=="")
    {
        alert("請輸入專案編號");
    }else{   
        $.ajaxSetup({ cache: false });   

        $("#list").html("");
        $.getJSON(
             "jsondata.ashx?id=",
            {name:document.getElementById('project_no').value,age:40,ss:0,jj:0},
            function(json){
                 $.each(json,function(i){
                 if (i==0)
                 {
                    $("#email").val(json[i].email) //接收json值
                 }else{
                
                //第二列以後
                    var tt=$('#tbd2 tr[subid="EditZone2"]').clone();
                    var dzcnt=$('#idx2').val();
		            var NewIndex=parseInt(dzcnt,10)+1;

                            $(tt).attr('subid','DataZone2');
                            $(tt).attr('subid2','DataZone2' + json[i].email);
                    		
                            $('#btnAdd2',tt)
	                            .attr('id','btnDel2'+json[i].email)
	                            .attr('value','<Img Src=Image/delete.png Height=15px Width=15px>')
	                            .attr('subindex',json[i].email)
	                            .bind('click',rDel2);		

                            $('#tbd2').append(tt);
        	
                            $('#email',tt)
                            .attr('value',json[i].email)
                            .attr('id','email'+json[i].email)
                            .attr('readonly',false)
        		            
        		           
                               $("#email"+json[i].email).autocomplete("ACDataSrc3.aspx",
                                {
                                    delay: 10,
                                    width: 450,
                                    minChars: 1, //至少輸入幾個字元才開始給提示?
                                    matchSubset: false,
                                    matchContains: false,
                                    cacheLength: 0, 
                                    noCache: true, //黑暗版自訂參數，每次都重新連後端查詢(適用總資料筆數很多時)

                                    formatItem: function(row) {
                                        return "<div style='height:12px'><div style='float:left'>" + row[0] +
                                                "</div><div style='float:right;padding-right:5px;'>" +
                                                 row[2] + "</div></div>";
                                    },
                                    autoFill: false,
                                    mustMatch: true //是否允許輸入提示清單上沒有的值?
                                });
                                
                               
	                }
                    
                })
                })

    }

}


// 20130520 代入NPI專案小組成員



//20130521 加入內容定義

 $(document).ready(function(){ 
             addnew("產品圖面或規格","","");
             addnew("可靠性測試需求","","");
             addnew("產品特性或外觀驗證","","");
             addnew("國際法規","","");
             addnew("其他","","");

         
            // 擷取資料庫中的資料並新增表格
             var loca = location.href;
             var a = loca.substring(loca.length,loca.length-36);
             $.post("../PManagement/Got_JoinList.aspx?PID="+ a,function(result) {ShoweMail(result)});

              function ShoweMail(result) {
              if (result != '')
              {
                   var eecount = result.split("@@").length;
                   var mailstring=result.split("@@");
                   for(i=0;i<eecount;i++)
                   {
                      var perdata =  mailstring[i].split(",");
                      addRow(perdata[0],perdata[1],perdata[2],perdata[3]);
                   }
              }
            }
            // 擷取資料庫中的資料並新增表格
             
         });   

function addnew(item,resolution,describe){
	    $('#remind').css('display','none');
		var table2 = $('#table2'); 
		
	    var today = new Date();
	    var CurrentDate = today.getFullYear() + "/" + (today.getMonth()+1) + "/" + today.getDate();
	    var inputid = today.getTime();  //InPut ID
		
		
		var nowlength = Getlength('itemno');
		 table2.append(
			 $('<tr>').append(
		     	    $('<td>').html($('<span>').html(nowlength)
								    .attr("name","itemno")
								    .css('width','20px')
								    ).css("text-align", "center"),		 
		     	    $('<td>').html($('<input>').attr("type","text")
								    .val(item)
								    .attr("name","item")
								    .css('width','200px')
								    ).css("text-align", "center"),			 
		     	    $('<td>').html($('<input>').attr("type","text")
								    .val(resolution)
								    .attr("name","resolution")
								    .attr("id","r_"+ inputid)						    
								    .css('width','140px')
								    ).css("text-align", "center"),	
		     	    $('<td>').html($('<input>').attr("type","text")
								    .val(describe)
								    .attr("name","describe")
								    .css('width','140px')
								    ).css("text-align", "center"),									     								    
					$('<td>').html(
						$('<input>').attr("type","button")
									.attr("value","Delete")
									.click(function() {
										$(this).parents("tr:first").remove();
                                        //重新編排數字
		                                var $spans = $('span[name="itemno"]');	
		                                for(var i = 0; i< $spans.length;i++ )
		                                   $spans[i].innerText = i + 1;
		                                //重新編排數字
		                                if($spans.length == 0)
		                                $('#remind').css('display','block');
									})

					).css("text-align", "center")
				 ).mouseover(function () {$(this).css("background-color","#E6EDFF");}).mouseout(function () {$(this).css("background-color","white");})
				 
		);
		


	}
	
	 function Getlength(strName)
     {
      var $spans = $('span[name="'+ strName +'"]');	
      var nowlength = $spans.length + 1;
      return nowlength;
     }




//20130521 加入內容定義


//20130527 小量生產/工程試作 預設CHANGE


$(window).load(function(){ 

      $('#ctl00_ContentPlaceHolder1_rd_level').change(function () {
      
      $("#table2 tr:not(:first)").remove();

         
          if ( $('#ctl00_ContentPlaceHolder1_rd_level option:selected').val() == '1' )
          {
             addnew("產品圖面或規格","","");
             addnew("可靠性測試需求","","");
             addnew("產品特性或外觀驗證","","");
             addnew("國際法規","","");
             addnew("其他","","");
             $('#isonumber').val('R-04-023');  // 20130703 加入ISO單號
             $('#e_title').val('工程試作單');  // 20130723 加入抬頭更改
          
          }else{
          
             addnew("製程管制與製程作業標準書","","");
             addnew("可靠性測試草案","","");
             addnew("產品尺寸、特性與外觀檢查作業標準書","","");
             addnew("產品包裝需求","","");
             addnew("其他","","");
             $('#isonumber').val('R-04-027');  // 20130703 加入ISO單號
             $('#e_title').val('小量生產試作單');  // 20130723 加入抬頭更改
          }        

         
    });
    
});


//20130527 小量生產/工程試作 預設CHANGE

    </script>
    
    <style type="text/css">
	.d1{
		background-color:yellow;
		color:blue;
		font-size:18px;
	}
	

}


</style>

</head>
    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server" Details="The desciption for this program"
		Caption="EngineeringTest Add Page" Width="100%" CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px">
		<CaptionStyle Font-Bold="True" CssClass="Medium"></CaptionStyle>
		<DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray"></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>
    <br />
    <table cellpadding="0" cellspacing="0" style="width: 1000px; border-collapse: collapse">
        <tr>
            <td align="center" colspan="2">
                <asp:Label ID="Label1" runat="server" CssClass="NormalBold" Font-Size="Medium" meta:resourcekey="Label1Resource1"
                    Text="銘異科技股份有限公司" Width="220px"></asp:Label></td>
        </tr>
        <tr>
            
        </tr>
        <tr>
            <td align="center" colspan="2">
                &nbsp;<input type="textbox" autocomplete="off"  id="e_title" name="e_title" value="工程試作單" style="border-right: 1px; border-top: 1px; font-weight: bold; font-size: 12pt; border-left: 1px; width: 154px; color: black; border-bottom: 1px; text-align: center;"></td>
        </tr>
        <tr>
            <td align="left" style="width: 306px; height: 24px">
            </td>
            <td align="right" style="width: 695px; height: 24px">
                <input type="textbox" autocomplete="off"  id="isonumber" name="isonumber" value="R-04-023" style="border-right: 1px; border-top: 1px; font-weight: bold; font-size: 11pt; border-left: 1px; width: 61px; color: black; border-bottom: 1px"></td>
        </tr>
        <tr>
            <td align="left" style="width: 306px; height: 24px">
            <div style="color:red">成品料號由BOM表指定，在申請前請確認BOM是否已申請，謝謝。</div>
            </td>
            <td align="right" style="height: 24px; width: 695px;">
                <asp:Label ID="Label6" runat="server" CssClass="NormalBold" meta:resourcekey="Label6Resource1"
                    Text="申&nbsp;請&nbsp;日&nbsp;期" Font-Names="新細明體" Font-Size="9pt"></asp:Label>&nbsp;<SmoothEnterpriseWebControl:InputText
                        ID="add_date" runat="server" BackColor="White" CssClass="Normal" FormatType="Date" BorderStyle="Groove" Height="19px">
                        <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                    </SmoothEnterpriseWebControl:InputText>&nbsp;</td>
        </tr>
        <tr>
            <td align="left" style="text-align: right" colspan="2" >
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                <asp:Label ID="Label17" runat="server" CssClass="NormalBold" Font-Names="新細明體" Font-Size="9pt"
                    meta:resourcekey="Label34Resource1" Text="廠&nbsp; 區"></asp:Label>
                <asp:Label ID="plantid" runat="server" CssClass="NormalBold" ForeColor="DimGray"
                    Height="5px" Text="MINAIK" Width="55px"></asp:Label>
                <asp:Label ID="Label22" runat="server" CssClass="NormalBold" Font-Names="新細明體" Font-Size="9pt"
                    meta:resourcekey="Label34Resource1" Text=" &nbsp;申 &nbsp;請 &nbsp;人"></asp:Label>
                <asp:Label ID="add_user" runat="server" CssClass="NormalBold" ForeColor="DimGray"
                    Height="5px" Text="林欣茹" Width="55px"></asp:Label></td>
        </tr>
    </table>
    <table border="1" bordercolor="silver" cellpadding="0" cellspacing="0" style="width: 1000px;
        border-collapse: collapse">
        <tr>
            <td style="width: 83%">
                <table width="100%">
                    <tr>
                        <td colspan="4" style="height: 20px; background-color: #f0f0f0">
                            <asp:Label ID="Label28" runat="server" CssClass="NormalBold" Font-Size="Small" ForeColor="White"
                                Height="10px" Text="*" Width="6px"></asp:Label>
                            <asp:Label ID="Label29" runat="server" meta:resourcekey="Label29Resource1"
                                Text="申&nbsp;請&nbsp;內&nbsp;容" Width="116px" Font-Bold="True" Font-Names="新細明體" Font-Size="11pt" ForeColor="DarkSlateGray"></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="width: 154px">
                        </td>
                        <td style="width: 139px">
                            &nbsp;</td>
                        <td style="width: 152px">
                        </td>
                        <td style="width: 285px">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 154px; height: 26px">
                            <asp:Label ID="Label13aa" runat="server" CssClass="NormalBold" Font-Size="Small" ForeColor="Red"
                                Height="10px" Text="*" Width="6px"></asp:Label>
                            <asp:Label ID="LABEL_1" runat="server" CssClass="NormalBold" meta:resourcekey="LABEL_1"
                                Text="研&nbsp;發&nbsp;階&nbsp;段"
                                Width="90px" Font-Names="新細明體" Font-Size="10pt"></asp:Label></td>
                        <td style="width: 139px; height: 26px">
                            <asp:DropDownList ID="rd_level"  runat="server">
                                <asp:ListItem Value="1">工程試作</asp:ListItem>
                                <asp:ListItem Value="2">小量生產</asp:ListItem>
                            </asp:DropDownList></td>
                        <td style="width: 152px; height: 26px">
                            <asp:Label ID="Label15" runat="server" CssClass="NormalBold" Font-Size="Small" ForeColor="Red"
                                Height="10px" Text="*" Width="6px"></asp:Label>
                            <asp:Label ID="Label7" runat="server" CssClass="NormalBold" meta:resourcekey="LABEL7"
                                Text="預訂完成日期" Font-Names="新細明體" Font-Size="10pt"></asp:Label></td>
                        <td style="width: 285px; height: 26px">
                            <SmoothEnterpriseWebControl:InputText id="FIELD_expect_date" runat="server" BackColor="White" CssClass="Normal" ErrorMessage="Please Input「Expect_date」!!" MaxLength="0"  FormatType="Date"><Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                                <ErrorStyle BorderStyle="NotSet" CssClass="" />
                            </SmoothEnterpriseWebControl:InputText></td>
                    </tr>
                    <tr>
                        <td style="width: 154px; height: 26px">
                            <asp:Label ID="Label12" runat="server" CssClass="NormalBold" Font-Size="Small" ForeColor="Red"
                                Height="10px" Text="*" Width="6px"></asp:Label>
                            <asp:Label ID="LABEL3aa" runat="server" CssClass="NormalBold" meta:resourcekey="LABEL3aa"
                                Text="成&nbsp;品&nbsp;料&nbsp;號" Font-Names="新細明體" Font-Size="10pt"></asp:Label></td>
                        <td style="width: 139px; height: 26px">
                            <input type="textbox" autocomplete="off"  id="cima01" name="cima01" value="" style="width: 200px; background-color: whitesmoke; border-left-color: gainsboro; border-bottom-color: gainsboro; border-top-style: solid; border-top-color: gainsboro; border-right-style: solid; border-left-style: solid; border-right-color: gainsboro; border-bottom-style: solid;">
</td>
                        <td style="width: 152px; height: 26px">
                            <asp:Label ID="Label5aa" runat="server" CssClass="NormalBold" Font-Size="Small" ForeColor="Red"
                                Height="10px" Text="*" Width="6px"></asp:Label>
                            <asp:Label ID="Label4" runat="server" CssClass="NormalBold" meta:resourcekey="LABEL4"
                                Text="成&nbsp;品&nbsp;品 名" Font-Names="新細明體" Font-Size="10pt"></asp:Label>
</td>
                        <td style="width: 285px; height: 26px">
                            <input type="textbox" autocomplete="off"  id="cima02" name="cima02" value="" style="width: 200px; background-color: whitesmoke; border-left-color: gainsboro; border-bottom-color: gainsboro; border-top-style: solid; border-top-color: gainsboro; border-right-style: solid; border-left-style: solid; border-right-color: gainsboro; border-bottom-style: solid;">
                            </td>
                    </tr>
                    <tr>
                        <td style="width: 154px; height: 27px">
                            <asp:Label ID="Label14" runat="server" CssClass="NormalBold" Font-Size="Small" ForeColor="Red"
                                Height="10px" Text="*" Width="6px"></asp:Label>
                            <asp:Label ID="LABEL5" runat="server" CssClass="NormalBold" meta:resourcekey="LABEL5"
                                Text="成&nbsp;品&nbsp;規&nbsp;格" Font-Names="新細明體" Font-Size="10pt"></asp:Label></td>
                        <td style="width: 139px; height: 27px">
                            <input type="textbox" autocomplete="off" id="cima03" name="cima03" value="" style="width: 200px; background-color: whitesmoke; border-left-color: gainsboro; border-bottom-color: gainsboro; border-top-style: solid; border-top-color: gainsboro; border-right-style: solid; border-left-style: solid; border-right-color: gainsboro; border-bottom-style: solid;"></td>
                        <td style="width: 152px; height: 27px">
                            <asp:Label ID="Label8" runat="server" CssClass="NormalBold" Font-Size="Small" ForeColor="White"
                                Height="10px" Text="*" Width="6px"></asp:Label>
                            <asp:Label ID="Label9" runat="server" CssClass="NormalBold" meta:resourcekey="LABEL_backdateResource1"
                                Text="REV." Font-Names="新細明體" Font-Size="10pt"></asp:Label></td>
                        <td style="width: 285px; height: 27px">
                            <input type="textbox" autocomplete="off"  id="rev" name="rev" value="" style="width: 200px; background-color: whitesmoke; border-left-color: gainsboro; border-bottom-color: gainsboro; border-top-style: solid; border-top-color: gainsboro; border-right-style: solid; border-left-style: solid; border-right-color: gainsboro; border-bottom-style: solid;"></td>
                    </tr>
                    <tr>
                        <td style="width: 154px; height: 27px">
                            <asp:Label ID="Label10" runat="server" CssClass="NormalBold" Font-Size="Small" ForeColor="Red"
                                Height="10px" Text="*" Width="6px"></asp:Label>
                            <asp:Label ID="Label6a" runat="server" CssClass="NormalBold" meta:resourcekey="LABEL6a"
                                Text="生&nbsp;產&nbsp;數&nbsp;量" Font-Names="新細明體" Font-Size="10pt"></asp:Label></td>
                        <td style="width: 139px; height: 27px">
                        <input type="textbox" autocomplete="off"  id="oduction_amount" name="oduction_amount"   value="" style="width: 200px; background-color: whitesmoke; border-left-color: gainsboro; border-bottom-color: gainsboro; border-top-style: solid; border-top-color: gainsboro; border-right-style: solid; border-left-style: solid; border-right-color: gainsboro; border-bottom-style: solid;"></td>
                        <td style="width: 152px; height: 27px">
                            <asp:Label ID="Label16" runat="server" CssClass="NormalBold" Font-Size="Small" ForeColor="Red"
                                Height="10px" Text="*" Width="6px"></asp:Label>
                            <asp:Label ID="Label19" runat="server"
                                    CssClass="NormalBold" meta:resourcekey="LABEL19" Text="送&nbsp;樣&nbsp;數&nbsp;量" Font-Names="新細明體" Font-Size="10pt"></asp:Label></td>
                        <td style="width: 285px; height: 27px">
                       <input type="textbox" autocomplete="off"  id="delivers_amount" name="delivers_amount" value=""  style="width: 200px; background-color: whitesmoke; border-left-color: gainsboro; border-bottom-color: gainsboro; border-top-style: solid; border-top-color: gainsboro; border-right-style: solid; border-left-style: solid; border-right-color: gainsboro; border-bottom-style: solid;"></td>
                    </tr>
                    <tr>
                        <td style="width: 154px; height: 27px">
                            <asp:Label ID="Label18" runat="server" CssClass="NormalBold" Font-Size="Small" ForeColor="WhiteSmoke"
                                Height="10px" Text="*" Width="6px"></asp:Label><asp:Label ID="Label20a" runat="server"
                                    CssClass="NormalBold" Font-Names="新細明體" Font-Size="10pt" meta:resourcekey="Label8a"
                                    Text="訂&nbsp;單&nbsp;號&nbsp;碼"></asp:Label></td>
                        <td style="width: 139px; height: 27px">
                            <asp:TextBox ID="order_no" runat="server" autocomplete="off" Style="border-left-color: gainsboro;
                                border-bottom-color: gainsboro; border-top-style: solid; border-top-color: gainsboro;
                                border-right-style: solid; border-left-style: solid; background-color: whitesmoke;
                                border-right-color: gainsboro; border-bottom-style: solid" Width="200px"></asp:TextBox></td>
                        <td style="width: 152px; height: 27px">
                            <asp:Label ID="Label36" runat="server" CssClass="NormalBold" Font-Size="Small" ForeColor="WhiteSmoke"
                                Height="10px" Text="*" Width="6px"></asp:Label>
                            <asp:Label ID="Label8a" runat="server" CssClass="NormalBold" Font-Names="新細明體" Font-Size="10pt"
                                meta:resourcekey="Label8a" Text="製程要項及說明"></asp:Label></td>
                        <td style="width: 285px; height: 27px">
                            <asp:TextBox ID="oduction_explain" runat="server" autocomplete="off" Style="border-left-color: gainsboro;
                                border-bottom-color: gainsboro; border-top-style: solid; border-top-color: gainsboro;
                                border-right-style: solid; border-left-style: solid; background-color: whitesmoke;
                                border-right-color: gainsboro; border-bottom-style: solid" Width="200px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td style="width: 154px;">
                            <asp:Label ID="Label26" runat="server" CssClass="NormalBold" Font-Size="Small" ForeColor="WhiteSmoke"
                                Height="10px" Text="*" Width="6px"></asp:Label><asp:Label ID="Label27" runat="server"
                                    CssClass="NormalBold" Font-Names="新細明體" Font-Size="10pt" meta:resourcekey="Label8a"
                                    Text="備&nbsp;     &nbsp;註"></asp:Label></td>
                        <td colspan="3">
                            <asp:TextBox ID="remark" runat="server" autocomplete="off" Style="border-left-color: gainsboro;
                                border-bottom-color: gainsboro; border-top-style: solid; border-top-color: gainsboro;
                                border-right-style: solid; border-left-style: solid; background-color: whitesmoke;
                                border-right-color: gainsboro; border-bottom-style: solid" Width="643px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td style="width: 154px;"><asp:Label ID="Label2" runat="server" CssClass="NormalBold" Font-Size="Small" ForeColor="Red"
                                Height="10px" Text="*" Width="6px"></asp:Label></asp:Label><asp:Label ID="Label20" runat="server"
                                    CssClass="NormalBold" Font-Names="新細明體" Font-Size="10pt" meta:resourcekey="Label8a"
                                    Text="模&nbsp;具&nbsp;編&nbsp;號"></asp:Label></td>
                        <td><input type="textbox" autocomplete="off"  id="module_no" name="module_no" value="" style="width: 200px; background-color: whitesmoke; border-left-color: gainsboro; border-bottom-color: gainsboro; border-top-style: solid; border-top-color: gainsboro; border-right-style: solid; border-left-style: solid; border-right-color: gainsboro; border-bottom-style: solid;"></td>
                        <td><asp:Label ID="Label40" runat="server" CssClass="NormalBold" Font-Size="Small" ForeColor="WhiteSmoke"
                                Height="10px" Text="*" Width="6px"></asp:Label><asp:Label ID="Label41" runat="server"
                                    CssClass="NormalBold" Font-Names="新細明體" Font-Size="10pt" meta:resourcekey="Label8a"
                                    Text="試&nbsp;模&nbsp;目&nbsp;的"></asp:Label></td>
                        <td><asp:DropDownList ID="FEILD_obj" runat="server">
                                <asp:ListItem Value="0" Text="Select"/>
                                <asp:ListItem Value="1" Text="工程試作"/>
                                <asp:ListItem Value="2" Text="試材料"/>
                                <asp:ListItem Value="3" Text="試清潔度"/>
                                <asp:ListItem Value="4" Text="試DOE"/>                                
                            </asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td colspan="2" style="width: 154px; text-align: left">
                            <nobr><asp:CheckBox ID="FIELD_ISNOTORNULL"  CssClass="NormalBold" Font-Names="新細明體" Font-Size="10pt" Text="其他用途試作工單，不須經由模具監控系統" runat="server" /></nobr>
                        </td>
                        <td colspan="2"  style="height: 25px; text-align: right">
                            <input id="Button3" type="button" value="代出下階料明細" onclick="getData()" style="font-weight: bold; font-size: 12px; color: #000000"  />
                            <input id="Button2" onclick="getData2()" style="font-weight: bold; font-size: 12px;
                                color: #000000" type="button" value="重新設定" />&nbsp;
                            </td>
                    </tr>
                </table>

  

            </td>
        </tr>
        <tr>
            <td style="width: 83%; height: 24px; font-weight: bold; color: #000000;">
              
<input type="hidden" id="idx" name="idx" value="0" />

    
<br />
<table id="tab1" border="1"  cellpadding="0" cellspacing="0" bordercolor="#666666" bgcolor="#FFFFFF" style="display=none; width: 800px;"　>
	<thead>
		<tr>

			<th style="width: 221px; text-align: left; color: #ffffff; background-color: #000000;">
                <span style="font-size: 10pt">料號</span></th>
			<th style="width: 300px; text-align: left; color: #ffffff; background-color: #000000;">
                <span style="font-size: 10pt">品名</span></th>
			<th style="width: 84px; text-align: left; color: #ffffff; background-color: #000000;">
                <span style="font-size: 10pt">數量</span></th>
			<th style="width: 84px; text-align: left; color: #ffffff; background-color: #000000;">
                <span style="font-size: 10pt">單位</span></th>

                
           <th style="width: 14px; text-align: left; color: #ffffff; background-color: #000000;">
                <span style="font-size: 10pt"><Button id="btnAdd" name="btnAdd"   >
                    <Img Src="Image/add.png" Height="15px" Width="15px"  ></button></span></th>
		</tr>
	</thead>
	<tbody id="tbd">
		<tr subid="EditZone" bgColor="#FFFFFF" onMouseOut="this.bgColor='#FFFFFF';" onMouseOver="this.bgColor='#a9a9a9';"  onfocus="this.bgColor='#a9a9a9';" > 

		
			<td style="width: 221px"><input type="textbox" autocomplete="off"  subid="txt" id="txtSymbol" name="txtSymbol"   readonly="readonly" style="width: 215px; background-color: whitesmoke; border-left-color: gainsboro; border-bottom-color: gainsboro; border-top-style: solid; border-top-color: gainsboro; border-right-style: solid; border-left-style: solid; border-right-color: gainsboro; border-bottom-style: solid;text-transform: uppercase"></td>
			<td style="width: 300px"><input type="textbox" autocomplete="off" subid="txt" id="txtCName"  name="txtCName" value="" style="width: 291px; background-color: whitesmoke; border-left-color: gainsboro; border-bottom-color: gainsboro; border-top-style: solid; border-top-color: gainsboro; border-right-style: solid; border-left-style: solid; border-right-color: gainsboro; border-bottom-style: solid;"></td>
			<td style="width: 84px"><input type="textbox" autocomplete="off" subid="txt" id="Quantity" name="Quantity" value="" style="width: 80px; background-color: whitesmoke; border-left-color: gainsboro; border-bottom-color: gainsboro; border-top-style: solid; border-top-color: gainsboro; border-right-style: solid; border-left-style: solid; border-right-color: gainsboro; border-bottom-style: solid;"></td>
			<td style="width: 84px"><input type="textbox" autocomplete="off" subid="txt" id="Unit" name="Unit" value="" style="width: 80px; background-color: whitesmoke; border-left-color: gainsboro; border-bottom-color: gainsboro; border-top-style: solid; border-top-color: gainsboro; border-right-style: solid; border-left-style: solid; border-right-color: gainsboro; border-bottom-style: solid;"></td>

			<td style="width: 14px; text-align: center;">
			<Button id="btnDel" name="btnDel"   > <Img Src="Image/delete.png" Height="15px" Width="15px"  ></Button>
		</tr>
	</tbody>
</table>
                &nbsp;<asp:Label runat="server" ID="Label3"></asp:Label><div id="test">
                    &nbsp;</div>
            </td>
        </tr>
        <tr>
            <td style="width: 83%"><table width="100%">
                <tr>
                    <td colspan="4" style="height: 20px; background-color: #f0f0f0">
                        <asp:Label ID="Label38" runat="server" CssClass="NormalBold" Font-Size="Small" ForeColor="White"
                            Height="10px" Text="*" Width="6px"></asp:Label>
                        <asp:Label ID="Label39" runat="server" CssClass="NormalBold" meta:resourcekey="Label9a"
                            Text="內&nbsp;容&nbsp;定&nbsp;義" Width="116px" Font-Names="新細明體" Font-Size="11pt" ForeColor="DarkSlateGray"></asp:Label></td>
                </tr>
                <tr>
                    <td colspan="4" rowspan="5">
                        <table id="table2" cellpadding="2" cellspacing="0" width="100%">
                            <thead>
                                <tr>
                                    <td align="center" bgcolor="#fff0f5" style="height: 24px; background-color: black"
                                        width="50">
                                        <asp:Label ID="Label46" runat="server" CssClass="NormalBold" ForeColor="#FFFFFF"
                                            Text="序號"></asp:Label></td>
                                    <td align="center" bgcolor="#fff0f5" style="height: 24px; background-color: black"
                                        width="250">
                                        <asp:Label ID="Label47" runat="server" CssClass="NormalBold" ForeColor="#FFFFFF"
                                            Text="項次"></asp:Label></td>
                                    <td align="center" bgcolor="#fff0f5" style="height: 24px; background-color: black"
                                        width="160">
                                        <asp:Label ID="Label48" runat="server" CssClass="NormalBold" ForeColor="#FFFFFF"
                                            Text="附件編號"></asp:Label></td>
                                    <td align="center" bgcolor="#fff0f5" style="height: 24px; background-color: black"
                                        width="160">
                                        <asp:Label ID="Label49" runat="server" CssClass="NormalBold" ForeColor="#FFFFFF"
                                            Text="抽樣計畫"></asp:Label></td>
                                    <td align="center" bgcolor="#fff0f5" style="height: 24px; background-color: black"
                                        width="220">
                                        <input onclick="addnew()" type="button" value="增加項次" /></td>
                                </tr>
                                <tr id="remind">
                                    <td align="center" colspan="5" height="50">
                                        <asp:Label ID="Label45" runat="server" Font-Bold="True" Font-Size="X-Small" ForeColor="Red"
                                            Text="尚未增加項次"></asp:Label>
                                    </td>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                    </td>
                </tr>
                <tr>
                </tr>
                <tr>
                </tr>
                <tr>
                </tr>
                <tr>
                </tr>
            </table>
                <table width="100%">
                    <tr>
                        <td colspan="4" style="height: 20px; background-color: #f0f0f0">
                            <asp:Label ID="Label23" runat="server" CssClass="NormalBold" Font-Size="Small" ForeColor="White"
                                Height="10px" Text="*" Width="6px"></asp:Label>
                            <asp:Label ID="Label24" runat="server" CssClass="NormalBold" Font-Names="新細明體" Font-Size="11pt"
                                ForeColor="DarkSlateGray" meta:resourcekey="Label9a" Text="簽&nbsp;核&nbsp;相&nbsp;關"
                                Width="116px"></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="width: 137px">
                    </td>
                    <td style="width: 10px">
                        &nbsp;</td>
                    <td style="width: 138px">
                    </td>
                    <td style="width: 280px">
                    </td>
                </tr>
                <tr>
                    <td style="width: 137px; height: 26px">
                        <asp:Label ID="Label25" runat="server" CssClass="NormalBold" Font-Size="Small" ForeColor="Red"
                            Height="10px" Text="*" Width="6px"></asp:Label>
                        <asp:Label ID="Label10a" runat="server"
                                CssClass="NormalBold" meta:resourcekey="LABEL10a" Text="流&nbsp;程&nbsp;類&nbsp;型"
                                Width="90px" Font-Names="新細明體" Font-Size="10pt"></asp:Label></td>
                    <td style="width: 10px; height: 26px"><asp:DropDownList ID="flow_type" runat="server">
                        <asp:ListItem Value="1">直屬->生管</asp:ListItem>
                        <asp:ListItem Value="2">直屬->生管->製造</asp:ListItem>
                        <asp:ListItem Value="3" >直屬->生管->工程</asp:ListItem>
                        <asp:ListItem Value="4">直屬->生管->工程->製造</asp:ListItem>
                        <asp:ListItem Value="5" Selected="true">生管->工程->製造->直屬</asp:ListItem>
                    </asp:DropDownList></td>
                    <td style="width: 138px; height: 26px">
                        &nbsp;</td>
                    <td style="width: 280px; height: 26px">
                        </td>
                </tr>
                <tr>
                    <td style="width: 137px; height: 26px">
                        <asp:Label ID="Label31" runat="server" CssClass="NormalBold" Font-Size="Small" ForeColor="Red"
                            Height="10px" Text="*" Width="6px"></asp:Label>
                        <asp:Label ID="LABEL11" runat="server" CssClass="NormalBold" meta:resourcekey="LABEL11"
                            Text="直&nbsp;屬&nbsp;主&nbsp;管" Width="90px" Font-Names="新細明體" Font-Size="10pt"></asp:Label></td>
                    <td style="width: 10px; height: 26px">
                        <SmoothEnterpriseWebControlEnterprise:PopupUser ID="FIELD_lsend" runat="server" BackColor="Snow"
                            CssClass="Normal" DisplayField="name" FormatType="InputCombo" FormatValueField="logonid"
                            Gradient-GradientType="Top" ValueField="id" Width="131px">
                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                            <ErrorStyle BorderStyle="NotSet" />
                        </SmoothEnterpriseWebControlEnterprise:PopupUser></td>
                    <td style="width: 138px; height: 26px">
                        <asp:Label ID="Label21" runat="server" CssClass="NormalBold" Font-Size="Small" ForeColor="Red"
                            Height="10px" Text="*" Width="6px"></asp:Label>
                        <asp:Label ID="Label1aa" runat="server" CssClass="NormalBold" meta:resourcekey="LABEL1aa"
                            Text="生&nbsp;管&nbsp;單&nbsp;位" Width="90px" Font-Names="新細明體" Font-Size="10pt"></asp:Label></td>
                    <td style="width: 280px; height: 26px">
                        <SmoothEnterpriseWebControlEnterprise:PopupUser ID="FIELD_pmcsend" runat="server"
                            BackColor="Snow" CssClass="Normal" DisplayField="name" FormatType="InputCombo"
                            FormatValueField="logonid" Gradient-GradientType="Top" ValueField="id">
                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControlEnterprise:PopupUser></td>
                </tr>
                <tr>
                    <td style="width: 137px; height: 27px">
                        <asp:Label ID="Label35" runat="server" CssClass="NormalBold" Font-Size="Small" ForeColor="White"
                            Height="10px" Text="*" Width="6px"></asp:Label>
                        <asp:Label ID="LABEL13" runat="server" CssClass="NormalBold" meta:resourcekey="LABEL13"
                            Text="工&nbsp;程&nbsp;單&nbsp;位" Font-Names="新細明體" Font-Size="10pt"></asp:Label></td>
                    <td style="width: 10px; height: 27px">
                        <SmoothEnterpriseWebControlEnterprise:PopupUser ID="FIELD_workssend" runat="server"
                            BackColor="Snow" CssClass="Normal" DisplayField="name" FormatType="InputCombo"
                            FormatValueField="logonid" Gradient-GradientType="Top" ValueField="id" Width="131px">
                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControlEnterprise:PopupUser></td>
                    <td style="width: 138px; height: 27px">
                        <asp:Label ID="Label33" runat="server" CssClass="NormalBold" Font-Size="Small" ForeColor="White"
                            Height="10px" Text="*" Width="6px"></asp:Label>
                        <asp:Label ID="Label14a" runat="server" CssClass="NormalBold" meta:resourcekey="LABEL14a"
                            Text="製&nbsp;造&nbsp;單&nbsp;位" Font-Names="新細明體" Font-Size="10pt"></asp:Label></td>
                    <td style="width: 280px; height: 27px">
                        <SmoothEnterpriseWebControlEnterprise:PopupUser ID="FIELD_makesend" runat="server"
                            BackColor="Snow" CssClass="Normal" DisplayField="name" FormatType="InputCombo"
                            FormatValueField="logonid" Gradient-GradientType="Top" ValueField="id">
                            <Gradient GradientBegin="" GradientEnd="" GradientType="Top" />
                            <ErrorStyle BorderStyle="NotSet" CssClass="" />
                        </SmoothEnterpriseWebControlEnterprise:PopupUser></td>
                </tr>
                <tr>
                    <td style="width: 137px; height: 33px; vertical-align: top;">
                    </td>
                    <td colspan="3" style="height: 33px">
                    </td>
                </tr>
            </table>
                <table width="100%">
                    <tr>
                        <td colspan="4" style="height: 20px; background-color: #f0f0f0">
                            <asp:Label ID="Label30" runat="server" CssClass="NormalBold" Font-Size="Small" ForeColor="White"
                                Height="10px" Text="*" Width="6px"></asp:Label>
                            <asp:Label ID="Label32" runat="server" CssClass="NormalBold" Font-Names="新細明體" Font-Size="11pt"
                                ForeColor="DarkSlateGray" meta:resourcekey="Label9a" Text="通 知&nbsp;相&nbsp;關"
                                Width="116px"></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="width: 137px">
                            <asp:Label ID="Label34" runat="server" CssClass="NormalBold" Font-Size="Small" ForeColor="White"
                                Height="10px" Text="*" Width="6px"></asp:Label>
                            <asp:Label ID="Label37" runat="server" CssClass="NormalBold" Font-Names="新細明體" Font-Size="10pt"
                                meta:resourcekey="Labela" Text="NPI專案編號"></asp:Label></td>
                        <td colspan="3">
                            &nbsp;<input type="textbox" autocomplete="off"  id="project_no" name="project_no" value="" style="width: 140px; background-color: whitesmoke; border-left-color: gainsboro; border-bottom-color: gainsboro; border-top-style: solid; border-top-color: gainsboro; border-right-style: solid; border-left-style: solid; border-right-color: gainsboro; border-bottom-style: solid;">
                            <input id="Buttonpeople" type="button" value="代出專案成員" onclick="getData3()" style="font-weight: bold; font-size: 12px; color: #000000; width: 97px;"  /></td>
                    </tr>
                    <tr>
                        <td style="width: 137px; height: 26px">
                            <asp:Label ID="Label44" runat="server" CssClass="NormalBold" Font-Size="Small" ForeColor="White"
                                Height="10px" Text="*" Width="6px"></asp:Label>
                            <asp:Label ID="Labela" runat="server" CssClass="NormalBold" Font-Names="新細明體" Font-Size="10pt"
                                meta:resourcekey="Labela" Text="通知人員E-Mail"></asp:Label></td>
                        <td style="width: 23px; height: 26px">
                    <table>
                        <thead>
                            </thead>
                            <tbody id="tbd2">
                            <tr subid="EditZone2" bgColor="#FFFFFF"  onfocus="this.bgColor='#a9a9a9';" > 

                                <td style="width: 100px">
                                    <input type="textbox" autocomplete="off"  subid="txt" id="email" 
                                    name="email" value=""  
                                    style="width: 215px; background-color: whitesmoke; border-left-color: gainsboro; border-bottom-color: gainsboro; border-top-style: solid; border-top-color: gainsboro; border-right-style: solid; border-left-style: solid; border-right-color: gainsboro; border-bottom-style: solid;"></td>
                                <td style="width: 100px"><Button id="btnAdd2" name="btnAdd2"   > <Img Src="Image/add.png" Height="15px" Width="15px"  ></Button>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    <input type="hidden" id="idx2" name="idx2" value="0" /></td>
                        <td style="width: 138px; height: 26px">
                        </td>
                        <td style="width: 280px; height: 26px">
                        </td>
                    </tr>
            </table>
                <br />
                <br />
                <br />
            </td>
        </tr>
    </table>

    <br />
    <br />
	<table border="0" Class="Normal">
		<tr>
			<td>
				<SmoothEnterpriseWebControl:InputButton ID="BUTTON_save" runat="server"  Text="儲存" width="80px" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="BUTTON_save_Click"><Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" /></SmoothEnterpriseWebControl:InputButton>&nbsp;
				<SmoothEnterpriseWebControl:InputButton ID="BUTTON_savenext" runat="server" Text="儲存後繼續操作" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="BUTTON_save_Click" Visible="False"><Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" /></SmoothEnterpriseWebControl:InputButton>&nbsp;
				<SmoothEnterpriseWebControl:InputButton ID="BUTTON_back" runat="server" Text="回上頁" width="80px" BackColor="#C8C8C8" BorderColor="#606060" BorderStyle="Solid" BorderWidth="1px" CssClass="NormalBold" Font-Bold="True" Font-Names="Arial" Font-Size="12px" OnClick="BUTTON_back_Click"><Gradient GradientBegin="136, 136, 136" GradientEnd="White" GradientType="Bottom" /></SmoothEnterpriseWebControl:InputButton>
			</td>
		</tr>
	</table>
</asp:Content>