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
        }

        .PostHeader {
            color: rgba(255,255,255,.8);
            background: rgba(0,0,0,.5);
            position: absolute;
            bottom: 0;
            padding: 10px;
            text-align: left;
        }

        .cat {
        }

        .categoryInner {
            color: rgb(128, 128, 128);
        }

        .infoDetails {
            color: rgb(128, 128, 128);
        }

        h5.relatedNews {
            background-color: darkviolet;
            padding: 5px;
            color: #fff;
        }

        .catSpan {
            position: absolute;
            bottom: 0;
            display: block;
            color: white;
            top: 15px;
        }

        .PostContent {
            margin: 10px auto;
            padding: 10px;
            background: #fff;
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

        .blue-button {
            padding: 10px;
            width: 100px;
            border: none;
            background: #000ba5;
            color: #fff;
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
        .headImage {
                width: 100%;
            }
        .lable {
            border: solid 1px #ff6363;
            padding: 10px;
            background: #fff;
            color: #ff6363;
            width:fit-content;
        }
    </style>
    <meta property="og:site_name" runat="server" id="og_site_name" />
    <meta property="og:url" runat="server" id="og_url" />
    <meta property="og:title" runat="server" id="og_title" />
    <meta property="og:description" runat="server" id="og_description" />
    <meta property="og:image" itemprop="image" runat="server" id="og_image" />
    <meta property="og:image:width" content="800" />
    <meta property="og:image:height" content="400" />
    <meta property="og:type" content="website" runat="server" id="og_type" />
    <meta property="og:updated_time" runat="server" id="og_updated_time" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <main>
            <article>
                <div id="heading" runat="server" class="header">
                    <img src="" alt="" class="headImage" runat="server" id="headImage" />
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
                <p class="lable">Related News</p>
                <section class="sub-news-section">
                    <div class="subnews-container" runat="server" id="subnews_container">
                    </div>
                    <div id="ads" runat="server"></div>
                </section>
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
