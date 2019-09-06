<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Admin.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <style>
         @import url('https://fonts.googleapis.com/css?family=Montserrat&display=swap');
        *{
            padding:0;
            margin:0; 
            font-family: 'Montserrat', sans-serif;

        }
        body{
            background-image:linear-gradient(180deg, rgba(0,0,0,.7), rgba(0,0,0,.8));
            background-repeat:no-repeat;
            height:90vh;
            position:relative;
        }
        .container{
            width:80%;
            max-width:800px;
            margin:10vh auto;
            
            max-height:800px;
            border:groove 3px  rgba(0,0,0,.8);
            border-radius:8px;
            padding:10px;
        }
        .textbox, .checkbox, .button, .link{
            display:block;
            margin:20px auto 20px auto;
            text-align:center;
            height:30px;           
        }
        .textbox{
            width:80%;
            max-width:280px;
            border:none;
            border-radius:5px;
            text-align:left;
            text-indent:20px;
        }
        .checkbox{
            color:rgba(255,255,255,.8);
        }
        .button{
            width:100px;
            border:none;
            border-radius:5px;
            background-image:linear-gradient(180deg, rgb(0, 217, 24), rgb(0, 156, 17));
        }
        .button:active{
            background-image:linear-gradient(360deg, rgb(0, 217, 24), rgb(0, 156, 17));
        }
        .link{
            color:rgba(255,255,255,.8);
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <asp:TextBox ID="txtUserName" runat="server" CssClass="textbox" placeholder="User Name"></asp:TextBox>
            <asp:TextBox ID="txtPassword" runat="server" CssClass="textbox" TextMode="Password" placeholder="Password"></asp:TextBox>
            <asp:CheckBox ID="chkRememberMe" runat="server" CssClass="checkbox" Text="Remember Me" />
            <asp:Button ID="btnLogin" runat="server" CssClass="button" Text="Login" OnClick="btnLogin_Click"/>
            <asp:LinkButton ID="lnkForgotPassword" runat="server" CssClass="link" Text="Forgot Password" OnClick="lnkForgotPassword_Click"></asp:LinkButton>
            
        </div>
    </form>
</body>
</html>
