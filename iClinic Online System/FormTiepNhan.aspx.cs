using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Globalization;

namespace iClinic_Online_System
{
    public partial class FormTiepNhan : System.Web.UI.Page
    {
        private SqlConnection connection = new SqlConnection("Data Source=.;Initial Catalog=iClinicDb;User ID=sa;Password=ThanhTruc1208");
        DateTime dateTime = DateTime.Now;

        public static DateTime Now { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            loadDb();
            getCurrentDateTime();
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
                    alert("Service has already been added!");
                }
            }
        }

        protected void gridView_RowDeleting(object sender, EventArgs e)
        {
            LinkButton removeService = (LinkButton)sender;
            connection.Open();
            SqlCommand cmd = new SqlCommand("delete from ServiceInfo where PAT_SER_ID = @PAT_SER_ID", connection);
            cmd.Parameters.Add("@PAT_SER_ID", SqlDbType.VarChar).Value = removeService.CommandArgument;
            int result = cmd.ExecuteNonQuery();
            connection.Close();
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

        public void getCurrentDateTime()
        {
            giotiepnhan.Text = dateTime.ToString("dd/MM/yyyy hh:mm");
        }

        public string calculateAge()
        {
            if (ngaysinh.Text != null)
            {
                string dob = ngaysinh.Text;
                string year = "";

                for (int i = 4; i > 0; i--)
                {
                    year += dob[dob.Length - i];
                }

                return (Convert.ToInt32(dateTime.ToString("yyyy")) - Convert.ToInt32(year)).ToString();
            }
            return null;
        }

        protected void ngaysinh_TextChanged(object sender, EventArgs e)
        {
            tuoi.Text = calculateAge();
        }

    }
}