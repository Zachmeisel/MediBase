<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="MediBase._Default" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
     <link href ="Content/StyleSheet1.css" rel="stylesheet" type ="text/css" />

    <div class="jumbotron">
        <h1>MediBase</h1>
        <p class="lead">
            <asp:Label ID="Label1" runat="server" Text="A Medical Database" meta:resourcekey="Label1Resource1"></asp:Label></p>
        <p><a href="http://www.asp.net" class="btn btn-primary btn-lg">Learn more &raquo;</a></p>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>
                <asp:Label ID="Label2" runat="server" Text="Getting started" meta:resourcekey="Label2Resource1"></asp:Label></h2>
            <p>
                <asp:Label ID="Label3" runat="server" Text="Click on one of the tabs or search in the search bar up above." meta:resourcekey="Label3Resource1"></asp:Label>
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301948">
                    <asp:Label ID="Label8" runat="server" Text="Learn more" meta:resourcekey="Label8Resource1"></asp:Label> &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>
                <asp:Label ID="Label4" runat="server" Text="Add Disease" meta:resourcekey="Label4Resource1"></asp:Label></h2>
            <p>
                <asp:Label ID="Label5" runat="server" Text="You can research and add your own diseases to our evergrowing databaase" meta:resourcekey="Label5Resource1"></asp:Label>
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301949">
                    <asp:Label ID="Label9" runat="server" Text="Learn more" meta:resourcekey="Label9Resource1"></asp:Label> &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>
                <asp:Label ID="Label6" runat="server" Text="Searching" meta:resourcekey="Label6Resource1"></asp:Label></h2>
            <p>
                <asp:Label ID="Label7" runat="server" Text="You can easily search through our database by symptoms and it will sort them by weak or strong for certain diseases and illnesses" meta:resourcekey="Label7Resource1"></asp:Label>
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301950">
                    <asp:Label ID="Label10" runat="server" Text="Learn more " meta:resourcekey="Label10Resource1"></asp:Label>&raquo;</a>
            </p>
        </div>
    </div>

</asp:Content>
