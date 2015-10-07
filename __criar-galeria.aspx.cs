using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class criar_galeria : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string[] caminhoArquivos = Directory.GetFiles(Server.MapPath("~/Galerias/"));
            List<ListItem> arquivos = new List<ListItem>();
            foreach (string filePath in caminhoArquivos)
            {
                arquivos.Add(new ListItem(Path.GetFileName(filePath), filePath));
            }
            gvfuImagens.DataSource = arquivos;
            gvfuImagens.DataBind();
        }

    }
    protected void EnviarArquivo(object sender, EventArgs e)
    {
        if (fuImagens.HasFile)
        {
            string nomeArquivo = Path.GetFileName(fuImagens.PostedFile.FileName);
            long tamanhoArquivo = fuImagens.PostedFile.ContentLength;
            fuImagens.PostedFile.SaveAs(Server.MapPath("~/Galerias/") + nomeArquivo);
            lblmsg.Text = "Arquivo enviado com sucesso.\n" + "Tamanho do Arquivo = " + tamanhoArquivo.ToString() + "bytes";
            Response.Redirect(Request.Url.AbsoluteUri);
        }
        else
        {
            lblmsg.Text = "Por Favor, selecione um arquivo a enviar.";
        }
    }
    protected void DeletarArquivo(object sender, EventArgs e)
    {
        try
        {
            string caminhoArquivo = (sender as LinkButton).CommandArgument;
            File.Delete(caminhoArquivo);
            Response.Redirect(Request.Url.AbsoluteUri);
        }
        catch (Exception ex)
        {
            lblmsg.Text = ex.Message;
        }
    }
}