using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;
using System.Data;
using System.Data.SqlClient;
namespace IntegratedHrPayroll
{
    public class ConnectMysql2
    {
        string strconn = "Server=localhost;Port=3306;Database=payroll;Uid=root;Pwd=040220;";

        private MySqlConnection connection;
        public MySqlConnection Connectsql()
        {
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
        public DataTable gettable(string sql)
        {
            connection = Connectsql();
            MySqlCommand cmd = new MySqlCommand(sql, connection);
            cmd.Connection = connection;
            MySqlDataAdapter da = new MySqlDataAdapter();
            da.SelectCommand = cmd;
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }
        //public int UpdateData(string sql)
        //{
        //    int row = 0;
        //    try
        //    {
        //        connection.Open();
        //        SqlCommand cmd = new SqlCommand(sql);
        //        cmd.Connection = connection;
        //        row = cmd.ExecuteNonQuery();
        //    }
        //    catch { }
        //    finally
        //    {
        //        connection.Close();
        //    }
        //    return row;
        //}
    }
}
