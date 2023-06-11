<%@ Page Title="" Language="C#" MasterPageFile="~/payroll/payrollMasterPage.Master" AutoEventWireup="true" CodeBehind="listempl.aspx.cs" Inherits="IntegratedHrPayroll.payroll.listempl" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="body-header">Number Of Employee</div>
                    <div class="body-main-content">
                        <div class="body-main-search">
                            <input type="text" class="search-input" placeholder="Employee Name...">
                            <button class="search-btn">Find</button>
                        </div>
                        <table class="table-shareholders" border="1px">
                            <tr class="table-shareholders-row">
                                 
                                    <td class="table-shareholders-colum colum-header">Employee Name</td>
                                    <td class="table-shareholders-colum colum-header">Gender</td>  
                                    <td class="table-shareholders-colum colum-header">Nation</td>
                                    <td class="table-shareholders-colum colum-header">Type</td>
                                    <td class="table-shareholders-colum colum-header">Department</td>
                                    <td class="table-shareholders-colum colum-header">working day</td> 
                                    <td class="table-shareholders-colum colum-header">Number Of Days Off</td>
                                    <td class="table-shareholders-colum colum-header">Maximum Number Of Days Off</td>             
                            </tr>
                            <tr class="table-shareholders-row">
                                <td class="table-shareholders-colum ">Nhân Viên A</td>
                                <td class="table-shareholders-colum ">Male</td>  
                                <td class="table-shareholders-colum ">Kinh</td>
                                <td class="table-shareholders-colum ">Fulltime</td>
                                <td class="table-shareholders-colum ">IT</td>
                                <td class="table-shareholders-colum ">01/04/2019</td> 
                                <td class="table-shareholders-colum ">10</td>  
                                <td class="table-shareholders-colum ">16</td>           
                        </tr>
                        <tr class="table-shareholders-row">
                            <td class="table-shareholders-colum ">Nhân Viên A</td>
                            <td class="table-shareholders-colum ">Male</td>  
                            <td class="table-shareholders-colum ">Kinh</td>
                            <td class="table-shareholders-colum ">Fulltime</td>
                            <td class="table-shareholders-colum ">IT</td>
                            <td class="table-shareholders-colum ">01/04/2019</td> 
                            <td class="table-shareholders-colum ">10</td>  
                            <td class="table-shareholders-colum ">16</td>           
                    </tr>
                    <tr class="table-shareholders-row">
                        <td class="table-shareholders-colum ">Nhân Viên A</td>
                        <td class="table-shareholders-colum ">Male</td>  
                        <td class="table-shareholders-colum ">Kinh</td>
                        <td class="table-shareholders-colum ">Fulltime</td>
                        <td class="table-shareholders-colum ">IT</td>
                        <td class="table-shareholders-colum ">01/04/2019</td> 
                        <td class="table-shareholders-colum ">10</td>  
                        <td class="table-shareholders-colum ">16</td>           
                </tr>
                <tr class="table-shareholders-row">
                    <td class="table-shareholders-colum ">Nhân Viên A</td>
                    <td class="table-shareholders-colum ">Male</td>  
                    <td class="table-shareholders-colum ">Kinh</td>
                    <td class="table-shareholders-colum ">Fulltime</td>
                    <td class="table-shareholders-colum ">IT</td>
                    <td class="table-shareholders-colum ">01/04/2019</td> 
                    <td class="table-shareholders-colum ">10</td>  
                    <td class="table-shareholders-colum ">16</td>           
            </tr>
                        
                            
                        </table> 
                    </div>
</asp:Content>
