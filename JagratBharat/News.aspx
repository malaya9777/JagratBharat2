<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="News.aspx.cs" Inherits="JagratBharat.News" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v4.0"></script>
    <style>
        @import url('https://fonts.googleapis.com/css?family=Montserrat&display=swap');


        main {
            margin: 30px 0;
        }

        .justified {
            margin-top: 15px;
            text-align: justify;
        }

        .header {
            position: relative;
            text-align: center;
            height: 500px;
        }

        .PostHeader {
            color: rgba(255,255,255,.8);
            position: absolute;
            bottom: 20px;
            left: 20px;
            text-align: left;
            padding: 0px 10px 0px 0px;
        }

        .cat {
            margin-top: 15px;
            height: 40px;
            width: 200px;
            margin-left: 10px;
            background-color: red;
        }

        .categoryInner {
            text-align: center;
            padding-top: 5%;
            color: rgb(255,255,255);
        }

        .infoDetails {
            margin-top: 10px;
            margin-left: 10px;
            text-align: left;
            color: rgb(0,0,0);
        }

        h5.relatedNews {
            background-color: darkviolet;
            padding: 5px;
            color: #fff;
        }

        .catSpan {
            position: relative;
            padding: 5px;
            background-color: red;
            float: left;
            display: block;
            color: white;
            top: 15px;
        }

        .PostContent {
            margin: 10px auto;
            padding: 10px;
            background: #fff;
        }

        .cardHeadline {
            text-align: left;
        }

        .cards {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            grid-gap: 5px;
            padding: 10px;
            background-color: rgba(0,0,0,.1);
        }

        .card {
            background-color: rgba(255, 255, 255, 1);
            border: 1px solid rgba(0, 0, 0, .1);
            padding: 5px;
            border-radius: 5px;
        }

            .card > img {
                width: 100%;
            }

            .card > h4 {
                text-align: left;
                text-indent: 10px;
            }

            .card > p {
                padding: 5px;
                text-align: justify;
            }

        .shareButtons {
            display: inline-flex;
            margin-left: 10px;
        }

        .fb-like {
            width: 50%;
        }

        .whatsaap {
            background-color: #24e51c;
            text-decoration: none;
            color: #fff;
            padding: 3px 5px 3px 0px;
            font-size: 11px;
            border-radius: 3px;
            margin-left: 5px;
        }

            .whatsaap > i {
                padding: 0px 5px;
            }

        .twitter {
            background-color: #009ac4;
            text-decoration: none;
            color: #fff;
            padding: 3px 5px 3px 0px;
            font-size: 11px;
            border-radius: 3px;
            margin-left: 5px;
        }

            .twitter > i {
                padding: 0px 5px;
            }

        @media(max-width:700px) {
            .header {
                position: relative;
                text-align: center;
                height: 200px;
            }

            .cards {
                grid-template-columns: repeat(1, 1fr);
            }

            .PostHeader {
                color: rgba(255,255,255,.8);
                position: absolute;
                bottom: 5px;
                left: 5px;
                text-align: left;
            }
        }
    </style>
    <meta property="og:site_name" runat="server" id="og_site_name" />
    <meta property="og:url" runat="server" id="og_url" />
    <meta property="og:title" runat="server" id="og_title" />
    <meta property="og:description" runat="server" id="og_description" />
    <meta property="og:image" itemprop="image" runat="server" id="og_image" />
    <meta property="og:type" content="website" runat="server" id="og_type" />
    <meta property="og:updated_time" runat="server" id="og_updated_time" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <main>
            <article>
                <div id="heading" runat="server" class="header">
                    <h2 id="PostHeader" class="PostHeader" runat="server"></h2>
                </div>
                <div id="ads1" runat="server"></div>
                <div class="cat">
                    <p id="category" class="categoryInner" runat="server"></p>
                </div>
                <div class="info">
                    <p id="info" class="infoDetails" runat="server"></p>
                </div>

                <%-- Share Buttons --%>
                <div class="shareButtons">
                    <div class="fb-share-button" data-href="" data-layout="button_count" data-size="small"><a target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Fdevelopers.facebook.com%2Fdocs%2Fplugins%2F&amp;src=sdkpreparse" class="fb-xfbml-parse-ignore">Share</a></div>
                    <a class="whatsaap" id="whatsaapbutton" runat="server" href="whatsaap://send?text=" data-action="share/whatsapp/share"><i class="fa fa-whatsapp"></i>Share</a>
                    <a class="twitter" id="twitterbutton" runat="server" href="https://twitter.com/intent/tweet?text=" data-size="large"><i class="fa fa-twitter"></i>Tweet</a>
                </div>
                <div id="PostContent" runat="server" class="PostContent">
                </div>
                <%-- Share Buttons --%>

                <div class="shareButtons">
                    <div class="fb-share-button" data-href="" data-layout="button_count" data-size="small"><a target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Fdevelopers.facebook.com%2Fdocs%2Fplugins%2F&amp;src=sdkpreparse" class="fb-xfbml-parse-ignore">Share</a></div>
                    <a class="whatsaap" id="A1" runat="server" href="whatsaap://send?text=" data-action="share/whatsapp/share"><i class="fa fa-whatsapp"></i>Share</a>
                    <a class="twitter" id="A2" runat="server" href="https://twitter.com/intent/tweet?text=" data-size="large"><i class="fa fa-twitter"></i>Tweet</a>
                </div>
                <h5 class="relatedNews">Related News</h5>

                <div id="RelatedNews" class="cards" runat="server">
                </div>
                <div id="ads" runat="server"></div>

            </article>
        </main>
    </div>
    <script>
        var fbs = document.getElementsByClassName("fb-like");
        for (var i = 0; i < fbs.length; i++) {
            fbs[i].setAttribute("data-href", window.location.href);
        }


    </script>

</asp:Content>
