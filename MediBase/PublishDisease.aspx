<%@ Page Title="Publish Disease" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PublishDisease.aspx.cs" Inherits="MediBase.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <h3>Add a disease to our ever growing database</h3>
    <p>Feel free to submist a disease or illness to be added to our database. Just feel out the required fields and hit send it your entry will be put under review by our experts.</p>
<p>&nbsp;</p>
    <style>
        .modelBackground 
        {
            background-color: black;
            filter: alpha(opacity=90) !important;
            opacity: 0.6 !important;
            z-index: 20;
        }
        .modelpopup
        {
            padding:20px 0px 24px 10px;
            position:relative;
            width:759px;
            height:151px;
            background-color:white;
            border:1px solid black;
            top: 505px;
            left: 319px;
        }

    </style>
    <div style="margin-left: auto; margin-right: auto; text-align: center;">
    Name of Disease or Illness:
    <asp:TextBox ID="DiseaseNameText" runat="server" Width="282px" BorderColor="White"></asp:TextBox>
        <br />
        <br />
        Disease Description:
    <asp:TextBox ID="DiseaseDescription" runat="server" Width="204px" Columns="1" Height="70px" TextMode="MultiLine"></asp:TextBox>
        <asp:Button ID="DiseaseDescriptionButton" runat="server" OnClick="StrongSymptomsButton_Click" Text="Add" Visible="False" />
        <p>&nbsp;</p>
        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Prognosis:
    <asp:TextBox ID="DiseasePrognosis" runat="server" Width="204px" Columns="1" Height="70px" TextMode="MultiLine"></asp:TextBox>
        </p>
        <p>&nbsp;</p>
        Pathogen:<asp:DropDownList ID="PathogenDropDown" runat="server" DataSourceID="PathogenDataSource" DataTextField="Name" DataValueField="Id" Height="16px" Width="186px">
        </asp:DropDownList>
&nbsp;<br />
        <br />
        <br />
        Symptoms Name:
    <asp:TextBox ID="WeakSymptomName" runat="server" Width="259px"></asp:TextBox>
        <br />
        <br />
&nbsp;Symptoms Description:
    <asp:TextBox ID="WeakSymptomDescription" runat="server" Width="256px" Columns="1" Height="70px" TextMode="MultiLine"></asp:TextBox>
        <asp:Button ID="WeakSymptomsButton" runat="server" OnClick="StrongSymptomsButton_Click" Text="Add" />
        <p>
            &nbsp;</p>
        Aliases:
    <asp:TextBox ID="Aliases" runat="server" Width="199px" Height="84px" TextMode="MultiLine"></asp:TextBox>
        <br />
        <br />
        Vectors:
        <asp:DropDownList ID="VectorDropDown" runat="server" DataSourceID="VectorsDataSource" DataTextField="Name" DataValueField="Id" Height="18px" Width="162px">
        </asp:DropDownList>
        <br />
        <br />
        <asp:Button ID="SubmitButton0" runat="server" OnClick="SubmitButton0_Click" Text="Submit" Width="95px" />
        <br />
        <br />
        
        <br />
        <br />
        
         
        <br />
        <asp:SqlDataSource ID="Disease_VectorsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DiseaseDatabaseConnection %>" SelectCommand="SELECT [Disease_Id], [Vector_Id] FROM [Disease_Vectors]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="PathogenDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DiseaseDatabaseConnection %>" SelectCommand="SELECT [Id], [Name] FROM [Phenotype]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="AliasesDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DiseaseDatabaseConnection %>" SelectCommand="SELECT [Name] FROM [Aliases]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SymptomsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DiseaseDatabaseConnection %>" SelectCommand="SELECT [Name], [Description] FROM [Symptoms]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="DiseaseDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DiseaseDatabaseConnection %>" OnSelected="DiseaseDataSource_Inserted" SelectCommand="SELECT [Name], [Description], [Prognosis], [Phenotype_Id], [Id] FROM [Diseases]" OnInserted="DiseaseDataSource_Inserted">
                <InsertParameters>
                    <asp:Parameter Direction="Output" Name="IdReturn" Type="Int32" />
                </InsertParameters>
        </asp:SqlDataSource>
            <asp:SqlDataSource ID="VectorsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DiseaseDatabaseConnection %>" SelectCommand="SELECT [Id], [Name], [Description] FROM [Vectors]" InsertCommand="SubmitButton0_Click" OnSelecting="SqlDataSource1_Selecting"></asp:SqlDataSource>

</div>

</asp:Content>
