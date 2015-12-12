using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;
using System.Text;

public partial class galeria : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        valorselect.Text = Request.QueryString["galeria"];

    }
}