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

            <div class="box-item">
                <asp:Label ID="lblGender" runat="server" AssociatedControlID="txtGender" CssClass="label">Gender</asp:Label>
                <asp:TextBox CssClass="input" ID="txtGender" Enabled="false" runat="server"></asp:TextBox>
            </div>

            <div class="box-item" id="empNum">
                <asp:Label ID="lblEmpNum" runat="server" AssociatedControlID="txtEmpNum" CssClass="label">Employee Number</asp:Label>
                <asp:TextBox CssClass="input" ID="txtEmpNum" Enabled="False" runat="server"></asp:TextBox>
            </div>

            <div class="box-item" id="ssn">
                <asp:Label ID="lblSsn" runat="server" AssociatedControlID="txtSsn" CssClass="label">SSN</asp:Label>
                <asp:TextBox CssClass="input" ID="txtSsn"  Enabled="False" runat="server"></asp:TextBox>
            </div>

            <div class="box-item" id="pos">
                <asp:Label ID="lblPos" runat="server"  Enabled="False"  AssociatedControlID="txtPos" CssClass="label">Possition</asp:Label>
                <asp:TextBox CssClass="input" ID="txtPos" Enabled="False" runat="server"></asp:TextBox>
            </div>

            <div class="box-item" id="dep">
                <asp:Label ID="lblDep" runat="server" AssociatedControlID="txtDep" CssClass="label">Department</asp:Label>
                <asp:TextBox CssClass="input" ID="txtDep" Enabled="False" runat="server"></asp:TextBox>
            </div>

            <div class="box-item" id="address">
                <asp:Label ID="lblAddress" runat="server" AssociatedControlID="txtAddress" CssClass="label">Address</asp:Label>
                <asp:TextBox CssClass="input" Enabled="False" ID="txtAddress" runat="server"></asp:TextBox>
            </div>

            <div class="box-item" id="ethnicity">
                <asp:Label ID="lblEthnicity" runat="server" AssociatedControlID="txtEthnicity" CssClass="label">Ethnicity</asp:Label>
                <asp:TextBox CssClass="input" ID="txtEthnicity" Enabled="False" runat="server"></asp:TextBox>
            </div>
        </div>

        

        <div class="contact-info">
            <div class="title">Contact Information</div>

            <div class="box-item" id="email">
                <asp:Label ID="lblEmail" runat="server" AssociatedControlID="txtEmail" CssClass="label">Email</asp:Label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="input" TextMode="Email"></asp:TextBox>
            </div>

            <div class="box-item" id="phone">
                <asp:Label ID="lblPhone" runat="server" AssociatedControlID="txtPhone" CssClass="label">Phone Number</asp:Label>
                <asp:TextBox ID="txtPhone" runat="server" CssClass="input"></asp:TextBox>
            </div>
        </div>

        <div class="box-avatar">
            <img src="images/avt.png" />
        </div>
        <asp:Button ID="btnUpdate" runat="server" CssClass="update-btn" Text="Update" OnClick="update_click" />
    </div>
</asp:Content>
