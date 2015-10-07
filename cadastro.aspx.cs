using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cadastro : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSalvar_Click(object sender, EventArgs e)
    {
        try
        {
            SqlDataSource1.Insert();
            System.IO.Directory.CreateDirectory(@"D:\Fotografo\Galerias\" + tbxEmail.Text + "");
            tbxEmail.Text = "";
            tbxNome.Text = "";
            tbxSenha.Text = "";
            lblJavaScript.Text = "<script type='text/javascript'>showDialogue();</script>";
        }
        catch
        {
            Response.Write("<script LANGUAGE='JavaScript' >alert('Problema ao Cadastrar Usuário, Tente Novamente Mais Tarde!')</script>");
        }
    }
}