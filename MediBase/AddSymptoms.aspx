<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddSymptoms.aspx.cs" Inherits="MediBase.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href ="Content/StyleSheet1.css" rel="stylesheet" type ="text/css" />
    <body>
    <div class="customstyle">
    <div style="margin-left: auto; margin-right: auto; text-align: center;">
        <br />
        <br />
        <br />
    Symptoms Name:
    <asp:TextBox ID="SymptomName" runat="server" Width="259px"></asp:TextBox>
    <br />
    <br />&nbsp;&nbsp;&nbsp;&nbsp; Symptoms Description:
    <asp:TextBox ID="SymptomDescription" runat="server" Width="256px" Columns="1" Height="70px" TextMode="MultiLine"></asp:TextBox>
        <asp:Button ID="AddSymptoms" runat="server" Text="Add" OnClick="AddSymptoms_Click" />
        <br />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; List of Symptoms
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:ListBox ID="ListBox1" runat="server" DataSourceID="SymptomDataSource" DataTextField="Name" DataValueField="Name" Height="101px" Width="251px"></asp:ListBox>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Return" />
        <br />
        <asp:SqlDataSource ID="SymptomDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DiseaseDatabaseConnection %>" SelectCommand="SELECT [Name], [Description] FROM [Symptoms]"></asp:SqlDataSource>
        </div>
        </div>
        </body>
</asp:Content>
