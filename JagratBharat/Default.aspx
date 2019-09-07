<%@ Page Title="Jagrat Bharat News-Home" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="JagratBharat.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <meta property="og:url" content="https://www.your-domain.com/your-page.html" />
    <meta property="og:type" content="website" />
    <meta property="og:title" content="The Jagrat Bharat News" />
    <meta property="og:description" content="Satya ra sandhana" />
    <meta property="og:image" content="https://www.your-domain.com/path/image.jpg" />
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
    <div class="main-container">
        <div class="leftSidebar">


            <img src="Defaults/flag.gif" alt="National_Flag" class="flag_image" />
            <p class="flag_text">Jai Hind</p>


        </div>
        <div class="mainContent">
            <h3>Top Stories</h3>
            <div class="scrollerContainer">
                <div class="scroll" id="scroll">
                    <p id="para" runat="server">
                        <%-- Auto Generated Scroll --%>
                    </p>
                </div>
            </div>

            <div class="cards" id="cards" runat="server">
                <%-- Auto Generated Cards --%>
            </div>
            <div class="mainNews">
            </div>
            <div style="height: 200px; margin: 20px 0px 10px 0px" class="advertisement">Advertisement</div>
            <div style="text-align: center">
                <iframe src="https://www.facebook.com/plugins/page.php?href=https%3A%2F%2Fwww.facebook.com%2FJagratBharatNews.in%2F&tabs=timeline&width=340&height=500&small_header=false&adapt_container_width=true&hide_cover=false&show_facepile=true&appId" width="350" height="500" style="border: none; overflow: hidden; text-align: center" scrolling="no" frameborder="0" allowtransparency="true" allow="encrypted-media"></iframe>
            </div>
            <div id="fb-root"></div>
            <script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v4.0"></script>
            <div class="fb-comments" data-href="https://www.facebook.com/JagratBharatNews.in/?modal=admin_todo_tour" data-width="100%" data-numposts="5"></div>
        </div>
        <div class="rightSidebar">
            <div class="video">
                <div runat="server" class="videoFrame" id="videoFrame">
                    <%-- Auto Generated Video --%>
                </div>
            </div>
            <div class="advertisement">
                <p>Advertisement</p>
                <div class="ad">
                    <script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
                    <ins class="adsbygoogle"
                        style="display: block"
                        data-ad-format="fluid"
                        data-ad-layout-key="-fb+5w+4e-db+86"
                        data-ad-client="ca-pub-1465461908442997"
                        data-ad-slot="3141786085"></ins>
                    <script>
                        (adsbygoogle = window.adsbygoogle || []).push({});
                    </script>
                </div>
            </div>
            <div class="other">
                <div class="callender">
                    <div id="txtDate" runat="server" class="date">
                    </div>
                    <div id="txtEvent" runat="server" class="event">
                    </div>
                    <div id="txtMonthYear" runat="server" class="monthYear">
                    </div>
                </div>
                <div class="rashifal">
                    <script>
                        function expand() {
                            let rashi = document.getElementById('ContentPlaceHolder1_rashifal');
                            if (rashi.style.display == "block") {
                                rashi.style.display = "none";

                            } else {
                                rashi.style.display = "block";
                            }
                        }
                    </script>
                    <p style="cursor: pointer; padding: 5px; border-radius: 3px; color: white; background-color: darkviolet; margin-top: 5px" onclick="expand()">Rashifal</p>
                    <ul id="rashifal" runat="server">
                    </ul>
                </div>
                <div class="watch">
                    <iframe
                        src="https://free.timeanddate.com/clock/i6sq6m47/n1690/szw110/szh110/hocbbb/hbw6/cf100/hgr0/fas16/fdi64/mqc000/mqs4/mql20/mqw2/mqd94/mhc000/mhs3/mhl20/mhw2/mhd94/mmc000/mml10/mmw1/mmd94/hmr7/hsc000/hss1/hsl90"
                        frameborder="0" width="110" height="110"></iframe>
                </div>

            </div>
        </div>
    </div>
    <script>
        let textWidht = document.getElementById("scroll");
        let textp = document.getElementById("ContentPlaceHolder1_para");
        textWidht.style.width = textp.scrollWidth + "px";
        textp.style.animationDuration = (textp.scrollWidth / 100) * 4 + "s";

    </script>
</asp:Content>
