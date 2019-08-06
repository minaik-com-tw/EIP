<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Tree.aspx.cs" Inherits="Leical_Build.Tree" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>

    <script src="../../script/jquery/jquery-1.10.2.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('.ann_header')
                .hover(function () {
                    cursorChange(this);
                })
                .click(function () {
                    foldToggle(this);
                });//.trigger('click');  // 預設是折疊起來 

            //.trigger('click');

            //$('.ann_sub_header')
            //    .addClass("fas fa-folder")
            //    .hover(function () {
            //        cursorChange(this);
            //    })
            //    .click(function () {
            //        foldToggle(this);
            //    });
            ////.trigger('click');  // 預設是折疊起來

        });

        // 打開or摺疊選單
        function foldToggle(element) {
            //$(element).next('ul').slideToggle();
            $(element).parent().children('ul').slideToggle();
            
        }

        // 讓游標移到標題上時，圖案會變成手指
        function cursorChange(element, cursorType) {
            $(element).css('cursor', 'pointer');
        }
    </script>
    <style>
        ul {
            list-style: none;
            padding: 2px 5px;
        }

        li {
            list-style: none;
            padding: 2px 5px;
        }

        i {
            padding: 1px 6px;
        }


        .cc_mark {
            text-decoration:line-through;
             color:red;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div> 
            <asp:Label ID="lab_tree" runat="server"></asp:Label>
        </div>
      
    </form>
</body>
</html>
