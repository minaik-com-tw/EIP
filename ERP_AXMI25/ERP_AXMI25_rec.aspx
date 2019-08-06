<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ERP_AXMI25_rec.aspx.cs" Inherits="CNE_CNE_rec" %>
<head>
    <script src="js/jquery.min.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">
        $(window).load(function (){
            $.ajaxSetup({async:true});//非同步關閉
            $.post("ERP_AXMI25_receive.ashx?file=<%= Request.QueryString["file"].ToString() %>",function(data,status){
                    
            })
            window.close();
        })
    </script>
</head>

