using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace sampleapp_framework
{
    public partial class About : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            string connetionString;
            SqlConnection cnn;
            connetionString = @"Data Source=52.255.210.234;Initial Catalog=shafi;User ID=sa;Password=@Aa123456";
            cnn = new SqlConnection(connetionString);
            cnn.Open();

            var a1 = "'"+TextBox1.Text+"'";
            var b1 = "'"+TextBox2.Text+"'";

            string query = "INSERT INTO t1 values('hello','shafi')";

            SqlCommand myCommand = new SqlCommand(query, cnn);

            myCommand.ExecuteNonQuery();

            cnn.Close();

        }
    }
}