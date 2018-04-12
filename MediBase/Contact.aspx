<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="MediBase.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link href ="/Content/StyleSheet1.css" rel="stylesheet" type ="text/css" />
    <body>
    <div class="customstyle">
    <p>&nbsp;</p>
    <h2 style="margin-top: 40px; margin-left: 13px;"><%: Title %></h2>
    <h3 style="margin-top: -15px; margin-left:13px;">Contact us here:</h3>
    <address style="margin-top: 30px; margin-left:13px;">
        One MediBase Way<br />
        Manchester, NH <br />
        <abbr title="Phone">P:</abbr>
        603.660.3471
    </address>

    <address>
        <strong style="margin-left:13px;">Support:</strong>   <a href="zachary.meisel@snhu.edu">zachary.meisel@snhu.edu</a><br />
    </address>
            </div>
        </body>
</asp:Content>
