﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class mp_admin : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Recebe o nome do Usuario logado e exibe na tela do Select
        lblNome.Text = "Bem vindo " + Convert.ToString(Session["Nome"]);
        string tipo = Convert.ToString(Session["tipo"]);
        if (tipo.Equals("1"))
        {

        }
    }
    public void Logout(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("inicio.aspx");

    }
}
