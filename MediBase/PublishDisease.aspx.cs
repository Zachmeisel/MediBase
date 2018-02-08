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
            DiseaseNameText.BorderColor = System.Drawing.Color.White;
            DiseaseDescription.BorderColor = System.Drawing.Color.White;
            DiseasePrognosis.BorderColor = System.Drawing.Color.White;
            WeakSymptomName.BorderColor = System.Drawing.Color.White;
            WeakSymptomDescription.BorderColor = System.Drawing.Color.White;
            Aliases.BorderColor = System.Drawing.Color.White;
            
            if (DiseaseNameText.Text != "" && DiseaseDescription.Text != "" && DiseasePrognosis.Text != "" && WeakSymptomName.Text != "" && WeakSymptomDescription.Text != "" && Aliases.Text != "")
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
                WeakSymptomDescription.Text = "";
                Aliases.Text = "";
            }
            else
            {
                
                 if (DiseaseNameText.Text == "" || DiseaseNameText.Text.Length < 3)
                 {
                     DiseaseNameText.BorderColor = System.Drawing.Color.Red;
                 }
                else
                {
                    for (int i = 0; i < DiseaseNameText.Text.Length; i++)
                    {
                        if (  DiseaseNameText.Text.ElementAt(i) == ',' || DiseaseNameText.Text.ElementAt(i) == '-' || DiseaseNameText.Text.ElementAt(i) == '+' || DiseaseNameText.Text.ElementAt(i) == '*' || DiseaseNameText.Text.ElementAt(i) == '/')
                        {
                            DiseaseNameText.BorderColor = System.Drawing.Color.Red;
                            
                           // var control = document.getElementById(controlId);
                        }


                    }
                }
                 if (DiseaseDescription.Text == ""|| DiseaseDescription.Text.Length<3)
                 {
                     DiseaseDescription.BorderColor = System.Drawing.Color.Red;
                 }
                else
                {
                    for (int i = 0; i < DiseaseDescription.Text.Length; i++)
                    {
                        if ( DiseaseDescription.Text.ElementAt(i) == '-' || DiseaseDescription.Text.ElementAt(i) == '+' || DiseaseDescription.Text.ElementAt(i) == '*' || DiseaseDescription.Text.ElementAt(i) == '/')
                        {
                            DiseaseDescription.BorderColor = System.Drawing.Color.Red;
                        }
                    }
                }
                 if (DiseasePrognosis.Text == ""|| DiseasePrognosis.Text.Length<3)
                 {
                     DiseasePrognosis.BorderColor = System.Drawing.Color.Red;
                 }
                 else
                {
                    for (int i = 0; i < DiseasePrognosis.Text.Length; i++)
                    {
                        if ( DiseasePrognosis.Text.ElementAt(i) == ',' || DiseasePrognosis.Text.ElementAt(i) == '-' || DiseasePrognosis.Text.ElementAt(i) == '+' || DiseasePrognosis.Text.ElementAt(i) == '*' || DiseasePrognosis.Text.ElementAt(i) == '/')
                        {
                            DiseasePrognosis.BorderColor = System.Drawing.Color.Red;
                        }
                    }
                }
                 if (WeakSymptomName.Text == ""|| WeakSymptomName.Text.Length < 3)
                 {
                     WeakSymptomName.BorderColor = System.Drawing.Color.Red;
                 }
                else
                {
                    for (int i = 0; i < WeakSymptomName.Text.Length; i++)
                    {
                        if (  WeakSymptomName.Text.ElementAt(i) == ',' || WeakSymptomName.Text.ElementAt(i) == '-' || WeakSymptomName.Text.ElementAt(i) == '+' || WeakSymptomName.Text.ElementAt(i) == '*' || WeakSymptomName.Text.ElementAt(i) == '/')
                        {
                            WeakSymptomName.BorderColor = System.Drawing.Color.Red;
                        }
                    }
                }
                 if (WeakSymptomDescription.Text == ""|| WeakSymptomDescription.Text.Length<3)
                 {
                     WeakSymptomDescription.BorderColor = System.Drawing.Color.Red;
                 }
                else
                {
                    for (int i = 0; i < WeakSymptomDescription.Text.Length; i++)
                    {
                        if (  WeakSymptomDescription.Text.ElementAt(i) == ',' || WeakSymptomDescription.Text.ElementAt(i) == '-' || WeakSymptomDescription.Text.ElementAt(i) == '+' || WeakSymptomDescription.Text.ElementAt(i) == '*' || WeakSymptomDescription.Text.ElementAt(i) == '/')
                        {
                            WeakSymptomDescription.BorderColor = System.Drawing.Color.Red;
                        }
                    }
                }
                 if (Aliases.Text == "" || Aliases.Text.Length<3)
                 {
                     Aliases.BorderColor = System.Drawing.Color.Red;
                 }
                else
                {
                    for (int i = 0; i < Aliases.Text.Length; i++)
                    {

                        if (  Aliases.Text.ElementAt(i) == ',' || Aliases.Text.ElementAt(i) == '-' || Aliases.Text.ElementAt(i) == '+' || Aliases.Text.ElementAt(i) == '*' || Aliases.Text.ElementAt(i) == '/')
                        {
                            Aliases.BorderColor = System.Drawing.Color.Red;
                        }
                    }
                }
              
               
              
               
                  
            }
            
        }
        protected void DiseaseDataSource_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            string Data_Id = e.Command.Parameters["@IdReturn"].Value.ToString();
            
                SymptomsDataSource.InsertParameters.Add("SymptomName", WeakSymptomName.Text);
                SymptomsDataSource.InsertParameters.Add("SymptomDescription", WeakSymptomDescription.Text);
                SymptomsDataSource.InsertCommandType = SqlDataSourceCommandType.Text;
                SymptomsDataSource.InsertCommand = "INSERT INTO Symptoms(Name, Description) VALUES(@SymptomName, @SymptomDescription)";

                SymptomsDataSource.Insert();

                string txt = Aliases.Text;
                string[] lst = txt.Split(new Char[] { '\n', '\r' }, StringSplitOptions.RemoveEmptyEntries);

                //int a = lst.Length;

                for(int a = 0; a < lst.Length; a++)
                {
                string check = "AliasName" + a;
                    AliasesDataSource.InsertParameters.Add(check, lst[a]);
                    AliasesDataSource.InsertCommandType = SqlDataSourceCommandType.Text;
                    AliasesDataSource.InsertCommand = "INSERT INTO Aliases(Name, Disease_Id) VALUES(@"+check+", " + Data_Id + ")";
                    AliasesDataSource.Insert();
                }

                Disease_VectorsDataSource.InsertParameters.Add("Vector_Id", VectorDropDown.SelectedValue);
                Disease_VectorsDataSource.InsertCommandType = SqlDataSourceCommandType.Text;
                Disease_VectorsDataSource.InsertCommand = "INSERT INTO Disease_Vectors(Disease_Id, Vector_Id) VALUES("+ Data_Id +", @Vector_Id)";

                Disease_VectorsDataSource.Insert();

            
      


        }

        protected void WeakSymptomDescription_TextChanged(object sender, EventArgs e)
        {
           /* //  ListItem tb = new ListItem();
            char s = WeakSymptomName.Text[WeakSymptomName.Text.Length - 1];
            if (s==',')
            {
                ListItem tb = new ListItem();
                tb.Text = WeakSymptomName.Text;
            }
          */
        }
    }
}