<%@ Page Title="Jagrat Bharat News-Home" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="JagratBharat.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <meta property="og:url" content="https://www.jagratbharatnews.in/" />
    <meta property="og:type" content="website" />
    <meta property="og:title" content="The Jagrat Bharat News" />
    <meta property="og:description" content="Satya ra sandhana" />
    <meta property="og:image" content="https://www.jagratbharatnews.in/Defaults/1.png" />
    <style>
        .advertisement {
        }
        /*Before Ad*/
        .main-container {
            max-width: 1200px;
            height: auto;
            margin: 70px auto 30px auto;
            display: grid;
            grid-gap: 1%;
            grid-template-columns: 20% 58% 20%;
            grid-template-rows: auto;
        }
        /* Left Side bar*/
        .leftSidebar {
            position: relative;
            background-color: rgb(255, 255, 255);
        }

            .leftSidebar > ul {
                list-style-type: none;
                padding: 0px;
                margin: 0px auto 0px auto;
                height: 300px;
                overflow-y: scroll;
            }

            .leftSidebar > .flag_image {
                
                width: 100%;
            }

            .leftSidebar > p.flag_text {
                padding: 10px 0px;
                background-color: #e23e00;
                color: #fff;
                margin: 0;
                width: 100%;
                text-align: center
            }

            .leftSidebar > ul > li {
                width: 80%;
                padding: 10px;
                text-align: center;
                border: 1px solid rgba(0,0,0,.1);
                background-color: black;
                border-radius: 5px;
                margin: 5px auto 0px auto;
            }

                .leftSidebar > ul > li > a {
                    text-decoration: none;
                    color: #fff;
                }
        /*Main Content*/
        .mainContent {
            padding: 10px;
            background-color: rgba(255, 255, 255, 1);
        }

            .mainContent > h3 {
                text-align: center;
                padding: 10px 0px;
                margin: 0;
                background-color: #212121;
                color: white;
            }

        .catSpan {
            position: relative;
            padding: 5px;
            background-color: red;
            float: left;
            display: block;
            color: white;
            font-size: 10px;
            top: -5px;
            left: -5px;
            border-bottom-right-radius: 8px;
            box-shadow: 2px 2px 2px rgba(0, 0, 0, 1);
        }

        .cardHeadline {
            position: relative;
            text-shadow: 0px 0px 5px rgba(0, 0, 0, 1);
            text-align: left;
        }

        .cards {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            grid-gap: 5px;            
            
        }

        .card_container {
            color: #fff;
            text-decoration: none;
        }

        .card {
            padding: 5px;
            transition: .5s;
            height: 110px;
        }

            .card:hover {
                transform: scale(1.2);
                z-index: 5;
                position: relative;
            }


        /* Side Content */
        .rightSidebar {
            display: grid;
            grid-template-rows: max-content max-content auto;
            grid-gap: 10px;
            padding: 10px;
            background-color: rgb(255, 255, 255);
        }

        .video {
            border: 1px solid rgba(0, 0, 0, .1);
            border-radius: 3px;
        }

        .scrollerContainer {
            position: relative;
            overflow-x: hidden;
            overflow-y: hidden;
            height: 30px;
        }

        .scroll {
            height: 30px;
            background-color: #fff;
           
            overflow-x: hidden;
            overflow-y: hidden;
        }

            .scroll > p {
                margin: 0px;
                padding: 5px 0px;
                white-space: nowrap;
                transform: translateX(180px);
                animation: scrolFromRight 60s linear infinite;
            }

                .scroll > p > a {
                    text-decoration: none;
                    color: red;
                }

                .scroll > p:hover {
                    animation-play-state: paused;
                }

        @keyframes scrolFromRight {
            100% {
                transform: translateX(-100%)
            }
        }

        .advertisement {
            text-align: center;
        }

            .advertisement > p {
                padding: 0;
                margin: 0;
                font-weight: bold;
            }

        .ad {
            height: 10em;
            border: 1px solid rgba(0, 0, 0, .1);
        }

        .other > div > p {
            margin: 0;
        }

        .callender {
            height: 80px;
            display: grid;
            grid-template-columns: 25% 75%;
            grid-template-rows: 50% 50%;
            border: 1px solid rgba(0, 0, 0, .1);
            cursor: pointer;
        }

        .date {
            margin: auto 0px auto auto;
            font-size: 50px;
            font-weight: bold;
            grid-row: span 2;
            color: red;
        }

        .event {
            font-weight: bold;
            margin: auto auto 0px 0px;
        }


        .rashifal > ul {
            list-style: none;
            padding: 0;
            display: none;
        }

        .rashifal > p {
            text-align: center;
            padding-top: 10px;
        }

        .rashifal > ul > li {
            height: 40px;
            vertical-align: middle;
            margin-bottom: 4px;
            border: 1px solid rgba(0, 0, 0, .1);
            cursor: pointer;
        }

            .rashifal > ul > li > p {
                margin: 10px auto auto 12px;
                vertical-align: middle;
            }

        .zodiac {
            position: relative;
        }

            .zodiac .tooltipText {
                visibility: hidden;
                width: 100%;
                background-color: black;
                color: #fff;
                text-align: left;
                border-radius: 6px;
                padding: 5px;
                /* Position the tooltip */
                position: absolute;
                z-index: 1;
            }

            .zodiac:hover .tooltipText {
                visibility: visible;
            }

        .tooltipText:active .tooltipText {
            visibility: hidden;
        }

        .watch {
            margin-top: 10px;
            text-align: center;
        }

        @media (max-width:1000px) {
            .main-container {
                grid-template-columns: 25% 48% 25%;
            }

            .cards {
                display: grid;
                grid-template-columns: repeat(2, 1fr);
                grid-gap: 5px;
            }
        }

        @media (max-width:750px) {
            .main-container {
                margin: 70px auto 30px auto;
                display: grid;
                grid-template-columns: 99%;
            }



            .leftSidebar {
                text-align: center;
            }

                .leftSidebar > ul {
                    display: none;
                }

                .leftSidebar > .flag_image {
                    width: 30vw;
                }

                .leftSidebar > p.flag_text {
                    top: unset;
                    bottom: 0px;
                    margin: 0 !important;
                }

                .leftSidebar > .catHead {
                    display: none;
                }

            .cards {
                display: grid;
                grid-template-columns: repeat(1, 1fr);
                grid-gap: 5px;
            }

            .card {
                height: 200px;
                background-size: cover !important;
                z-index: 5;
            }

                .card:hover {
                    transform: none;
                }

            .catSpan {
                font-size: 14px;
            }

            .watch {
                margin-bottom: 50px;
            }

            .videoFrame > iframe {
                height: 300px;
            }
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

                        <p class="main-content" runat="server" id="para">Lorem ipsum dolor sit amet consectetur adipisicing elit. Eos illum
                            dolorem nesciunt! Voluptas quis fugiat natus at. Totam, ut. Dolorem aut non excepturi et
                            dolore? Ipsum consequuntur deleniti nihil non?Lorem ipsum dolor sit amet consectetur
                            adipisicing elit. Temporibus, esse. Tenetur repellendus et dolorum facilis qui, optio eaque
                            aut repudiandae voluptatem dolorem accusantium, ducimus at iste minima similique, enim
                            velit! Lorem ipsum, dolor sit amet consectetur adipisicing elit. Eum hic, neque impedit
                            doloremque aliquid provident amet magni, tenetur quod harum veniam vel soluta velit iste
                            ipsa aliquam reiciendis ratione beatae!
                        </p>
                        <div class="button-container">
                            <button class="blue-button absolute-right" runat="server" id="btntop">Read More</button>
                        </div>
                    </div>
                </article>

            </div>
        </section>
        <section class="sub-news-section">
            <div class="lable">
                Latest News
            </div>
            <div class="subnews-container">
                <article class="subnews">
                    <div class="subnews-image">
                        <img src="https://source.unsplash.com/user/erondu" alt="">
                        <div class="info">
                            <p>International</p>
                            <p>09<sup>th</sup>Semtember 2019</p>
                        </div>
                    </div>
                    <div class="subnews-info">
                        <h1>Leorem Ipsum Headline</h1>
                        <button class="blue-button">Read More</button>
                    </div>
                </article>
                <article class="subnews">
                    <div class="subnews-image">
                        <img src="https://source.unsplash.com/user/erondu" alt="">
                        <div class="info">
                            <p>International</p>
                            <p>09<sup>th</sup>Semtember 2019</p>
                        </div>

                    </div>
                    <div class="subnews-info">
                        <h1>Leorem Ipsum Headline</h1>
                        <button class="blue-button">Read More</button>
                    </div>
                </article>
                <article class="subnews">
                    <div class="subnews-image">
                        <img src="https://source.unsplash.com/user/erondu" alt="">
                        <div class="info">
                            <p>International</p>
                            <p>09<sup>th</sup>Semtember 2019</p>
                        </div>

                    </div>
                    <div class="subnews-info">
                        <h1>Leorem Ipsum Headline</h1>
                        <button class="blue-button">Read More</button>
                    </div>
                </article>
                <article class="subnews">
                    <div class="subnews-image">
                        <img src="https://source.unsplash.com/user/erondu" alt="">
                        <div class="info">
                            <p>International</p>
                            <p>09<sup>th</sup>Semtember 2019</p>
                        </div>

                    </div>
                    <div class="subnews-info">
                        <h1>Leorem Ipsum Headline</h1>
                        <button class="blue-button">Read More</button>
                    </div>
                </article>
                <article class="subnews">
                    <div class="subnews-image">
                        <img src="https://source.unsplash.com/user/erondu" alt="">
                        <div class="info">
                            <p>International</p>
                            <p>09<sup>th</sup>Semtember 2019</p>
                        </div>

                    </div>
                    <div class="subnews-info">
                        <h1>Leorem Ipsum Headline</h1>
                        <button class="blue-button">Read More</button>
                    </div>
                </article>
                <article class="subnews">
                    <div class="subnews-image">
                        <img src="https://source.unsplash.com/user/erondu" alt="">
                        <div class="info">
                            <p>International</p>
                            <p>09<sup>th</sup>Semtember 2019</p>
                        </div>

                    </div>
                    <div class="subnews-info">
                        <h1>Leorem Ipsum Headline</h1>
                        <button class="blue-button">Read More</button>
                    </div>
                </article>
                <article class="subnews">
                    <div class="subnews-image">
                        <img src="https://source.unsplash.com/user/erondu" alt="">
                        <div class="info">
                            <p>International</p>
                            <p>09<sup>th</sup>Semtember 2019</p>
                        </div>

                    </div>
                    <div class="subnews-info">
                        <h1>Leorem Ipsum Headline</h1>
                        <button class="blue-button">Read More</button>
                    </div>
                </article>
                <article class="subnews">
                    <div class="subnews-image">
                        <img src="https://source.unsplash.com/user/erondu" alt="">
                        <div class="info">
                            <p>International</p>
                            <p>09<sup>th</sup>Semtember 2019</p>
                        </div>

                    </div>
                    <div class="subnews-info">
                        <h1>Leorem Ipsum Headline</h1>
                        <button class="blue-button">Read More</button>
                    </div>
                </article>
                <article class="subnews">
                    <div class="subnews-image">
                        <img src="https://source.unsplash.com/user/erondu" alt="">
                        <div class="info">
                            <p>International</p>
                            <p>09<sup>th</sup>Semtember 2019</p>
                        </div>

                    </div>
                    <div class="subnews-info">
                        <h1>Leorem Ipsum Headline</h1>
                        <button class="blue-button">Read More</button>
                    </div>
                </article>
            </div>
        </section>

        <section class="more-links">
            <div class="lable">More links</div>
            <div class="more-links-container">
                <div class="morelinks">
                    <a href="#">More liks to new afasdfdsaf news..</a>
                    <a href="#">More liks to new asdfsadfdsa news..</a>
                    <a href="#">More liks to newasdfasf asdfsaf asfsadfwrewrdfsgdsaf news..</a>
                    <a href="#">More liks to new asdf cvzxcv agag news..</a>
                    <a href="#">More liks to new asdfsad dfsagdsf werew fgsdf news..</a>
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
                    <img src="img/flag.gif" alt="">
                </div>
                <div class="extra-items">
                    <div class="share-buttons">
                        <div class="lable share">Share On</div>
                        <div class="share-button"><i class="fa fa-facebook"></i></div>
                        <div class="share-button"><i class="fa fa-twitter"></i></div>
                        <div class="share-button"><i class="fa fa-whatsapp"></i></div>
                    </div>
                    <div class="date">
                        <iframe
                            src="http://free.timeanddate.com/clock/i6xksqdw/n1690/fn11/fs20/fcff4271/tct/pct/tt0/tw0/tm1/tb1"
                            frameborder="0" width="209" height="26" allowTransparency="true"></iframe>


                    </div>

                    <div class="rashifal">
                        Rashifal
                    </div>
                </div>
                <div class="facebook-page">
                    <iframe
                        src="https://www.facebook.com/plugins/page.php?href=https%3A%2F%2Fwww.facebook.com%2FJagratBharatNews.in%2F&tabs=timeline&width=340&height=500&small_header=false&adapt_container_width=true&hide_cover=false&show_facepile=true&appId"
                        width="340" height="380" style="border:none;overflow:hidden" scrolling="no" frameborder="0"
                        allowTransparency="true" allow="encrypted-media"></iframe>
                </div>
            </div>
        </section>
    </main>
</asp:Content>
