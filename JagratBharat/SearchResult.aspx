<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="SearchResult.aspx.cs" Inherits="JagratBharat.SearchResult" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .container {
            max-width: 800px;
            margin: 80px auto 10px auto;
            padding: 0px 20px 0px 20px;
        }

        .searchTerm {
           
            
        }

        .results {
            padding: 10px;
            display: grid;
            grid-template-columns: auto auto;
            grid-column-gap: 10px;
            grid-row-gap: 20px;
            cursor: pointer;
        }

        h3 {
            margin: 0;
        }



        @media(max-width:550px) {
            .results {
                margin:auto;
                grid-template-columns: auto;
                max-width:240px;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="searchTerm">
            <h3 id="query" runat="server" class="searchTerm" style="color:darkblue"></h3>
        </div>
        <div class="ads"></div>
        <div id="results" class="results" runat="server">
        </div>
        <div class="ads">
        </div>
    </div>
</asp:Content>
