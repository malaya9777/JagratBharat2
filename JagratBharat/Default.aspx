<%@ Page Title="Jagrat Bharat News-Home" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="JagratBharat.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <meta property="og:url" content="https://www.jagratbharatnews.in/" />
    <meta property="og:type" content="website" />
    <meta property="og:title" content="The Jagrat Bharat News" />
    <meta property="og:description" content="Satya ra sandhana" />
    <meta property="og:image" content="https://www.jagratbharatnews.in/Defaults/1.png" />
    <style>
        .lable {
            border: solid 1px #ff6363;
            padding: 10px;
            background: #fff;
            color: #ff6363;
        }

        .scroller-container {
            position: relative;
            max-width: 1000px;
            min-height: 40px;
            background: #dfdfdf;
            display: -ms-grid;
            display: grid;
            -ms-flex-line-pack: center;
            align-content: center;
            margin: 10px auto;
            overflow: hidden;
        }

            .scroller-container marquee a {
                text-decoration: none;
                color: #ff6363;
            }

            .scroller-container marquee:hover {
                -webkit-animation: pause;
                animation: pause;
            }

        .top-news {
            max-width: 1000px;
            margin: 20px auto;
        }

            .top-news article {
                display: -ms-grid;
                display: grid;
                -ms-grid-columns: 50% auto;
                grid-template-columns: 50% auto;
                grid-gap: 10px;
            }

        @media (max-width: 700px) {
            .top-news article {
                -ms-grid-columns: auto;
                grid-template-columns: auto;
            }
        }

        .top-news article .top-news-image {
            overflow: hidden;
        }

            .top-news article .top-news-image img {
                width: 100%;
            }

        .top-news article .info {
            position: relative;
        }

            .top-news article .info h1 {
                font-size: 2em;
                margin: 0;
            }

            .top-news article .info p {
                font-size: .8em;
                opacity: .7;
                padding: 1px;
                margin: 5px;
            }

                .top-news article .info p.main-content {
                    font-size: 1em;
                    max-height: 300px;
                    overflow: hidden;
                    opacity: 1;
                    text-align: justify;
                }

            .top-news article .info .button-container {
                position: absolute;
                height: 50px;
                display: -ms-grid;
                display: grid;
                -ms-flex-line-pack: center;
                align-content: center;
                text-align: right;
                bottom: 0;
                width: 100%;
                background: -webkit-gradient(linear, left top, right top, from(transparent), to(#fff));
                background: linear-gradient(to right, transparent, #fff);
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

        .more-links {
            margin: 0 auto;
            max-width: 1000px;
        }

            .more-links .lable {
                width: -webkit-fit-content;
                width: -moz-fit-content;
                width: fit-content;
            }

        .more-links-container {
            display: -ms-grid;
            display: grid;
            -ms-grid-columns: auto auto;
            grid-template-columns: auto auto;
            grid-gap: 20px;
        }

        @media (max-width: 700px) {
            .more-links-container {
                -ms-grid-columns: auto;
                grid-template-columns: auto;
            }
        }

        .morelinks {
            padding: 30px;
            max-height: 300px;
            overflow-y: scroll;
        }

            .morelinks a {
                display: block;
                margin-bottom: 1em;
            }

        .extra {
            max-width: 1000px;
            margin: 0 auto;
        }

            .extra .lable {
                width: 120px;
            }

            .extra .extra-items {
                display: -ms-grid;
                display: grid;
                -ms-grid-rows: auto auto auto;
                grid-template-rows: auto auto auto;
                grid-gap: 5px;
            }

                .extra .extra-items .share-buttons {
                    display: -ms-grid;
                    display: grid;
                    -ms-grid-columns: auto auto auto auto;
                    grid-template-columns: auto auto auto auto;
                    text-align: center;
                    -ms-flex-line-pack: center;
                    align-content: center;
                    -webkit-box-align: center;
                    -ms-flex-align: center;
                    align-items: center;
                }

                .extra .extra-items .share {
                    width: 80px;
                    height: -webkit-fit-content;
                    height: -moz-fit-content;
                    height: fit-content;
                }

                .extra .extra-items .share-button {
                    height: 30px;
                    width: 30px;
                    background: #181818;
                    border-radius: 50%;
                    color: #fff;
                    display: -ms-grid;
                    display: grid;
                    text-align: center;
                    -ms-flex-line-pack: center;
                    align-content: center;
                    cursor: pointer;
                    text-decoration: none;
                }


                .extra .extra-items .date {
                    display: -ms-grid;
                    display: grid;
                    text-align: center;
                    -ms-flex-line-pack: center;
                    align-content: center;
                    color: #ff6363;
                }

                    .extra .extra-items .date iframe {
                        margin: auto;
                    }

                .extra .extra-items .rashifal {
                    min-height: 80px;
                    display: -ms-grid;
                    display: grid;
                    text-align: center;
                    -ms-flex-line-pack: center;
                    align-content: center;
                    background: #ff6363;
                    color: #fff;
                    font-weight: bold;
                }

            .extra .extra-container {
                display: -ms-grid;
                display: grid;
                -ms-grid-columns: auto auto auto;
                grid-template-columns: auto auto auto;
            }

        @media (max-width: 700px) {
            .extra .extra-container {
                -ms-grid-columns: auto;
                grid-template-columns: auto;
            }
        }

        .extra .facebook-page {
            margin: auto;
        }

        .blue-button {
            padding: 10px;
            width: 100px;
            border: none;
            background: #000ba5;
            color: #fff;
        }

        .absolute-right {
            position: absolute;
            right: 10px;
            z-index: 1;
        }

        .absolute-left {
            position: absolute;
            left: 0;
            z-index: 1;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main>
        <div class="scroller-container">
            <div class="lable absolute-left">
                Headlines
            </div>
            <marquee direction="left" scrollamount="3" id="marquee" runat="server" onmouseover="this.stop();" onmouseout="this.start();">
               <%-- Autogenerated Item --%>
            </marquee>

        </div>
        <section>
            <div class="top-news">
                <article>
                    <div class="top-news-image">
                        <img src="https://source.unsplash.com/user/erondu" alt="" runat="server" id="topImgae">
                    </div>
                    <div class="info">
                        <h1 runat="server" id="topHeadline">Lorem Ipsum Headlines</h1>
                        <p runat="server" id="topCategory">International</p>
                        <p runat="server" id="topDate">09<sup>th</sup>Semtember 2019</p>

                        <p class="main-content" runat="server" id="para">
                        </p>
                        <div class="button-container">
                            <button class="blue-button absolute-right" runat="server" id="btntop">Read More</button>
                        </div>
                    </div>
                </article>

            </div>
        </section>
        <section>
            <div class="top-news">
                <article>  
                    <div class="top-news-video" runat="server" id="top_news_video">

                    </div>
                    <div class="info">
                        <h1 runat="server" id="videoHeading" >Lorem Ipsum Headlines</h1>
                        <p runat="server" id="videoCategory" >International</p>
                        <p runat="server" id="videoDate" >09<sup>th</sup>Semtember 2019</p>
                        <p class="main-content" runat="server" id="videoContent">
                        </p>
                        <div class="button-container">
                            <button class="blue-button absolute-right" runat="server" id="btntop2">Read More</button>
                        </div>
                    </div>
                     
                </article>
            </div>
        </section>
        <section class="sub-news-section">
            <div class="lable">
                Latest News
            </div>
            <div class="subnews-container" runat="server" id="subnews_container">
            </div>
        </section>

        <section class="more-links">
            <div class="lable">More links</div>
            <div class="more-links-container">
                <div class="morelinks" id="moreLinks" runat="server">
                </div>
                <div class="facebook-comment">
                    <div id="fb-root"></div>
                    <script async defer crossorigin="anonymous"
                        src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v4.0"></script>
                    <div class="fb-comments" data-href="https://www.jagratbharatnews.in/" data-width="100%" data-numposts="10"></div>
                </div>
            </div>

        </section>
        <section class="extra">
            <div class="lable">
                Please Share
            </div>
            <div class="extra-container">
                <div class="nationnal-flag">
                    <img src="Defaults/flag.gif" alt="">
                </div>
                <div class="extra-items">
                    <div class="share-buttons">
                        <div class="lable share">Share On</div>
                        <a class="share-button" href="https://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Fjagratbharatnews.in%2F&amp;src=sdkpreparse"><i class="fa fa-facebook"></i></a>
                        <a class="share-button" href="https://twitter.com/intent/tweet?text=Jagrat+Bharat+News https://www.jagratbharatnews.in"><i class="fa fa-twitter"></i></a>
                        <a class="share-button" href="whatsapp://send?text=Jagrat+Bharat+News https://www.jagratbharatnews.in"><i class="fa fa-whatsapp"></i></a>
                    </div>
                    <div class="date">
                        <iframe
                            src="https://free.timeanddate.com/clock/i6xksqdw/n1690/fn11/fs20/fcff4271/tct/pct/tt0/tw0/tm1/tb1"
                            frameborder="0" width="209" height="26" allowtransparency="true"></iframe>
                    </div>
                    <div class="share-buttons">
                        <div class="lable">Other Platforms</div>
                        <div><i style="font-size:30px" class="fa fa-facebook-square" onclick="window.location='https://www.facebook.com/JagratBharatNews.in/'"></i></div>
                        <div><i style="font-size:30px"  class="fa fa-youtube" onclick="window.location='https://www.youtube.com/channel/UCko-vdab8OCR6iGSnP8UOKg'"></i></div>
                    </div>
                </div>
                <div class="facebook-page">
                    <iframe
                        src="https://www.facebook.com/plugins/page.php?href=https%3A%2F%2Fwww.facebook.com%2FJagratBharatNews.in%2F&tabs=timeline&width=340&height=500&small_header=false&adapt_container_width=true&hide_cover=false&show_facepile=true&appId"
                        width="340" height="380" style="border: none; overflow: hidden" scrolling="no" frameborder="0"
                        allowtransparency="true" allow="encrypted-media"></iframe>
                </div>
            </div>
        </section>
    </main>
</asp:Content>
