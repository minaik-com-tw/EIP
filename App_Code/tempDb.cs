using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Text;
using System.Web;
using System.Web.UI.WebControls;





public abstract class TempDb<t>
{
    public TempDb()
    { 
    }

    public abstract DataTable Create();

   
}


