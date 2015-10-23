using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class login : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["clickfotosConnectionString"].ConnectionString);
        con.Open();
        SqlDataAdapter adapter = new SqlDataAdapter();
        // Create the SelectCommand.
        SqlCommand command = new SqlCommand("SELECT * FROM usuario " +
            "WHERE email = '" + tbxEmail.Text + "'AND senha = '" + tbxSenha.Text + "'", con);
        adapter.SelectCommand = command;
        DataTable dt = new DataTable();
        adapter.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            String nome = dt.Rows[0]["nome"].ToString();
            Session.Add("Nome", nome);

            Response.Redirect("galeria-privada.aspx");
        }
        else
        {
            lblInformacao.Text = "Usuário ou senha Invalida!";
        }
    }
}

