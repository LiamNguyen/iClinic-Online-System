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
                JsAlert("Data not found");
            }
        }

        public void addService(object sender, EventArgs e)
        {
            if (MaDichVuTxtBox.Text == "")
            {
                MaDichVuTxtBox.BackColor = System.Drawing.ColorTranslator.FromHtml("#FF6678");
                return;
            }

            try
            {
                string strSQL = "INSERT INTO ServiceInfo (PAT_SER_ID, QUANTITY, PERCENT_DOWN, PRICE) VALUES ( ";
                strSQL += MaDichVuTxtBox.Text + ", ";
                strSQL += SoLuongTxtBox.Text + ", ";
                strSQL += GiamTxtBox.Text + ", ";
                strSQL += "'" + loaigia.Text + "')";

                connection.Open();
                SqlCommand cmd = new SqlCommand(strSQL, connection);
                int result = cmd.ExecuteNonQuery();
                connection.Close();

                if (result == 1)
                {
                    loadDb();
                    ScriptManager.RegisterStartupScript(Page, GetType(), "clearTxtBox", "<script>clearTxtBox()</script>", false);
                }
                else
                {
                    JsAlert("Error while adding new service");
                }
            }
            catch(SqlException ex)
            {
                if (ex.Number == 2627) {
                    JsAlert("Service has already been added!");
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
            loadDb();

        }

        public void newPatient(object sender, EventArgs e)
        {

        }

        protected void madichvu_TextChanged(object sender, EventArgs e)
        {
            TenDichVuTxtBox.Text = MaDichVuTxtBox.Text;
        }

        public void JsAlert(string alertMessage)
        {
            ScriptManager.RegisterStartupScript(Page, GetType(), "alertPopUp", "<script>alertPopUp('" + alertMessage + "')</script>", false);
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