using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Web.Configuration;

namespace Academic
{
    public class DBconnetion
    {
        SqlConnection con = new SqlConnection();
        SqlCommand cmd = new SqlCommand();
        DataTable tbl = new DataTable();
        SqlDataAdapter da;
        DataSet ds = new DataSet();

      public DBconnetion()
        {
             //string c = WebConfigurationManager.ConnectionStrings["AcademicDBConnectionString"].ToString();
             con.ConnectionString = @"server=DESKTOP-07FF9I5\MYSQL;trusted_connection=true;database=AcademicDB";
             cmd.Connection = con;
        }
       public string SqlDml(string Statment)
        {
            try
            {
                cmd.CommandText = Statment;
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                return "Done";
            }
            catch (SqlException ex)
            {
                return ex.ToString();
            }
           
        }
        public DataTable SqlQuery(string Statment)
        {
            tbl.Rows.Clear();
            tbl.Columns.Clear();
            try
            {
                cmd.CommandText = Statment;
                con.Open();
                tbl.Load(cmd.ExecuteReader());
                con.Close();
                return tbl;
            }
            catch (SqlException )
            {
                return null;
            }
        }
        public DataSet addpter(string statment )
        {
            try
            {
                da = new SqlDataAdapter(statment, con);
                da.Fill(ds, "table");
                return ds;
            }
            catch (SqlException)
            {
                return null;
            }
        }
        public static int ID;

    }
}