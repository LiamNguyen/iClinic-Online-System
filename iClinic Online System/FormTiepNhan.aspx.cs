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
        private SqlConnection connection = new SqlConnection("Data Source=.;Initial Catalog=iClinicSystem_MONACO_BK;User ID=sa;Password=ThanhTruc1208");

        protected void Page_Load(object sender, EventArgs e)
        {
            loadDb();
        }

        public void loadDb()
        {
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet ds = new DataSet();
            string sql = "select PAT_SER_ID , QUANTITY, PERCENT_DOWN, PRICE from PATIENTS_SERVICE";
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
                string display = "Data not found";
                ClientScript.RegisterStartupScript(this.GetType(), "yourMessage", "alert('" + display + "');", true);
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
                    string display = "Successfully added a new service";
                    ClientScript.RegisterStartupScript(this.GetType(), "yourMessage", "alert('" + display + "');", true);
                }
                else
                {
                    string display = "Error while adding a new service";
                    ClientScript.RegisterStartupScript(this.GetType(), "yourMessage", "alert('" + display + "');", true);
                }
            }
            catch(SqlException ex)
            {
                if (ex.Number == 2627) {
                    string display = "Repetition of Service ID";
                    ClientScript.RegisterStartupScript(this.GetType(), "yourMessage", "alert('" + display + "');", true);
                }
            }
        }

        public void cancelService(object sender, EventArgs e)
        {

        }

        public void newPatient(object sender, EventArgs e)
        {

        }
    }
}