<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Admin.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .container {
            max-width: 85%;
            margin: 30px 50px auto auto;
            grid-template-columns: repeat(2,1fr);
            display: grid;
            grid-gap: 10px;
            grid-template-areas: "userDetails userList" "latestNews scroller" "categories horoscope";
            background-color: darkgray;
            padding: 10px;
        }
        .smallPanel {
            border: 1px solid rgba(0,0,0,.2);
            border-radius: 3px;
            padding: 0px 20px 20px 20px;
            height: 200px;
            overflow: hidden;
            overflow-y: scroll;
            background-color: #fff;
        }

        .UserDetails {
            grid-area: userDetails;
        }

        .UserList {
            grid-area: userList;
        }

        .LatestNews {
            grid-area: latestNews;
        }

        .Scroller {
            grid-area: scroller;
        }

        .Horoscope {
            grid-area: horoscope;
        }

        .Categories {
            grid-area: categories;
            border-radius: 3px;
            border: 1px solid rgba(0,0,0,.1);
            max-height: 300px;
        }

        .row {
            background-color: rgb(128, 128, 128);
            width: 100%;
            text-align: center;
        }

        .textBox, .checkbox, .btnSubmit {
            display: block;
            height: 30px;
            width: 250px;
            margin: 10px auto auto auto;
        }

        .textBox {
            text-indent: 8px;
            border: 1px solid rgba(0,0,0,.2);
            border-radius: 3px;
        }

        .btnSubmit {
            border: none;
            background-color: #00b715;
            color: #fff;
            border-radius: 3px;
        }

        .unchecked {
            height: 20px;
            width: 20px;
            border: 2px solid black;
        }

        .checked {
            height: 20px;
            width: 20px;
            border: 2px solid black;
            background-color: black;
        }

        .row {
            display: inline-flex;
            height: 50px;
        }

        .boxHeader {
            padding: 8px;
            font-size: 14px;
            background-color: red;
            color: #fff;
            margin-bottom: 10px;
        }

        .box {
            height: 40px;
            margin-bottom: 5px;
            border-radius: 20px;
            color: #fff;
            padding-top: 15px;
            text-align: center;
        }

        .activated {
            background-color: limegreen;
        }

        .deactivated {
            background-color: orange;
        }
        .selected{
            float:right;
        }

        .total {
            background-color: lightpink;
        }

        .center {
            margin: auto !important;
        }

        @media (max-width:1400px) {
            .container {
                width: 80%;
                grid-template-columns: repeat(2,1fr);
                display: grid;
                grid-gap: 10px;
                grid-template-areas: "userDetails userList" "latestNews scroller" "categories horoscope";
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="smallPanel UserDetails">
            <div class="boxHeader">User's Details</div>
            <div id="boxActivated" runat="server" class="box activated"></div>
            <div id="boxDeactivated" runat="server" class="box deactivated"></div>
            <div id="boxTotal" runat="server" class="box total"></div>
        </div>
        <div class="smallPanel UserList">
            <div class="boxHeader">User's List</div>
            <asp:GridView runat="server" ID="grdUserList" AutoGenerateColumns="false" HeaderStyle-HorizontalAlign="Left" RowStyle-Height="30" BorderStyle="None" GridLines="Horizontal" Width="100%">
                <Columns>
                    <asp:TemplateField HeaderText="SL No">
                        <ItemTemplate>
                            <%# Container.DataItemIndex+1 %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="usreName" HeaderText="Name" />
                    <asp:BoundField DataField="userRole" HeaderText="Role" />
                    <asp:BoundField DataField="active" HeaderText="Activated" />
                </Columns>
            </asp:GridView>
        </div>
        <div class="smallPanel LatestNews">
            <div class="boxHeader">Lastes News</div>
            <asp:GridView runat="server" ID="grdNews" AutoGenerateColumns="false" AllowPaging="true" PageSize="10" OnPageIndexChanging="grdNews_PageIndexChanging" HeaderStyle-HorizontalAlign="Left" RowStyle-Height="30" BorderStyle="None" GridLines="Horizontal" Width="100%">
                <Columns>
                    <asp:TemplateField HeaderText="SL No">
                        <ItemTemplate>
                            <%# Container.DataItemIndex +1 %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Headline">
                        <ItemTemplate>
                            <a href='<%# Eval("link") %>' target="_blank"><%# Eval("headLine") %></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="posted" HeaderText="Posted" />
                </Columns>
            </asp:GridView>
        </div>
        <div class="smallPanel Scroller">
            <div class="boxHeader">Select Scroller<span class="selected" runat="server" id="selected"></span></div>
            <asp:GridView runat="server" ID="grdScroller" AutoGenerateColumns="false" OnRowCommand="grdScroller_RowCommand" AllowPaging="true" PageSize="10" OnPageIndexChanging="grdScroller_PageIndexChanging" HeaderStyle-HorizontalAlign="Left" RowStyle-Height="30" BorderStyle="None" GridLines="Horizontal" Width="100%">
                <Columns>
                    <asp:TemplateField HeaderText="SL No">
                        <ItemTemplate>
                            <%# Container.DataItemIndex +1 %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="headline" HeaderText="Headline" />
                    <asp:TemplateField HeaderText="Selected">
                        <ItemTemplate>
                            <asp:Button runat="server" ID="btnSelected" BorderColor="Black" CssClass='<%# Eval("css") %>' CommandArgument='<%# Eval("Id") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
        <div class="smallPanel Categories">
            <div class="boxHeader">Categories</div>
            <div class="row">
                <asp:TextBox runat="server" ID="txtCategory" CssClass="textBox center" placeholder="Category"></asp:TextBox>
                <asp:Button runat="server" ID="btnAdd" CssClass="btn green center" Text="Add" OnClick="btnAdd_Click" />
            </div>
            <asp:Panel runat="server" ID="pnl" ScrollBars="Vertical" Height="200px">
                <asp:GridView runat="server" ID="grdCategories" GridLines="Horizontal" HeaderStyle-HorizontalAlign="Left" RowStyle-Height="30" Width="100%" BorderWidth="0" OnRowEditing="grdCategories_RowEditing" OnRowUpdating="grdCategories_RowUpdating" OnRowCancelingEdit="grdCategories_RowCancelingEdit" AutoGenerateEditButton="true" AutoGenerateColumns="false" ShowHeader="true">
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="ID" ReadOnly="true" />
                        <asp:BoundField DataField="Name" HeaderText="Category" ControlStyle-CssClass="textBox" />
                    </Columns>
                </asp:GridView>
            </asp:Panel>
        </div>
        <div class="smallPanel Horoscope">
            <div class="boxHeader">Horoscope</div>
            <asp:GridView runat="server" ID="grdHoroscope" AutoGenerateColumns="false" OnRowCommand="grdScroller_RowCommand" HeaderStyle-HorizontalAlign="Left" RowStyle-Height="30" BorderStyle="None" GridLines="Horizontal" Width="100%">
                <Columns>
                    <asp:TemplateField HeaderText="SL No">
                        <ItemTemplate>
                            <%# Container.DataItemIndex +1 %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="zodiac" HeaderText="Zodiac" />
                    <asp:BoundField DataField="hs" HeaderText="Horoscope" />
                </Columns>
            </asp:GridView>
        </div>
    </div>

</asp:Content>
