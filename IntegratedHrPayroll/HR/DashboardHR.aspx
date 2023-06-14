<%@ Page Title="" Language="C#" MasterPageFile="~/HR/masterHR.Master" AutoEventWireup="true" CodeBehind="DashboardHR.aspx.cs" Inherits="IntegratedHrPayroll.HR.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="table-col-50">
        <!-- Total employee -->
        <div class="total-em">
            <table style="width: 358px; height: 267px;">
                <tr class="table-total-em-row1">
                    <td class="table-total-em-col1">Total Employee</td>
                    <td class="table-total-em-col2" rowspan="2">
                        <svg xmlns="http://www.w3.org/2000/svg" version="1.1" class="svg">
                            <defs>
                                <linearGradient id="GradientColor">
                                    <stop offset="0%" stop-color="#e91e63" />
                                    <stop offset="100%" stop-color="#673ab7" />
                                </linearGradient>
                            </defs>
                            <circle cx="50%" cy="50%" r="30%" stroke-linecap="round" />
                        </svg>
                    </td>
                </tr>
                <tr class="table-total-em-row2">
                    <td class="table-total-em-col1">639</td>
                </tr>
            </table>
        </div>

        <!-- Warning -->
        <div class="warning-table1">
            <table class="table-shareholders1">
                <tr class="table-shareholders-row">
                    <td class="table-shareholders-colum colum-header1">Receiver</td>
                    <td class="table-shareholders-colum colum-header1">Department</td>
                    <td class="table-shareholders-colum colum-header1">Description</td>
                </tr>
                <tr class="table-shareholders-row">
                    <td class="table-shareholders-colum">Nhân Viên A</td>
                    <td class="table-shareholders-colum">IT</td>
                    <td class="table-shareholders-colum">Có Sinh Nhật vào ngày 5</td>
                    <td class="table-shareholders-colum action-column"></td>
                </tr>
                <tr class="table-shareholders-row">
                    <td class="table-shareholders-colum">Nhân Viên A</td>
                    <td class="table-shareholders-colum">IT</td>
                    <td class="table-shareholders-colum">Có Sinh Nhật vào ngày 5</td>
                    <td class="table-shareholders-colum action-column"></td>
                </tr>
                <tr class="table-shareholders-row">
                    <td class="table-shareholders-colum">Nhân Viên A</td>
                    <td class="table-shareholders-colum">IT</td>
                    <td class="table-shareholders-colum">Có Sinh Nhật vào ngày 5</td>
                    <td class="table-shareholders-colum action-column"></td>
                </tr>
                <tr class="table-shareholders-row">
                    <td class="table-shareholders-colum">Nhân Viên A</td>
                    <td class="table-shareholders-colum">IT</td>
                    <td class="table-shareholders-colum">Có Sinh Nhật vào ngày 5</td>
                    <td class="table-shareholders-colum action-column"></td>
                </tr>


            </table>
        </div>
    </div>
</asp:Content>
