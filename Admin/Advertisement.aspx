<%@ Page Title="Advertisement" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Advertisement.aspx.cs" Inherits="Admin.Advertisement" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .container {
            max-width: 85%;
            margin: 30px 50px auto auto;
            grid-template-columns: 30% 70%;
            display: grid;
            grid-gap: 10px;
        }

        .entry, .grid-container {
            border: 1px solid rgba(0,0,0,.1);
            border-radius: 5px;
            padding: 10px;
        }

        @media (max-width:1400px) {
            .container {
                width: 80%;
                grid-template-columns: 30% 70%;
                display: grid;
                grid-gap: 10px;
            }
        }
        .previewPanle {
            position: fixed;
            height: 95vh;
            width: 95vw;
            top: 2.5vh;
            left: 2.5vw;
            border-radius: 5px;
            background-color: rgb(49, 49, 49);
            text-align: center;
            display: flex;
            text-align: center;
            align-items: center;
            position:absolute;
            top:-100%;
            transition:.5s;
        }
       
        .previewPanle > img {
            margin: auto;
        }

        .previewPanle > div {
            position: absolute;
            top: 10px;
            right: 15px;
            height: 50px;
            width: 50px;
            font-size: 38px;
            font-weight: bold;
            border-radius: 100%;
            color: rgb(49, 49, 49);
            vertical-align: middle;
            background-color: white;
            cursor: pointer;
        }

        .image {
            max-height: 80vh;
            max-width:80vw;
        }
        @media (max-width:1400px) {
            .container {
                width: 80%;
                grid-template-columns: 50% 50%;
                display: grid;
                grid-gap: 10px;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="entry">
            <h3>Post Advertisement</h3>
            <hr />
            <br />
            <br />
            <div class="horoscope">
                <asp:Label Text="Quote" runat="server"> </asp:Label><br />
                <asp:TextBox ID="txtHeadline" runat="server" CssClass="textBox" ValidationGroup="from" placeholder="Add Name"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtHeadline" ID="rfv1" ErrorMessage="*" ForeColor="Red" ValidationGroup="from"></asp:RequiredFieldValidator>
            </div>
            <br />
            <br />
            <div class="horoscope">
                <asp:Label Text="Up to Date" runat="server"> </asp:Label><br />
                <asp:TextBox ID="txtDate" runat="server" CssClass="textBox" AutoCompleteType="None" ValidationGroup="from"></asp:TextBox>
                <asp:ToolkitScriptManager runat="server"></asp:ToolkitScriptManager>
                <asp:CalendarExtender runat="server" ID="ce1" TargetControlID="txtDate" Format="dd-MMM-yyyy"></asp:CalendarExtender>
                <asp:RequiredFieldValidator ControlToValidate="txtDate" runat="server" ErrorMessage="*" ForeColor="Red" ValidationGroup="from"></asp:RequiredFieldValidator>
            </div>
            <br />
            <br />
            <div class="horoscope">
                <asp:Label Text="Phone number" runat="server"></asp:Label><br />
                <asp:TextBox ID="txtPhone" runat="server" CssClass="textBox" ValidationGroup="from" placeholder="Phone number" AutoCompleteType="BusinessPhone" MaxLength="10"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="rfv2" ControlToValidate="txtPhone" ErrorMessage="*" ForeColor="Red" ValidationGroup="from"></asp:RequiredFieldValidator>
            </div>
            <br />
            <br />
            <div class="horoscope">
                <asp:Label Text="Select Image" runat="server"> </asp:Label><br />
                <asp:FileUpload ID="fImage" runat="server" CssClass="textBox" ValidationGroup="from"></asp:FileUpload>
                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="fImage" ErrorMessage="*" ForeColor="Red" ValidationGroup="from"></asp:RequiredFieldValidator>
            </div>
            <div class="submit">
                <asp:Button runat="server" Text="Submit" CssClass="btnSubmit" ID="btnSubmit" OnClick="btnSubmit_Click" ValidationGroup="from" />
                <br />
                <br />
                <asp:Button ID="btnDelete" runat="server" Text="Delete older data" CssClass="btn red" OnClick="btnDelete_Click" OnClientClick="return confirm('Are you sure to delete older data?')" Width="100px" />
            </div>
        </div>
        <div class="grid-container">
            <asp:GridView ID="grdPost" runat="server" GridLines="Horizontal" OnRowCommand="grdPost_RowCommand" AllowPaging="true" PageSize="10" OnPageIndexChanging="grdPost_PageIndexChanging" HeaderStyle-Font-Bold="false" HeaderStyle-HorizontalAlign="Left" RowStyle-Height="40" BorderStyle="None" AutoGenerateColumns="false" Width="100%">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="ID" />
                    <asp:BoundField DataField="HeadLine" HeaderText="Head Line" ItemStyle-Width="200px"/>
                    <asp:TemplateField HeaderText="Image" ItemStyle-Width="110px">
                        <ItemTemplate>
                            <asp:Image ID="imgThumnail" runat="server" CssClass="image" AlternateText='<%#Eval("ImagePath") %>' ImageUrl='<%#Eval("ThumbnailPath") %>' Height="50" Width="100" onclick="CreatePreview(this.alt)" />
                        </ItemTemplate>
                    </asp:TemplateField>                   
                    <asp:TemplateField HeaderText="Edit">
                        <ItemTemplate>
                            <asp:Button ID="btnEdit" runat="server" Text="Edit" CssClass="btn orange"  CommandArgument='<%# Eval("Id")%>' CommandName="editPost" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Action">
                        <ItemTemplate>
                            <asp:Button ID="btnSubmit" runat="server" Text='<%#Eval("SendButtonTxt") %>' CssClass='<%#Eval("SendButtonCss") %>' CommandArgument='<%# Eval("Id")%>' CommandName="sendPost" />
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Delete">
                        <ItemTemplate>
                            <asp:Button ID="btnDelete" runat="server" CssClass='btn red' Text='Delete' CommandArgument='<%# Eval("Id")%>' CommandName="deletePost" OnClientClick=" return confirm('Are you sure?');" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
    <div class='previewPanle fadeIn' id='previewPanel'>
        <div onclick='remove()'>X</div>
        <img id="previewImage" class='image' src='#'></div>
    <script>
        function CreatePreview(ImageURL) {
            document.getElementById('previewImage').src = ImageURL;
            document.getElementById('previewPanel').style.top = '20px';

        };
        function remove() {
            document.getElementById('previewPanel').style.top = '-100%';

        };
    </script>
</asp:Content>
