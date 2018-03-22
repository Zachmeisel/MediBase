<%@ Page Title="Results" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Results.aspx.cs" Inherits="MediBase.Results" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>



<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
     
    <br />
	<br />
	&nbsp;<asp:TextBox ID="NameSearchTextBox" runat="server" Width="320px" meta:resourcekey="NameSearchTextBoxResource1"></asp:TextBox>
	<asp:Button ID="SearchButton" runat="server" OnClick="SearchButton_Click" Text="Search" meta:resourcekey="SearchButtonResource1" />
	<asp:GridView ID="ResultsGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="ResultsDataSource" AllowPaging="True" OnRowDataBound="ResultsGridView_RowDataBound" OnSelectedIndexChanged="ResultsGridView_SelectedIndexChanged" meta:resourcekey="ResultsGridViewResource1">
		<Columns>
			<asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" Visible="True" meta:resourcekey="BoundFieldResource1" />
			<asp:BoundField DataField="DiseaseName" HeaderText="Name" SortExpression="Name" meta:resourcekey="BoundFieldResource2" />
			<asp:TemplateField HeaderText="Aliases" meta:resourcekey="TemplateFieldResource1">
				<ItemTemplate>
					<asp:SqlDataSource ID="AliasesDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DiseaseDatabaseConnection %>" SelectCommand="SELECT [Name] FROM [Aliases] WHERE ([Disease_Id] = @Id)">
						<SelectParameters>
							<asp:Parameter Name="Id" Type="Int32" />
            </SelectParameters>
          </asp:SqlDataSource>
					<asp:GridView ID="AliasesDetailsGridView" runat="server" AutoGenerateColumns="False" DataSourceID="AliasesDataSource" ShowHeader="False" meta:resourcekey="AliasesDetailsGridViewResource1">
						<Columns>
							<asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" meta:resourcekey="BoundFieldResource3" />
						</Columns>
					</asp:GridView>
				</ItemTemplate>
			</asp:TemplateField>
			<asp:BoundField DataField="DiseaseDescription" HeaderText="Description" meta:resourcekey="BoundFieldResource4" />
			<asp:TemplateField HeaderText="Symptoms" meta:resourcekey="TemplateFieldResource2">
				<ItemTemplate>
					<asp:SqlDataSource ID="SymptomsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DiseaseDatabaseConnection %>" SelectCommand="SELECT Symptoms.Name AS Name, Symptoms.Description AS Description FROM Disease_Symptoms INNER JOIN Symptoms ON Symptoms.Id = Disease_Symptoms.Symptom_Id WHERE Disease_Symptoms.Disease_Id = @Id">
						<SelectParameters>
							<asp:Parameter Name="Id" Type="Int32" />
            </SelectParameters>
          </asp:SqlDataSource>
					<asp:GridView ID="SymptomsDetailsGridView" runat="server" AutoGenerateColumns="False" DataSourceID="SymptomsDataSource" meta:resourcekey="SymptomsDetailsGridViewResource1">
						<Columns>
							<asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" meta:resourcekey="BoundFieldResource5" />
							<asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" meta:resourcekey="BoundFieldResource6" />
						</Columns>
					</asp:GridView>
				</ItemTemplate>
			</asp:TemplateField>
			<asp:TemplateField HeaderText="Vectors" meta:resourcekey="TemplateFieldResource3">
				<ItemTemplate>
					<asp:SqlDataSource ID="VectorsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DiseaseDatabaseConnection %>" SelectCommand="SELECT Vectors.Name AS Name, Vectors.Description AS Description FROM Disease_Vectors INNER JOIN Vectors ON Vectors.Id = Disease_Vectors.Vector_Id WHERE Disease_Vectors.Disease_Id = @Id">
						<SelectParameters>
							<asp:Parameter Name="Id" Type="Int32" />
            </SelectParameters>
          </asp:SqlDataSource>
					<asp:GridView ID="VectorsDetailsGridView" runat="server" AutoGenerateColumns="False" DataSourceID="VectorsDataSource" meta:resourcekey="VectorsDetailsGridViewResource1">
						<Columns>
							<asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" meta:resourcekey="BoundFieldResource7" />
							<asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" meta:resourcekey="BoundFieldResource8" />
						</Columns>
					</asp:GridView>
				</ItemTemplate>
			</asp:TemplateField>
			<asp:BoundField DataField="PhenotypeName" HeaderText="Phenotype" meta:resourcekey="BoundFieldResource9" />
			<asp:BoundField DataField="PhenotypeDescription" HeaderText="Phenotype Description" meta:resourcekey="BoundFieldResource10" />
		    <asp:HyperLinkField Text="Edit" DataNavigateUrlFields="Id" DataNavigateUrlFormatString="~/Edit_Disease.aspx?boosh={0}" meta:resourcekey="HyperLinkFieldResource1" />
		</Columns>
		<emptydatatemplate>
			No Diseases Matching Search Terms. Try broadening your search.
		</emptydatatemplate>
	</asp:GridView>
	<br />
	<asp:SqlDataSource ID="ResultsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DiseaseDatabaseConnection %>" SelectCommand="SELECT [Diseases].Id, [Diseases].[Name] AS DiseaseName, [Diseases].[Description] AS DiseaseDescription, [Phenotype].[Name] AS PhenotypeName, [Phenotype].[Description] AS PhenotypeDescription FROM [Diseases] LEFT JOIN [Aliases] ON [Aliases].Disease_Id = [Diseases].Id LEFT JOIN [Phenotype] ON [Phenotype].Id = [Diseases].Phenotype_Id WHERE ([Aliases].[Name] = @DiseaseName OR [Diseases].[Name] = @DiseaseName)">
	</asp:SqlDataSource>
</asp:Content>
