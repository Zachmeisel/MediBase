using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MediBase
{
	public partial class Results : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!this.Page.IsPostBack)
			{
				//TODO: get data from text field in site.master, update search parameters
				ResultsDataSource.SelectParameters.Clear();
				ResultsDataSource.SelectParameters.Add(new Parameter("DiseaseName", System.Data.DbType.String, "Test"));
				ResultsDataSource.Select(DataSourceSelectArguments.Empty);
				ResultsDataSource.DataBind();
				ResultsGridView.DataBind();
			}
		}

		protected void SearchButton_Click(object sender, EventArgs e)
		{
			//TODO: create Fulltext Indexes of Columns in Diseases, Aliases, Symptoms tables

			List<string> searchParameters = parseSearchTerms(NameSearchTextBox.Text);

			string parameterString = "\"" + searchParameters[0] + "\"";

			for(int i = 1; i < searchParameters.Count; i++)
			{
				parameterString += " AND \"" + searchParameters[i] + "\"";
			}

			ResultsDataSource.SelectParameters.Clear();

			string selectCommand = "SELECT [Diseases].Id, [Diseases].[Name] AS DiseaseName, [Diseases].[Description] AS DiseaseDescription, [Phenotype].[Name] AS PhenotypeName, [Phenotype].[Description] AS PhenotypeDescription FROM [Diseases] LEFT JOIN [Aliases] ON [Aliases].Disease_Id = [Diseases].Id LEFT JOIN [Phenotype] ON [Phenotype].Id = [Diseases].Phenotype_Id LEFT JOIN [Disease_Symptoms] ON [Disease_Symptoms].Disease_Id = [Diseases].Id LEFT JOIN [Symptoms] ON [Symptoms].Id = [Disease_Symptoms].Symptom_Id WHERE (CONTAINS([Aliases].[Name], '" + parameterString + "') OR CONTAINS([Diseases].[Name], '" + parameterString + "') OR CONTAINS([Symptoms].Name,'" + parameterString + "')) ORDER BY DiseaseName ASC;";

			//for (int i = 0; i < searchParameters.Count; i++)
			//{
			//	selectCommand += searchParameters[i];

			//	if(i < searchParameters.Count - 1)		// if this is not the last parameter
			//	{
			//		selectCommand += ", ";
			//	}
			//	else
			//	{
			//		selectCommand += ");";
			//	}
			//}

			ResultsDataSource.SelectCommand = selectCommand;

			ResultsDataSource.Select(DataSourceSelectArguments.Empty);
			ResultsDataSource.DataBind();
			ResultsGridView.DataBind();
		}

		private List<string> parseSearchTerms(string parametersString)
		{
			List<string> searchParameters = Regex.Matches(parametersString, @"[\""].+?[\""]|[^ ]+").Cast<Match>().Select(m => m.Value).ToList();

			return searchParameters;
		}

		protected void ResultsGridView_RowDataBound(object sender, GridViewRowEventArgs e)
		{
			//propogate the data binding to the inner DataSources
			if (e.Row.RowType == DataControlRowType.DataRow)
			{
				SqlDataSource s = (SqlDataSource)e.Row.FindControl("SymptomsDataSource");
				s.SelectParameters[0].DefaultValue = e.Row.Cells[0].Text;

				SqlDataSource v = (SqlDataSource)e.Row.FindControl("VectorsDataSource");
				v.SelectParameters[0].DefaultValue = e.Row.Cells[0].Text;

				SqlDataSource a = (SqlDataSource)e.Row.FindControl("AliasesDataSource");
				a.SelectParameters[0].DefaultValue = e.Row.Cells[0].Text;
			}
		}

        protected void ResultsGridView_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}