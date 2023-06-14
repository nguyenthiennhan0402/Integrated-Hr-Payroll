<%@ Page Title="" Language="C#" MasterPageFile="~/LoginPage/LoginPage.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="IntegratedHrPayroll.LoginPage.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="box-container">
        <span class="icon-close">
            <ion-icon name="close-circle-outline"></ion-icon>
        </span>
        <div class="form-box">
            <h2>login</h2>
            <form action="#">
                <div class="input-box">
                    <span class="icon">
                        <ion-icon name="mail-outline"></ion-icon>
                    </span>
                    <asp:TextBox CssClass="input" ID="txtEmail" runat="server" TextMode="Email" required />
                    <label>email</label>
                </div>
                <div class="input-box">
                    <span class="icon">
                        <ion-icon name="lock-closed-outline"></ion-icon>
                    </span>
                    <asp:TextBox CssClass="input" ID="txtPassword" runat="server" TextMode="Password" required />
                    <label>password</label>
                </div>
                <div class="remember-forgot">
                    <label>
                        <input type="checkbox">remember me</label>
                    <a href="#">forgot password?</a>
                </div>
                <asp:Button CssClass="btn" ID="btnLogin" runat="server" Text="Login" OnClick="login_Click" />
            </form>
        </div>
    </div>
</asp:Content>
