using System;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ResumeFrontEnd
{
    public partial class Blog : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetPost();
            }


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




        protected void rpt_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            Repeater re = e.Item.FindControl("inRpdt") as Repeater;
            if (re != null)
            {
                Label la = e.Item.FindControl("lblpostid") as Label;
                string postId = la.Text.Trim();
                SqlConnection conn = new SqlConnection(@"Server=localhost; Database=Resume;User Id=sa;Password=Password123");
                int id = Convert.ToInt32(postId);


                SqlCommand cmd = new SqlCommand("select * from  PostCommets WHERE postID='" + id + "'", conn);
                conn.Open();
                DataTable dt = new DataTable();
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                adp.Fill(dt);
                conn.Close();

                Label c1 = e.Item.FindControl("countlbllike") as Label;
                c1.Text = query(postId,"LikerID").ToString();
                c1.Visible = true;

                Label c2 = e.Item.FindControl("countlbldislike") as Label;
                c2.Text = query(postId,"dislike").ToString();
                c2.Visible = true;

                Label c3 = e.Item.FindControl("countlblheart") as Label;
                c3.Text = query(postId,"heart").ToString();
                c3.Visible = true;

                Label c4 = e.Item.FindControl("countlblbrokenheart") as Label;
                c4.Text = query(postId,"brokenheart").ToString();
                c4.Visible = true;

                Label c5 = e.Item.FindControl("countlblhaha") as Label;
                c5.Text = query(postId,"emo").ToString();
                c5.Visible = true;

                Label c6 = e.Item.FindControl("countlblangry") as Label;
                c6.Text = query(postId,"Angry").ToString();
                c6.Visible = true;

            
               
                if (dt.Rows.Count > 0)
                {
                    re.DataSource = dt;
                    re.DataBind();
                }

            }


        }


        Boolean emotion(string postID, string emotion){
            SqlConnection conn = new SqlConnection(@"Server=localhost; Database=Resume;User Id=sa;Password=Password123");
            DataTable userdata= Session["userdata"] as DataTable;
            string userID=userdata.Rows[0]["userId"].ToString();
            SqlCommand cmd = new SqlCommand("select count('"+emotion+"') As countoflikes FROM PostLikes  WHERE postId='"+postID+ "' And '"+emotion+"'='"+userID+"'", conn);
           
            DataTable like = new DataTable();
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            conn.Open();
            adp.Fill(like);
            conn.Close();
            int countoflike = int.Parse(like.Rows[0][0].ToString());
            if(countoflike==0){
                return true;
            }
            else{
                return false;
            }

        }

        int query(string postID , string emotion){
            SqlConnection conn = new SqlConnection(@"Server=localhost; Database=Resume;User Id=sa;Password=Password123");
            SqlCommand cmd = new SqlCommand("select count(@emo) As countoflikes FROM PostLikes  WHERE postId=@post", conn);
            DataTable like = new DataTable();
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            cmd.Parameters.AddWithValue("@emo",emotion);
            cmd.Parameters.AddWithValue("@post",postID);
            conn.Open();
            adp.Fill(like);
            conn.Close();
            int countoflike = int.Parse(like.Rows[0][0].ToString());
            return countoflike;
        }


        protected void rpt_ItemCommand1(object sender, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Command")
            {
                int id = Convert.ToInt32(e.CommandArgument.ToString());
                TextBox txt = e.Item.FindControl("ctext") as TextBox;
                if(check_comments(txt.Text)){
                    if(Session["userdata"] !=null ){
                        SqlConnection conn = new SqlConnection(@"Server=localhost; Database=Resume;User Id=sa;Password=Password123");
                        conn.Open();
                        SqlCommand cmd = new SqlCommand("INSERT INTO PostCommets (comment, Cdate ,postID) VALUES(@comment,@date,@ID)", conn);
                        cmd.Parameters.AddWithValue("@comment", txt.Text);
                        cmd.Parameters.AddWithValue("@date", DateTime.Today);
                        cmd.Parameters.AddWithValue("@ID", id);
                        cmd.ExecuteNonQuery();
                        conn.Close();
                        GetPost();
                    }
                    else{
                        Label reglbl = e.Item.FindControl("regslbl") as Label;
                        reglbl.Visible = true;
                    }
                   
                }
                else{
                    Label lblmess = e.Item.FindControl("badlbl") as Label;
                    lblmess.Visible = true;

                }
               
            }
            else if(e.CommandName == "addlike"){
                if(Session["userdata"]!=null){
                    SqlConnection conn = new SqlConnection(@"Server=localhost; Database=Resume;User Id=sa;Password=Password123");
                   
                    DataTable dtuserdata = Session["userdata"] as DataTable;
                   
                    string userId = dtuserdata.Rows[0]["userId"].ToString();

                    string cmda = e.CommandArgument.ToString();
                    int cmdnum = int.Parse(cmda.Substring(cmda.Length - 1));
                    string postID = cmda.Remove(cmda.Length - 1);

                    switch(cmdnum)
                    {
                        case 1:
                            if(emotion(postID,"LikerID")){
                                conn.Open();
                                SqlCommand cmd1 = new SqlCommand("Insert into PostLikes (LikerID,postId) Values (@likerid,@postid)", conn);
                                cmd1.Parameters.AddWithValue("@likerid", userId);
                                cmd1.Parameters.AddWithValue("@postid", postID);
                                cmd1.ExecuteNonQuery();
                                conn.Close();
                                GetPost();
                            }
                            break;
                        case 2:
                            if(emotion(postID,"dislike")){
                                conn.Open();
                                SqlCommand cmd2 = new SqlCommand("Insert into PostLikes (dislike,postId) Values (@dislike,@postid)", conn);
                                cmd2.Parameters.AddWithValue("@dislike", User);
                                cmd2.Parameters.AddWithValue("@postid", postID);
                                cmd2.ExecuteNonQuery();
                                conn.Close();
                                GetPost();
                            }
                            break;
                        case 3:
                            if (emotion(postID, "heart"))
                            {
                                conn.Open();
                                SqlCommand cmd3 = new SqlCommand("INSERT into PostLikes (heart,postId) VALUES(@Heart,@id)", conn);
                                cmd3.Parameters.AddWithValue("@Heart", userId);
                                cmd3.Parameters.AddWithValue("@id", postID);
                                cmd3.ExecuteNonQuery();
                                conn.Close();
                                GetPost();
                            }
                            break;
                        case 4:
                            if(emotion(postID,"brokenheart")){
                                conn.Open();
                                SqlCommand cmd4 = new SqlCommand("INSERT into PostLikes (brokenheart,postId) VALUES(@bHeart,@id)", conn);
                                cmd4.Parameters.AddWithValue("@bHeart",userId);
                                cmd4.Parameters.AddWithValue("@id",postID);
                                cmd4.ExecuteNonQuery();
                                conn.Close();
                                GetPost();
                            }
                            break;
                        case 5:
                            if(emotion(postID,"emo")){
                                conn.Open();
                                SqlCommand cmd4 = new SqlCommand("INSERT into PostLikes (emo,postId) VALUES(@Hemo,@id)", conn);
                                cmd4.Parameters.AddWithValue("@Hemo", userId);
                                cmd4.Parameters.AddWithValue("@id", postID);
                                cmd4.ExecuteNonQuery();
                                conn.Close();
                                GetPost(); 
                            }
                            break;
                        case 6:
                            if(emotion(postID,"Angry")){
                                conn.Open();
                                SqlCommand cmd4 = new SqlCommand("INSERT into PostLikes (Angry,postId) VALUES(@angry,@id);", conn);
                                cmd4.Parameters.AddWithValue("@angry", userId);
                                cmd4.Parameters.AddWithValue("@id", postID);
                                cmd4.ExecuteNonQuery();
                                conn.Close();
                                GetPost(); 
                            }
                            break;
                    }


                }
                else{
                    Label reglbl = e.Item.FindControl("regslbl") as Label;
                    reglbl.Visible = true;
                }

                
            }
            else if(e.CommandName=="ClearCommand"){
                string id = e.CommandArgument.ToString();
                SqlConnection conn = new SqlConnection(@"Server=localhost; Database=Resume;User Id=sa;Password=Password123");
                SqlCommand cmd = new SqlCommand("DELETE from PostLikes WHERE postId='" + id + "'", conn);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
                GetPost();
            }

          
        }


        Boolean check_comments(string comment)
        {
            string[] Badwords = { "bad", "good", "notgood" };
            for (int i = 0; i < Badwords.Length; i++)
            {
                if (Badwords[i].ToString().ToLower() == comment.ToLower())
                {
                    return false;
                }

            }
            return true;

        }





    }
}