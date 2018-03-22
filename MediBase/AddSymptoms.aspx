<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddSymptoms.aspx.cs" Inherits="MediBase.WebForm2" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="margin-left: auto; margin-right: auto; text-align: center;">
        <br />
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" Text="Symptoms Name:" meta:resourcekey="Label1Resource1"></asp:Label>
    <asp:TextBox ID="SymptomName" runat="server" Width="259px" meta:resourcekey="SymptomNameResource1"></asp:TextBox>
    <br />
    <br />&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="Label2" runat="server" Text="Symptoms Description:" meta:resourcekey="Label2Resource1"></asp:Label>
    <asp:TextBox ID="SymptomDescription" runat="server" Width="256px" Columns="1" Height="70px" TextMode="MultiLine" meta:resourcekey="SymptomDescriptionResource1"></asp:TextBox>
        <asp:Button ID="AddSymptoms" runat="server" Text="Add" OnClick="AddSymptoms_Click" meta:resourcekey="AddSymptomsResource1" />
        <br />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label3" runat="server" Text="List of Symptoms" meta:resourcekey="Label3Resource1"></asp:Label> 
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:ListBox ID="ListBox1" runat="server" DataSourceID="SymptomDataSource" DataTextField="Name" DataValueField="Name" Height="101px" Width="251px" meta:resourcekey="ListBox1Resource1"></asp:ListBox>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Return" meta:resourcekey="Button1Resource1" />
        <br />
        <asp:SqlDataSource ID="SymptomDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DiseaseDatabaseConnection %>" SelectCommand="SELECT [Name], [Description] FROM [Symptoms]"></asp:SqlDataSource>
        </div>
</asp:Content>
