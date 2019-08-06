<%@ Page Language="C#" MasterPageFile="~/_site/layout/Template.master" AutoEventWireup="true" CodeFile="test.aspx.cs" Inherits="test" StylesheetTheme="Default" Culture="Auto" UICulture="Auto"%>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 
 <head>
 <script type="text/javascript" src="/PManagement/js/jquery.min.js"></script>
<script src="jquery.autocomplete.js" type="text/javascript"> </script>


 <script language="javascript" type="text/javascript">
    $(function() {

       autoauto('Model_class','Model_class2','Model_class',true);
           
       
    });

  
  
  function autoauto(a1,b1,c1,d1)  //欄位名1,欄位名2,抓取的資料key
    {
        var x='ACDataSrc_Complex.aspx';
        //c1=c1+'_D';
        alert("23123");
        $('#'+a1).autocomplete(x,   
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
                    $('#'+b1).val(li.extra[1]);
                }
    
    }
  </script>
 </head>
  
  
    <asp:DropDownList ID="DropDownList1" runat="server" Width="141px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True">
        <asp:ListItem>NA</asp:ListItem>
        <asp:ListItem>2</asp:ListItem>
        <asp:ListItem>1</asp:ListItem>
    </asp:DropDownList>
    <input id="Model_class"  name="Model_class" style="border-left-color: gainsboro;
                                                                                                    border-bottom-color: gainsboro; width: 83px; border-top-style: solid; border-top-color: gainsboro;
                                                                                                    border-right-style: solid; border-left-style: solid; background-color: whitesmoke;
                                                                                                    border-right-color: gainsboro; border-bottom-style: solid" type="textbox" />
                                                                                                <input id="Model_class2"  name="Model_class2"  disabled="disabled" style="border-left-color: gainsboro;
                                                                                                    border-bottom-color: gainsboro; width: 100px; border-top-style: solid; border-top-color: gainsboro;
                                                                                                    border-right-style: solid; border-left-style: solid; background-color: whitesmoke;
                                                                                                    border-right-color: gainsboro; border-bottom-style: solid" type="textbox" />



</asp:Content>

