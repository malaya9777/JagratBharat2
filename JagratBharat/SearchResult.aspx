<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="SearchResult.aspx.cs" Inherits="JagratBharat.SearchResult" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .container {
            max-width: 800px;
            margin: 80px auto 10px auto;
            padding: 0px 20px 0px 20px;
        }
        .searchTerm{
            padding:10px;
            color:#fff;
            background-color: rgba(94, 94, 94, 0.50);

            
        }

        .results {
            background-color: rgba(94, 94, 94, 0.50);
            padding: 10px;
        }

        .result {
            margin: 10px auto 0px auto;
            padding: 10px;
            border-radius: 5px;
            background-color: rgb(255, 255, 255);
        }

            .result > a {
                text-decoration: none;
                display: grid;
                grid-template-columns: 30% 70%;
                grid-column-gap: 2%;
                border-radius: 4px;
                width: auto;
            }

                .result > a > .img {
                    background-size: cover;
                    height: 100px;
                }

             h5 {
                margin: 0;
            }

        @media(max-width:850px) {
            .result > a > .img {
                background-size: contain;
                background-repeat: no-repeat;
                height:70px;
                
            }
            .result{
                height:70px;
                color:rgb(12, 8, 76);
            }
              h5 {
                margin: 0;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="searchTerm">
            <h5 id="searchTerm" runat="server" class="searchTerm"></h5>
        </div>
        <div class="ads"></div>
        <div id="results" class="results" runat="server">
        </div>
        <div class="ads">
        </div>
    </div>
</asp:Content>
