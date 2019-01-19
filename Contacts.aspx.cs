using System;
using System.Web;
using System.Web.UI;
using System.Data.Sql;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace ResumeFrontEnd
{

    public partial class Contacts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e){
            dateOfmess.Attributes.Add("type", "Date");
            
        }

        public void Button_Click1(object sender, EventArgs e){
            SqlConnection conn = new SqlConnection(@"Server=localhost; Database=Resume;User Id=sa;Password=Password123");
            conn.Open();
            SqlCommand cmd = new SqlCommand("INSERT INTO Messages (FirstName,LastName,Sub ,mess,messdate) VALUES(@fname,@lname,@sub,@mess,@date)",conn);
            cmd.Parameters.AddWithValue("@fname", FirstName.Text);
            cmd.Parameters.AddWithValue("@lname", LastName.Text);
            cmd.Parameters.AddWithValue("@date", Convert.ToDateTime(dateOfmess.Value));
            cmd.Parameters.AddWithValue("@sub",subject.Text);
            cmd.Parameters.AddWithValue("@mess",message.Text);
            cmd.ExecuteNonQuery();
            conn.Close();
            ContentPlaceHolder head = (ContentPlaceHolder)Master.FindControl("Head");
            ContentPlaceHolder body = (ContentPlaceHolder)Master.FindControl("body");
            head.Visible = false;
            body.Visible = true;
            Resopnse.Visible = true;

        }
    }
}
