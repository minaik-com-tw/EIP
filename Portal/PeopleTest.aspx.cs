using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.IO;
using System.Drawing;
using System.Collections.Specialized;


public partial class Portal_PeopleTest : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
        SqlConnection connection = new SqlConnection("uid=smooth;pwd=mat2009;Initial Catalog=EIP;Data Source=192.168.0.200; ");
        // Assumes that connection is a valid SqlConnection object.
        SqlCommand command = new SqlCommand(
          "select id,attachments   from  bul_main", connection);

        // Writes the BLOB to a file (*.bmp).
        FileStream stream;
        // Streams the BLOB to the FileStream object.
        BinaryWriter writer;

        // Size of the BLOB buffer.
        int bufferSize = 100;
        // The BLOB byte[] buffer to be filled by GetBytes.
        byte[] outByte = new byte[bufferSize];
        // The bytes returned from GetBytes.
        long retval;
        // The starting position in the BLOB output.
        long startIndex = 0;

        // The publisher id to use in the file name.
        string id = "";

        // Open the connection and read data into the DataReader.
        connection.Open();
        SqlDataReader reader = command.ExecuteReader(CommandBehavior.SequentialAccess);

        while (reader.Read())
        {
            // Get the publisher id, which must occur before getting the logo.
            id = reader.GetString(0);

            // Create a file to hold the output.
            stream = new FileStream(
              "attachments" + id + ".bmp", FileMode.OpenOrCreate, FileAccess.Write);
            writer = new BinaryWriter(stream);

            // Reset the starting byte for the new BLOB.
            startIndex = 0;

            // Read bytes into outByte[] and retain the number of bytes returned.
            retval = reader.GetBytes(1, startIndex, outByte, 0, bufferSize);

            // Continue while there are bytes beyond the size of the buffer.
            while (retval == bufferSize)
            {
                writer.Write(outByte);
                writer.Flush();

                // Reposition start index to end of last buffer and fill buffer.
                startIndex += bufferSize;
                retval = reader.GetBytes(1, startIndex, outByte, 0, bufferSize);
            }

            // Write the remaining buffer.
            writer.Write(outByte, 0, (int)retval - 1);
            writer.Flush();

            // Close the output file.
            writer.Close();
            stream.Close();
        }

        // Close the reader and the connection.
        reader.Close();
        connection.Close();


    }
}
