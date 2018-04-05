<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Lockout.aspx.cs" Inherits="MediBase.Account.Lockout" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link href ="/Content/StyleSheet1.css" rel="stylesheet" type ="text/css" />
    <body>
    <div class="customstyle">
    <hgroup>
        <h1>Locked out.</h1>
        <h2 class="text-danger">This account has been locked out, please try again later.</h2>
    </hgroup>
        </div>
        </body>
</asp:Content>
