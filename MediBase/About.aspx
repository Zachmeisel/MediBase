<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="MediBase.About" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
     
    <p>&nbsp;</p>
    <h2><asp:Label ID="Label1" runat="server" Text="About MediBase" meta:resourcekey="Label1Resource1"></asp:Label></h2>
    <h3>
        <asp:Label ID="Label2" runat="server" Text="Medical Database program description" meta:resourcekey="Label2Resource1"></asp:Label></h3>
    <p>
        <asp:Label ID="Label3" runat="server" Text="The aim of this program is to provide a medical database for users to find potential ailments they or their
        patients may suffer from utilizing the database's search tools. They can specify their symptoms through the
        database where it will be matched with the diseases we have stored." meta:resourcekey="Label3Resource1"></asp:Label></p>
    <p></p>
    <p>
        <asp:Label ID="Label4" runat="server" Text="As development progresses, we also intend to map patients' locations, to see if there are any trends being
        formed based on it (E.g. if there's a Cancer cluster). Coupled with that, we also plan on implementing strong
        and weak tagging systems." meta:resourcekey="Label4Resource1"></asp:Label></p>
    <p></p>
    <p>
        <asp:Label ID="Label5" runat="server" Text="This database was made using ASP.NET, Microsoft Visual Studio, C#, and SQL." meta:resourcekey="Label5Resource1"></asp:Label></p>
</asp:Content>
