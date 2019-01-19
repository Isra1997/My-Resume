using System;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ResumeFrontEnd
{
    public partial class BlogMyVeiw : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            dateOfPost.Attributes.Add("type","Date");
        }

        public void Button_Click(object sender, EventArgs e){
            SqlConnection conn = new SqlConnection(@"Server = localhost; Database = Resume; User Id = sa; Password = Password123");
            conn.Open();
            SqlCommand cmd = new SqlCommand("INSERT INTO BlogPosts (Post,Title,attache,pdate) VALUES (@post,@title,@attache,@date)",conn);
            cmd.Parameters.AddWithValue("@title",Btitle.Text);
            cmd.Parameters.AddWithValue("@post",BPost.Text);
            cmd.Parameters.AddWithValue("@date",Convert.ToDateTime(dateOfPost.Value));
            cmd.Parameters.AddWithValue("@attache", uploader.FileName);
            cmd.ExecuteNonQuery();
            conn.Close();
            ContentPlaceHolder head = (ContentPlaceHolder)Master.FindControl("Head");
            ContentPlaceHolder body = (ContentPlaceHolder)Master.FindControl("body");
            head.Visible = false;
            body.Visible = true;
            postresp.Visible = true;

        }
    }
}
