<%@ Page Title="Post News" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="PostNews.aspx.cs" Inherits="Admin.PostNews" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        
        .container {
            max-width: 85%;
            margin: 30px 50px auto auto;
            grid-template-columns: 50% 50%;
            display: grid;
            grid-gap: 10px;
        }

        .postNews, .latestNews {
            border: 1px solid rgba(0,0,0,.1);
            border-radius: 5px;
            padding: 10px;
        }

        .action {
            margin-top: 10px;
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
        <div class="postNews">
            <div>
                <h3>Create Post</h3>
            </div>
            <div class="newsCategory">
                <asp:DropDownList runat="server" ID="ddlCategory" CssClass="textBox"></asp:DropDownList>
                <asp:RequiredFieldValidator ID="rf3" runat="server" ControlToValidate="ddlCategory" ValidationGroup="Main" InitialValue="0" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
            <div class="newsHeadline">
                <asp:TextBox runat="server" CssClass="textBox" ID="txtHeadline" placeholder="News Headline" Width="100%"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rf1" runat="server" ControlToValidate="txtHeadline" ValidationGroup="Main" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
            <div class="newsDate">
                <asp:TextBox runat="server" ID="txtNewsDate" CssClass="textBox" placeholder="News Date" AutoCompleteType="None"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtNewsDate" ValidationGroup="Main" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:ToolkitScriptManager runat="server"></asp:ToolkitScriptManager>
                <asp:CalendarExtender TargetControlID="txtNewsDate" Format="dd-MMM-yyyy" runat="server" ID="ce1" />
            </div>
            <div class="newsBody">
                <asp:TextBox runat="server" CssClass="textBox" ID="txtBody" placeholder="News Body" TextMode="MultiLine" Height="200px" Width="100%"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rf2" runat="server" ControlToValidate="txtBody" ErrorMessage="*" ValidationGroup="Main" ForeColor="Red"></asp:RequiredFieldValidator>

            </div>
            <div class="newsImage">
                <asp:FileUpload runat="server" CssClass="textBox" ID="fImage" placeholder="Select Image" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="fImage" ValidationGroup="Main" ErrorMessage="*" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:Image runat="server" Height="20" Width="40" ID="imgPreview" onclick="CreatePreview(this.alt)" />

            </div>
            <div class="Embedvideo">
                <asp:TextBox runat="server" CssClass="textBox" ID="videoEmbed" Width="100%" placeholder="YouTube Video URL"></asp:TextBox>
            </div>
            <div class="action">
                <asp:Button ID="btnSubmit" runat="server" CssClass="btn green" Text="Submit" ValidationGroup="Main" OnClick="btnSubmit_Click" />
            </div>
        </div>

        <div class="latestNews">
            <div id="notAllowed" runat="server" class="notAllowed">
                <p>
                    You are not authorized to view this page!<br>
                    Please contack administrator.
                </p>
            </div>
            <asp:GridView ID="grdPost" runat="server" GridLines="Horizontal" OnRowCommand="grdPost_RowCommand" AllowPaging="true" PageSize="10" OnPageIndexChanging="grdPost_PageIndexChanging" HeaderStyle-Font-Bold="false" HeaderStyle-HorizontalAlign="Left" RowStyle-Height="40" BorderStyle="None" AutoGenerateColumns="false" Width="100%">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="ID" />
                    <asp:BoundField DataField="HeadLine" HeaderText="Head Line" />
                    <asp:TemplateField HeaderText="Image">
                        <ItemTemplate>
                            <asp:Image ID="imgThumnail" runat="server" CssClass="image" AlternateText='<%#Eval("OriginalImageURL") %>' ImageUrl='<%#Eval("ThumbnailImageURL") %>' Height="20" Width="40" onclick="CreatePreview(this.alt)" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="View">
                        <ItemTemplate>
                            <a href='<%#Eval("PreviewURL") %>' target="_blank">View</a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Edit">
                        <ItemTemplate>
                            <asp:Button ID="btnEdit" runat="server" Text="Edit" CssClass="btn orange" CommandArgument='<%# Eval("Id")%>' CommandName="editPost" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Action">
                        <ItemTemplate>
                            <asp:Button ID="btnSubmit" runat="server" CssClass='<%# Eval("SendButtonCss")%>' Text='<%# Eval("SendButtonTxt")%>' CommandArgument='<%# Eval("Id")%>' CommandName="sendPost" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Delete">
                        <ItemTemplate>
                            <asp:Button ID="btnDelete" runat="server" CssClass='btn red' Text='Delete' CommandArgument='<%# Eval("Id")%>' CommandName="deletePost" OnClientClick=" return confirm('Are you sure?');" />
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>
            </asp:GridView>
            <asp:Image ID="imgTest" runat="server" />
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
