using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MediBase
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void AddSymptoms_Click(object sender, EventArgs e)
        {
            if (SymptomName.Text != "" && SymptomDescription.Text != "")
            {
                SymptomDataSource.InsertParameters.Add("SymptomName", SymptomName.Text);
                SymptomDataSource.InsertParameters.Add("SymptomDescription", SymptomDescription.Text);
                SymptomDataSource.InsertCommandType = SqlDataSourceCommandType.Text;
                SymptomDataSource.InsertCommand = "INSERT INTO Symptoms(Name, Description) VALUES(@SymptomName, @SymptomDescription)";

                SymptomDataSource.Insert();

                SymptomName.Text = "";
                SymptomDescription.Text = "";
            }
            else
            {
                if (SymptomName.Text == "")
                {
                    SymptomName.BorderColor = System.Drawing.Color.Red;
                }
                if (SymptomDescription.Text == "")
                {
                    SymptomDescription.BorderColor = System.Drawing.Color.Red;
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("PublishDisease.aspx");
        }
    }
}