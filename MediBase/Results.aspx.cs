using System;
using System.Collections.Generic;
using System.Linq;
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
			//TODO: split search field on spaces, add symptom searching, add boolean searching, may need to use different search method (not parameters)

			ResultsDataSource.SelectParameters.Clear();
			ResultsDataSource.SelectParameters.Add(new Parameter("DiseaseName", System.Data.DbType.String, NameSearchTextBox.Text));
			ResultsDataSource.Select(DataSourceSelectArguments.Empty);
			ResultsDataSource.DataBind();
			ResultsGridView.DataBind();
		}

		protected void ItemSelected(object sender, EventArgs e)
		{
			//TODO: delete me gracefully
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
	}
}