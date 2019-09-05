<%@ Page Title="Contact Us | Jagrat Bharat News" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="JagratBharat.ContactUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .container {
            margin: 80px auto;
            max-width: 1200px;
            padding: 10px;
        }

            .container > h2 {
                width: 100%;
                text-align: center;
            }

        .mainContainer {
            width: auto;
            display: grid;
            grid-template-columns: 32% 32% 34%;
            grid-gap: 1%;
            align-content: center;
        }

        .box {
            color: #fff;
            background-color: #0e084f;
            padding: 5px 20px;
            font-size: 50px;
        }

            .box > p {
                font-size: 14px;
            }

                .box > p > i {
                    padding: 0px 10px;
                }

        .byPhone {
            border-radius: 0px 10px 0px 10px;
        }

        .byMail {
            border-radius: 10px;
        }

        .bySocialMedia {
            border-radius: 10px 0px 10px 0px;
        }

            .bySocialMedia > p > a {
                text-decoration: none;
                color: #fff;
            }

        @media (max-width:1010px) {
            .mainContainer {
                grid-template-columns: 99%;
                grid-gap: 10px;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h2>Contact Us</h2>
        <div class="mainContainer">
            <div class="box byPhone">
                <i class="fa fa-phone"></i>
                <p><i class="fa fa-pencil"></i>Susil Kumar Aich(Chief Editor)</p>
                <p><i class="fa fa-mobile"></i>Mobile: +91 9861094319</p>
                <p><i class="fa fa-pencil"></i>Susant Kumar Samal(Editor)</p>
                <p><i class="fa fa-mobile"></i>Mobile: +91 7008911504</p>
            </div>
            <div class="box byMail">
                <i class="fa fa-envelope"></i>
                <p>Nuahata, Banarpal</p>
                <p>Angul, Odisha, India,759128 </p>
                <p>official@jagratbharatnew.com </p>

            </div>
            <div class="box bySocialMedia">
                <i class="fa fa-globe"></i>
                <p><i class="fa fa-facebook"></i><a href="#">facebook.com/jagratbharatnews</a></p>
                <p><i class="fa fa-twitter"></i><a href="#">twitter.com/jagratbharatnews</a></p>
                <p><i class="fa fa-youtube-play"></i><a href="#">youtube.com/jagratbharatnews</a></p>
            </div>
        </div>
    </div>
</asp:Content>
