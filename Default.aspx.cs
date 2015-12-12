using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    int resultado;
    int titulo = 1;
    string thumb;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["clickfotosConnectionString"].ConnectionString);
        con.Open();

        // SQL SELECT MAX -------
        string sqlselect = "SELECT max(id_galeria) from galeria";
        SqlCommand comm = new SqlCommand(sqlselect, con);
        SqlDataReader reader = comm.ExecuteReader();
        if (reader.Read())
        {
            resultado = reader.GetInt32(0);
        }
        con.Close();

        //FIM SELECT ------------

        //INSERT SQL-------------





        if (FileUpload1.HasFile)
        {
            foreach (HttpPostedFile uploadedFile in FileUpload1.PostedFiles)
            {

                uploadedFile.SaveAs(System.IO.Path.Combine(Server.MapPath("img/"),
                uploadedFile.FileName)); listofuploadedfiles.Text += String.Format("{0}<br />", uploadedFile.FileName);
                thumb = uploadedFile.FileName;
                string sqlinsert = "insert into foto values(@id_galeria,@titulo,@caminho)";
                comm = new SqlCommand(sqlinsert, con);
                comm.Parameters.AddWithValue("@id_galeria", resultado);
                comm.Parameters.AddWithValue("@titulo", titulo);
                comm.Parameters.AddWithValue("@caminho", uploadedFile.FileName);
                titulo = +1;
                con.Open();
                comm.ExecuteNonQuery();
                con.Close();
            }
            string sqlupdate = "update galeria set thumb = @thumb where id_galeria = @id_galeria";
            comm = new SqlCommand(sqlupdate, con);
            comm.Parameters.AddWithValue("@id_galeria", "" + resultado + "");
            comm.Parameters.AddWithValue("@thumb", "img/" +thumb + "");
            con.Open();
            comm.ExecuteNonQuery();
            con.Close();
            

        }
    }
}