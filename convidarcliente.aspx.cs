using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class convidarcliente : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand comm;
    int resultado;
    string email;
    protected void Page_Load(object sender, EventArgs e)
    {
        lblid_usuario.Text = Convert.ToString(Session["id"]);
        lblNomefotografo.Text = Convert.ToString(Session["Nome"]);
        email = tbxEmail.Text;
        string senha = tbxSenha.Text;
        Label1.Text = AcertaSenha(email, senha);
    }
    protected void Cadastra_Click(object sender, EventArgs e)
    {
        try
        {

            SqlDataSource1.Insert();

            con = new SqlConnection(ConfigurationManager.ConnectionStrings["clickfotosConnectionString"].ConnectionString);
            string sqlselect = "SELECT max(id) from Usuario";
            comm = new SqlCommand(sqlselect, con);
            con.Open();
            SqlDataReader reader = comm.ExecuteReader();
            if (reader.Read())
            {
                resultado = reader.GetInt32(0);
            }
            con.Close();

            string sqlinsertpermissao = "insert into permissaousuario values (@id_fotografo, @id_usuario, @id_galeria,(getdate()))";
            comm = new SqlCommand(sqlinsertpermissao, con);
            comm.Parameters.AddWithValue("@id_fotografo", lblid_usuario.Text);
            comm.Parameters.AddWithValue("@id_usuario", resultado);
            comm.Parameters.AddWithValue("@id_galeria", DropDownList1.SelectedValue);
            con.Open();
            comm.ExecuteNonQuery();
            con.Close();

            //Enviar email para Cliente
            MailMessage objEmail = new MailMessage();
            objEmail.From = new MailAddress("smtpclickfotos@gmail.com");
            //objEmail.ReplyTo = "";
            objEmail.To.Add(tbxEmail.Text);
            //objEmail.Bcc.Add("Email oculto");
            objEmail.Priority = MailPriority.Normal;
            objEmail.IsBodyHtml = true;
            objEmail.Subject = "Usuário de Acesso ao sistema Click Fotos";
            objEmail.Body = "<div>Ol&aacute; Cliente " + tbxNome.Text + ",</div>" +
            "<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;O Fotografo " + lblNomefotografo.Text + " enviou " +
            "permiss&atilde;o para visualizar a galeria de fotos.</div>" +
            "<div>&nbsp;</div><div><strong>Usu&aacute;rio: " + tbxEmail.Text + "</strong></div>" +
            "<div><strong>Senha: " + tbxSenha.Text + "</strong></div><div>&nbsp;</div><div>" +
            "<div><strong>O endereço da galeria: http://localhost:32023/Fotografo/login.aspx?email=" + email + " </strong></div> " +
            "<strong>A equipe Click Fotos Agradece</strong></div>" +
            "<div>&nbsp;</div><div>" +
            "<img alt='' src='http://i64.tinypic.com/2ywzih5.jpg' style='width: 318px; height: 73px;' /></div>";
            objEmail.SubjectEncoding = Encoding.GetEncoding("ISO-8859-1");
            objEmail.BodyEncoding = Encoding.GetEncoding("ISO-8859-1");
            SmtpClient objSmtp = new SmtpClient();
            objSmtp.Host = "smtp.gmail.com";
            objSmtp.EnableSsl = true;
            objSmtp.Port = 587;
            objSmtp.Credentials = new NetworkCredential("smtpclickfotos@gmail.com", "smtp123456");
            objSmtp.Send(objEmail);
            GridView1.DataBind();
            Response.Write("<script LANGUAGE='JavaScript' >alert('Cadastro do cliente realizado com sucesso!.')</script>");
        }
        catch
        {
            Response.Write("<script LANGUAGE='JavaScript' >alert('Não foi possivel realizar o cadastro!.')</script>");
        }
    }
    public static string AcertaSenha(string _login, string _senha)
    {
        StringBuilder senha = new StringBuilder();

        MD5 md5 = MD5.Create();
        byte[] entrada = Encoding.ASCII.GetBytes(_login + "//" + _senha);
        byte[] hash = md5.ComputeHash(entrada);
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < hash.Length; i++)
        {
            senha.Append(hash[i].ToString("X2"));
        }
        return senha.ToString();
    }
}