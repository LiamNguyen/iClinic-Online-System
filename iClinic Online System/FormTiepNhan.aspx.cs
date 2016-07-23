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
            loadDb();
        }

        public void loadDb()
        {
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet ds = new DataSet();
            string sql = "select PAT_SER_ID, QUANTITY, PERCENT_DOWN, PRICE from ServiceInfo";
            connection.Open();
            SqlCommand command = new SqlCommand(sql, connection);
            adapter.SelectCommand = command;
            adapter.Fill(ds);
            adapter.Dispose();
            command.Dispose();
            connection.Close();
            if (ds.Tables[0].Rows.Count > 0)
            {
                grid.DataSource = ds;
                grid.DataBind();
            }
            else
            {
                ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
                grid.DataSource = ds;
                grid.DataBind();
                alert("Data not found");
            }
        }

        public void addService(object sender, EventArgs e)
        {
            try
            {
                string strSQL = "INSERT INTO ServiceInfo (PAT_SER_ID, QUANTITY, PERCENT_DOWN, PRICE) VALUES ( ";
                strSQL += madichvu.Text + ", ";
                strSQL += soluong.Text + ", ";
                strSQL += giam.Text + ", ";
                strSQL += "'" + loaigia.Text + "')";

                connection.Open();
                SqlCommand cmd = new SqlCommand(strSQL, connection);
                int result = cmd.ExecuteNonQuery();
                connection.Close();

                if (result == 1)
                {
                    loadDb();
                    alert("Successfully added a new service");
                }
                else
                {
                    alert("Error while adding a new service");
                }
            }
            catch(SqlException ex)
            {
                if (ex.Number == 2627) {
                    alert("Repetition of Service ID");
                }
            }
        }

        protected void gridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string PAT_SER_ID = grid.DataKeys[e.RowIndex].Values["PAT_SER_ID"].ToString();
            connection.Open();
            SqlCommand cmd = new SqlCommand("delete from ServiceInfo where PAT_SER_ID =" + PAT_SER_ID, connection);
            int result = cmd.ExecuteNonQuery();
            connection.Close();

            if (result == 1)
            {
                loadDb();
                alert("Successfully deleted a service");
            }
            else
            {
                alert("Error while deleting a service");
            }
        }

        public void newPatient(object sender, EventArgs e)
        {

        }

        protected void madichvu_TextChanged(object sender, EventArgs e)
        {
            tendichvu.Text = madichvu.Text;
        }

        public void alert(string alertMessage)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "yourMessage", "alert('" + alertMessage + "');", true);
        }
    }
}