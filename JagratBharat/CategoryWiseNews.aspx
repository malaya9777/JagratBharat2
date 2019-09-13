<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="CategoryWiseNews.aspx.cs" Inherits="JagratBharat.CategoryWiseNews" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .main_container {
            position: relative;
            margin: 10px auto;
            max-width: 1000px;
        }

        .lable {
            border: solid 1px #ff6363;
            padding: 10px;
            background: #fff;
            color: #ff6363;
        }

        .blue-button {
            padding: 10px;
            width: 100px;
            border: none;
            background: #000ba5;
            color: #fff;
        }

        .sub-news-section {
            max-width: 1000px;
            margin: 0 auto 10px auto;
        }

            .sub-news-section .lable {
                width: 100px;
            }

            .sub-news-section .subnews-container {
                margin: 10px auto;
                display: -ms-grid;
                display: grid;
                -ms-grid-columns: auto auto auto;
                grid-template-columns: auto auto auto;
                grid-gap: 20px;
            }

        @media (max-width: 700px) {
            .sub-news-section .subnews-container {
                -ms-grid-columns: auto;
                grid-template-columns: auto;
            }
        }

        .sub-news-section .subnews-container .subnews .subnews-image {
            position: relative;
            -webkit-box-sizing: content-box;
            box-sizing: content-box;
        }

            .sub-news-section .subnews-container .subnews .subnews-image img {
                width: 100%;
            }

            .sub-news-section .subnews-container .subnews .subnews-image .info {
                position: absolute;
                bottom: 7px;
                padding: 10px;
                color: #fff;
                background: rgba(0, 0, 0, 0.5);
            }

                .sub-news-section .subnews-container .subnews .subnews-image .info p {
                    padding: 0;
                    margin: 0;
                    font-size: .8em;
                }

        .sub-news-section .subnews-container .subnews .subnews-info {
            padding: 10px;
        }

            .sub-news-section .subnews-container .subnews .subnews-info h1 {
                font-size: 1em;
                margin: 2px;
            }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main>
        <div class="main_container">
            <h3 id="heading" runat="server" class="lable">Heading</h3>
            <section class="sub-news-section">
                <div class="subnews-container" runat="server" id="subnews_container">
                </div>
                <div id="ads" runat="server"></div>
            </section>
        </div>
    </main>

    <script>
        function redirect(path) {
            window.location = path;
        };
    </script>
</asp:Content>
