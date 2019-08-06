<%@ Page Language="C#" MasterPageFile="~/_site/layout/Template.master" AutoEventWireup="true" CodeFile="ShipmentMail.aspx.cs" Inherits="ShipmentMail" StylesheetTheme="Default" Culture="Auto" UICulture="Auto"%>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<head>
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

</head>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1"
        OnRowDataBound="GridView1_RowDataBound" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" GridLines="None" Width="3000px" Font-Size="9pt"  >
        <Columns>

            <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" >
                            <HeaderStyle CssClass="hiddencol"  />
                            <ItemStyle CssClass="hiddencol"  />
            </asp:BoundField>

                 <asp:TemplateField HeaderText="Item"> 
                     <ItemTemplate> 
                         <%#Container.DataItemIndex + 1%> 
                     </ItemTemplate> 
                 </asp:TemplateField> 



            <asp:BoundField DataField="Component" HeaderText="Component" SortExpression="Component" />
            <asp:BoundField DataField="DWG" HeaderText="DWG" SortExpression="DWG" />
            <asp:BoundField DataField="Partno" HeaderText="Partno" SortExpression="Partno" />
            <asp:BoundField DataField="Material" HeaderText="Material" SortExpression="Material" />
            <asp:BoundField DataField="npiname" HeaderText="NPI Engineer" SortExpression="npiname" />
            <asp:BoundField DataField="C_PO" HeaderText="Customer PO" SortExpression="C_PO" />
            <asp:BoundField DataField="Purpose2" HeaderText="Purpose" SortExpression="Purpose2" />
            <asp:BoundField DataField="LV" HeaderText="LV" SortExpression="LV" />
            <asp:BoundField DataField="HV" HeaderText="HV" SortExpression="HV" />
            <asp:BoundField DataField="Customer" HeaderText="Customer" SortExpression="Customer" />
            <asp:BoundField DataField="Qty" HeaderText="Qty" SortExpression="Qty" />
            <asp:BoundField DataField="C_demand" HeaderText="MA commitment date(ETD)" ReadOnly="True" SortExpression="C_demand" />
            <asp:BoundField DataField="C_demand2" HeaderText="MA commitment date revise (ETD)" ReadOnly="True" SortExpression="C_demand2" />
            <asp:BoundField DataField="systemstatus" HeaderText="Systemstatus" ReadOnly="True" />
            <asp:BoundField DataField="delay" HeaderText="Delay" ReadOnly="True" SortExpression="delay" />
            <asp:BoundField DataField="Potential_P" HeaderText="Potential Problem" SortExpression="Potential_P" />

        </Columns>
        <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
        <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
        <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EIPAConnectionString %>"
        SelectCommand="SELECT a.id, a.No AS no, a.Ver AS ver, a.Plant, b.item, a.ERP_PO, a.Customer, a.C_PO, a.Purpose, a.loc, c.name, CONVERT (char, a.Add_date, 111) AS Add_date, CASE Status WHEN 'N' THEN '未送審' WHEN 'Y' THEN '送審中' WHEN 'OK' THEN '完成審核' ELSE '退回' END AS status, b.Component, b.DWG, b.Partno, b.Material, d.LCaption, b.LV, b.HV, b.Qty, CONVERT (char, b.C_demand, 111) AS C_demand, CONVERT (char, b.C_demand2, 111) AS C_demand2, CONVERT (char, b.ETD, 111) AS ETD, b.Potential_P, b.Paper, b.Packing, b.B_no, b.Shipment_status, CASE WHEN etd = c_demand THEN 'On-time' WHEN CONVERT (char , getdate() , 111) < CONVERT (char , C_demand , 111) THEN 'In-Progress' WHEN CONVERT (char , C_demand2 , 111) > CONVERT (char , C_demand , 111) THEN 'Delay' END AS systemstatus, DATEDIFF(day, CONVERT (datetime, b.ETD), CONVERT (datetime, GETDATE())) AS delay, e.npiname FROM Shipment_head AS a LEFT OUTER JOIN Shipment_body AS b ON a.id = b.aid LEFT OUTER JOIN dguser AS c ON a.Add_user = c.id LEFT OUTER JOIN NPI_Base_file AS d ON b.Shipment_type = d.LID LEFT OUTER JOIN (SELECT Shipment_NPIEngineer.aid, dguser.name AS npiname FROM Shipment_NPIEngineer LEFT OUTER JOIN dguser ON Shipment_NPIEngineer.NPI_Engineer1 = dguser.id) AS e ON a.id = e.aid" ProviderName="<%$ ConnectionStrings:EIPBConnectionStringEIPAConnectionString.ProviderName %>">
    </asp:SqlDataSource>
    <br />
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2"
        OnRowDataBound="GridView1_RowDataBound" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" GridLines="None" Width="3000px" Font-Size="9pt"  >
        <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
        <Columns>
            <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" >
                <HeaderStyle CssClass="hiddencol"  />
                <ItemStyle CssClass="hiddencol"  />
            </asp:BoundField>
            <asp:TemplateField HeaderText="Item">
                <ItemTemplate>
                    <%#Container.DataItemIndex + 1%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Component" HeaderText="Component" SortExpression="Component" />
            <asp:BoundField DataField="DWG" HeaderText="DWG" SortExpression="DWG" />
            <asp:BoundField DataField="Partno" HeaderText="Partno" SortExpression="Partno" />
            <asp:BoundField DataField="Material" HeaderText="Material" SortExpression="Material" />
            <asp:BoundField DataField="npiname" HeaderText="NPI Engineer" SortExpression="npiname" />
            <asp:BoundField DataField="C_PO" HeaderText="Customer PO" SortExpression="C_PO" />
            <asp:BoundField DataField="Purpose2" HeaderText="Purpose" SortExpression="Purpose2" />
            <asp:BoundField DataField="LV" HeaderText="LV" SortExpression="LV" />
            <asp:BoundField DataField="HV" HeaderText="HV" SortExpression="HV" />
            <asp:BoundField DataField="Customer" HeaderText="Customer" SortExpression="Customer" />
            <asp:BoundField DataField="Qty" HeaderText="Qty" SortExpression="Qty" />
            <asp:BoundField DataField="C_demand" HeaderText="MA commitment date(ETD)" ReadOnly="True" SortExpression="C_demand" />
            <asp:BoundField DataField="C_demand2" HeaderText="MA commitment date revise (ETD)" ReadOnly="True" SortExpression="C_demand2" />
            <asp:BoundField DataField="systemstatus" HeaderText="Systemstatus" ReadOnly="True" />
            <asp:BoundField DataField="delay" HeaderText="Delay" ReadOnly="True" SortExpression="delay" />
            <asp:BoundField DataField="Potential_P" HeaderText="Potential Problem" SortExpression="Potential_P" />
        </Columns>
        <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
        <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:EIPAConnectionString %>"
        SelectCommand="SELECT a.id, a.No AS no, a.Ver AS ver, a.Plant, b.item, a.ERP_PO, a.Customer, a.C_PO, a.Purpose, a.loc, c.name, CONVERT (char, a.Add_date, 111) AS Add_date, CASE Status WHEN 'N' THEN '未送審' WHEN 'Y' THEN '送審中' WHEN 'OK' THEN '完成審核' ELSE '退回' END AS status, b.Component, b.DWG, b.Partno, b.Material, d.LCaption, b.LV, b.HV, b.Qty, CONVERT (char, b.C_demand, 111) AS C_demand, CONVERT (char, b.C_demand2, 111) AS C_demand2, CONVERT (char, b.ETD, 111) AS ETD, b.Potential_P, b.Paper, b.Packing, b.B_no, b.Shipment_status, CASE WHEN etd = c_demand THEN 'On-time' WHEN CONVERT (char , getdate() , 111) < CONVERT (char , C_demand , 111) THEN 'In-Progress' WHEN CONVERT (char , C_demand2 , 111) > CONVERT (char , C_demand , 111) THEN 'Delay' END AS systemstatus, DATEDIFF(day, CONVERT (datetime, b.ETD), CONVERT (datetime, GETDATE())) AS delay, e.npiname FROM Shipment_head AS a LEFT OUTER JOIN Shipment_body AS b ON a.id = b.aid LEFT OUTER JOIN dguser AS c ON a.Add_user = c.id LEFT OUTER JOIN NPI_Base_file AS d ON b.Shipment_type = d.LID LEFT OUTER JOIN (SELECT Shipment_NPIEngineer.aid, dguser.name AS npiname FROM Shipment_NPIEngineer LEFT OUTER JOIN dguser ON Shipment_NPIEngineer.NPI_Engineer1 = dguser.id) AS e ON a.id = e.aid" ProviderName="<%$ ConnectionStrings:EIPAConnectionString.ProviderName %>">
    </asp:SqlDataSource>
    <br />
    <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3"
        OnRowDataBound="GridView1_RowDataBound" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" GridLines="None" Width="3000px" Font-Size="9pt"  >
        <RowStyle BackColor="Red" ForeColor="White" />
        <Columns>
            <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" >
                <HeaderStyle CssClass="hiddencol"  />
                <ItemStyle CssClass="hiddencol"  />
            </asp:BoundField>
            <asp:TemplateField HeaderText="Item">
                <ItemTemplate>
                    <%#Container.DataItemIndex + 1%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Component" HeaderText="Component" SortExpression="Component" />
            <asp:BoundField DataField="DWG" HeaderText="DWG" SortExpression="DWG" />
            <asp:BoundField DataField="Partno" HeaderText="Partno" SortExpression="Partno" />
            <asp:BoundField DataField="Material" HeaderText="Material" SortExpression="Material" />
            <asp:BoundField DataField="npiname" HeaderText="NPI Engineer" SortExpression="npiname" />
            <asp:BoundField DataField="C_PO" HeaderText="Customer PO" SortExpression="C_PO" />
            <asp:BoundField DataField="Purpose2" HeaderText="Purpose" SortExpression="Purpose2" />
            <asp:BoundField DataField="LV" HeaderText="LV" SortExpression="LV" />
            <asp:BoundField DataField="HV" HeaderText="HV" SortExpression="HV" />
            <asp:BoundField DataField="Customer" HeaderText="Customer" SortExpression="Customer" />
            <asp:BoundField DataField="Qty" HeaderText="Qty" SortExpression="Qty" />
            <asp:BoundField DataField="C_demand" HeaderText="MA commitment date(ETD)" ReadOnly="True" SortExpression="C_demand" />
            <asp:BoundField DataField="C_demand2" HeaderText="MA commitment date revise (ETD)" ReadOnly="True" SortExpression="C_demand2" />
            <asp:BoundField DataField="systemstatus" HeaderText="Systemstatus" ReadOnly="True" />
            <asp:BoundField DataField="delay" HeaderText="Delay" ReadOnly="True" SortExpression="delay" />
            <asp:BoundField DataField="Potential_P" HeaderText="Potential Problem" SortExpression="Potential_P" />
        </Columns>
        <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
        <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:EIPAConnectionString %>"
        SelectCommand="SELECT a.id, a.No AS no, a.Ver AS ver, a.Plant, b.item, a.ERP_PO, a.Customer, a.C_PO, a.Purpose, a.loc, c.name, CONVERT (char, a.Add_date, 111) AS Add_date, CASE Status WHEN 'N' THEN '未送審' WHEN 'Y' THEN '送審中' WHEN 'OK' THEN '完成審核' ELSE '退回' END AS status, b.Component, b.DWG, b.Partno, b.Material, d.LCaption, b.LV, b.HV, b.Qty, CONVERT (char, b.C_demand, 111) AS C_demand, CONVERT (char, b.C_demand2, 111) AS C_demand2, CONVERT (char, b.ETD, 111) AS ETD, b.Potential_P, b.Paper, b.Packing, b.B_no, b.Shipment_status, CASE WHEN etd = c_demand THEN 'On-time' WHEN CONVERT (char , getdate() , 111) < CONVERT (char , C_demand , 111) THEN 'In-Progress' WHEN CONVERT (char , C_demand2 , 111) > CONVERT (char , C_demand , 111) THEN 'Delay' END AS systemstatus, DATEDIFF(day, CONVERT (datetime, b.ETD), CONVERT (datetime, GETDATE())) AS delay, e.npiname FROM Shipment_head AS a LEFT OUTER JOIN Shipment_body AS b ON a.id = b.aid LEFT OUTER JOIN dguser AS c ON a.Add_user = c.id LEFT OUTER JOIN NPI_Base_file AS d ON b.Shipment_type = d.LID LEFT OUTER JOIN (SELECT Shipment_NPIEngineer.aid, dguser.name AS npiname FROM Shipment_NPIEngineer LEFT OUTER JOIN dguser ON Shipment_NPIEngineer.NPI_Engineer1 = dguser.id) AS e ON a.id = e.aid" ProviderName="<%$ ConnectionStrings:EIPAConnectionString.ProviderName %>">
    </asp:SqlDataSource>
    <br />
    <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource4"
        OnRowDataBound="GridView1_RowDataBound" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" GridLines="None" Width="3000px" Font-Size="9pt"  >
        <RowStyle BackColor="Red" ForeColor="White" />
        <Columns>
            <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" >
                <HeaderStyle CssClass="hiddencol"  />
                <ItemStyle CssClass="hiddencol"  />
            </asp:BoundField>
            <asp:TemplateField HeaderText="Item">
                <ItemTemplate>
                    <%#Container.DataItemIndex + 1%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Component" HeaderText="Component" SortExpression="Component" />
            <asp:BoundField DataField="DWG" HeaderText="DWG" SortExpression="DWG" />
            <asp:BoundField DataField="Partno" HeaderText="Partno" SortExpression="Partno" />
            <asp:BoundField DataField="Material" HeaderText="Material" SortExpression="Material" />
            <asp:BoundField DataField="npiname" HeaderText="NPI Engineer" SortExpression="npiname" />
            <asp:BoundField DataField="C_PO" HeaderText="Customer PO" SortExpression="C_PO" />
            <asp:BoundField DataField="Purpose2" HeaderText="Purpose" SortExpression="Purpose2" />
            <asp:BoundField DataField="LV" HeaderText="LV" SortExpression="LV" />
            <asp:BoundField DataField="HV" HeaderText="HV" SortExpression="HV" />
            <asp:BoundField DataField="Customer" HeaderText="Customer" SortExpression="Customer" />
            <asp:BoundField DataField="Qty" HeaderText="Qty" SortExpression="Qty" />
            <asp:BoundField DataField="C_demand" HeaderText="MA commitment date(ETD)" ReadOnly="True" SortExpression="C_demand" />
            <asp:BoundField DataField="C_demand2" HeaderText="MA commitment date revise (ETD)" ReadOnly="True" SortExpression="C_demand2" />
            <asp:BoundField DataField="systemstatus" HeaderText="Systemstatus" ReadOnly="True" />
            <asp:BoundField DataField="delay" HeaderText="Delay" ReadOnly="True" SortExpression="delay" />
            <asp:BoundField DataField="Potential_P" HeaderText="Potential Problem" SortExpression="Potential_P" />
        </Columns>
        <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
        <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:EIPAConnectionString %>"
        SelectCommand="SELECT a.id, a.No AS no, a.Ver AS ver, a.Plant, b.item, a.ERP_PO, a.Customer, a.C_PO, a.Purpose, a.loc, c.name, CONVERT (char, a.Add_date, 111) AS Add_date, CASE Status WHEN 'N' THEN '未送審' WHEN 'Y' THEN '送審中' WHEN 'OK' THEN '完成審核' ELSE '退回' END AS status, b.Component, b.DWG, b.Partno, b.Material, d.LCaption, b.LV, b.HV, b.Qty, CONVERT (char, b.C_demand, 111) AS C_demand, CONVERT (char, b.C_demand2, 111) AS C_demand2, CONVERT (char, b.ETD, 111) AS ETD, b.Potential_P, b.Paper, b.Packing, b.B_no, b.Shipment_status, CASE WHEN etd = c_demand THEN 'On-time' WHEN CONVERT (char , getdate() , 111) < CONVERT (char , C_demand , 111) THEN 'In-Progress' WHEN CONVERT (char , C_demand2 , 111) > CONVERT (char , C_demand , 111) THEN 'Delay' END AS systemstatus, DATEDIFF(day, CONVERT (datetime, b.ETD), CONVERT (datetime, GETDATE())) AS delay, e.npiname FROM Shipment_head AS a LEFT OUTER JOIN Shipment_body AS b ON a.id = b.aid LEFT OUTER JOIN dguser AS c ON a.Add_user = c.id LEFT OUTER JOIN NPI_Base_file AS d ON b.Shipment_type = d.LID LEFT OUTER JOIN (SELECT Shipment_NPIEngineer.aid, dguser.name AS npiname FROM Shipment_NPIEngineer LEFT OUTER JOIN dguser ON Shipment_NPIEngineer.NPI_Engineer1 = dguser.id) AS e ON a.id = e.aid" ProviderName="<%$ ConnectionStrings:EIPAConnectionString.ProviderName %>">
    </asp:SqlDataSource>
    <br />    
</asp:Content>

