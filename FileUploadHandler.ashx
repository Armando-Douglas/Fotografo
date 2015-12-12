<%@ WebHandler Language="C#" Class="FileUploadHandler" %>
 
using System;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


public class FileUploadHandler : IHttpHandler
{
    int resultado;
    int titulo = 1;
    string thumb;

    public void ProcessRequest(HttpContext context)
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

        string sqlinsert = "insert into foto (id_galeria,titulo,caminho) values(@id_galeria,@titulo,@caminho)";
        comm = new SqlCommand(sqlinsert, con);
        comm.Parameters.AddWithValue("@id_galeria", "" + resultado + "");
        if (context.Request.Files.Count > 0)
        {
            HttpFileCollection files = context.Request.Files;
            for (int i = 0; i < files.Count; i++)
            {

                
                HttpPostedFile file = files[i];
               
                thumb = file.FileName;
                string fname = context.Server.MapPath("~/img/" + file.FileName);
                file.SaveAs(fname);
                con.Open();
                comm.ExecuteNonQuery();
                con.Close();
                //FIM DO INSERT 
                titulo++;
            }
            con.Close();
            con.Open();
            context.Response.ContentType = "text/plain";
            context.Response.Write("Arquivos enviados com sucesso!");

            string sqlupdate = "update galeria set thumb ='img/@thumb' where id_galeria = '@idgaleria'";
            comm = new SqlCommand(sqlupdate, con);
            comm.Parameters.AddWithValue("@idgaleria", "" + resultado + "");
            comm.Parameters.AddWithValue("@thumb", "" + thumb + "");
            comm.ExecuteNonQuery();
        }
    }
    public bool IsReusable
    {
        get
        {
            return false;
        }
    }
}