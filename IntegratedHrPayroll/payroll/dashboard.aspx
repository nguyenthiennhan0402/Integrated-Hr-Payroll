<%@ Page Title="" Language="C#" MasterPageFile="~/payroll/payrollMasterPage.Master" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="IntegratedHrPayroll.payroll.dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
       
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="body-main-dashboard">
                        <div class="dashboard-group">
                            <a href="#" class="dashboard-link dashboard-link1 link-active">Earnings Per Shareholder</a>
                            <a href="#" class="dashboard-link dashboard-link2">Earnings Per Employee</a>
                        </div>
                        <div class="dashboard-display ">
                            <div class="dashboard-shareholders">
                                <table class="table-shareholders" border="1px">
                                    <tr class="table-shareholders-row">
                                            <td class="table-shareholders-colum colum-header">Date</td>
                                            <td class="table-shareholders-colum colum-header">Name of shareholder</td>
                                            <td class="table-shareholders-colum colum-header">Gender</td>  
                                            <td class="table-shareholders-colum colum-header">Nation</td> 
                                            <td class="table-shareholders-colum colum-header">Total income</td>             
                                    </tr>
                                    <tr class="table-shareholders-row">
                                        <td class="table-shareholders-colum ">16/03/2023</td>
                                        <td class="table-shareholders-colum ">Cổ Đông A</td>
                                        <td class="table-shareholders-colum ">Nam</td>  
                                        <td class="table-shareholders-colum ">Kinh</td> 
                                        <td class="table-shareholders-colum ">17,123,000</td>             

                                </tr>
                                <tr class="table-shareholders-row">
                                    <td class="table-shareholders-colum ">16/03/2023</td>
                                    <td class="table-shareholders-colum ">Cổ Đong B</td>
                                    <td class="table-shareholders-colum ">Nữ</td>  
                                    <td class="table-shareholders-colum ">Kinh</td> 
                                    <td class="table-shareholders-colum ">7,000,000</td>             

                            </tr>
                                    
                                </table>    
                            </div>
                            <div class="dashboard-employee unable-display">
                                <table class="table-shareholders" border="1px">
                                    <tr class="table-shareholders-row">
                                            <td class="table-shareholders-colum colum-header">Date</td>
                                            <td class="table-shareholders-colum colum-header">Type of employee</td>
                                            <td class="table-shareholders-colum colum-header">Total income</td>              
                                    </tr>
                                    <tr class="table-shareholders-row">
                                        <td class="table-shareholders-colum">16/03/2023</td>
                                        <td class="table-shareholders-colum">Full-time</td>
                                        <td class="table-shareholders-colum">10,200,210</td>              
                                    </tr>
                                    <tr class="table-shareholders-row">
                                        <td class="table-shareholders-colum">16/03/2023</td>
                                        <td class="table-shareholders-colum">Part-time</td>
                                        <td class="table-shareholders-colum">6,018,700</td>              
                                    </tr>
                                </table>    
                            </div>
                        </div>
                    </div>
    <script type="text/javascript">
        const link1 = document.querySelector('.dashboard-link1');
        const link2 = document.querySelector('.dashboard-link2');
        const shareholdersDiv = document.querySelector('.dashboard-shareholders');
        const employeeDiv = document.querySelector('.dashboard-employee');

        link1.addEventListener('click', function (event) {
            employeeDiv.classList.add('unable-display');
            shareholdersDiv.classList.remove('unable-display');
            link1.classList.add('link-active');
            link2.classList.remove('link-active');

        });

        link2.addEventListener('click', function (event) {
            shareholdersDiv.classList.add('unable-display');
            employeeDiv.classList.remove('unable-display');
            link2.classList.add('link-active');
            link1.classList.remove('link-active');
            console.log('click');
        });
    </script>
</asp:Content>
