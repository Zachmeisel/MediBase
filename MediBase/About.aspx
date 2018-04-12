<%@ Page Title="About MediBase" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="MediBase.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link href ="Content/StyleSheet1.css" rel="stylesheet" type ="text/css" />
    <body>
    <p>&nbsp;</p>
        <div class="customstyle">
    <h2 style="margin-top: 40px; margin-bottom: -20px; margin-left:13px;"><%: Title %></h2>
    <h3 style="margin-bottom: 40px; margin-left:13px;">Medical Database program description</h3>
    <p style="margin-left:13px;">The aim of this program is to provide a medical database for users to find potential ailments they or their
        patients may suffer from utilizing the database's search tools. They can specify their symptoms through the
        database where it will be matched with the diseases we have stored.</p>
    <p></p>
    <p style="margin-left:13px;">As development progresses, we also intend to map patients' locations, to see if there are any trends being
        formed based on it (E.g. if there's a Cancer cluster). Coupled with that, we also plan on implementing strong
        and weak tagging systems.</p>
    <p></p>
    <p style="margin-left:13px; margin-top: 20px; margin-bottom: -10px;">This database was made using ASP.NET, Microsoft Visual Studio, C#, and SQL.</p>
        </div>
        </body>
</asp:Content>
