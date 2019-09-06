<%@ Page Title="About Us | Jagrat Bharat News" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="JagratBharat.AboutUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        main {
            max-width:1200px;
            margin: 30px auto;
            padding: 0 10px;

        }

        .mainContainer {
            padding: 60px 20px;
            border-radius: 0px 50px 0px 50px;
            background-color: #fff;
            text-align: justify;
        }

            .mainContainer > span {
                float: right;
                text-align: center;
            }

                .mainContainer > span > span {
                    font-weight: bolder;
                }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main>

        <div class="mainContainer">
            <h2>Our Story</h2>
            <p>
                The JAGRAT BHARAT NEWS , started in 1st April 2019 as a Web portal and social media news network agency , became a daily in from same day and from then on has been steadily growing to the e-paper circulation of unlimited copies and a readership of growing about  much more. 
            </p>
            <p>
                The JAGRAT BHARAT NEWS independent editorial stand and its reliable and balanced presentation of the news have over the years, won for it the serious attention and regard of the people who matter in India and abroad.
            </p>
            <p>
                The JAGRAT BHARAT NEWS uses modern facilities for news gathering, page Composition. It is a revolutionary step in the global android mobile phone season . The publishing of e-paper is from our ofiice Banarpal and in near by angul District also. 
            </p>
            <p>
                Our achievements is readers and viewers of The JAGRAT BHARAT NEWS will be increasing in thousands and may be in lakhs.
            </p>
            <span>
                <br />
                <span>The JAGRAT BHARAT NEWS team</span>
            </span>
        </div>
    </main>

</asp:Content>
