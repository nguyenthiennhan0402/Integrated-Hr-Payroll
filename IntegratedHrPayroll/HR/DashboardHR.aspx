<%@ Page Title="" Language="C#" MasterPageFile="~/HR/masterHR.Master" AutoEventWireup="true" CodeBehind="DashboardHR.aspx.cs" Inherits="IntegratedHrPayroll.HR.Dashboard" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="table-col-50">
        <!-- Total employee -->
        <div class="total-em">
            <table style="width: 358px; height: 267px;">
                <tr class="table-total-em-row1">
                    <td class="table-total-em-col1">Total Employee</td>
                    <td class="table-total-em-col2" rowspan="2">
                        <canvas id="myChart"></canvas>
                        <%--<svg xmlns="http://www.w3.org/2000/svg" version="1.1" class="svg">
                            <% int[] data = {  }; %>
                            <% int total = data.Sum(); %>
                            <% double startAngle = 0; %>
                            <% double radius = 75; %> <!-- Thay đổi bán kính thành 75% -->
                            <% double centerX = 75; %> <!-- Thay đổi tâm X thành 100 -->
                            <% double centerY = 125; %> <!-- Thay đổi tâm Y thành 100 -->
                            <% for (int i = 0; i < data.Length; i++)
                                { %>
                                    <% double percentage = (double)data[i] / total * 100; %>
                                    <% double endAngle = startAngle + percentage * 3.6; %>
                                    <% double startX = centerX + Math.Cos(Math.PI * startAngle / 180) * radius; %>
                                    <% double startY = centerY + Math.Sin(Math.PI * startAngle / 180) * radius; %>
                                    <% double endX = centerX + Math.Cos(Math.PI * endAngle / 180) * radius; %>
                                    <% double endY = centerY + Math.Sin(Math.PI * endAngle / 180) * radius; %>
                                    <path d="M<%= centerX %>,<%= centerY %> L<%= startX %>,<%= startY %> A<%= radius %>,<%= radius %> 0 <%= (percentage > 50) ? '1' : '0' %> 1 <%= endX %>,<%= endY %> Z" fill="<%= GetRandomColor(i) %>" stroke="<%= GetRandomColor(i) %>" />
                                    <% startAngle = endAngle; %>
                            <%  } %>
                        </svg>--%>
                        <%--<svg xmlns="http://www.w3.org/2000/svg" version="1.1" class="svg">
                            <defs>
                                <linearGradient id="GradientColor">
                                    <stop offset="0%" stop-color="#e91e63" />
                                    <stop offset="100%" stop-color="#673ab7" />
                                </linearGradient>
                            </defs>
                            <circle cx="50%" cy="50%" r="30%" stroke-linecap="round" style="--offset: <% if(Session["totalem"] == null) { %>1<% } else { %> <%= Session["totalem"] %> <% } %>;" />
                        </svg>--%>
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
    <script>
        const ctx = document.getElementById('myChart');
        const departmentData = JSON.parse('<%= Session["data"] %>');
        new Chart(ctx, {
            type: 'pie',
            data: {
                labels: departmentData.map(item => item.label),
                datasets: [{
                    label: 'Employee',
                    data: departmentData.map(item => item.value),
                    borderWidth: 1
                }]
            }
        });
    </script>
</asp:Content>
