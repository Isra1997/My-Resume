using System;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;

namespace ResumeFrontEnd
{

    public partial class Archive : System.Web.UI.Page
    {
        protected void Page_Load(object args,EventArgs e){

                GetPost();  
           

        }

        void GetPost()
        {
            SqlConnection conn = new SqlConnection(@"Server=localhost; Database=Resume;User Id=sa;Password=Password123");
            SqlCommand cmd = new SqlCommand("Select * FROM Archive", conn);
            DataTable dt = new DataTable();
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            conn.Open();
            adp.Fill(dt);
            conn.Close();
            rpt.DataSource = dt;
            rpt.DataBind();
        }
    }
}
