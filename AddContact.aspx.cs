using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Web.UI;

namespace NotebookASP
{
    public partial class AddContact : System.Web.UI.Page
    {
        SqlConnection connection;

        protected void Page_Load(object sender, EventArgs e)
        {
            ScriptManager.ScriptResourceMapping.AddDefinition("jquery", new ScriptResourceDefinition
            {
                Path = "~/scripts/jquery-1.7.2.min.js",
            });

            string connectionSring = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            connection = new SqlConnection(connectionSring);
            connection.Open();
        }

        protected void AddButton_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    SqlCommand command = new SqlCommand("INSERT INTO Contacts (Name, Phone, Email) VALUES (@Name, @Phone, @Email)", connection);
                    command.Parameters.AddWithValue("Name", NameTextBox.Text);
                    command.Parameters.AddWithValue("Phone", PhoneTextBox.Text);
                    command.Parameters.AddWithValue("Email", EmailTextBox.Text);

                    command.ExecuteNonQuery();

                    string script = "alert('Запись добавлена'); document.location.href = 'Default.aspx';";
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "MessageBox", script, true);                    
                }
                catch (Exception ex)
                {
                    ErrorOutput.ForeColor = Color.Red;
                    ErrorOutput.Text = "Error:<br />" + ex.Message;                    
                }
            }
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