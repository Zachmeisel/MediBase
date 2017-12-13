<%@ Page Title="Results" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Results.aspx.cs" Inherits="MediBase.Results" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
	
	&nbsp;<asp:Label ID="Label1" runat="server" Text="Disease Name"></asp:Label>
	<asp:TextBox ID="NameSearchTextBox" runat="server"></asp:TextBox>
	<br />
	<asp:Label ID="Label2" runat="server" Text="Symptoms"></asp:Label>
	<asp:TextBox ID="SymptomsTextBox" runat="server"></asp:TextBox>
	<asp:Button ID="SearchButton" runat="server" OnClick="SearchButton_Click" Text="Search" />
	<asp:GridView ID="ResultsGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="ResultsDataSource" OnRowDataBound="OnRowDataBound">
		<Columns>
			<asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
			<asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
			<asp:TemplateField HeaderText="Symptoms">
				<ItemTemplate>
					<asp:SqlDataSource ID="SymptomsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DiseaseDatabase %>" SelectCommand="SELECT Symptoms.Name AS SymptomName, Symptoms.Description AS SymptomDescription FROM Disease_Symptoms INNER JOIN Symptoms ON Symptoms.Id = Disease_Symptoms.Symptom_Id WHERE Disease_Symptoms.Disease_Id = @DiseaseId">
						<SelectParameters>
							<asp:ControlParameter Name="Id" ControlID="lblLabel" PropertyName="Text" />
            </SelectParameters>
          </asp:SqlDataSource>
					<asp:GridView ID="SymptomsDetailsGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SymptomsDataSource">
						<Columns>
							<asp:BoundField DataField="SymptomName" HeaderText="Symptom" />
							<asp:BoundField DataField="SymptomDescription" HeaderText="Description" />
						</Columns>
					</asp:GridView>
				</ItemTemplate>
			</asp:TemplateField>
			<asp:TemplateField HeaderText="Vectors">
				<ItemTemplate>
          <asp:Label ID="lblId" Text='<%# Eval("Id") %>' Visible="false" runat="server"/>
          <asp:SqlDataSource ID="VectorsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DiseaseDatabase %>" SelectCommand="SELECT Vectors.Name AS VectorName, Vectors.Description AS VectorDescription FROM Disease_Vectors INNER JOIN Vectors ON Vectors.Id = Disease_Vectors.Vector_Id WHERE Disease_Vectors.Disease_Id = @DiseaseId">
							<SelectParameters>
                  <asp:ControlParameter Name="Id" ControlID="lblLabel" PropertyName="Text" />
              </SelectParameters>
          </asp:SqlDataSource>
					<asp:GridView ID="VectorsDetailsGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="VectorsDataSource">
						<Columns>
							<asp:BoundField DataField="VectorName" HeaderText="Vector" />
							<asp:BoundField DataField="VectorDescription" HeaderText="Description" />
						</Columns>
					</asp:GridView>
				</ItemTemplate>
			</asp:TemplateField>
		</Columns>
	</asp:GridView>
	<br />
	<asp:SqlDataSource ID="ResultsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DiseaseDatabase %>" SelectCommand="SELECT [Diseases].Id, [Diseases].Name FROM [Diseases] INNER JOIN [Aliases] ON [Aliases].Disease_Id = [Diseases].Id WHERE [Aliases].Name LIKE @DiseaseName">
		<SelectParameters>
			<asp:FormParameter FormField="NameSearchTextField" Name="DiseaseName" />
		</SelectParameters>
</asp:SqlDataSource>
	
	</asp:Content>
