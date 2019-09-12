<%@ Page Title="Profile" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="Admin.Profile" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .container {
            max-width: 85%;
            margin: 30px 50px auto auto;
            display: grid;
            grid-template-columns: repeat(2,1fr);
            grid-gap: 10px;
            grid-template-areas: "profileInfo resetRequest";
        }

        .profileInformation {
            padding: 10px;
            border: 1px solid rgba(0,0,0,.2);
            border-radius: 3px;
            grid-area: profileInfo;  
            
        }
        .info{
            margin:30px auto auto auto;           
            width:70%;
            display: grid;
            grid-template-columns: repeat(2,1fr);
            grid-template-columns:30% 70%;
            grid-gap: 5px;
        }

        .smallDiv {
            padding-top:10px;
            height: 30px;
            border-bottom:1px solid rgba(0,0,0,.2);
            margin: 0;
        }
        .panel{
            max-width:700px;
            max-height:500px;
            padding:10px;
            background-color:#fff;
            border-radius:5px;
        }
        .resetRequest {
            padding: 10px;
            border: 1px solid rgba(0,0,0,.2);
            border-radius: 3px;
            grid-area: resetRequest;
        }
         @media (max-width:1400px) {
            .container {
                width: 80%;
                grid-template-columns: repeat(2,1fr);
                display: grid;
                grid-gap: 10px;
                grid-template-areas: "profileInfo resetRequest";
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="profileInformation">
            <div class="info">
                <div class="smallDiv">User Name</div>
                <div id="userName" runat="server" class="smallDiv"></div>
                <div class="smallDiv">Role</div>
                <div id="role" runat="server" class="smallDiv"></div>
                <div class="smallDiv">Email</div>
                <div id="email" runat="server" class="smallDiv"></div>
                <div class="smallDiv">Mobile</div>
                <div id="mobile" runat="server" class="smallDiv"></div>
                <div class="smallDiv">Created On</div>
                <div id="createdOn" runat="server" class="smallDiv"></div>
                <div class="smallDiv">Created By</div>
                <div id="createdBy" runat="server" class="smallDiv"></div>
                <div class="smallDiv">Password</div>
                <div class="smallDiv">
                    <asp:Button ID="btnReset" runat="server" CssClass="btn green" Text="Reset" OnClick="btnReset_Click" />
                </div>
            </div>
        </div>
        <asp:Button ID="btnHidden" runat="server" style="display:none" />
        <div class="resetRequest">
            <div class="notAllowed" runat="server" id="notAllowed">
                <p>
                    You are not authorized to view this page!<br>
                    Please contack administrator.
                </p>
            </div>
            <asp:GridView ID="grdUsers" runat="server" Width="100%" GridLines="Horizontal" BorderStyle="None" OnRowCommand="grdUsers_RowCommand" HeaderStyle-HorizontalAlign="Left" RowStyle-Height="30" AutoGenerateColumns="false">
                <Columns>
                    <asp:TemplateField HeaderText="SL No">
                        <ItemTemplate>
                            <%# Container.DataItemIndex +1 %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Id" HeaderText="ID" />
                    <asp:BoundField DataField="Name" HeaderText="Name" />
                    <asp:BoundField DataField="Role" HeaderText="Role" />
                    <asp:TemplateField HeaderText="Reset">
                        <ItemTemplate>
                            
                            <asp:Button ID="btnReset" runat="server" Text="Reset" CssClass="btn green" CommandArgument='<%# Eval("Id") %>' CommandName="Reset" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
    <asp:Panel runat="server" ID="PopUpPanel" CssClass="panel">
        <div id="user_p" runat="server" align="center">Hello</div>
        <asp:Label runat="server" ID="lblNewPassword">New Password</asp:Label>
        <asp:TextBox ID="txtNewPassword" runat="server" CssClass="textBox" placeholder="New Password" TextMode="Password" AutoCompleteType="None"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfv1" runat="server" ControlToValidate="txtNewPassword" ErrorMessage="*" ForeColor="Red" ValidationGroup="reset"></asp:RequiredFieldValidator>
        <asp:Button ID="btnChange" runat="server" CssClass="btn green" Text="Change" OnClick="btnChange_Click" ValidationGroup="reset" />
        <asp:Button ID="btnCancle" runat="server" CssClass="btn orange" Text="Cancle" OnClick="btnCancle_Click" />
    </asp:Panel>
    <asp:ToolkitScriptManager runat="server"></asp:ToolkitScriptManager>
    <asp:ModalPopupExtender ID="mpe1" runat="server" TargetControlID="btnHidden" BackgroundCssClass="modalBackground" PopupControlID="PopUpPanel">
        
    </asp:ModalPopupExtender>
    

</asp:Content>
