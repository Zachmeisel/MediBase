<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="MediBase.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link href ="Content/StyleSheet1.css" rel="stylesheet" type ="text/css" />
    <body>
        <div class="customstyle">
    <p>&nbsp;</p>
    <h2><%: Title %>Contact</h2>
    <h3>Your contact page.</h3>
    <address>
        One MediBase Way<br />
        Manchester, NH <br />
        <abbr title="Phone">P:</abbr>
        603.660.3471
    </address>

    <address>
        <strong>Support:</strong>   <a href="zachary.meisel@snhu.edu">zachary.meisel@snhu.edu</a><br />
    </address>
            </div>
        </body>
</asp:Content>
