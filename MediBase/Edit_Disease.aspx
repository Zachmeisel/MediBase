<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Edit_Disease.aspx.cs" Inherits="MediBase.Edit_Disease" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   
    <style type="text/css">
        body
        {
            font: 11px "Lucida Grande" , Verdana;
            cursor: text;
            background: #FFFFFF;
        }
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
        <span style="font-size: xx-large">Edit Disease</span><br />
    </p>
    <div style="margin-left: auto; margin-right: auto; text-align: center;">
    <p>
        Disease Name:
        <asp:TextBox ID="TextBox2" runat="server" Width="178px"></asp:TextBox>
    </p>
    <div style="float:inherit">
    <p>
        Disease Description:
    <asp:TextBox ID="TextBox3" runat="server" Height="55px" style="margin-top: 0px" Width="260px" TextMode="MultiLine"></asp:TextBox>
    </p>
    </div>
    <p>&nbsp;</p>
    <div style="float:inherit">
    <p>
        &nbsp;Prognosis:
        
    <asp:TextBox ID="TextBox4" runat="server" Height="63px" style="margin-top: 0px" Width="240px" TextMode="MultiLine"></asp:TextBox>
    
    </p>
    </div>
    
    <br />
    
    <p>&nbsp;</p>
    <p>
        Pathogen:<asp:DropDownList ID="DropDownList1" runat="server" Height="38px" Width="175px" DataSourceID="SqlDataSource2" DataTextField="Name" DataValueField="Id">
        </asp:DropDownList>
    </p>
    <p>
        Symptoms:</p>
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
        
        <div>
            <asp:TextBox ID="txtValues" runat="server" Width="390px" Visible="True" CssClass ="Hiddentextbox"></asp:TextBox>
        </div>
    </div>
    <p>
        Aliases:<asp:TextBox ID="TextBox5" runat="server" Height="85px" TextMode="MultiLine" Width="314px"></asp:TextBox>
        </p>
    
    <p>
        Vectors:<asp:Panel ID="Panel1" runat="server" Height="88px" style="margin-left: 513px" Width="206px">
            <asp:CheckBoxList ID="CheckBoxList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="Id" TextAlign="Left" Height="27px" Width="140px">
            </asp:CheckBoxList>
        </asp:Panel>
        <asp:Button ID="Submit" runat="server" Text="Submit" OnClick="Submit_Click" />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DiseaseDatabaseConnection %>" SelectCommand="SELECT * FROM [Vectors]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="DiseaseDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DiseaseDatabaseConnection %>" OnUpdated="DiseaseDataSource_Inserted" SelectCommand="SELECT * FROM [Diseases]"></asp:SqlDataSource>
        </p>
        <p>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DiseaseDatabaseConnection %>" SelectCommand="SELECT * FROM [Phenotype]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DiseaseDatabaseConnection %>" SelectCommand="SELECT * FROM [Aliases]"></asp:SqlDataSource>
        </p>
        <p>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:DiseaseDatabaseConnection %>" SelectCommand="SELECT * FROM [Disease_Vectors]"></asp:SqlDataSource>
        </p>
    </div>
</asp:Content>
