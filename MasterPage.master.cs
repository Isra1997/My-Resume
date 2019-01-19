using System;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace ResumeFrontEnd
{
    public partial class Masterpage : System.Web.UI.MasterPage
                                            
    {
        
     
        protected void Page_Load(object sender, EventArgs e)
        {
            //SqlConnection conn = new SqlConnection(@"Server=localhost; Database=Resume;User Id=sa;Password=Password123");
            //SqlCommand cmd = new SqlCommand("GetNavbarItems");
            //cmd.CommandType = CommandType.StoredProcedure;

            //SqlDataAdapter sda = new SqlDataAdapter(cmd);
            //DataTable dt = new DataTable();
            //sda.Fill(dt);
            //table.DataSource = dt;
            //table.DataBind();

        }
    }
}
