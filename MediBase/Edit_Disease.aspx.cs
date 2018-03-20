using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MediBase
{
    public partial class Edit_Disease : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String s = Request.QueryString["boosh"];
            GetData(s);
        }
        private void GetData(string user)
        {
            String s = Request.QueryString["boosh"];
            String Q = "";

            SqlConnection connection = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\DiseaseDatabase.mdf;Integrated Security=True");
            connection.Open();
            DataTable dt = new DataTable();

            SqlCommand sqlCmd = new SqlCommand("SELECT * from Diseases WHERE Id = " + s + "", connection);
            sqlCmd.Parameters.AddWithValue("@username", user);
            SqlDataAdapter sqlDa = new SqlDataAdapter(sqlCmd);
            
            
            sqlDa.Fill(dt);
            if (dt.Rows.Count > 0 && TextBox2.Text == "" && TextBox3.Text == "" && TextBox4.Text == ""  )
            {
                TextBox2.Text = dt.Rows[0]["Name"].ToString();
                TextBox3.Text = dt.Rows[0]["Description"].ToString();
                TextBox4.Text = dt.Rows[0]["Prognosis"].ToString();
                Q = dt.Rows[0]["Phenotype_Id"].ToString();
                DropDownList1.SelectedValue = Q;
            }
            DataTable dt1 = new DataTable();
            SqlCommand sqlCmd1 = new SqlCommand("SELECT * from Disease_Symptoms WHERE Disease_Id = " + s + "", connection);
            sqlCmd1.Parameters.AddWithValue("@username", user);
            SqlDataAdapter sqlDa1 = new SqlDataAdapter(sqlCmd1);


            sqlDa1.Fill(dt1);
           
            String[] List1 = new String[dt1.Rows.Count] ;
            if (dt1.Rows.Count > 0)
            {
                for (int w = 0; w < dt1.Rows.Count; w++)
                {
                    List1[w] = dt1.Rows[w]["Symptom_Id"].ToString();
                }
            }

            DataTable dt2 = new DataTable();
            SqlCommand sqlCmd2 = new SqlCommand("SELECT * from Aliases WHERE Disease_Id = " + s + "", connection);
            sqlCmd2.Parameters.AddWithValue("@username", user);
            SqlDataAdapter sqlDa2 = new SqlDataAdapter(sqlCmd2);


            sqlDa2.Fill(dt2);

            if (dt2.Rows.Count > 0 && TextBox5.Text == "")
            {
                for (int r = 0; r < dt2.Rows.Count; r++)
                {
                    if (dt2.Rows[r]["Name"].ToString() != "")
                    {
                        TextBox5.Text = TextBox5.Text + dt2.Rows[r]["Name"].ToString();
                    }
                }
            }

            DataTable dt3 = new DataTable();
            SqlCommand sqlCmd3 = new SqlCommand("SELECT * from Disease_Vectors WHERE Disease_Id = " + s + "", connection);
            sqlCmd3.Parameters.AddWithValue("@username", user);
            SqlDataAdapter sqlDa3 = new SqlDataAdapter(sqlCmd3);
            

            sqlDa3.Fill(dt3);
           
            //if (dt3.Rows.Count > 0 && CheckBoxList1.SelectedIndex == -1)
            //{
            //    for (int e = 0; e < dt3.Rows.Count; e++)
            //    {
            //        CheckBoxList1.DataValueField = dt3.Rows[e]["Vector_Id"].ToString();
            //        CheckBoxList1.Items[0].Selected = true;
            //    }
            //}
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            String s = Request.QueryString["boosh"];
            String q = TextBox3.Text;
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

            if (TextBox2.Text != "" && TextBox3.Text != "" && TextBox4.Text != "" && TextBox5.Text != "" && count != 0 && SympCheck(newlist) == true && AllCheck() == true)
            {
                
                DiseaseDataSource.UpdateParameters.Add("Name", TextBox2.Text);
                DiseaseDataSource.UpdateParameters.Add("Description", TextBox3.Text);
                DiseaseDataSource.UpdateParameters.Add("Prognosis", TextBox4.Text);
                DiseaseDataSource.UpdateParameters.Add("Phenotype_Id", DropDownList1.SelectedValue);
                // DiseaseDataSource.InsertParameters.Add("DiseaseId", TextBox2.Text);
                DiseaseDataSource.UpdateParameters.Add("DiseaseId", "");


                q = TextBox2.Text;
                 q = TextBox3.Text;
                 q = TextBox4.Text;
                


                DiseaseDataSource.UpdateCommandType = SqlDataSourceCommandType.Text;
                DiseaseDataSource.UpdateCommand = "UPDATE [Diseases] SET [Name] = @Name, [Description] = @Description, [Prognosis] = @Prognosis, [Phenotype_Id] = @Phenotype_Id WHERE [Id] = " + s + "";
                DiseaseDataSource.Update();

                TextBox2.Text = "";
                TextBox3.Text = "";
                TextBox4.Text = "";
                TextBox5.Text = "";
                CheckBoxList1.ClearSelection();
            }
            else
            {
                if (SympCheck(newlist) == false)
                {
                    string myStringVariable = "Symptoms not found in Database";
                    txtValues.Text = "";
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + myStringVariable + "');", true);
                }






            }
            Label1.Visible = true;
            System.Threading.Thread.Sleep(2000);
            Label1.Visible = false;
            Response.Redirect("Results.aspx");

        }
        protected void DiseaseDataSource_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            String Data_Id = Request.QueryString["boosh"];

            string txt2 = txtValues.Text;
            string[] newlist = txt2.Split(new Char[] { ';', '\\' }, StringSplitOptions.RemoveEmptyEntries);
            string[] IdSstring;
            System.Data.DataTable dt = new System.Data.DataTable();
            string bush = string.Empty;

            for (int g = 0; g < newlist.Length; g++)
            {
                //SymptomsDataSource.SelectCommandType = SqlDataSourceCommandType.Text;
                //SymptomsDataSource.SelectCommand = "SELECT [Id] FROM [Symptoms] WHERE ([Name] = @" + newlist[g] + ")";
                //SymptomsDataSource.SelectParameters.Clear();
                //SymptomsDataSource.SelectParameters.Add("Id", bush);
                //SymptomsDataSource.
                //SqlConnection connection = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\DiseaseDatabase.mdf;Integrated Security=True");
                //SqlCommand command = new SqlCommand("SELECT Id FROM Symptoms", connection);
                //connection.Open();
                //SqlDataReader reader = command.ExecuteReader();
                //reader.Read();
                //bush = reader[0].ToString();

            }
            //for (int q = 0; q < txt2.Length; q++)
            //{
            //   string Sym_Check = "Symp" + q;
            //    Disease_SymptomsDataSource.InsertParameters.Add(Sym_Check, newlist[q]);
            //    Disease_SymptomsDataSource.InsertCommandType = SqlDataSourceCommandType.Text;
            //    Disease_SymptomsDataSource.InsertCommand = "INSERT INTO Disease_Symptoms(Disease_Id, Symptom_Id) VALUES(" + Data_Id + ", @" + Sym_Check + ")";

            //    Disease_SymptomsDataSource.Insert();
            //}           
            String s = Request.QueryString["boosh"];
            string txt = TextBox5.Text;
            string[] lst = txt.Split(new Char[] { '\n', '\r', ' ' }, StringSplitOptions.RemoveEmptyEntries);
            
            string[] Add = new String[lst.Length]; ;

            //int a = lst.Length;
            SqlConnection connection = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\DiseaseDatabase.mdf;Integrated Security=True");
            connection.Open();
            DataTable dtAliases = new DataTable();

            DataTable dtAl = new DataTable();
            SqlCommand sqlCmdAl = new SqlCommand("SELECT * from Aliases WHERE Disease_Id = " + s + "", connection);
            sqlCmdAl.Parameters.AddWithValue("@username", s);
            SqlDataAdapter sqlDaAl = new SqlDataAdapter(sqlCmdAl);
            

                
                //SqlDataSource3.DeleteParameters.Add(check1, Delete[aop]);
                SqlDataSource3.DeleteCommandType = SqlDataSourceCommandType.Text;
                SqlDataSource3.DeleteCommand = "DELETE FROM Aliases WHERE Aliases.Disease_Id = " + s + "";
                SqlDataSource3.Delete();

            for (int a = 0; a < lst.Length; a++)
            {
                string check = "AliasName" + a;
                SqlDataSource3.InsertParameters.Add(check, lst[a]);
                SqlDataSource3.InsertCommandType = SqlDataSourceCommandType.Text;
                SqlDataSource3.InsertCommand = "INSERT INTO Aliases(Name, Disease_Id) VALUES(@" + check + ", " + Data_Id + ")";
                SqlDataSource3.Insert();
            }
            
            DataTable dtVe = new DataTable();
            SqlCommand sqlCmdVe = new SqlCommand("SELECT * from Disease_Vectors WHERE Disease_Id = " + s + "", connection);
            sqlCmdAl.Parameters.AddWithValue("@username", s);
            SqlDataAdapter sqlDaVe = new SqlDataAdapter(sqlCmdVe);


            sqlDaVe.Fill(dtVe);
            CheckBoxList chkbx = (CheckBoxList)FindControl("CheckBoxList1");
   


                    //SqlDataSource4.DeleteParameters.Add(check1, Delete1[b]);
                    SqlDataSource4.DeleteCommandType = SqlDataSourceCommandType.Text;
                    SqlDataSource4.DeleteCommand = "DELETE FROM Disease_Vectors WHERE [Disease_Id] = " + s + "";

                    SqlDataSource4.Delete();

            for(int fo = 0; fo < 5; fo++)
            {
                string check12 = "Vector_Id" + fo;
                if (CheckBoxList1.Items[fo].Selected)
                {
                    SqlDataSource4.InsertParameters.Add(check12, CheckBoxList1.Items[fo].Value);
                    SqlDataSource4.InsertCommandType = SqlDataSourceCommandType.Text;
                    SqlDataSource4.InsertCommand = "INSERT INTO Disease_Vectors(Disease_Id, Vector_Id) VALUES(" + Data_Id + ", @" + check12 + ")";

                    SqlDataSource4.Insert();
                }
            }


            //"INSERT INTO Disease_Vectors(Disease_Id, Vector_Id) VALUES(" + Data_Id + ", @" + check1 + ")"
            //String myStringVariable = "Disease Updated";
            
        }


        protected bool SympCheck(string[] arr)
        {

            SqlConnection conn = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\DiseaseDatabase.mdf;Integrated Security=True");
            conn.Open();
            //System.Data.DataTable dt = new System.Data.DataTable();

            for (int a = 0; a < arr.Length; a++)
            {
                System.Data.DataTable dt = new System.Data.DataTable();
                SqlCommand check_User_Name = new SqlCommand("SELECT * FROM Symptoms WHERE ([Name] = @SName)", conn);
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
            if (TextBox2.Text == "" || TextBox2.Text.Length < 3)
            {
                TextBox2.BorderColor = System.Drawing.Color.Red;
                return false;
            }
            else
            {
                for (int i = 0; i < TextBox2.Text.Length; i++)
                {
                    if (TextBox2.Text.ElementAt(i) == ',' || TextBox2.Text.ElementAt(i) == '-' || TextBox2.Text.ElementAt(i) == '+' || TextBox2.Text.ElementAt(i) == '*' || TextBox2.Text.ElementAt(i) == '/')
                    {
                        TextBox2.BorderColor = System.Drawing.Color.Red;
                        return false;

                        // var control = document.getElementById(controlId);
                    }


                }
            }
            if (TextBox3.Text == "" || TextBox3.Text.Length < 3)
            {
                TextBox3.BorderColor = System.Drawing.Color.Red;
                return false;
            }
            else
            {
                for (int i = 0; i < TextBox3.Text.Length; i++)
                {
                    if (TextBox3.Text.ElementAt(i) == '-' || TextBox3.Text.ElementAt(i) == '+' || TextBox3.Text.ElementAt(i) == '*' || TextBox3.Text.ElementAt(i) == '/')
                    {
                        TextBox3.BorderColor = System.Drawing.Color.Red;
                        return false;
                    }
                }
            }
            if (TextBox4.Text == "" || TextBox4.Text.Length < 3)
            {
                TextBox4.BorderColor = System.Drawing.Color.Red;
                return false;
            }
            else
            {
                for (int i = 0; i < TextBox4.Text.Length; i++)
                {
                    if (TextBox4.Text.ElementAt(i) == ',' || TextBox4.Text.ElementAt(i) == '-' || TextBox4.Text.ElementAt(i) == '+' || TextBox4.Text.ElementAt(i) == '*' || TextBox4.Text.ElementAt(i) == '/')
                    {
                        TextBox4.BorderColor = System.Drawing.Color.Red;
                        return false;
                    }
                }
            }
            if (TextBox5.Text == "" || TextBox5.Text.Length < 3)
            {
                TextBox5.BorderColor = System.Drawing.Color.Red;
                return false;
            }
            else
            {
                for (int i = 0; i < TextBox5.Text.Length; i++)
                {

                    if (TextBox5.Text.ElementAt(i) == ',' || TextBox5.Text.ElementAt(i) == '-' || TextBox5.Text.ElementAt(i) == '+' || TextBox5.Text.ElementAt(i) == '*' || TextBox5.Text.ElementAt(i) == '/')
                    {
                        TextBox5.BorderColor = System.Drawing.Color.Red;
                        return false;
                    }
                }
            }
            return true;
        }

    }
}