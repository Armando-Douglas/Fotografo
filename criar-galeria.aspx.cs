using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class criar_galeria : System.Web.UI.Page
{
    int resultado;
    string titulo;
    string thumb;
    string msg;
    SqlConnection con;
    SqlCommand comm;

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
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["clickfotosConnectionString"].ConnectionString);
            // SQL SELECT MAX -------
            string sqlselect = "SELECT max(id_galeria) from galeria";
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
            comm.Parameters.AddWithValue("@id_fotografo", lblID.Text);
            comm.Parameters.AddWithValue("@id_usuario", lblID.Text);
            comm.Parameters.AddWithValue("@id_galeria", resultado);
            con.Open();
            comm.ExecuteNonQuery();
            con.Close();

            if (FileUpload1.HasFile)
            {
                foreach (HttpPostedFile uploadedFile in FileUpload1.PostedFiles)
                {

                    uploadedFile.SaveAs(System.IO.Path.Combine(Server.MapPath("img/"),
                        //uploadedFile.FileName)); listofuploadedfiles.Text += String.Format("{0}<br />", uploadedFile.FileName);
                        //thumb = uploadedFile.FileName;
                     uploadedFile.FileName)); msg += String.Format("{0}, ", uploadedFile.FileName);
                    thumb = uploadedFile.FileName;
                    titulo = uploadedFile.FileName;
                    titulo = titulo.Substring(0, titulo.LastIndexOf('.'));
                    string sqlinsert = "insert into foto values(@id_galeria,@titulo,@caminho)";
                    comm = new SqlCommand(sqlinsert, con);
                    comm.Parameters.AddWithValue("@id_galeria", resultado);
                    comm.Parameters.AddWithValue("@titulo", titulo);
                    comm.Parameters.AddWithValue("@caminho", "img/" + uploadedFile.FileName + "");
                    con.Open();
                    comm.ExecuteNonQuery();
                    con.Close();
                }

                string sqlupdate = "update galeria set thumb = @thumb where id_galeria = @id_galeria";
                comm = new SqlCommand(sqlupdate, con);
                comm.Parameters.AddWithValue("@id_galeria", "" + resultado + "");
                comm.Parameters.AddWithValue("@thumb", "img/" + thumb + "");
                con.Open();
                comm.ExecuteNonQuery();
                con.Close();
                Response.Write("<script LANGUAGE='JavaScript' >alert('Fotos enviadas com sucesso! " + msg + "');location.href='galeriafotografo.aspx'</script>");
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine(ex);
        }
    }
}
