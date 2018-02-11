using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
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

        //protected void StrongSymptomsButton_Click(object sender, EventArgs e)
        //{
        //SymptomsDataSource.InsertParameters.Add("Name", StrongSymptomName.Text);
        //SymptomsDataSource.InsertParameters.Add("Description", StrongSymptomDescription.Text);
        //SymptomsDataSource.InsertCommandType = SqlDataSourceCommandType.Text;
        //SymptomsDataSource.InsertCommand = "INSERT INTO Symptoms(Name, Description) VALUES(@Name, @Description)";

        //SymptomsDataSource.Insert();

        //}

        protected void SubmitButton0_Click(object sender, EventArgs e)
        {
            DiseaseNameText.BorderColor = System.Drawing.Color.White;
            DiseaseDescription.BorderColor = System.Drawing.Color.White;
            DiseasePrognosis.BorderColor = System.Drawing.Color.White;
            WeakSymptomName.BorderColor = System.Drawing.Color.White;
            Aliases.BorderColor = System.Drawing.Color.White;

            int count = 0;
            for (int a = 0; a < 5; a++)
            {
                if (CheckBoxList1.Items[a].Selected)
                {
                    count++;
                }
            }

            if (DiseaseNameText.Text != "" && DiseaseDescription.Text != "" && DiseasePrognosis.Text != "" && WeakSymptomName.Text != ""
                && Aliases.Text != "" && count != 0)
            {
                DiseaseDataSource.InsertParameters.Add("Name", DiseaseNameText.Text);
                DiseaseDataSource.InsertParameters.Add("Description", DiseaseDescription.Text);
                DiseaseDataSource.InsertParameters.Add("Prognosis", DiseasePrognosis.Text);
                DiseaseDataSource.InsertParameters.Add("Phenotype_Id", PathogenDropDown.SelectedValue);
                // DiseaseDataSource.InsertParameters.Add("DiseaseId", DiseaseNameText.Text);
                DiseaseDataSource.InsertParameters.Add("DiseaseId", "");


                DiseaseDataSource.InsertCommandType = SqlDataSourceCommandType.Text;
                DiseaseDataSource.InsertCommand = "INSERT INTO Diseases(Name, Description, Prognosis, Phenotype_Id) VALUES(@Name, @Description, @Prognosis, @Phenotype_Id) SET @IdReturn=SCOPE_IDENTITY();";
                DiseaseDataSource.Insert();

                DiseaseNameText.Text = "";
                DiseaseDescription.Text = "";
                DiseasePrognosis.Text = "";
                WeakSymptomName.Text = "";
                Aliases.Text = "";
                CheckBoxList1.ClearSelection();
            }
            else
            {

                string txt2 = txtValues.Text;
                string[] newlist = txt2.Split(new Char[] { ';', '\\' }, StringSplitOptions.RemoveEmptyEntries);

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
                if (WeakSymptomName.Text == "")
                {
                    WeakSymptomName.BorderColor = System.Drawing.Color.Red;
                }
                if (Aliases.Text == "")
                {
                    Aliases.BorderColor = System.Drawing.Color.Red;
                }


            }

        }
        protected void DiseaseDataSource_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            string Data_Id = e.Command.Parameters["@IdReturn"].Value.ToString();
            
            SymptomsDataSource.InsertParameters.Add("SymptomName", WeakSymptomName.Text);
            SymptomsDataSource.InsertCommandType = SqlDataSourceCommandType.Text;
            SymptomsDataSource.InsertCommand = "INSERT INTO Symptoms(Name) VALUES(@SymptomName)";

            SymptomsDataSource.Insert();

            string txt = Aliases.Text;
            string[] lst = txt.Split(new Char[] { '\n', '\r' }, StringSplitOptions.RemoveEmptyEntries);

            //int a = lst.Length;

            for (int a = 0; a < lst.Length; a++)
            {
                string check = "AliasName" + a;
                AliasesDataSource.InsertParameters.Add(check, lst[a]);
                AliasesDataSource.InsertCommandType = SqlDataSourceCommandType.Text;
                AliasesDataSource.InsertCommand = "INSERT INTO Aliases(Name, Disease_Id) VALUES(@" + check + ", " + Data_Id + ")";
                AliasesDataSource.Insert();
            }
            CheckBoxList chkbx = (CheckBoxList)FindControl("CheckBoxList1");
            for (int b = 0; b < 5; b++)
            {
                string check1 = "Vector_Id" + b;
                if (CheckBoxList1.Items[b].Selected)
                {
                    Disease_VectorsDataSource.InsertParameters.Add(check1, CheckBoxList1.Items[b].Value);
                    Disease_VectorsDataSource.InsertCommandType = SqlDataSourceCommandType.Text;
                    Disease_VectorsDataSource.InsertCommand = "INSERT INTO Disease_Vectors(Disease_Id, Vector_Id) VALUES(" + Data_Id + ", @" + check1 + ")";

                    Disease_VectorsDataSource.Insert();
                }
            }




        }

        protected void StrongSymptomsButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddSymptoms.aspx");
        }
        protected bool SympCheck(string []arr)
        {
            string name;

           // SymptomsDataSource.SelectParameters{ name};
            return true;
        }
    }
}