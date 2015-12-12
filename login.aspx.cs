using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Security.Cryptography;
using System.Text;

public partial class login : System.Web.UI.Page
{
    String tipo;

    protected void Page_Load(object sender, EventArgs e)
    {
        string emailfotografo = Request.QueryString["email"];
        Session.Add("emailf", emailfotografo);
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string senha = AcertaSenha(tbxEmail.Text, tbxSenha.Text);
        try
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["clickfotosConnectionString"].ConnectionString);
            con.Open();
            SqlDataAdapter adapter = new SqlDataAdapter();
            // Create the SelectCommand.
            SqlCommand command = new SqlCommand("SELECT * FROM usuario " +
                "WHERE email = '" + tbxEmail.Text + "'AND senha = '" + senha + "' AND tipo='" + ddlTipo.SelectedValue + "' ", con);
            adapter.SelectCommand = command;
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                String nome = dt.Rows[0]["nome"].ToString();
                String id = dt.Rows[0]["id"].ToString();
                tipo = dt.Rows[0]["tipo"].ToString();
                Session.Add("Nome", nome);
                Session.Add("Id", id);
                Session.Add("Tipo", tipo);
                Session.Add("email", tbxEmail.Text);
            }
        }
        catch
        {
            Response.Write("<script LANGUAGE='JavaScript' >alert('Usuário, senha ou perfil invalido.')</script>");
        }
        try
        {
            if (ddlTipo.SelectedValue.Equals("1") && tipo.Equals("1"))
            {
                Response.Redirect("adm_cliente.aspx");
            }
        }
        catch
        {
            Response.Write("<script LANGUAGE='JavaScript' >alert('Usuário, senha ou perfil invalido.')</script>");
        }
        try
        {
            if (ddlTipo.SelectedValue.Equals("2") && tipo.Equals("2"))
            {
                Response.Redirect("criar-galeria.aspx");
            }
        }
        catch
        {
            Response.Write("<script LANGUAGE='JavaScript' >alert('Usuário, senha ou perfil invalido.')</script>");
        }
        try
        {
            if (ddlTipo.SelectedValue.Equals("3") && tipo.Equals("3"))
            {


                Response.Redirect("Galeria.aspx");
            }
        }
        catch
        {
            Response.Write("<script LANGUAGE='JavaScript' >alert('Usuário, senha ou perfil invalido.')</script>");
        }
        Response.Write("<script LANGUAGE='JavaScript' >alert('Usuário, senha ou perfil invalido.')</script>");
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

