using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Text;

/// <summary>
/// Summary description for ServerChe
/// </summary>
public class ServerChe
{
	public ServerChe()
	{
		
	}
    public string GetHostNameByIp(string ip)
    {
        ip = ip.Trim();
        if (ip == string.Empty)
            return string.Empty;
        try
        {
            // 是否 Ping 的通
            if (this.Ping(ip))
            {
                System.Net.IPHostEntry host = System.Net.Dns.GetHostEntry(ip);
                return host.HostName;
            }
            else
                return string.Empty;
        }
        catch (Exception)
        {
            return string.Empty;
        }
    }

    public bool Ping(string ip)
    {
        System.Net.NetworkInformation.Ping p = new System.Net.NetworkInformation.Ping();
        System.Net.NetworkInformation.PingOptions options = new System.Net.NetworkInformation.PingOptions();
        options.DontFragment = true;
        string data = "Test Data!";
         byte[] buffer = Encoding.ASCII.GetBytes(data);
        int timeout = 1000; // Timeout 时间，单位：毫秒
        System.Net.NetworkInformation.PingReply reply = p.Send(ip, timeout, buffer, options);
        if (reply.Status == System.Net.NetworkInformation.IPStatus.Success)
            return true;
        else
            return false;
    }
}
