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
                    </td>
                </tr>
                <tr class="table-total-em-row2">
                    <% var data = Newtonsoft.Json.JsonConvert.DeserializeObject<dynamic>(Session["data"] + ""); %>
                    <% int sum = 0; %>
                    <% foreach (var item in data)
                        { %>
                    <% try
                        {
                            sum += Convert.ToInt32(item.value + "");
                        }
                        catch { } %>
                    <% } %>
                    <td class="table-total-em-col1"><%= sum %></td>
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
