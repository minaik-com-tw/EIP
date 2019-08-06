<%@ Page Title="" Language="C#" MasterPageFile="~/_site/layout/ie7.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="IPQC_Maintain_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <header>
        <style>
            #contentwrapper {
                float: left;
                width: 100%;
                background-color:red;
            }

#contentcolumn{
margin-left: 200px; /*Set left margin to LeftColumnWidth*/
}

#leftcolumn{
float: left;
width: 200px; /*Width of left column*/
margin-left: -100%;
background: #C8FC98;
}

        </style>
    </header>
<div id="contentwrapper">
    <div id="contentcolumn">
        <div class="innertube"><b>Content Column: <em>Fluid</em></b></div>
    </div>
</div>
<div id="leftcolumn">
    <div class="innertube"><b>Left Column: <em>200px</em></b></div>
</div>
</asp:Content>

