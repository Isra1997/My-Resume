using System;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace ResumeFrontEnd
{

    public partial class Veiw_All_posts : System.Web.UI.Page
    {
        protected void Page_Load(object args,EventArgs e){
            GetPost();
        }

        void GetPost()
        {
            SqlConnection conn = new SqlConnection(@"Server=localhost; Database=Resume;User Id=sa;Password=Password123");
            SqlCommand cmd = new SqlCommand("Select * FROM BlogPosts", conn);
            DataTable dt = new DataTable();
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            conn.Open();
            adp.Fill(dt);
            conn.Close();
            rpt.DataSource = dt;
            rpt.DataBind();
        }

        protected void Repeater_ItemCommand(object source,RepeaterCommandEventArgs e){
            string PostId = e.CommandArgument.ToString();
            SqlConnection conn = new SqlConnection(@"Server=localhost; Database=Resume;User Id=sa;Password=Password123");
            int id = Convert.ToInt16(PostId);
            SqlCommand cmd = new SqlCommand("INSERT INTO Archive (Post,Title,archive,attache,pdate,postID) Select Post,Title,archive,attache,pdate,postID from BlogPosts WHERE postID= '"+id+"' ", conn);
            SqlCommand cmd1 = new SqlCommand("INSERT INTO ArchiveComments (comment,Cdate ,postID) Select comment,Cdate ,postID from PostCommets WHERE postID= '" + id + "' ", conn);
            SqlCommand cmd2 = new SqlCommand("DELETE FROM PostCommets WHERE postID='" + id + "' ", conn);
            SqlCommand cmd3 = new SqlCommand("DELETE FROM BlogPosts WHERE postID='" + id + "' ", conn);
            conn.Open();
            cmd.ExecuteNonQuery();
            cmd1.ExecuteNonQuery();
            cmd2.ExecuteNonQuery();
            cmd3.ExecuteNonQuery();
            conn.Close();
            GetPost();
            Archmess.Visible = true;
        }

        public void buttLi_Click(object args,EventArgs e){
            SqlConnection conn = new SqlConnection(@"Server=localhost; Database=Resume;User Id=sa;Password=Password123");
            SqlCommand cmd = new SqlCommand("Select * FROM BlogPosts", conn);
            DataTable dt = new DataTable();
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            conn.Open();
        }
    }
}