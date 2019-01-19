using System;
using System.Web;
using System.Web.UI;
using System.Net.Mail;
using System.Data.Sql;
using System.Data;
using System.Data.SqlClient;
using System.Net;

namespace ResumeFrontEnd
{
   
    public partial class LoginResponse : System.Web.UI.Page
    {
        protected void Page_Load(object sender,EventArgs e){
            sendMail();
            
        }
        public void sendMail(){
            try
            {
                // Credentials
                var credentials = new NetworkCredential("therandomnesswithin2018@gmail.com", "testing100%");

                // Mail message
                var mail = new MailMessage()
                {
                    From = new MailAddress("therandomnesswithin2018@gmail.com"),
                    Subject = "Test email.",
                    Body = "Test email body"
                };

                mail.To.Add(new MailAddress("mohamed01196@gmail.com"));

                // Smtp client
                var client = new SmtpClient()
                {
                    Port = 587,
                    DeliveryMethod = SmtpDeliveryMethod.Network,
                    UseDefaultCredentials = false,
                    Host = "smtp.gmail.com",
                    EnableSsl = true,
                    Credentials = credentials
                };

                // Send it...         
                client.Send(mail);
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error in sending email: " + ex.Message);
                Console.ReadKey();
                return;
            }

            Console.WriteLine("Email sccessfully sent");
            Console.ReadKey();
        }
    }
}
