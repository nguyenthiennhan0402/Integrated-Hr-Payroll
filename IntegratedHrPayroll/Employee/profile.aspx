<%@ Page Title="" Language="C#" MasterPageFile="~/Employee/Master.Master" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="IntegratedHrPayroll.Employee.aspx.profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="profile">
        <div id="title">profile</div>
        <asp:Label CssClass="lbShow" ID="lbShow" runat="server" Text=""></asp:Label>
        <div class="basic-info">
            <div class="title">Basic Information</div>

            <div class="box-item">
                <asp:Label ID="lblName" runat="server" AssociatedControlID="txtName" CssClass="label">Name</asp:Label>
                <asp:TextBox CssClass="input" ID="txtName" runat="server"></asp:TextBox>
            </div>

            <div class="box-item" id="gender">
                <asp:Label ID="lblGender" runat="server" AssociatedControlID="txtGender" CssClass="label">Gender</asp:Label>
                <asp:TextBox CssClass="input" ID="txtGender" runat="server"></asp:TextBox>
            </div>

            <div class="box-item" id="positon">
                <asp:Label ID="lblPosition" runat="server" AssociatedControlID="txtPosition" CssClass="label">Job Position</asp:Label>
                <asp:TextBox CssClass="input" ID="txtPosition" runat="server"></asp:TextBox>
            </div>

            <div class="box-item" id="department">
                <asp:Label ID="lblDepartment" runat="server" AssociatedControlID="txtDepartment" CssClass="label">Department</asp:Label>
                <asp:TextBox CssClass="input" ID="txtDepartment" runat="server"></asp:TextBox>
            </div>
        </div>

        <div class="contact-info">
            <div class="title">Contact Information</div>

            <div class="box-item" id="email">
                <asp:Label ID="lblEmail" runat="server" AssociatedControlID="txtEmail" CssClass="label">Email</asp:Label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="input" TextMode="Email"></asp:TextBox>
            </div>

            <div class="box-item" id="phone-numbre">
                <asp:Label ID="lblPhoneNumber" runat="server" AssociatedControlID="txtPhoneNumber" CssClass="label">Phone Number</asp:Label>
                <asp:TextBox ID="txtPhoneNumber" runat="server" CssClass="input" TextMode="Phone"></asp:TextBox>
            </div>

            <div class="box-item" id="address">
                <asp:Label ID="lblAddress" runat="server" AssociatedControlID="txtAddress" CssClass="label">Address</asp:Label>
                <asp:TextBox ID="txtAddress" runat="server" CssClass="input"></asp:TextBox>
            </div>
        </div>

        <div class="box-avatar">
            <img src="images/avt.png" />
        </div>

        <asp:Button ID="btnUpdate" runat="server" CssClass="update-btn" Text="Update"  OnClick="update_click"/>
    </div>
</asp:Content>
