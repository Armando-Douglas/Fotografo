using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Text;

public partial class cadastro : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSalvar_Click(object sender, EventArgs e)
    {
        string email = tbxEmail.Text;
        string senha = tbxSenha.Text;
        Label1.Text =  AcertaSenha(email, senha);

        try
        {
            SqlDataSource1.Insert();
            //System.IO.Directory.CreateDirectory(@"D:\Fotografo\Galerias\" + tbxEmail.Text + "");
            tbxEmail.Text = "";
            tbxNome.Text = "";
            tbxSenha.Text = "";
            Response.Write("<script LANGUAGE='JavaScript' >alert('Usuário cadastrado com sucesso!');location.href='inicio.aspx'</script>");
        }
        catch
        {
            Response.Write("<script LANGUAGE='JavaScript' >alert('Problema ao Cadastrar Usuário, Tente Novamente Mais Tarde!')</script>");
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