<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PublishDisease.aspx.cs" Inherits="MediBase.WebForm1" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <link href ="Content/StyleSheet1.css" rel="stylesheet" type ="text/css" />
    <p>&nbsp;</p>
    <h2>
        <asp:Label ID="Label1" runat="server" Text="Publish Disease" meta:resourcekey="Label1Resource2"></asp:Label></h2>
    <h3>
        <asp:Label ID="Label2" runat="server" Text="Add a disease to our ever growing database" meta:resourcekey="Label2Resource2"></asp:Label></h3>
    <p>
        <asp:Label ID="Label3" runat="server" Text="Feel free to submist a disease or illness to be added to our database. Just feel out the required fields and hit send it your entry will be put under review by our experts." meta:resourcekey="Label3Resource2"></asp:Label></p>
<p>&nbsp;</p>
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
    <div style="margin-left: auto; margin-right: auto; text-align: center;">
        <asp:Label ID="Label4" runat="server" Text="Name of Disease or Illness:" meta:resourcekey="Label4Resource1"></asp:Label>
    <asp:TextBox ID="DiseaseNameText" runat="server" Width="282px" BorderColor="White" meta:resourcekey="DiseaseNameTextResource1"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label5" runat="server" Text="Disease Description:" meta:resourcekey="Label5Resource1"></asp:Label>
    <asp:TextBox ID="DiseaseDescription" runat="server" Width="204px" Columns="1" Height="70px" TextMode="MultiLine" meta:resourcekey="DiseaseDescriptionResource1"></asp:TextBox>
        <asp:Button ID="DiseaseDescriptionButton" runat="server" OnClick="StrongSymptomsButton_Click" Text="Add" Visible="False" meta:resourcekey="DiseaseDescriptionButtonResource2" />
        <p>&nbsp;</p>
        <p>&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="Label6" runat="server" Text="Prognosis:" meta:resourcekey="Label6Resource1"></asp:Label>
    <asp:TextBox ID="DiseasePrognosis" runat="server" Width="204px" Columns="1" Height="70px" TextMode="MultiLine" meta:resourcekey="DiseasePrognosisResource1"></asp:TextBox>
        </p>
        <p>&nbsp;</p>
        &nbsp;<asp:Label ID="Label7" runat="server" Text="Pathogen:" meta:resourcekey="Label7Resource1"></asp:Label><asp:DropDownList ID="PathogenDropDown" runat="server" DataSourceID="PathogenDataSource" DataTextField="Name" DataValueField="Id" Height="16px" Width="186px" meta:resourcekey="PathogenDropDownResource1">
        </asp:DropDownList>
&nbsp;<br />
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label8" runat="server" Text="Symptoms Name:" meta:resourcekey="Label8Resource1"></asp:Label>
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
            <asp:TextBox ID="txtValues" runat="server" Width="390px" CssClass ="Hiddentextbox" meta:resourcekey="txtValuesResource1"></asp:TextBox>
        </div>
    </div>
  
        &nbsp;&nbsp;
        <asp:Button ID="SymptomsButton" runat="server" OnClick="StrongSymptomsButton_Click" Text="Add" ToolTip="To add a symptom not coming up" Width="79px" meta:resourcekey="SymptomsButtonResource2" />
        <br />
        <br />
        <asp:Label ID="Label9" runat="server" Text="Aliases:" meta:resourcekey="Label9Resource1"></asp:Label>
    <asp:TextBox ID="Aliases" runat="server" Width="199px" Height="84px" TextMode="MultiLine" meta:resourcekey="AliasesResource1"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label10" runat="server" Text="Vectors:" meta:resourcekey="Label10Resource1"></asp:Label>
        

        <br />
        <asp:Panel ID="Panel1" runat="server" Height="88px" style="margin-left: 513px" Width="206px" meta:resourcekey="Panel1Resource1">
            <asp:CheckBoxList ID="CheckBoxList1" runat="server" DataSourceID="VectorsDataSource" DataTextField="Name" DataValueField="Id" TextAlign="Left" meta:resourcekey="CheckBoxList1Resource1">
            </asp:CheckBoxList>
        </asp:Panel>
        <br />
        <br />
        <br />
        <asp:Button ID="SubmitButton0" runat="server" OnClick="SubmitButton0_Click" Text="Submit" Width="95px" meta:resourcekey="SubmitButton0Resource2" />
        <br />
        <br />
        
        <br />
        <br />
        
         
        <br />
        <asp:SqlDataSource ID="Disease_VectorsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DiseaseDatabaseConnection %>" SelectCommand="SELECT [Disease_Id], [Vector_Id] FROM [Disease_Vectors]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="PathogenDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DiseaseDatabaseConnection %>" SelectCommand="SELECT [Id], [Name] FROM [Phenotype]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="AliasesDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DiseaseDatabaseConnection %>" SelectCommand="SELECT [Name] FROM [Aliases]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SymptomsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DiseaseDatabaseConnection %>" SelectCommand="SELECT * FROM [Symptoms]" OnSelecting="SymptomsDataSource_Selecting"></asp:SqlDataSource>
            <asp:SqlDataSource ID="DiseaseDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DiseaseDatabaseConnection %>" OnSelected="DiseaseDataSource_Inserted" SelectCommand="SELECT [Name], [Description], [Prognosis], [Phenotype_Id], [Id] FROM [Diseases]" OnInserted="DiseaseDataSource_Inserted">
                <InsertParameters>
                    <asp:Parameter Direction="Output" Name="IdReturn" Type="Int32" />
                </InsertParameters>
        </asp:SqlDataSource>
            <asp:SqlDataSource ID="VectorsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DiseaseDatabaseConnection %>" SelectCommand="SELECT [Id], [Name], [Description] FROM [Vectors]" InsertCommand="SubmitButton0_Click" OnSelecting="SqlDataSource1_Selecting"></asp:SqlDataSource>

        <asp:SqlDataSource ID="Disease_SymptomsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DiseaseDatabaseConnection %>" SelectCommand="SELECT [Disease_Id], [Symptom_Id] FROM [Disease_Symptoms]"></asp:SqlDataSource>

</div>

</asp:Content>
