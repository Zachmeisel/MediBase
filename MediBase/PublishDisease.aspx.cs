using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MediBase
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
         //   DiseaseDataSource.InsertCommand
         //   
        }
        //TODO Delete me
        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void StrongSymptomsButton_Click(object sender, EventArgs e)
        {
            //SymptomsDataSource.InsertParameters.Add("Name", StrongSymptomName.Text);
            //SymptomsDataSource.InsertParameters.Add("Description", StrongSymptomDescription.Text);
            //SymptomsDataSource.InsertCommandType = SqlDataSourceCommandType.Text;
            //SymptomsDataSource.InsertCommand = "INSERT INTO Symptoms(Name, Description) VALUES(@Name, @Description)";

            //SymptomsDataSource.Insert();

        }

        protected void SubmitButton0_Click(object sender, EventArgs e)
        {
           
            if (DiseaseNameText.Text != "" && DiseaseDescription.Text != "" && DiseasePrognosis.Text != "")
            {
                DiseaseDataSource.InsertParameters.Add("Name", DiseaseNameText.Text);
                DiseaseDataSource.InsertParameters.Add("Description", DiseaseDescription.Text);
                DiseaseDataSource.InsertParameters.Add("Prognosis", DiseasePrognosis.Text);
                DiseaseDataSource.InsertParameters.Add("Phenotype_Id", PathogenDropDown.SelectedValue);

                DiseaseDataSource.InsertCommandType = SqlDataSourceCommandType.Text;
                DiseaseDataSource.InsertCommand = "INSERT INTO Diseases(Name, Description, Prognosis, Phenotype_Id) VALUES(@Name, @Description, @Prognosis, @Phenotype_Id) Set @DiseaseId = SCOPE_IDENTITY();";
                DiseaseDataSource.Insert();
               
                
            }
            else
            {
                if (DiseaseNameText.Text == "")
                {
                    DiseaseNameText.BorderColor = System.Drawing.Color.Red;
                }
                if (DiseaseDescription.Text == "")
                {
                    DiseaseDescription.BorderColor = System.Drawing.Color.Red;
                }
                if (DiseasePrognosis.Text == "")
                {
                    DiseasePrognosis.BorderColor = System.Drawing.Color.Red;
                }
               
            }

        }
        protected void DiseaseDataSource_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            string Data_Id = e.Command.Parameters["@DiseaseId"].Value.ToString();


        }
    }
}