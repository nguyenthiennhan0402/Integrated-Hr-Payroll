<%@ Page Title="" Language="C#" MasterPageFile="~/Employee/Master.Master" AutoEventWireup="true" CodeBehind="account-benefit.aspx.cs" Inherits="IntegratedHrPayroll.Employee.account_benefit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="account-benefit">
        <div id="title">Account & Benefits</div>
        <div id="chartContainer" class="chart-container">
            <label class="text">Lương</label>
            <canvas id="salaryChart"></canvas>
        </div>
        <div class="benefit">
            <h1>Chính sách bảo hiểm</h1>

            <h2>Thông tin nhân viên:</h2>
            <label for="employee-name" class="lbTitle">Tên nhân viên</label>
            <span id="employee-name" class="employee-info">
                <asp:Label ID="employeeNameLabel" CssClass="show" runat="server"></asp:Label></span><br>

            <label for="ssn" class="lbTitle">Số CMND</label>
            <span id="ssn" class="employee-info">
                <asp:Label ID="ssnLabel" runat="server" CssClass="show"></asp:Label></span><br>

            <label for="pay-rate" class="lbTitle">Mức lương</label>
            <span id="pay-rate" class="employee-info">
                <asp:Label ID="payRateLabel" runat="server" CssClass="show"></asp:Label></span><br>

            <label for="vacation-days" class="lbTitle">Số ngày nghỉ phép còn lại</label>
            <span id="vacation-days" class="employee-info">
                <asp:Label ID="vacationDaysLabel" runat="server" CssClass="show"></asp:Label></span><br>

            <label for="paid-to-date" class="lbTitle">Số tiền đã thanh toán trong năm</label>
            <span id="paid-to-date" class="employee-info">
                <asp:Label ID="paidToDateLabel" runat="server" CssClass="show"></asp:Label></span><br>

            <label for="paid-last-year" class="lbTitle">Số tiền đã thanh toán năm trước</label>
            <span id="paid-last-year" class="employee-info">
                <asp:Label ID="paidLastYearLabel" runat="server" CssClass="show"></asp:Label></span><br>

            <h2>Chính sách bảo hiểm:</h2>
            <ul>
                <li>bảo hiểm: staff</li>
                <li>giá trị: 500000 vnd</li>
                <li>tỷ lệ thuế: 9%</li>
            </ul>

            <ul>
                <li>bảo hiểm: manager</li>
                <li>giá trị: 10000000 vnd</li>
                <li>tỷ lệ thuế: 10%</li>
            </ul>
        </div>
        <script>
            var container = document.getElementById('chartContainer');
            var containerWidth = container.clientWidth;
            var containerHeight = container.clientHeight;

            const dataaaaa = JSON.parse('<%=Session["data"] %>');

            lables = dataaaaa.map(item => item.label);
            data = dataaaaa.map(item => item.value);
            
            var ctx = document.getElementById('salaryChart').getContext('2d');
            var chart = new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: lables,
                    datasets: [{
                        label: 'Lương nhân viên',
                        data: data,
                        backgroundColor: ['blue', 'green', 'orange', 'purple'],
                        minBarLength: 5,
                        borderRadius: 10,
                        barPercentage: 0.8,
                    }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    },
                    plugins: {
                        legend: {
                            display: false,
                        },
                    },
                }
            });

            ctx.canvas.width = containerWidth;
            ctx.canvas.height = containerHeight;
        </script>

    </div>
</asp:Content>
