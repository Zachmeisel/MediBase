<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="MediBase.Contact" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
     <link href ="Content/StyleSheet1.css" rel="stylesheet" type ="text/css" />
    <p>&nbsp;</p>
    <h2><asp:Label ID="Title" runat="server" Text="Contact" meta:resourcekey="Label1Resource1"></asp:Label></h2>
    <h3>
        <asp:Label ID="Description" runat="server" Text="Your contact page." meta:resourcekey="Label2Resource1"></asp:Label></h3>
    <address>
        <asp:Label ID="Address" runat="server" Text="One MediBase Way&lt;br /&gt;
        Manchester, NH &lt;br /&gt;
        &lt;abbr title=&quot;Phone&quot;&gt;P:&lt;/abbr&gt;
        603.660.3471" meta:resourcekey="Label3Resource1"></asp:Label>
        
    </address>

    <address>
        <strong>
            <asp:Label ID="Support" runat="server" Text="Support:" meta:resourcekey="Label4Resource1"></asp:Label></strong>   <a href="zachary.meisel@snhu.edu">zachary.meisel@snhu.edu</a><br />
    </address>
</asp:Content>
