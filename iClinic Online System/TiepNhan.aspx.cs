using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace iClinic_Online_System
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet ds = new DataSet();
            int i = 0;
            string sql = null;
            string connetionString = "Data Source=.;Initial Catalog=iClinicDb;User ID=sa;Password=ThanhTruc1208";
            sql = "select * from ServiceInfo";
            SqlConnection connection = new SqlConnection(connetionString);
            connection.Open();
            SqlCommand command = new SqlCommand(sql, connection);
            adapter.SelectCommand = command;
            adapter.Fill(ds);
            adapter.Dispose();
            command.Dispose();
            connection.Close();
            grid.DataSource = ds.Tables[0];
            grid.DataBind();
        }
    }
}