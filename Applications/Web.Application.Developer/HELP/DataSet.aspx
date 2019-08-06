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
                            <asp:Label ID="L_classname" runat="server" Text="類別名稱"></asp:Label></td>
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
                            <asp:Label ID="L_constructor" runat="server" Text="建構值"></asp:Label></td>
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
                                        <asp:Label ID="D_constructor1" runat="server">使用預設資料庫連線，而且僅提供資料讀查詢功能，無法做資料更新</asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        DataSet(Connection,DataSetType)
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top" rowspan="4">
                                        <asp:Label ID="D_constructor2" runat="server"><strong>String</strong> :<br/>自訂資料庫連線字串<br/><br/><strong>Connection</strong> : <br/>自訂SmoothEnterprise.Database.Connection物件<br/><br/><strong>DataSetType</strong> :<br/>SmoothEnterprise.Database.DataSetType.<strong>OpenRead</strong> : 僅資料讀取<br/>SmoothEnterprise.Database.DataSetType.<strong>OpenUpdate</strong> : 可更新資料</asp:Label></td>
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
                            <asp:Label ID="L_properties" runat="server" Text="屬性"></asp:Label></td>
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
                                        <asp:Label ID="D_connection" runat="server" Text="取得或設定資料庫連線物件"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff; width: 112px;"
                                        valign="top">
                                        SQL</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_sql" runat="server" Text="取得或設定資料庫查詢字串"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff; width: 112px;"
                                        valign="top">
                                        BOF</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_bof" runat="server" Text="取得目前資料指標是否在第一筆"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff; width: 112px;"
                                        valign="top">
                                        EOF</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_eof" runat="server" Text="取得目前資料指標是否在最後一筆"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="width: 112px; height: 18px; background-color: #ffffff"
                                        valign="top">
                                        Columns</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    <asp:Label ID="D_columns" runat="server" Text="取得目前查詢結果的資料的欄位集合物件"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff; width: 112px;"
                                        valign="top">
                                        Row</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_row" runat="server" Text="取得目前資料指標的資料物件"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff; width: 112px;"
                                        valign="top">
                                        Rows</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_rows" runat="server" Text="取得目前查詢結果的資料集合物件"></asp:Label></td>
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
                            <asp:Label ID="L_method" runat="server" Text="方法"></asp:Label></td>
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
                                    <asp:Label ID="D_connectionstring" runat="server" Text="取得資料庫連線字串"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff; width: 112px;"
                                        valign="top">
                                        Open() +2</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_open" runat="server" >(多載)<br/><strong>Open()</strong> :<br/>使用SQL屬性的資料庫查詢字串進行資料開啟動作<br/><br/><strong>Open(string sql)</strong> :<br/>使用傳入的sql字串參數進行資料開啟動作</asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff; width: 112px;"
                                        valign="top">
                                        Close()</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_close" runat="server" Text="關閉資料庫連線"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff; width: 112px;"
                                        valign="top">
                                        Add()</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_add" runat="server" Text="新增一筆空白資料"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff; width: 112px;"
                                        valign="top">
                                        Update()</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_update" runat="server" Text="更新異動資料到資料庫(含上述新增的資料)"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="width: 112px; height: 18px; background-color: #ffffff"
                                        valign="top">
                                        Delete()</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    <asp:Label ID="D_delete" runat="server" Text="刪除目前資料指標的資料庫資料"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff; width: 112px;"
                                        valign="top">
                                        MoveFirst()</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_movefirst" runat="server" Text="將目前資料指標移至第一筆"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff; width: 112px;"
                                        valign="top">
                                        MoveLast()</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <asp:Label ID="D_movelast" runat="server" Text="將目前資料指標移至最後一筆"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="width: 112px; height: 18px; background-color: #ffffff"
                                        valign="top">
                                        MoveNext()</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    <asp:Label ID="D_movenext" runat="server" Text="將目前資料指標移至下一筆"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="width: 112px; height: 18px; background-color: #ffffff"
                                        valign="top">
                                        MovePrev()</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    <asp:Label ID="D_moveprev" runat="server" Text="將目前資料指標移至上一筆"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="width: 112px; height: 18px; background-color: #ffffff"
                                        valign="top">
                                        ExecuteNonQuery()</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    <asp:Label ID="D_executenonquery" runat="server" Text="以傳入的sql字串直接在資料庫上進行處理(僅處理 INSERT,UPDATE,DELETE 命令)"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    </td>
                                    <td Class="Normal" style="width: 112px; height: 18px; background-color: #ffffff"
                                        valign="top">
                                        ExecuteScalar()</td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                    <asp:Label ID="D_executescalar" runat="server" Text="以傳入的sql字串直接在資料庫上查詢，並回傳第一筆資料的第一個欄位值(僅處理 SELECT 命令)"></asp:Label></td>
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
                            <asp:Label ID="L_Example" runat="server" Text="程式範例"></asp:Label></td>
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
                                            // <strong>資料查詢</strong></span><br />
                                        SmoothEnterprise.Database.<span style="color: #339999">DataSet</span> ds = <span style="color: #0000ff">new</span> SmoothEnterprise.Database.<span style="color: #339999">DataSet</span>();
                                        <br />
                                        ds.Open(<span style="color: #cc0000">"SELECT * FROM <strong>資料表</strong>"</span>);
                                        <br />
                                        <span style="color: #0000ff">while</span>(!ds.EOF)<br />
                                        {<br />
                                        &nbsp; &nbsp; Response.Write(ds[<span style="color: #cc0000">"<strong>欄位名稱</strong>"</span>].ToString());
                                        <br />
                                        &nbsp; &nbsp; // 或 Label.Text = ds[<span style="color: #cc0000">"<strong>欄位名稱</strong>"</span>].ToString();
                                        <br />
                                        &nbsp; &nbsp; ds.MoveNext();<br />
                                        }<br />
                                        ds.Close();<br /><br />
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <br />
                                        <br />
                                        1. 首先宣告一個DataSet物件ds<br />
                                        2. 使用Open() 開啟資料表<br />
                                        3. 用while迴圈方式判斷目前資料指標是否有資料 ( !ds.EOF表示有資料)<br />
                                        4. 用ds[<span style="color: #cc0000">"<strong>欄位名稱</strong>"</span>].ToString() 取得欄位資料<br />
                                        5. 記得要做ds.MoveNext(); 將資料指標一致下一筆，否則會造成無窮迴圈<br />
                                        6. 最後ds.Close();關閉資料連線</td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <br />
                                        <span style="color: #339900">// <strong>資料新增與更新</strong></span><br />
                                        SmoothEnterprise.Database.<span style="color: #339999">DataSet</span> ds = <span style="color: #0000ff">new</span> SmoothEnterprise.Database.<span style="color: #339999">DataSet</span>(SmoothEnterprise.Database.<span style="color: #339999">DataSetType</span>.OpenUpdate);
                                        <br />
                                        ds.Open(<span style="color: #cc0000">"SELECT * FROM <strong>資料表</strong> WHERE <strong>條件式</strong>"</span>);
                                        <br />
                                        <span style="color: #0000ff">if</span>(!ds.EOF)<br />
                                        {<br />
                                        &nbsp; &nbsp; &nbsp; <span style="color: #339900">// 修改資料</span><br />
                                        &nbsp; &nbsp; ds[<span style="color: #cc0000">"<strong>欄位名稱1</strong>"</span>] = Label1.Text;
                                        <br />
                                        &nbsp; &nbsp; ds[<span style="color: #cc0000">"<strong>欄位名稱2</strong>"</span>] = Label2.Text;
                                        <br />
                                        }<br />
                                        <span style="color: #0000ff">else</span>
                                        <br />
                                        {&nbsp;<br />
                                        &nbsp; &nbsp; &nbsp; <span style="color: #339900">// 新增</span><br />
                                        &nbsp; &nbsp; ds.Add();
                                        <br />
                                        &nbsp; &nbsp; ds[<span style="color: #cc0000">"<strong>欄位名稱1</strong>"</span>] = Label1.Text;
                                        <br />
                                        &nbsp; &nbsp; ds[<span style="color: #cc0000">"<strong>欄位名稱2</strong>"</span>] = Label2.Text;
                                        <br />
                                        }
                                        <br />
                                        <span style="color: #339900">// 資料更新</span><br />
                                        ds.Update();
                                        <br />
                                        ds.Close();<br /><br />
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <br />
                                        <br />
                                        1. 首先宣告一個可進行更新動作(建構值參數為SmoothEnterprise.Database.<span style="color: #339999">DataSetType</span>.OpenUpdate)的DataSet物件ds<br />
                                        2. 使用Open() 開啟資料表，一定要加的查詢唯一條件，否則會更新全部資料喔<br />
                                        3. 判斷目前資料指標是否有資料 ( !ds.EOF表示有資料)<br />
                                        4. 有資料就進行更新(設定每個欄位資料ds[<span style="color: #cc0000">"<strong>欄位名稱1</strong>"</span>]
                                        = Label1.Text;
                                        <br />
                                        )<br />
                                        5. 無資料就先ds.Add(); 新增一筆資料，再設定每個欄位資料ds[<span style="color: #cc0000">"<strong>欄位名稱2</strong>"</span>]
                                        = Label2.Text;
                                        <br />
                                        6. 使用 ds.Update(); 將更新資料更新到資料庫<br />
                                        7. 最後ds.Close(); 關閉資料連線</td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <br />
                                        <span style="color: #339900">// <strong>資料刪除</strong></span><br />
                                        SmoothEnterprise.Database.<span style="color: #339999">DataSet</span> ds = <span style="color: #0000ff">new</span> SmoothEnterprise.Database.<span style="color: #339999">DataSet</span>(SmoothEnterprise.Database.<span style="color: #339999">DataSetType</span>.OpenUpdate);
                                        <br />
                                        ds.Open(<span style="color: #cc0000">"SELECT * FROM <strong>資料表</strong> WHERE <strong>條件式</strong>"</span>);
                                        <br />
                                        <span style="color: #0000ff">while</span>(!ds.EOF)<br />
                                        {<br />
                                        &nbsp; &nbsp; <span style="color: #339900">// 刪除</span><br />
                                        &nbsp; &nbsp; ds.Delete();&nbsp;<br />
                                        &nbsp; &nbsp; ds.MoveNext();<br />
                                        }<br />
                                        <span style="color: #339900">// 資料更新</span><br />
                                        ds.Update();<br />
                                        ds.Close();<br /><br />
                                    </td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <br />
                                        <br />
                                        1. 首先宣告一個可進行更新動作(建構值參數為SmoothEnterprise.Database.<span style="color: #339999">DataSetType</span>.OpenUpdate)的DataSet物件ds<br />
                                        2. 使用Open() 開啟資料表，記得加入要刪除資料的條件式，否則會刪除全部資料喔<br />
                                        3. 用while迴圈方式判斷目前資料指標是否有資料 ( !ds.EOF表示有資料)<br />
                                        4. 使用ds.Delete(); 刪除單筆資料<br />
                                        5. 記得要做ds.MoveNext(); 將資料指標一致下一筆，否則會造成無窮迴圈<br />
                                        6. 使用 ds.Update(); 將刪除的資料更新到資料庫<br />
                                        7. 最後ds.Close(); 關閉資料連線</td>
                                </tr>
                                <tr>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <br />
                                        <span style="color: #339900">// <strong>ExecuteNonQuery 與 ExecuteScalar</strong></span><br />
                                        SmoothEnterprise.Database.<span style="color: #339999">DataSet</span> ds = <span style="color: #0000ff">new</span> SmoothEnterprise.Database.<span style="color: #339999">DataSet</span>();<br />
                                        <span style="color: #339900">
                                            <br />
                                            // ExecuteNonQuery<br />
                                            <span style="color: #000000">ds.ExecuteNonQuery(<span style="color: #cc0000">"<strong>INSERT or UPDATE or DELETE SQL命令</strong>"</span>);<br />
                                                <span style="color: #339900">
                                                    <br />
                                                    // ExecuteScalar</span><br /><span style="color: #0000ff">object</span> obj = ds.ExecuteScalar(<span style="color: #cc0000">"SELECT <strong>欄位</strong> FROM <strong>資料表</strong> WHERE <strong>條件</strong>"</span>);
                                                <br />
                                                Label.Text = obj.ToString();</span></span><br /><br /></td>
                                    <td Class="Normal" style="height: 18px; background-color: #ffffff" valign="top">
                                        <br />
                                        <br />
                                        1. 首先宣告一個DataSet物件ds<br />
                                        2. 使用ds.ExecuteNonQuery直接下達SQL命令，此方法不會回傳資料結果，所以僅能處理<span style="color: #cc0000"><strong>INSERT
                                            or UPDATE or DELETE SQL命令<br />
                                            <br />
                                        </strong><span style="color: #000000">3. 使用ds.ExecuteScalar進行單一資料欄位查詢作業，會回傳Object物件型態，所以要轉存到其他物件屬性請記得轉換類別(
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
