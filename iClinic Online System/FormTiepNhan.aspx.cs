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
    public partial class FormTiepNhan : System.Web.UI.Page
    {
        private SqlConnection connection = new SqlConnection("Data Source=.;Initial Catalog=iClinicDb;User ID=sa;Password=ThanhTruc1208");

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        public void loadDb()
        {
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet ds = new DataSet();
            int i = 0;
            string sql = null;
            sql = "select * from ServiceInfo";
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

        public void addService(object sender, EventArgs e)
        {

        }

        public void cancelService(object sender, EventArgs e)
        {

        }

        public void newPatient(object sender, EventArgs e)
        {

        }
    }
}