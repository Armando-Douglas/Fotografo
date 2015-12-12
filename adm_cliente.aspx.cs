using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Text;
using System.Net.Mail;
using System.Net;
using System.Data.SqlClient;
using System.Configuration;

public partial class adm_cliente : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
      
    }

    protected void ddlTipo_SelectedIndexChanged(object sender, EventArgs e)
    {
        //SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["clickfotosConnectionString"].ConnectionString);
        //con.Open();

        //// SQL SELECT MAX -------
        //string sqlupdate = "update cliente set tipo = @tipo where id=@id";
        //SqlCommand comm = new SqlCommand(sqlupdate, con);
        //comm.Parameters.AddWithValue("@tipo",GridView1);
        //comm.Parameters.AddWithValue("@id",);
        //con.Open();
        //comm.ExecuteNonQuery();
        //con.Close();
    }
}