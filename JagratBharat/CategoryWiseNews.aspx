<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="CategoryWiseNews.aspx.cs" Inherits="JagratBharat.CategoryWiseNews" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .container {
            margin: 80px auto;
            max-width: 1200px;
        }

        .mainContent {
            display: grid;
            width: 100%;
            background-color: #fff;
            padding: 5px;
            grid-template-columns: 30% 30% 30%;
            grid-gap: 5%;
        }

            .mainContent > .card {
                min-width: 200px;
                background-color: black;
                margin: 0px 10px 0px 0px;
                cursor: pointer;
            }

                .mainContent > .card > img {
                    width: 90%;
                    padding: 5%;
                }

                .mainContent > .card > h5 {
                    margin: unset;
                    color: #fff;
                    padding: 0px 5px 10px 5px;
                    text-align: justify;
                }

        .container > h3 {
            text-align: center;
            padding: 8px;
            background-color: #000000;
            color: #fff;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h3 id="heading" runat="server">Heading</h3>
        <div class="mainContent" id="mainContent" runat="server">
        </div>
    </div>
    <script>
        function redirect(path) {
            window.location = path;
        }
    </script>
</asp:Content>
