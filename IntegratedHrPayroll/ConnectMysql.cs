using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;
using System.Data;
using System.Data.SqlClient;
namespace IntegratedHrPayroll
{
    public class ConnectMysql
    {
        string strconn = "Server=localhost;Port=3306;Database=test;Uid=root;Pwd=040220;";

        MySqlConnection connection;
        public MySqlConnection Connectsql()
        {
            strconn = "Server=localhost;Port=3306;Database=test;Uid=root;Pwd=loiloiloi;";
            connection = new MySqlConnection(strconn);
            try
            {
                connection.Open();
                return connection;
            }
            finally
            {
                connection.Close();
            }
        }
        public DataSet gettable(string sql)
        {
            MySqlConnection con = Connectsql();
            MySqlCommand cmd = new MySqlCommand(sql, con);
            cmd.Connection = con;
            MySqlDataAdapter da = new MySqlDataAdapter();
            da.SelectCommand = cmd;
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
        }
    }
}