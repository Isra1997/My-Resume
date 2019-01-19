using System;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;

namespace ResumeFrontEnd
{

    public partial class lpage : System.Web.UI.Page
    {
        protected void Page_Load(object sender,EventArgs e){
            
        }

        public void login_Click(object sender, EventArgs e){
            if(login_check(username.Text,password.Text) && check_admin(username.Text)){
                Response.Redirect("BlogMyVeiw.aspx");
            }
            else{
                if (login_check(username.Text,password.Text))
                {
                    
                    Response.Redirect("Blog.aspx");
                }
                else
                {
                    divmsg.Visible = true;
                }
            }
            
        }

        public Boolean login_check(string username,string password){
            SqlConnection conn = new SqlConnection(@"Server=localhost; Database=Resume;User Id=sa;Password=Password123");
            DataTable dt = new DataTable();
            conn.Open();
            SqlCommand cmd = new SqlCommand("SELECT * from users WHERE username='"+username+"' and PASS='"+password+"'", conn);
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            cmd.ExecuteNonQuery();
            adp.Fill(dt);
            conn.Close();
            if(dt.Rows.Count!=0){
                Session["userdata"] = dt;
                return true;
            }
            else{
                return false;
            }
        }

        public Boolean check_admin(string username){
            SqlConnection conn = new SqlConnection(@"Server=localhost; Database=Resume;User Id=sa;Password=Password123");
            DataTable dt = new DataTable();
            conn.Open();
            SqlCommand cmd = new SqlCommand("SELECT *  from users WHERE Username='" + username + "'", conn);
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            cmd.ExecuteNonQuery();
            adp.Fill(dt);
            conn.Close();
           
            if(Convert.ToInt32(dt.Rows[0]["isAdmin"]) ==1){
                return true;
            }
            else{
                return false;
            }
        }
    }
}
