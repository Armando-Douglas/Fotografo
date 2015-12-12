using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class criar_galeria : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblID.Text = Convert.ToString(Session["Id"]);
    }
    protected void btnSalvar_Click(object sender, EventArgs e)
    {
        try
        {
            SqlDataSource1.Insert();
            Response.Write("<script LANGUAGE='JavaScript' >alert('Galeria Criada com sucesso!')</script>");
        }
        catch
        {
            Response.Write("<script LANGUAGE='JavaScript' >alert('Preenha o campo nome da galeria!')</script>");
        }
    }
}