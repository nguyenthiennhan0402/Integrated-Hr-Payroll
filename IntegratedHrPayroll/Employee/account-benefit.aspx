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
            <label for="employee-name" class="lable">Tên nhân viên:</label>
            <span id="employee-name" class="employee-info">
                <asp:Label ID="employeeNameLabel" CssClass="show" runat="server"></asp:Label></span><br>

            <label for="ssn" class="lable">Số CMND:</label>
            <span id="ssn" class="employee-info">
                <asp:Label ID="ssnLabel" runat="server" CssClass="show"></asp:Label></span><br>

            <label for="pay-rate" class="lable">Mức lương:</label>
            <span id="pay-rate" class="employee-info">
                <asp:Label ID="payRateLabel" runat="server" CssClass="show"></asp:Label></span><br>

            <label for="vacation-days" class="lable">Số ngày nghỉ phép còn lại:</label>
            <span id="vacation-days" class="employee-info">
                <asp:Label ID="vacationDaysLabel" runat="server" CssClass="show"></asp:Label></span><br>

            <label for="paid-to-date" class="lable">>Số tiền đã thanh toán trong năm:</label>
            <span id="paid-to-date" class="employee-info">
                <asp:Label ID="paidToDateLabel" runat="server" CssClass="show"></asp:Label></span><br>

            <label for="paid-last-year" class="lable">Số tiền đã thanh toán năm trước:</label>
            <span id="paid-last-year" class="employee-info">
                <asp:Label ID="paidLastYearLabel" runat="server" CssClass="show"></asp:Label></span><br>

            <h2>Chính sách bảo hiểm:</h2>
            <ul>
                <li>Bảo hiểm: Staff</li>
                <li>Mức đóng góp: 500000 VND</li>
                <li>Tỷ lệ thuế: 9%</li>
            </ul>

            <ul>
                <li>Bảo hiểm: Manager</li>
                <li>Mức đóng góp: 10000000 VND</li>
                <li>Tỷ lệ thuế: 10%</li>
            </ul>
        </div>
        <script>
            var container = document.getElementById('chartContainer');
            var containerWidth = container.clientWidth;
            var containerHeight = container.clientHeight;
            var payAmount = 7000000;
            var payToDate = 5;
            var payRate = 6;
            var payLastYear = 6;

            var netPay = payAmount * (payRate - (9 / 100));

            var ctx = document.getElementById('salaryChart').getContext('2d');
            var chart = new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: ['Định mức lương', 'Đã trả', 'Thực nhận', 'Thu nhập năm ngoái'],
                    datasets: [{
                        label: 'Lương nhân viên',
                        data: [payAmount, payToDate, netPay, payLastYear],
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
                    }
                }
            });

            ctx.canvas.width = containerWidth;
            ctx.canvas.height = containerHeight;
        </script>
        
    </div>
</asp:Content>
