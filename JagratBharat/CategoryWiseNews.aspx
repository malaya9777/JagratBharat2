<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="CategoryWiseNews.aspx.cs" Inherits="JagratBharat.CategoryWiseNews" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .main_container {
            position: relative;
            margin: 10px auto;
            max-width: 1000px;
        }

        .main-Content {
            display: grid;
            width: 100%;
            background-color: #fff;
            padding: 5px;
            grid-template-columns: auto auto auto;
            grid-gap: 5%;
        }

        @media (max-width:700px) {
            .main-Content {
                grid-template-columns: auto;
                grid-gap:10px;
            }
        }

        .main-Content > .card {
            min-width: 200px;
            background-color: black;
            margin: 0px 10px 0px 0px;
            cursor: pointer;
        }

            .main-Content > .card > img {
                width: 90%;
                padding: 5%;
            }

            .main-Content > .card > h5 {
                margin: unset;
                color: #fff;
                padding: 0px 5px 10px 5px;
                text-align: justify;
                font-size:1em;
            }

        .main_container > h3 {
            text-align: center;
            padding: 8px;
            background-color: #000000;
            color: #fff;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main>
        <div class="main_container">
            <h3 id="heading" runat="server">Heading</h3>
            <div class="main-Content" id="mainContent" runat="server"></div>
        </div>
    </main>

    <script>
        function redirect(path) {
            window.location = path;
        };
    </script>
</asp:Content>
