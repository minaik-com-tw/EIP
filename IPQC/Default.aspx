<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="IPQC_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <style type="text/css">
        .Normal {
            font-weight: normal;
            font-size: 12px;
            font-family: Sans-Serif, Verdana, Arial, Tahoma;
        }

        .NormalBold {
            font-weight: bold;
            font-size: 12px;
            padding-top: 1px;
            font-family: Sans-Serif, Verdana, Arial, Tahoma;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr align="center">
                    <td>
                        <table>
                            <tr>
                                <td align="center" style="font-size: 24px; font-weight: bold">銘異股份有限公司 Min Aik Technology </td>
                            </tr>
                            <tr>
                                <td align="center" style="font-size: 14pt; font-weight: bold">品質異常處理單 Quality Abnormal Disposition Record </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <table>
                            <tr>
                                <td align="left" style="background-color: #ff3333">1.開案人員 Initiator </td>
                                <td align="left" style="background-color: #ff3333">2.開案年-月-日 </td>
                            </tr>
                            <tr>
                                <td>
                                    <table border="0" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td>
                                                <label>麥東明</label></td>
                                        </tr>
                                    </table>
                                </td>
                                <td>
                                    <label>2016-12-12</label></td>
                            </tr>
                            <tr>
                                <td align="left" style="background-color: #ff3333">3.異常單號碼 Disposition No. </td>
                                <td align="left" style="background-color: #ff3333">4.工單號碼 Traveling sheet No. </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>QAD16090001</label></td>
                                <td>
                                    <label>TEST</label></td>
                            </tr>
                            <tr>
                                <td align="left" style="background-color: #ff3333">5.異常站別 Abnormal Station </td>
                                <td align="left" style="background-color: #ff3333">6.客戶名稱 Customer name </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>FA</label>
                                </td>
                                <td>
                                    <label>Belton</label>
                                </td>
                            </tr>
                            <tr>
                                <td align="left" style="background-color: #ff3333">7.機種名稱 Program name </td>
                                <td align="left" style="background-color: #ff3333">8.產品名稱 Product name </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>白色</label></td>
                                <td>
                                    <label>GRT</label>
                                </td>
                            </tr>
                            <tr>
                                <td align="left" style="background-color: #ff3333">9.產品圖號 P/N </td>
                                <td align="left" style="background-color: #ff3333">10.產品版本 Product Rev. </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>TEST</label></td>
                                <td>
                                    <label>TEST</label></td>
                            </tr>
                            <tr>
                                <td align="left" style="background-color: #ff3333">11.產品階段 Product stage </td>
                                <td align="left" style="background-color: #ff3333">12.不良率 Defect Rate </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>NPI</label>
                                </td>
                                <td>
                                    <label>TEST</label></td>
                            </tr>
                            <tr>
                                <td align="left" colspan="2" style="background-color: #ff3333">13.異常描述 Abnormal Description 可複選 </td>
                            </tr>
                            <tr>
                                <td align="left" colspan="2">
                                    <textarea id="ctl00_ContentPlaceHolder1_FIELD_Description" readonly="readonly" class="Normal" cols="20" rows="1" style="height: 80px; width: 100%; background-color: #f0f0f0">TEST</textarea></td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
