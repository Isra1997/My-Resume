using System;
using System.Web;
using System.Web.UI;
using System.Data.Sql;
using System.Data;
using System.Data.SqlClient;


namespace ResumeFrontEnd
{

    public partial class login : System.Web.UI.Page                                
    {
        protected void Page_Load(object sender, EventArgs e){
            dateofbirth.Attributes.Add("type","Date");
        }

        public void Button_Click(object sender,EventArgs e){
            SqlConnection conn = new SqlConnection(@"Server=localhost; Database=Resume;User Id=sa;Password=Password123");
            if(checkfirstName(username.Text)){
                conn.Open();
                SqlCommand cmd = new SqlCommand("INSERT INTO users (username,Firname,Lastname,PASS,DateOfBirth,addr,email) VALUES(@usname,@fname,@lname,@pass,@dateofbirth,@address,@email)", conn);
                cmd.Parameters.AddWithValue("@usname", username.Text);
                cmd.Parameters.AddWithValue("@fname", FirstName.Text);
                cmd.Parameters.AddWithValue("@lname", LastName.Text);
                cmd.Parameters.AddWithValue("@pass", password.Text);
                cmd.Parameters.AddWithValue("@dateofbirth", Convert.ToDateTime(dateofbirth.Value));
                cmd.Parameters.AddWithValue("@address", address.Text);
                cmd.Parameters.AddWithValue("@email", email.Text);
                cmd.ExecuteNonQuery();
                conn.Close();
                Response.Redirect("LoginResponse.aspx");
            }
            else{
                divmsg.Visible = true;
            }
           
        }

        public Boolean checkfirstName(string enteredusername){
            SqlConnection conn = new SqlConnection(@"Server=localhost; Database=Resume;User Id=sa;Password=Password123");
            DataTable dt = new DataTable();
            conn.Open();
            SqlCommand cmd = new SqlCommand("SELECT * from users WHERE username='"+enteredusername+"'",conn);
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            adp.Fill(dt);
            conn.Close();
            if(dt.Rows.Count==0){
                return true;
            }
            else{
                return false;
            }
        }

    }
}
