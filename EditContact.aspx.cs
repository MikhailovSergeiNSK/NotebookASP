using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Web.UI;

namespace NotebookASP
{
    public partial class EditContact : System.Web.UI.Page
    {
        SqlConnection connection;        

        protected void Page_Load(object sender, EventArgs e)
        {
            ScriptManager.ScriptResourceMapping.AddDefinition("jquery", new ScriptResourceDefinition
            {
                Path = "~/scripts/jquery-1.7.2.min.js",
            });

            string sessionStr = Session["Name"] as string;
            if (sessionStr != null)
            {
                if (sessionStr == "&nbsp;")
                {
                    sessionStr = "";
                }
                NameTextBox.Text = sessionStr;
            }

            sessionStr = Session["Phone"] as string;
            if (sessionStr != null)
            {
                if (sessionStr == "&nbsp;")
                {
                    sessionStr = "";
                }
                PhoneTextBox.Text = sessionStr;
            }

            sessionStr = Session["Email"] as string;
            if (sessionStr != null)
            {
                if (sessionStr == "&nbsp;")
                {
                    sessionStr = "";
                }
                EmailTextBox.Text = sessionStr;
            }

            Session.Abandon();            

            string connectionSring = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            connection = new SqlConnection(connectionSring);
            connection.Open();
        }

        protected void UpdateButton_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    SqlCommand command = new SqlCommand("UPDATE Contacts SET Name=@Name, Phone=@Phone, Email=@Email  WHERE Id=@Id", connection);
                    command.Parameters.AddWithValue("Id", Request.QueryString["Id"]);
                    command.Parameters.AddWithValue("Name", NameTextBox.Text);
                    command.Parameters.AddWithValue("Phone", PhoneTextBox.Text);
                    command.Parameters.AddWithValue("Email", EmailTextBox.Text);

                    command.ExecuteNonQuery();

                    string script = "alert('Запись сохранена'); document.location.href = window.location.href.replace('EditContact.aspx?Id=','Details.aspx?Id=');";
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "MessageBox", script, true);                    
                }
                catch (Exception ex)
                {
                    ErrorOutput.ForeColor = Color.Red;
                    ErrorOutput.Text = "Error:<br />" + ex.Message;
                }
            }
        }

        protected void CancelButton_Click(object sender, EventArgs e)
        {
            Response.Redirect($"Details.aspx?Id={Request.QueryString["Id"]}", false);
        }

        protected void Page_Unload(object sender, EventArgs e)
        {
            if (connection != null && connection.State != ConnectionState.Closed)
            {
                connection.Close();
            }
        }        
    }
}