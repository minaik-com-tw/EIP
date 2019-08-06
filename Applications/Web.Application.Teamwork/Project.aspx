<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Teamwork.Project, App_Web_project.aspx.cdcab7d2" theme="Default" %>

<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.WebControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Application.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">    
    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server" Details="The desciption for this program"
		Caption="Program Name" Width="100%" CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px">
		<CaptionStyle Font-Bold="True" CssClass="Medium"></CaptionStyle>
		<DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray"></DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>
    <table border="0">
        <tr>
            <td>
                <asp:Label ID="LABEL_code" runat="server" Text="專案代碼" cssClass="NormalBold" ></asp:Label></td>
            <td>
                <asp:Label ID="LABEL_name" runat="server" Text="名稱" cssClass="NormalBold" ></asp:Label></td>
            <td>
                <asp:Label ID="LABEL_projtypeid" runat="server" Text="專案類別" cssClass="NormalBold" ></asp:Label></td>
            <td>
                <asp:Label ID="LABEL_remark" runat="server" Text="說明" cssClass="NormalBold" ></asp:Label></td>
            <td>
                <asp:Label ID="LABEL_projstatusid" runat="server" Text="專案狀態" cssClass="NormalBold" ></asp:Label></td>
        </tr>
        <tr>
            <td>
                <SmoothEnterpriseWebControl:InputText ID="QUERY_code" runat="server" CssClass="Normal"
                    BackColor="#F0F0F0" Personalize="true">
                    <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                    <ErrorStyle BorderStyle="NotSet" CssClass=""></ErrorStyle>
                    <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                </SmoothEnterpriseWebControl:InputText></td>
            <td>
                <SmoothEnterpriseWebControl:InputText ID="QUERY_name" runat="server" CssClass="Normal"
                    BackColor="#F0F0F0" Personalize="true">
                    <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                    <ErrorStyle BorderStyle="NotSet" CssClass=""></ErrorStyle>
                    <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                </SmoothEnterpriseWebControl:InputText></td>
            <td>
                <SmoothEnterpriseWebControlEnterprise:SelectCode ID="QUERY_projtypeid" runat="server"
                    BackColor="#F0F0F0" CssClass="Normal" CodeType="projtype" ValueField="id"
                    TextField="name" Personalize="True" ItemAllDisplayed="True" ItemNoneDisplayed="True"
                    ItemAll-Gradient-GradientEnd=" " ItemAll-Gradient-GradientBegin=" " ItemAll-Selected="False"
                    ItemAll-RowHeight="18" ItemAll-Value="%" ItemAll-Text="%">
                    <ErrorStyle BorderStyle="NotSet" CssClass="" />
                    <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                </SmoothEnterpriseWebControlEnterprise:SelectCode>
            </td>
            <td>
                <SmoothEnterpriseWebControl:InputText ID="QUERY_remark" runat="server" CssClass="Normal"
                    BackColor="#F0F0F0" Personalize="true">
                    <ErrorStyle BorderStyle="NotSet" CssClass=""></ErrorStyle>
                    <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                </SmoothEnterpriseWebControl:InputText></td>
            <td>
                <SmoothEnterpriseWebControlEnterprise:SelectCode ID="QUERY_projstatusid" runat="server"
                    BackColor="#F0F0F0" CssClass="Normal" CodeType="projstatus" ValueField="id"
                    TextField="name" Personalize="True" ItemAllDisplayed="True" ItemNoneDisplayed="True"
                    ItemAll-Gradient-GradientEnd=" " ItemAll-Gradient-GradientBegin=" " ItemAll-Selected="False"
                    ItemAll-RowHeight="18" ItemAll-Value="%" ItemAll-Text="%" Editable="False">
                    <ErrorStyle BorderStyle="NotSet" />
                    <Gradient GradientType="Top" GradientBegin="" GradientEnd=""></Gradient>
                </SmoothEnterpriseWebControlEnterprise:SelectCode>
            </td>
            <td>
                <SmoothEnterpriseWebControl:InputButton ID="BUTTON_query" runat="server" Text="查詢"
                    Width="80px" Gradient-GradientType="Bottom" CssClass="NormalBold" BackColor="#C8C8C8"
                    BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid" Font-Names="Arial"
                    Font-Size="12px" Font-Bold="True" OnClick="BUTTON_query_Click">
                </SmoothEnterpriseWebControl:InputButton></td>
            <td>
                <SmoothEnterpriseWebControl:InputButton ID="BUTTON_add" runat="server" Text="新增"
                    Width="80px" Gradient-GradientType="Bottom" CssClass="NormalBold" BackColor="#C8C8C8"
                    BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid" Font-Names="Arial"
                    Font-Size="12px" Font-Bold="True" OnClick="BUTTON_add_Click">
                </SmoothEnterpriseWebControl:InputButton></td>
        </tr>
    </table>
    <table border="0" width="100%">
        <tr>
            <td>
                <SmoothEnterpriseWebControl:DataList ID="DataList1" runat="server" BorderColor="#000000"
                    RowNumber="True" RowAlign="Middle" NavigatorPos="Bottom" HeaderPos="Top" HeaderAlign="Middle"
                    EnablePrint="True" EnableExport="True" EnableCustom="True" CellPadding="3px"
                    guid="" rows="10" gridlines="both" BorderWidth="1px" BorderStyle="Solid" NavigatorGradient="Left"
                    HeaderGradient="Left" HeaderHeight="30px" SelectedColor="224, 224, 224" Font-Names="Arial"
                    Font-Size="12px" SQL="select * from dgproject" Personalize="True" OnOnRenderCell="DataList1_OnRenderCell">
                    <Columns>
                        <SmoothEnterpriseWebControl:DataColumn DataType="CheckBox" DataAlign="Center" Width="1%"
                            Required="True" ID="DataList1_chk" DataStyle-BorderStyle="NotSet"
                            HeaderStyle-BorderStyle="NotSet" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn DataType="IconEdit" DataAlign="Center" Width="1%"
                            ID="DataList1_edit" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="專案代碼" Required="True"
                            DataName="code" Sortable="True" ID="DataList1_code" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet"
                            runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="名稱" Required="True"
                            DataName="name" Sortable="True" ID="DataList1_name" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet"
                            runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="專案類別" Required="True"
                            DataName="projtypeid_name" Sortable="True" ID="DataList1_projptypeid" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet"
                            runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataList1_projphase" runat="server" Caption="目前階段"
                            DataName="projphase_name" DataStyle-BorderStyle="NotSet"
                            DataType="UserDefined" HeaderStyle-BorderStyle="NotSet"
                            Required="True" Sortable="True">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="說明" Required="True"
                            DataName="remark" Sortable="True" ID="DataList1_remark" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet"
                            runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn DataType="ViewText" Caption="專案狀態" DataName="projstatusid_name"
                            Sortable="True" ID="DataList1_projstatusid" DataStyle-BorderStyle="NotSet"
                            HeaderStyle-BorderStyle="NotSet" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="建立人員"
                            DataName="inituid_name" Sortable="True" ID="DataList1_inituid" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet"
                            runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="建立時間"
                            DataName="initdate" Sortable="True" ID="DataList1_initdate" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet"
                            runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="更新人員"
                            DataName="modifyuid_name" Sortable="True" ID="DataList1_modifyuid" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet"
                            runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn Visible="False" DataType="ViewText" Caption="更新時間"
                            DataName="modifydate" Sortable="True" ID="DataList1_modifydate" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet"
                            runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn ID="DataList1_gotask" Width="1%" DataType="UserDefined" Caption="工作計畫"
                            DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server" DataAlign="Center">
                        </SmoothEnterpriseWebControl:DataColumn>
                        <SmoothEnterpriseWebControl:DataColumn DataType="IconView" DataAlign="Center" Width="1%"
                            ID="DataList1_view" DataStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" runat="server">
                        </SmoothEnterpriseWebControl:DataColumn>
                    </Columns>
                    <NavigatorStyle Font-Size="10px" Font-Names="Arial" BorderStyle="Solid" BorderWidth="1px"
                        ForeColor="64, 64, 64" BorderColor="Silver" BackColor="224, 224, 224">
                    </NavigatorStyle>
                    <HeaderStyle Font-Bold="True" ForeColor="White" BackColor="Black" BorderStyle="NotSet"></HeaderStyle>
                    <SelectColumnStyle BackColor="242, 242, 242" BorderStyle="NotSet"></SelectColumnStyle>
                    <SelectStyle BackColor="195, 210, 248" BorderStyle="NotSet"></SelectStyle>
                    <GridLine LineColor="224, 224, 224" LineStyle="Solid" LineMode="Vertical" LineWidth="1px">
                    </GridLine>
                    <HoverStyle BackColor="230, 237, 255" BorderStyle="NotSet"></HoverStyle>
                    <RowStyle BorderStyle="NotSet" />
                </SmoothEnterpriseWebControl:DataList>
            </td>
        </tr>
    </table>
    <table border="0">
        <tr>
            <td>
                <SmoothEnterpriseWebControl:InputButton ID="BUTTON_delete" runat="server" Text="刪除"
                    Width="80px" Gradient-GradientType="Bottom" CssClass="NormalBold" BackColor="#C8C8C8"
                    BorderColor="#606060" BorderWidth="1px" BorderStyle="Solid" Font-Names="Arial"
                    Font-Size="12px" Font-Bold="True" OnClick="BUTTON_delete_Click">
                </SmoothEnterpriseWebControl:InputButton></td>
        </tr>
    </table>
</asp:Content>
