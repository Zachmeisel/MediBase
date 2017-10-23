<%@ Page Title="Publish Disease" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PublishDisease.aspx.cs" Inherits="MediBase.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <h3>Add a disease to our ever growing database</h3>
    <p>Feel free to submist a disease or illness to be added to our database. Just feel out the required fields and hit send it your entry will be put under review by our experts.</p>
<p>&nbsp;</p>
    <div style="margin-left: auto; margin-right: auto; text-align: center;">
    Name of Disease or Illness:
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <p>&nbsp;</p>
        Phenotype:
    <asp:TextBox ID="TextBox2" runat="server" Width="204px"></asp:TextBox>
</div>

</asp:Content>
