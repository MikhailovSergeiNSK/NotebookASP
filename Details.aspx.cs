using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NotebookASP
{
    public partial class Details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ScriptManager.ScriptResourceMapping.AddDefinition("jquery", new ScriptResourceDefinition
            {
                Path = "~/scripts/jquery-1.7.2.min.js",
            });

            if (!IsPostBack)
            {
                string script = "var element=document.getElementById('__EVENTTARGET'); if(!element)alert('Ошибка! Запрашиваемой записи не существует');";
                ClientScript.RegisterClientScriptBlock(this.GetType(), "ErrorMessageBox", script, true);
            }

        }

        protected void detailsview1_ItemCommand(Object sender, DetailsViewCommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                string script = "alert('Запись удалена'); document.location.href = 'Default.aspx';";
                ClientScript.RegisterClientScriptBlock(this.GetType(), "MessageBox", script, true);
            }

            if (e.CommandName == "Edit")
            {
                Session["Name"] = DetailsView1.Rows[0].Cells[1].Text;
                Session["Phone"] = DetailsView1.Rows[1].Cells[1].Text;
                Session["Email"] = DetailsView1.Rows[2].Cells[1].Text;
                Session.Timeout = 1;

                Response.Redirect($"EditContact.aspx?Id={Request.QueryString["Id"]}", false);                
            }
        }        
    }
}