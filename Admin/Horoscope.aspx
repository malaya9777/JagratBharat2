<%@ Page Title="Horoscope" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Horoscope.aspx.cs" Inherits="Admin.Horoscope" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .container {
            max-width: 85%;
            margin: 30px 50px auto auto;
            grid-template-columns: 30% 70%;
            display: grid;
            grid-gap: 10px;
        }

        .postHoroscope, .todaysHoroscope {
            border: 1px solid rgba(0,0,0,.1);
            border-radius: 5px;
            padding: 10px;
        }

        @media (max-width:1400px) {
            .container {
                width: 80%;
                grid-template-columns: 30% 70%;
                display: grid;
                grid-gap: 10px;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="postHoroscope">
            <h3>Post Horoscope</h3>
            <div class="date">
                <asp:TextBox ID="txtDate" runat="server" CssClass="textBox" AutoCompleteType="None" ValidationGroup="from"></asp:TextBox>
                <asp:ToolkitScriptManager runat="server"></asp:ToolkitScriptManager>
                <asp:CalendarExtender runat="server" ID="ce1" TargetControlID="txtDate" Format="dd-MMM-yyyy"></asp:CalendarExtender>
                <asp:RequiredFieldValidator ControlToValidate="txtDate" runat="server" ErrorMessage="*" ForeColor="Red" ValidationGroup="from"></asp:RequiredFieldValidator>
            </div>
            <div class="zodiac">
                <asp:DropDownList ID="ddlZodiac" runat="server" CssClass="textBox" ValidationGroup="from"></asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" InitialValue="0" ControlToValidate="ddlZodiac" ID="rfv1" ErrorMessage="*" ForeColor="Red" ValidationGroup="from"></asp:RequiredFieldValidator>
            </div>
            <div class="horoscope">
                <asp:TextBox TextMode="MultiLine" CssClass="textBox" runat="server" ID="txtHoroscope" Height="200" ValidationGroup="from"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="rfv2" ControlToValidate="txtHoroscope" ErrorMessage="*" ForeColor="Red" ValidationGroup="from"></asp:RequiredFieldValidator>
            </div>
            <div class="submit">
                <asp:Button runat="server" Text="Submit" CssClass="btnSubmit" ID="btnSubmit" OnClick="btnSubmit_Click" ValidationGroup="from"/>
                <asp:Button ID="btnDelete" runat="server" Text="Delete older data" CssClass="btn red" OnClick="btnDelete_Click" OnClientClick="return confirm('Are you sure to delete older data?')" Width="100px" />
            </div>
        </div>
        <div class="todaysHoroscope">
            <h3>Today's Horoscope</h3>
            <div class="selectDate">
                <asp:DropDownList ID="ddlDate" runat="server" CssClass="textBox" OnSelectedIndexChanged="ddlDate_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
            </div>
            <br />
            <div class="gridList">
                <asp:GridView ID="grdHoroscope" runat="server" GridLines="Horizontal" Width="100%" OnRowCommand="grdHoroscope_RowCommand" HeaderStyle-Font-Bold="false" HeaderStyle-HorizontalAlign="Left" RowStyle-Height="40" BorderStyle="None" AutoGenerateColumns="false">
                    <Columns>
                        <asp:TemplateField HeaderText="SL No" ItemStyle-Width="15%">
                            <ItemTemplate>
                                <%# Container.DataItemIndex +1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="zodiac" HeaderText="Zodiac" ItemStyle-Width="30%" />
                        <asp:BoundField DataField="Horoscope_English" HeaderText="Horoscope" ItemStyle-Width="30%" />

                        <asp:TemplateField HeaderText="Edit" ItemStyle-Width="20%">
                            <ItemTemplate>
                                <asp:Button ID="btnEdit" runat="server" Text="Edit" CssClass="btn orange" CommandArgument='<%# Eval("ID") %>' CommandName="editHoroscope" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
