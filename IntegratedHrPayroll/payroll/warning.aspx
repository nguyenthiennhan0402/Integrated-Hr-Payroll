<%@ Page Title="" Language="C#" MasterPageFile="~/payroll/payrollMasterPage.Master" AutoEventWireup="true" CodeBehind="warning.aspx.cs" Inherits="IntegratedHrPayroll.payroll.warning" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="body-header">Number Of Days Off</div>
    <div class="body-main-content">
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
    </div>
</asp:Content>
