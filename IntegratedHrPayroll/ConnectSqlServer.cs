﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
namespace IntegratedHrPayroll
{
    public class ConnectSqlServer
    {
        SqlConnection conn;
        public ConnectSqlServer()
        {
            string sqlCon = @"Data Source=DESKTOP-HE26NH1;Initial Catalog=HR;Integrated Security=True";
            conn = new SqlConnection(sqlCon);
        }
        public DataTable getData(string sql)
        {
            DataTable dt = new DataTable();
            try
            {
                SqlDataAdapter da = new SqlDataAdapter(sql, conn);
                da.Fill(dt);
            }
            catch { }
            return dt;
        }

        public int UpdateData(string sql)
        {
            int row = 0;
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(sql, conn);
                row = cmd.ExecuteNonQuery();
            }
            catch { }
            finally
            {
                conn.Close();
            }
            return row;
        }
    }
}