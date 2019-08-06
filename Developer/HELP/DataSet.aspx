<%@ page language="C#" masterpagefile="~/_site/layout/Template.master" autoeventwireup="true" inherits="SmoothEnterprise.Web.Application.Developer.DataSet, App_Web_dataset.aspx.87a0902e" stylesheettheme="Default" culture="Auto" uiculture="Auto" %>

<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.WebControl" TagPrefix="SmoothEnterpriseWebControl" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Application.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control.Enterprise, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Content.UI.WebControl" TagPrefix="SmoothEnterpriseWebControlEnterprise" %>
<%@ Register Assembly="SmoothEnterprise.Web.Control, Version=2.0.0.0, Culture=neutral, PublicKeyToken=2bc4b50aa8c436e1"
    Namespace="SmoothEnterprise.Web.UI.HTMLControl" TagPrefix="SmoothEnterpriseWebControl" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <SmoothEnterpriseWebControlEnterprise:Descriptor ID="ContentDescriptor" runat="server"
        Details="SmoothEnterprise.Database.DataSet" Caption="Class Library" Width="100%"
        CssClass="Normal" Gradient="None" Height="40%" PaddingSpace="5px" IconHeight=""
        IconWidth="" meta:resourcekey="ContentDescriptorResource1">
        <CaptionStyle Font-Bold="True" CssClass="Medium" BorderStyle="NotSet"></CaptionStyle>
        <DetailsStyle Font-Size="11px" Font-Names="Arial" ForeColor="Gray" BorderStyle="NotSet">
        </DetailsStyle>
    </SmoothEnterpriseWebControlEnterprise:Descriptor>
    <table style="width: 80%;">
        <tr>
            <td valign="top">
                <table width="100%" style="background-color: #339933; filter: progid:DXImageTransform.Microsoft.Gradient(startColorStr='#FFFFFFF', endColorStr='#55AAFFAA', gradientType='1');
                    border-right: #000099 1px solid; border-top: #000099 1px solid; border-left: #000099 1px solid;
                    border-bottom: #000099 1px solid;">
                    <tr>
                        <td Class="NormalBold" style="font-size: 14px; border-bottom: #009900 thin solid;">
                            <asp:Label ID="L_classname" runat="server" Text="���O�W��"></asp:Label></td>
                    </tr>
                    <tr>
                        <td Class="Normal" style="height:30px">
                            SmoothEnterprise.Database.<strong>DataSet</strong>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td height="5">
            </td>
        </tr>
        <tr>
            <td Class="Normal">
                <table width="100%">
                    <tr>
                        <td Class="NormalBold" style="font-size: 14px; border-bottom: #009900 thin solid;
                            height: 20px;">
                            <asp:Label ID="L_constructor" runat="server" Text="�غc��"></asp:Label></td>
                    </tr>
                    <tr>
                        <td Class="Normal">
                            <table width="100%" style="border-right: #003300 1px solid; border-top: #003300 1px solid;
                                border-left: #003300 1px solid; border-bottom: #003300 1px solid">
                                <tr>
                                    <td width="1%" Class="NormalBold" style="color: #ffffff; background-color: #003300;"
                                        align="center">
                                    </td>
                                    <td width="30%" Class="NormalBold" style="color: #ffffff; background-color: #003300;"
                                        align="center">
                                        Overload
                                    </td>
                                    <td Class="NormalBold" style="color: #ffffff; background-color: #003300;" align="center">
                                        Description
                                    </td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        DataSet()</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_constructor1" runat="server">�ϥιw�]��Ʈw�s�u�A�ӥB�ȴ��Ѹ��Ū�d�ߥ\��A�L�k����Ƨ�s</asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        DataSet(Connection,DataSetType)
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top" rowspan="4">
                                        <asp:Label ID="D_constructor2" runat="server"><strong>String</strong> :<br/>�ۭq��Ʈw�s�u�r��<br/><br/><strong>Connection</strong> : <br/>�ۭqSmoothEnterprise.Database.Connection����<br/><br/><strong>DataSetType</strong> :<br/>SmoothEnterprise.Database.DataSetType.<strong>OpenRead</strong> : �ȸ��Ū��<br/>SmoothEnterprise.Database.DataSetType.<strong>OpenUpdate</strong> : �i��s���</asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        DataSet(DataSetType)</td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        DataSet(String)</td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        DataSet(String,DataSetType)</td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td Class="Normal">
                <table width="100%">
                    <tr>
                        <td Class="NormalBold" style="font-size: 14px; border-bottom: #009900 thin solid;
                            height: 20px;">
                            <asp:Label ID="L_properties" runat="server" Text="�ݩ�"></asp:Label></td>
                    </tr>
                    <tr>
                        <td Class="Normal">
                            <table width="100%" style="border-right: #003300 1px solid; border-top: #003300 1px solid;
                                border-left: #003300 1px solid; border-bottom: #003300 1px solid">
                                <tr>
                                    <td width="1%" Class="NormalBold" style="color: #ffffff; background-color: #003300;"
                                        align="center">
                                    </td>
                                    <td width="20%" Class="NormalBold" style="color: #ffffff; background-color: #003300;"
                                        align="center">
                                        Name
                                    </td>
                                    <td Class="NormalBold" style="color: #ffffff; background-color: #003300;" align="center">
                                        Description
                                    </td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff; width: 112px;"
                                        valign="top">
                                        Connection</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_connection" runat="server" Text="���o�γ]�w��Ʈw�s�u����"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff; width: 112px;"
                                        valign="top">
                                        SQL</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_sql" runat="server" Text="���o�γ]�w��Ʈw�d�ߦr��"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff; width: 112px;"
                                        valign="top">
                                        BOF</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_bof" runat="server" Text="���o�ثe��ƫ��ЬO�_�b�Ĥ@��"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff; width: 112px;"
                                        valign="top">
                                        EOF</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_eof" runat="server" Text="���o�ثe��ƫ��ЬO�_�b�̫�@��"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="width: 112px; height: 18px; background-color: #ffffff"
                                        valign="top">
                                        Columns</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    <asp:Label ID="D_columns" runat="server" Text="���o�ثe�d�ߵ��G����ƪ���춰�X����"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff; width: 112px;"
                                        valign="top">
                                        Row</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_row" runat="server" Text="���o�ثe��ƫ��Ъ���ƪ���"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff; width: 112px;"
                                        valign="top">
                                        Rows</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_rows" runat="server" Text="���o�ثe�d�ߵ��G����ƶ��X����"></asp:Label></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td height="5">
            </td>
        </tr>
                <tr>
            <td Class="Normal">
                <table width="100%">
                    <tr>
                        <td Class="NormalBold" style="font-size: 14px; border-bottom: #009900 thin solid;
                            height: 20px;">
                            <asp:Label ID="L_method" runat="server" Text="��k"></asp:Label></td>
                    </tr>
                    <tr>
                        <td Class="Normal">
                            <table width="100%" style="border-right: #003300 1px solid; border-top: #003300 1px solid;
                                border-left: #003300 1px solid; border-bottom: #003300 1px solid">
                                <tr>
                                    <td width="1%" Class="NormalBold" style="color: #ffffff; background-color: #003300;"
                                        align="center">
                                    </td>
                                    <td width="20%" Class="NormalBold" style="color: #ffffff; background-color: #003300;"
                                        align="center">
                                        Name
                                    </td>
                                    <td Class="NormalBold" style="color: #ffffff; background-color: #003300;" align="center">
                                        Description
                                    </td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="width: 112px; height: 18px; background-color: #ffffff"
                                        valign="top">
                                        ConnectionString()</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    <asp:Label ID="D_connectionstring" runat="server" Text="���o��Ʈw�s�u�r��"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff; width: 112px;"
                                        valign="top">
                                        Open() +2</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_open" runat="server" >(�h��)<br/><strong>Open()</strong> :<br/>�ϥ�SQL�ݩʪ���Ʈw�d�ߦr��i���ƶ}�Ұʧ@<br/><br/><strong>Open(string sql)</strong> :<br/>�ϥζǤJ��sql�r��Ѽƶi���ƶ}�Ұʧ@</asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff; width: 112px;"
                                        valign="top">
                                        Close()</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_close" runat="server" Text="������Ʈw�s�u"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff; width: 112px;"
                                        valign="top">
                                        Add()</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_add" runat="server" Text="�s�W�@���ťո��"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff; width: 112px;"
                                        valign="top">
                                        Update()</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_update" runat="server" Text="��s���ʸ�ƨ��Ʈw(�t�W�z�s�W�����)"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="width: 112px; height: 18px; background-color: #ffffff"
                                        valign="top">
                                        Delete()</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    <asp:Label ID="D_delete" runat="server" Text="�R���ثe��ƫ��Ъ���Ʈw���"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff; width: 112px;"
                                        valign="top">
                                        MoveFirst()</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_movefirst" runat="server" Text="�N�ثe��ƫ��в��ܲĤ@��"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff; width: 112px;"
                                        valign="top">
                                        MoveLast()</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_movelast" runat="server" Text="�N�ثe��ƫ��в��̫ܳ�@��"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="width: 112px; height: 18px; background-color: #ffffff"
                                        valign="top">
                                        MoveNext()</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    <asp:Label ID="D_movenext" runat="server" Text="�N�ثe��ƫ��в��ܤU�@��"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="width: 112px; height: 18px; background-color: #ffffff"
                                        valign="top">
                                        MovePrev()</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    <asp:Label ID="D_moveprev" runat="server" Text="�N�ثe��ƫ��в��ܤW�@��"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="width: 112px; height: 18px; background-color: #ffffff"
                                        valign="top">
                                        ExecuteNonQuery()</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    <asp:Label ID="D_executenonquery" runat="server" Text="�H�ǤJ��sql�r�ꪽ���b��Ʈw�W�i��B�z(�ȳB�z INSERT,UPDATE,DELETE �R�O)"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="width: 112px; height: 18px; background-color: #ffffff"
                                        valign="top">
                                        ExecuteScalar()</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    <asp:Label ID="D_executescalar" runat="server" Text="�H�ǤJ��sql�r�ꪽ���b��Ʈw�W�d�ߡA�æ^�ǲĤ@����ƪ��Ĥ@������(�ȳB�z SELECT �R�O)"></asp:Label></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td height="5">
            </td>
        </tr>
        <tr style="color: #000000">
            <td Class="Normal">
                <table width="100%">
                    <tr>
                        <td Class="NormalBold" style="font-size: 14px; border-bottom: #009900 thin solid;
                            height: 20px;">
                            <asp:Label ID="L_Example" runat="server" Text="�{���d��"></asp:Label></td>
                    </tr>
                    <tr>
                        <td Class="Normal">
                            <table width="100%" style="border-right: #003300 1px solid; border-top: #003300 1px solid;
                                border-left: #003300 1px solid; border-bottom: #003300 1px solid">
                                <tr>
                                    <td Class="NormalBold" style="color: #ffffff; background-color: #003300;" align="center">
                                        Example
                                    </td>
                                    <td width="50%" align="center" Class="NormalBold" style="color: #ffffff; background-color: #003300">
                                        Description</td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <span style="color: #339900">
                                            <br />
                                            // <strong>��Ƭd��</strong></span><br />
                                        SmoothEnterprise.Database.<span style="color: #339999">DataSet</span> ds = <span style="color: #0000ff">new</span> SmoothEnterprise.Database.<span style="color: #339999">DataSet</span>();
                                        <br />
                                        ds.Open(<span style="color: #cc0000">"SELECT * FROM <strong>��ƪ�</strong>"</span>);
                                        <br />
                                        <span style="color: #0000ff">while</span>(!ds.EOF)<br />
                                        {<br />
                                        &nbsp; &nbsp; Response.Write(ds[<span style="color: #cc0000">"<strong>���W��</strong>"</span>].ToString());
                                        <br />
                                        &nbsp; &nbsp; // �� Label.Text = ds[<span style="color: #cc0000">"<strong>���W��</strong>"</span>].ToString();
                                        <br />
                                        &nbsp; &nbsp; ds.MoveNext();<br />
                                        }<br />
                                        ds.Close();<br /><br />
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <br />
                                        <br />
                                        1. �����ŧi�@��DataSet����ds<br />
                                        2. �ϥ�Open() �}�Ҹ�ƪ�<br />
                                        3. ��while�j��覡�P�_�ثe��ƫ��ЬO�_����� ( !ds.EOF��ܦ����)<br />
                                        4. ��ds[<span style="color: #cc0000">"<strong>���W��</strong>"</span>].ToString() ���o�����<br />
                                        5. �O�o�n��ds.MoveNext(); �N��ƫ��Ф@�P�U�@���A�_�h�|�y���L�a�j��<br />
                                        6. �̫�ds.Close();������Ƴs�u</td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <br />
                                        <span style="color: #339900">// <strong>��Ʒs�W�P��s</strong></span><br />
                                        SmoothEnterprise.Database.<span style="color: #339999">DataSet</span> ds = <span style="color: #0000ff">new</span> SmoothEnterprise.Database.<span style="color: #339999">DataSet</span>(SmoothEnterprise.Database.<span style="color: #339999">DataSetType</span>.OpenUpdate);
                                        <br />
                                        ds.Open(<span style="color: #cc0000">"SELECT * FROM <strong>��ƪ�</strong> WHERE <strong>����</strong>"</span>);
                                        <br />
                                        <span style="color: #0000ff">if</span>(!ds.EOF)<br />
                                        {<br />
                                        &nbsp; &nbsp; &nbsp; <span style="color: #339900">// �ק���</span><br />
                                        &nbsp; &nbsp; ds[<span style="color: #cc0000">"<strong>���W��1</strong>"</span>] = Label1.Text;
                                        <br />
                                        &nbsp; &nbsp; ds[<span style="color: #cc0000">"<strong>���W��2</strong>"</span>] = Label2.Text;
                                        <br />
                                        }<br />
                                        <span style="color: #0000ff">else</span>
                                        <br />
                                        {&nbsp;<br />
                                        &nbsp; &nbsp; &nbsp; <span style="color: #339900">// �s�W</span><br />
                                        &nbsp; &nbsp; ds.Add();
                                        <br />
                                        &nbsp; &nbsp; ds[<span style="color: #cc0000">"<strong>���W��1</strong>"</span>] = Label1.Text;
                                        <br />
                                        &nbsp; &nbsp; ds[<span style="color: #cc0000">"<strong>���W��2</strong>"</span>] = Label2.Text;
                                        <br />
                                        }
                                        <br />
                                        <span style="color: #339900">// ��Ƨ�s</span><br />
                                        ds.Update();
                                        <br />
                                        ds.Close();<br /><br />
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <br />
                                        <br />
                                        1. �����ŧi�@�ӥi�i���s�ʧ@(�غc�ȰѼƬ�SmoothEnterprise.Database.<span style="color: #339999">DataSetType</span>.OpenUpdate)��DataSet����ds<br />
                                        2. �ϥ�Open() �}�Ҹ�ƪ�A�@�w�n�[���d�߰ߤ@����A�_�h�|��s������Ƴ�<br />
                                        3. �P�_�ثe��ƫ��ЬO�_����� ( !ds.EOF��ܦ����)<br />
                                        4. ����ƴN�i���s(�]�w�C�������ds[<span style="color: #cc0000">"<strong>���W��1</strong>"</span>]
                                        = Label1.Text;
                                        <br />
                                        )<br />
                                        5. �L��ƴN��ds.Add(); �s�W�@����ơA�A�]�w�C�������ds[<span style="color: #cc0000">"<strong>���W��2</strong>"</span>]
                                        = Label2.Text;
                                        <br />
                                        6. �ϥ� ds.Update(); �N��s��Ƨ�s���Ʈw<br />
                                        7. �̫�ds.Close(); ������Ƴs�u</td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <br />
                                        <span style="color: #339900">// <strong>��ƧR��</strong></span><br />
                                        SmoothEnterprise.Database.<span style="color: #339999">DataSet</span> ds = <span style="color: #0000ff">new</span> SmoothEnterprise.Database.<span style="color: #339999">DataSet</span>(SmoothEnterprise.Database.<span style="color: #339999">DataSetType</span>.OpenUpdate);
                                        <br />
                                        ds.Open(<span style="color: #cc0000">"SELECT * FROM <strong>��ƪ�</strong> WHERE <strong>����</strong>"</span>);
                                        <br />
                                        <span style="color: #0000ff">while</span>(!ds.EOF)<br />
                                        {<br />
                                        &nbsp; &nbsp; <span style="color: #339900">// �R��</span><br />
                                        &nbsp; &nbsp; ds.Delete();&nbsp;<br />
                                        &nbsp; &nbsp; ds.MoveNext();<br />
                                        }<br />
                                        <span style="color: #339900">// ��Ƨ�s</span><br />
                                        ds.Update();<br />
                                        ds.Close();<br /><br />
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <br />
                                        <br />
                                        1. �����ŧi�@�ӥi�i���s�ʧ@(�غc�ȰѼƬ�SmoothEnterprise.Database.<span style="color: #339999">DataSetType</span>.OpenUpdate)��DataSet����ds<br />
                                        2. �ϥ�Open() �}�Ҹ�ƪ�A�O�o�[�J�n�R����ƪ����󦡡A�_�h�|�R��������Ƴ�<br />
                                        3. ��while�j��覡�P�_�ثe��ƫ��ЬO�_����� ( !ds.EOF��ܦ����)<br />
                                        4. �ϥ�ds.Delete(); �R���浧���<br />
                                        5. �O�o�n��ds.MoveNext(); �N��ƫ��Ф@�P�U�@���A�_�h�|�y���L�a�j��<br />
                                        6. �ϥ� ds.Update(); �N�R������Ƨ�s���Ʈw<br />
                                        7. �̫�ds.Close(); ������Ƴs�u</td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <br />
                                        <span style="color: #339900">// <strong>ExecuteNonQuery �P ExecuteScalar</strong></span><br />
                                        SmoothEnterprise.Database.<span style="color: #339999">DataSet</span> ds = <span style="color: #0000ff">new</span> SmoothEnterprise.Database.<span style="color: #339999">DataSet</span>();<br />
                                        <span style="color: #339900">
                                            <br />
                                            // ExecuteNonQuery<br />
                                            <span style="color: #000000">ds.ExecuteNonQuery(<span style="color: #cc0000">"<strong>INSERT or UPDATE or DELETE SQL�R�O</strong>"</span>);<br />
                                                <span style="color: #339900">
                                                    <br />
                                                    // ExecuteScalar</span><br /><span style="color: #0000ff">object</span> obj = ds.ExecuteScalar(<span style="color: #cc0000">"SELECT <strong>���</strong> FROM <strong>��ƪ�</strong> WHERE <strong>����</strong>"</span>);
                                                <br />
                                                Label.Text = obj.ToString();</span></span><br /><br /></td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <br />
                                        <br />
                                        1. �����ŧi�@��DataSet����ds<br />
                                        2. �ϥ�ds.ExecuteNonQuery�����U�FSQL�R�O�A����k���|�^�Ǹ�Ƶ��G�A�ҥH�ȯ�B�z<span style="color: #cc0000"><strong>INSERT
                                            or UPDATE or DELETE SQL�R�O<br />
                                            <br />
                                        </strong><span style="color: #000000">3. �ϥ�ds.ExecuteScalar�i���@������d�ߧ@�~�A�|�^��Object���󫬺A�A�ҥH�n��s���L�����ݩʽаO�o�ഫ���O(
                                            ex. obj.ToString(); )</span></span></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
