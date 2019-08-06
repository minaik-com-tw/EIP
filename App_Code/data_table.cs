using System;
using System.Collections.Generic;
using System.Data;
using System.Web;

/// <summary>
/// DataTable的模組化
/// </summary>
public class data_table
{
    private DataTable _temp;
    private string _name = "";
    public data_table()
    {
        _temp = new DataTable();
    }

    public data_table(string name)
    {
        _temp = new DataTable();
        _name = name;
    }
    public data_table(string name, params string[] col)
    {
        _temp = new DataTable();
        foreach (string value in col)
        {
            _temp.Columns.Add(value);
        }
        _name = name;
    }



    public string Name
    {
        get
        {
            return _name;
        }
    }

    public bool isExist(string command)
    {
        try
        {
            bool isNot = false;
            if (_temp.Rows.Count > 0)
            { 
                DataRow[] row = _temp.Select(command);

                if (row.Length > 0)
                {
                    isNot = true;
                }
            }

            return isNot;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }


    public void Row_Del(string command)
    {

        DataRow[] row = _temp.Select(command);

        if (row.Length > 0)
        {
            _temp.Rows.Remove(row[0]);
        }
    }



    public DataTable Table
    {
        get
        {
            return _temp;
        }

        set
        {
            _temp = (DataTable)value;

        }
    }


}