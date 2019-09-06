<%@ Page Title="User" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="ManageUser.aspx.cs" Inherits="Admin.ManageUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .container {
            max-width: 85%;
            margin: 30px 50px auto auto;
            grid-template-columns: repeat(2,1fr);
            display: grid;
            grid-gap: 10px;
            grid-template-areas: "userDetails userList";
        }

        .CreateUser {
            grid-area: userDetails;
            border: 1px solid rgba(0,0,0,.2);
            border-radius: 3px;
            padding: 20px;
            text-align: center;
        }

        .UserList {
            grid-area: userList;
            border: 1px solid rgba(0,0,0,.2);
            border-radius: 3px;
            padding: 20px;
        }

        .formControl {
            display: block;
        }
       
        

        @media (max-width:1400px) {
            .container {
                width: 80%;
                grid-template-columns: repeat(2,1fr);
                display: grid;
                grid-gap: 10px;
                grid-template-areas: "userDetails userList";
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" runat="server" id="mainContainer">
        <div class="CreateUser">
            <h4>Create User</h4>
            <div class="formControl">
                <asp:TextBox ID="txtUserName" runat="server" CssClass="textBox" placeholder="UserName" autocomplete="off"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfv1" runat="server" ValidationGroup="form" ControlToValidate="txtUserName" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
            <div class="formControl">
                <asp:TextBox ID="txtPassword" runat="server" CssClass="textBox" TextMode="Password" placeholder="Password" autocomplete="off"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="form" runat="server" ControlToValidate="txtPassword" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
            <div class="formControl">
                <asp:TextBox ID="txtMobile" runat="server" CssClass="textBox" placeholder="10 Digit Mobile" MaxLength="10" autocomplete="off"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="form" runat="server" ControlToValidate="txtMobile" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
            <div class="formControl">
                <asp:TextBox ID="txtEmail" runat="server" CssClass="textBox" placeholder="Email" autocomplete="off"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="form" runat="server" ControlToValidate="txtEmail" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
            <div class="formControl">
                <asp:DropDownList ID="ddlRole" runat="server" CssClass="textBox"></asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ValidationGroup="form" runat="server" ControlToValidate="ddlRole" InitialValue="--Select Role--" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
            <div class="formControl">
                <asp:CheckBox ID="chkActive" CssClass="checkbox" runat="server" Text="Active" Checked="true" />
            </div>
            <div class="formControl">
                <asp:Button ID="btnSubmit" runat="server" Text="Create User" CssClass="btnSubmit" OnClick="btnSubmit_Click" ValidationGroup="form" />
            </div>
        </div>
        <div class="UserList">
            <asp:GridView ID="grdUserList" runat="server" Width="100%" Font-Size="Small" OnRowCommand="grdUserList_RowCommand" OnRowDataBound="grdUserList_RowDataBound" BorderWidth="0" RowStyle-BorderColor="WhiteSmoke" GridLines="Horizontal" AutoGenerateColumns="false" RowStyle-Height="40px">
                <Columns>
                    
                    <asp:BoundField DataField="userName" HeaderText="User Name" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" />
                    <asp:BoundField DataField="createdBy" HeaderText="Created By" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" />
                    <asp:BoundField DataField="createdOn" HeaderText="Created On" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" />
                   
                    <asp:TemplateField HeaderText="Deactivate" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:TextBox ID="hdn" runat="server" Text='<%# Eval("Active") %>' style="display:none" />
                            <asp:Button ID="btnDeactivate" runat="server" Text="Deactivate" CssClass="btn green" CommandName="Deactivate" CommandArgument='<%#Eval("ID")%>' />
                            <asp:Button ID="btnActivate" runat="server" Text="Activate" CssClass="btn orange" CommandName="Activate" CommandArgument='<%#Eval("ID") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
    <div id="notAllowed" runat="server" class="notAllowed">
        <p>You are not authorized to view this page!<br>  Please contack administrator.</p>

    </div>
</asp:Content>
