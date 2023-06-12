<%@ Page Title="" Language="C#" MasterPageFile="~/HR/masterHR.Master" AutoEventWireup="true" CodeBehind="WarningHR.aspx.cs" Inherits="IntegratedHrPayroll.HR.Warning" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="warning-nav">
        <div class="body-main-search">
            <input type="text" class="search-input" placeholder="Employee Name...">
            <button class="search-btn">Find</button>
        </div>
        <div>
            <button class="addannouce-btn">Add Announcement</button>
        </div>
    </div>
    <div class="warning-table">
        <table class="table-shareholders" border="1px">
            <tr class="table-shareholders-row">
                <td class="table-shareholders-colum colum-header">Receiver</td>
                <td class="table-shareholders-colum colum-header">Department</td>
                <td class="table-shareholders-colum colum-header">Description</td>
                <td class="table-shareholders-colum colum-header">Action</td>
            </tr>
            <tr class="table-shareholders-row">
                <td class="table-shareholders-colum">Nhân Viên A</td>
                <td class="table-shareholders-colum">IT</td>
                <td class="table-shareholders-colum">Có Sinh Nhật vào ngày 5</td>
                <td class="table-shareholders-colum action-column">
                    <button class="action-btn update-btn">Sửa</button>
                    <button class="action-btn delete-btn">Xóa</button>
                </td>
            </tr>
            <tr class="table-shareholders-row">
                <td class="table-shareholders-colum">Nhân Viên A</td>
                <td class="table-shareholders-colum">IT</td>
                <td class="table-shareholders-colum">Có Sinh Nhật vào ngày 5</td>
                <td class="table-shareholders-colum action-column">
                    <button class="action-btn update-btn">Sửa</button>
                    <button class="action-btn delete-btn">Xóa</button>
                </td>
            </tr>
            <tr class="table-shareholders-row">
                <td class="table-shareholders-colum">Nhân Viên A</td>
                <td class="table-shareholders-colum">IT</td>
                <td class="table-shareholders-colum">Có Sinh Nhật vào ngày 5</td>
                <td class="table-shareholders-colum action-column">
                    <button class="action-btn update-btn">Sửa</button>
                    <button class="action-btn delete-btn">Xóa</button>
                </td>
            </tr>
            <tr class="table-shareholders-row">
                <td class="table-shareholders-colum">Nhân Viên A</td>
                <td class="table-shareholders-colum">IT</td>
                <td class="table-shareholders-colum">Có Sinh Nhật vào ngày 5</td>
                <td class="table-shareholders-colum action-column">
                    <button class="action-btn update-btn">Sửa</button>
                    <button class="action-btn delete-btn">Xóa</button>
                </td>
            </tr>


        </table>
    </div>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="addannouce-form unable-display">
        <div class="addannouce-form-body">
            <h1 class="addannouce-form-body-header">Add Announcement</h1>
            <br>
            <h2 class="form-lb-receiver">Receiver</h2>
            <br>
            <input type="text" class="form-input" placeholder="Name">
            <br>
            <h2 class="form-lb-receiver">Department</h2>
            <br>
            <input type="text" class="form-input" placeholder="Department">
            <br>
            <h2 class="form-lb-receiver">Created by</h2>
            <br>
            <input type="text" class="form-input" placeholder="Created by">
            <br>
            <h2 class="form-lb-receiver">Description</h2>
            <br>
            <textarea name="message" rows="5" cols="55" placeholder="Description"
                class="form-input-multi"></textarea>
            <div class="form-control">
                <button class="form-btn save-btn">Save</button>
                <button class="form-btn cancel-btn">Cancel</button>
            </div>
        </div>
    </div>
</asp:Content>
