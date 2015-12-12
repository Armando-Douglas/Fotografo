using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;
using System.Text;

public partial class galeria : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        valorselect.Text = Request.QueryString["galeria"];

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string fotos = Request["item"];
        string email = Convert.ToString(Session["email"]);
        string nomeusuario = Convert.ToString(Session["Nome"]);

        Response.Write("<script LANGUAGE='JavaScript' >alert('Solicitação realizada com sucesso!.')</script>");
        try
        {
            //Enviar email para Cliente
            MailMessage objEmail = new MailMessage();
            objEmail.From = new MailAddress("smtpclickfotos@gmail.com");
            //objEmail.ReplyTo = "";
            objEmail.To.Add(email);
            //objEmail.Bcc.Add("Email oculto");
            objEmail.Priority = MailPriority.Normal;
            objEmail.IsBodyHtml = true;
            objEmail.Subject = "Solicitação de Cliente";
            objEmail.Body = "<div>Ol&aacute; Armando,</div><div>&nbsp;" +
              "</div><div>O cliente " + nomeusuario + " solicitou as seguintes fotos " + fotos.ToString() + " de forma " + ddlTipo.Text + ".</div><p>" +
              "<strong>A equipe Click Fotos Agradece</strong></div>" +
              "<div>&nbsp;</div><div>" +
              "<img alt='' src='http://i64.tinypic.com/2ywzih5.jpg' style='width: 318px; height: 73px;' /></p>";
            objEmail.SubjectEncoding = Encoding.GetEncoding("ISO-8859-1");
            objEmail.BodyEncoding = Encoding.GetEncoding("ISO-8859-1");
            SmtpClient objSmtp = new SmtpClient();
            objSmtp.Host = "smtp.gmail.com";
            objSmtp.EnableSsl = true;
            objSmtp.Port = 587;
            objSmtp.Credentials = new NetworkCredential("smtpclickfotos@gmail.com", "smtp123456");
            objSmtp.Send(objEmail);
        }
        catch
        {
        }
    }
}