<%@ Page Title="Categories | Jagrat Bharat News" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Categories.aspx.cs" Inherits="JagratBharat.Categories" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .container {
            margin: 80px auto;
            max-width: 1200px;
        }

            .container > h3 {
                padding: 10px;
                color: #fff;
                max-width: 95%;
                background-color: red;
            }

            .container > .roller {
                display: none;
                position: relative;
                display: inline-flex;
                max-width: 95%;
                overflow-x: scroll;
                padding: 10px;
                background-color: rgb(255, 255, 255);
            }

                .container > .roller > .card {
                    min-width: 200px;
                    background-color: black;
                    margin: 0px 10px 0px 0px;
                    cursor: pointer;
                }

                    .container > .roller > .card > img {
                        width: 90%;
                        padding: 5%;
                    }

                    .container > .roller > .card > h5 {
                        margin: unset;
                        color: #fff;
                        padding: 0px 5px 10px 5px;
                        text-align: justify;
                    }

        @media (max-width:700px) {
            .container > .roller {
                padding: 2.5%;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" id="container" runat="server">
        
    </div>
    <script>
        function redirect(path) {
            window.location = path;
        }
    </script>
</asp:Content>
