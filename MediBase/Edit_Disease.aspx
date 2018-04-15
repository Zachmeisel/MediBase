<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Edit_Disease.aspx.cs" Inherits="MediBase.Edit_Disease" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   <link href ="Content/StyleSheet1.css" rel="stylesheet" type ="text/css" />
    <style type="text/css">

        ul
        {
            display: block;
        }
        .textboxlist
        {
            font: 11px "Lucida Grande" , Verdana;
            cursor: text;
            width: 400px;
            margin-left: 380px;
            background: #FFFFFF;
        }
        .textboxlist-ul
        {
            overflow: hidden;
            margin: 0;
            padding: 3px 4px 0;
            border: 1px solid #999;
            padding-bottom: 3px;
        }
        .textboxlist-li
        {
            list-style-type: none;
            float: left;
            display: block;
            padding: 0;
            margin: 0 5px 3px 0;
            cursor: default;
            background: #FFFFFF;
        }
        .textboxlist-li-editable
        {
            border: 1px solid #fff;
            background: #FFFFFF;
        }
        .textboxlist-li-editable-input
        {
            border: 0;
            padding: 2px 0;
            padding-bottom: 0;
            height: 14px;
            font: 11px "Lucida Grande" ,Verdana;
        }
        .textboxlist-li-editable-input:focus
        {
            outline: 0;
        }
        .textboxlist-li-box
        {
            position: relative;
            line-height: 18px;
            padding: 0 5px;
            border: 1px solid #CAD8F3;
            background: #DEE7F8;
            cursor: default;
            float: right;
        }
        .textboxlist-li-box-deletable
        {
            padding-right: 15px;
        }
        .textboxlist-li-box-deletebutton
        {
            position: absolute;
            right: 4px;
            top: 6px;
            display: block;
            width: 7px;
            height: 7px;
            font-size: 1px;
            background: url(  'close.gif' );
        }
        .textboxlist-li-box-deletebutton:hover
        {
            border: none;
            background-position: 7px;
            text-decoration: none;
        }
        .Hiddentextbox
        {
            display: none;
        }
        div
        {
            display: block;
        }
    </style>
    
    <script src="Scripts/jquery-1.7.1.min.js"></script>  
    <script language="javascript" type="text/javascript">

        $(document).ready(function () {
            var TypeHere = $("input[id$='TypeHere']");
            var txtValues = $("input[id$='txtValues']");
            var liTypeHere = $("#liTypeHere");
            var mydivTextBox = $("#mydivTextBox");

            //Once the user clicks on div, set the focus on input box.
            mydivTextBox.click(function () {
                TypeHere.focus();
            });

            TypeHere.keypress(function (e) {
                switch (e.keyCode) {
                    case 188: // ','
                        // alert('done');
                        break;
                    default:
                        TypeHere.width(TypeHere.width() + 10);
                }
            });
            TypeHere.keyup(function (e) {
                switch (e.keyCode) {
                    case 8:  // Backspace
                        if (TypeHere.width() > 10) {
                            TypeHere.width(TypeHere.width() - 10);
                        }
                        break;
                    case 188: // ','
                        var myInputLength = TypeHere.val().length;
                        var myInputText = TypeHere.val().substring(0, myInputLength - 1); // remove ','
                        TypeHere.width(myInputLength * 6 + 15);




                        //Create the list item on fly and apply the css
                        CreateLi(myInputText)
                        //Save into Textbox or HiddenField
                        var strValue = txtValues.val() + myInputText + ';';
                        txtValues.val(strValue);
                        //Push the textbox to the right
                        TypeHere.width(myInputLength + 15);
                        //Make the input width to default and set as blank
                        liTypeHere.css('left', TypeHere.position().left + TypeHere.width() + 10);
                        TypeHere.val('');
                        TypeHere.width(10);
                        break;
                }
            });

            function CreateLi(strValue) {
                var li = document.createElement('li');
                li.className = 'textboxlist-li textboxlist-li-box textboxlist-li-box-deletable';
                li.innerHTML = strValue;

                var butt = document.createElement('a');
                butt.className = 'textboxlist-li-box-deletebutton';
                butt.onclick = removeSymptom;
                li.appendChild(butt);
                document.getElementById('myListbox').appendChild(li);

            }
        });

        function removeSymptom() {
            //alert('Delete clicked');
            this.parentNode.parentNode.removeChild(this.parentNode);
        }

    </script>
    
    <p>
        <p>&nbsp &nbsp &nbsp</p>
        <span style="font-size: xx-large">
            <asp:Label ID="Label2" runat="server" Text="Edit Disease" meta:resourcekey="Label2Resource1"></asp:Label></span><br />
    </p>
    <div style="margin-left: auto; margin-right: auto; text-align: center;">
        <asp:Label ID="Label1" runat="server" Text="Disease Updated" BackColor="#000066" BorderColor="#0000CC" ForeColor="White" Visible="False" meta:resourcekey="Label1Resource1"></asp:Label>
        <br />
    <p>
        <asp:Label ID="Label3" runat="server" Text="Disease Name:" meta:resourcekey="Label3Resource1"></asp:Label>
        <asp:TextBox ID="TextBox2" runat="server" Width="178px" meta:resourcekey="TextBox2Resource1"></asp:TextBox>
    </p>
    <div style="float:inherit">
    <p>
        <asp:Label ID="Label4" runat="server" Text="Disease Description:" meta:resourcekey="Label4Resource1"></asp:Label>
    <asp:TextBox ID="TextBox3" runat="server" Height="55px" style="margin-top: 0px" Width="260px" TextMode="MultiLine" meta:resourcekey="TextBox3Resource1"></asp:TextBox>
    </p>
    </div>
    <p>&nbsp;</p>
    <div style="float:inherit">
    <p>
        &nbsp;<asp:Label ID="Label5" runat="server" Text="Prognosis:" meta:resourcekey="Label5Resource1"></asp:Label>
        
    <asp:TextBox ID="TextBox4" runat="server" Height="63px" style="margin-top: 0px" Width="240px" TextMode="MultiLine" meta:resourcekey="TextBox4Resource1"></asp:TextBox>
    
    </p>
    </div>
    
    <br />
    
    <p>&nbsp;</p>
    <p>
        <asp:Label ID="Label6" runat="server" Text="Pathogen:" meta:resourcekey="Label6Resource1"></asp:Label><asp:DropDownList ID="DropDownList1" runat="server" Height="38px" Width="175px" DataSourceID="SqlDataSource2" DataTextField="Name" DataValueField="Id" meta:resourcekey="DropDownList1Resource1">
        </asp:DropDownList>
    </p>
        <div style="margin-left: auto; margin-right: auto; text-align: center;">
            </div>
    <p>
        <asp:Label ID="Label7" runat="server" Text="Add More
        Symptoms:" meta:resourcekey="Label7Resource1"></asp:Label></p>
    <div id="feedback"></div> 
    <div>
        <div class="textboxlist" id="mydivTextBox">
            <ul class="textboxlist-ul" id="myListbox">
                <li class="textboxlist-li textboxlist-li-editable" style="display: block;" id="liTypeHere">
                    <input type="text" class="textboxlist-li-editable-input" style="width: 10px;" ID="TypeHere"
                        maxlength="35" />
                </li>
            </ul>
        </div>
        <br />
        <asp:Label ID="Label8" runat="server" Text="To Delete Symptoms you must delete the name and the " meta:resourcekey="Label8Resource1"></asp:Label> &quot;;&quot;<br />
        
        <div>
            <asp:TextBox ID="txtValues" runat="server" Width="390px" meta:resourcekey="txtValuesResource1"></asp:TextBox>
            <br />
        </div>
    </div>
    <p>
        <asp:Label ID="Label9" runat="server" Text="Aliases:" meta:resourcekey="Label9Resource1"></asp:Label><asp:TextBox ID="TextBox5" runat="server" Height="85px" TextMode="MultiLine" Width="314px" meta:resourcekey="TextBox5Resource1"></asp:TextBox>
        </p>
    
    <p>
        <asp:Label ID="Label10" runat="server" Text="Vectors:" meta:resourcekey="Label10Resource1"></asp:Label><asp:Panel ID="Panel1" runat="server" Height="88px" style="margin-left: 513px" Width="143px" meta:resourcekey="Panel1Resource1">
            <asp:CheckBoxList ID="CheckBoxList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="Id" TextAlign="Left" Height="33px" Width="129px" OnLoad="Page_Load" OnPreRender="VectorLoad" meta:resourcekey="CheckBoxList1Resource1">
            </asp:CheckBoxList>
        </asp:Panel>
        <br />
        <br />
        <br />
        <asp:Button ID="Submit" runat="server" Text="Submit" OnClick="Submit_Click" meta:resourcekey="SubmitResource1" />
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DiseaseDatabaseConnection %>" SelectCommand="SELECT * FROM [Vectors]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="DiseaseDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DiseaseDatabaseConnection %>" OnUpdated="DiseaseDataSource_Inserted" SelectCommand="SELECT * FROM [Diseases]"></asp:SqlDataSource>
        </p>
        <p>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DiseaseDatabaseConnection %>" SelectCommand="SELECT * FROM [Phenotype]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DiseaseDatabaseConnection %>" SelectCommand="SELECT * FROM [Aliases]" OnSelecting="SqlDataSource3_Selecting"></asp:SqlDataSource>
        </p>
        <p>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:DiseaseDatabaseConnection %>" SelectCommand="SELECT * FROM [Disease_Vectors]"></asp:SqlDataSource>
        </p>
        <p>
            <asp:SqlDataSource ID="Disease_SymptomsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DiseaseDatabaseConnection %>" SelectCommand="SELECT * FROM [Disease_Symptoms]"></asp:SqlDataSource>
        </p>
    </div>
</asp:Content>
