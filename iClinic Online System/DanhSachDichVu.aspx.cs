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
    public partial class DanhSachDichVu : System.Web.UI.Page
    {
        private SqlConnection connection = new SqlConnection("Data Source=.;Initial Catalog=iClinicDb;User ID=sa;Password=ThanhTruc1208");
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet ds = new DataSet();
            string sql = "select PAT_SER_ID, QUANTITY, PRICE from ServiceInfo";
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
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onmouseover"] = "this.style.backgroundColor='aquamarine';";
                e.Row.Attributes["onmouseout"] = "this.style.backgroundColor='white';";
                e.Row.ToolTip = "Click last column for selecting this row.";
            }
        }

        protected void OnSelectedIndexChanged(object sender, EventArgs e)
        {
            string id = grid.SelectedRow.Cells[0].Text;
            Session["PAT_SER_ID"] = "ID: " + id;
            msg.Text = "ID: " + id + " is selected";
        }
    }
}