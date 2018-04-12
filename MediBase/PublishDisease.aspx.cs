using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

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
            Aliases.BorderColor = System.Drawing.Color.White;

            int count = 0;
            for (int a = 0; a < 5; a++)
            {
                if (CheckBoxList1.Items[a].Selected)
                {
                    count++;
                }
            }
            string txt2 = txtValues.Text;
            string[] newlist = txt2.Split(new Char[] { ';', '\\' }, StringSplitOptions.RemoveEmptyEntries);

            if (DiseaseNameText.Text != "" && DiseaseDescription.Text != "" && DiseasePrognosis.Text != "" && Aliases.Text != "" && count != 0 && SympCheck(newlist) ==true && AllCheck()==true)
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
                Aliases.Text = "";
                CheckBoxList1.ClearSelection();
            }
            else
            {
               if( SympCheck(newlist) == false)
                {
                    string myStringVariable = "Symptoms not found in Database";
                    txtValues.Text = "";
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + myStringVariable + "');", true);
                }



                


            }

        }
        protected void DiseaseDataSource_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            string Data_Id = e.Command.Parameters["@IdReturn"].Value.ToString();

            string txt2 = txtValues.Text;
            string[] newlist = txt2.Split(new Char[] { ';', '\\' }, StringSplitOptions.RemoveEmptyEntries);
            string[] IdSstring = new String[newlist.Length];
            System.Data.DataTable dt = new System.Data.DataTable();
            string bush = string.Empty;

            SqlConnection connection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            connection.Open();
            DataTable dt3 = new DataTable();
            SqlCommand sqlCmd3 = new SqlCommand("SELECT * from Symptoms ", connection);
            // sqlCmd3.Parameters.AddWithValue("@username", user);
            SqlDataAdapter sqlDa3 = new SqlDataAdapter(sqlCmd3);

            sqlDa3.Fill(dt3);

            int comcheck = 0;
            int Incre = 0;
            int DSincr = 0;

            while (comcheck < newlist.Length)
            {
                for (int hu = 0; hu < dt3.Rows.Count; hu++)
                {
                    if (newlist[comcheck] == dt3.Rows[hu]["Name"].ToString())
                    {
                        IdSstring[Incre] = dt3.Rows[hu]["Id"].ToString();
                        Incre++;
                        break;
                    }
                }
                comcheck++;

            }
            for (int q = 0; q < IdSstring.Length; q++)
            {
                string Sym_Check = "Symp" + q;
                Disease_SymptomsDataSource.InsertParameters.Add(Sym_Check, newlist[q]);
                Disease_SymptomsDataSource.InsertCommandType = SqlDataSourceCommandType.Text;
                Disease_SymptomsDataSource.InsertCommand = "INSERT INTO Disease_Symptoms(Disease_Id, Symptom_Id) VALUES(" + Data_Id + ", " + IdSstring[q] + ")";

                Disease_SymptomsDataSource.Insert();
            }
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

            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            conn.Open();
            //System.Data.DataTable dt = new System.Data.DataTable();
           
            for (int a = 0; a < arr.Length; a++)
            {
                System.Data.DataTable dt = new System.Data.DataTable();
                SqlCommand check_User_Name = new SqlCommand("SELECT * FROM Symptoms WHERE ([Name] = @SName)",conn);
                check_User_Name.Parameters.AddWithValue("@SName", arr[a]);
                SqlDataAdapter ad = new SqlDataAdapter(check_User_Name);
                ad.Fill(dt);
                if (dt.Rows.Count == 0)
                {
                    return false;
                }
            }
            // SymptomsDataSource.SelectParameters{ name};
            return true;
        }

        protected void SymptomsDataSource_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }
        protected bool AllCheck()
        {
            if (DiseaseNameText.Text == "" || DiseaseNameText.Text.Length < 3)
            {
                DiseaseNameText.BorderColor = System.Drawing.Color.Red;
                return false;
            }
            else
            {
                for (int i = 0; i < DiseaseNameText.Text.Length; i++)
                {
                    if (DiseaseNameText.Text.ElementAt(i) == ',' || DiseaseNameText.Text.ElementAt(i) == '-' || DiseaseNameText.Text.ElementAt(i) == '+' || DiseaseNameText.Text.ElementAt(i) == '*' || DiseaseNameText.Text.ElementAt(i) == '/')
                    {
                        DiseaseNameText.BorderColor = System.Drawing.Color.Red;
                        return false;

                        // var control = document.getElementById(controlId);
                    }


                }
            }
            if (DiseaseDescription.Text == "" || DiseaseDescription.Text.Length < 3)
            {
                DiseaseDescription.BorderColor = System.Drawing.Color.Red;
                return false;
            }
            else
            {
                for (int i = 0; i < DiseaseDescription.Text.Length; i++)
                {
                    if (DiseaseDescription.Text.ElementAt(i) == '-' || DiseaseDescription.Text.ElementAt(i) == '+' || DiseaseDescription.Text.ElementAt(i) == '*' || DiseaseDescription.Text.ElementAt(i) == '/')
                    {
                        DiseaseDescription.BorderColor = System.Drawing.Color.Red;
                        return false;
                    }
                }
            }
            if (DiseasePrognosis.Text == "" || DiseasePrognosis.Text.Length < 3)
            {
                DiseasePrognosis.BorderColor = System.Drawing.Color.Red;
                return false;
            }
            else
            {
                for (int i = 0; i < DiseasePrognosis.Text.Length; i++)
                {
                    if (DiseasePrognosis.Text.ElementAt(i) == ',' || DiseasePrognosis.Text.ElementAt(i) == '-' || DiseasePrognosis.Text.ElementAt(i) == '+' || DiseasePrognosis.Text.ElementAt(i) == '*' || DiseasePrognosis.Text.ElementAt(i) == '/')
                    {
                        DiseasePrognosis.BorderColor = System.Drawing.Color.Red;
                        return false;
                    }
                }
            }
            if (Aliases.Text == "" || Aliases.Text.Length < 3)
            {
                Aliases.BorderColor = System.Drawing.Color.Red;
                return false;
            }
            else
            {
                for (int i = 0; i < Aliases.Text.Length; i++)
                {

                    if (Aliases.Text.ElementAt(i) == ',' || Aliases.Text.ElementAt(i) == '-' || Aliases.Text.ElementAt(i) == '+' || Aliases.Text.ElementAt(i) == '*' || Aliases.Text.ElementAt(i) == '/')
                    {
                        Aliases.BorderColor = System.Drawing.Color.Red;
                        return false;
                    }
                }
            }
            return true;
        }
    }
    
    }