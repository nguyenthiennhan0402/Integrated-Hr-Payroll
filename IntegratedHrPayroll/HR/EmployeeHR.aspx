<%@ Page Title="" Language="C#" MasterPageFile="~/HR/masterHR.Master" AutoEventWireup="true" CodeBehind="EmployeeHR.aspx.cs" Inherits="IntegratedHrPayroll.HR.Employee" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="body-main-search">
        <form action="EmployeeHR.aspx" method="post">
            <input type="text" class="search-input" placeholder="Employee Name..." name="search_input">
            <button type="submit" class="search-btn">Find</button>
        </form>
    </div>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" CssClass="table-shareholders">
        <Columns>
            <asp:BoundField DataField="EmployeeName" HeaderText="Employee Name" />
            <asp:BoundField DataField="Gender" HeaderText="Gender" />
            <asp:BoundField DataField="Nation" HeaderText="Nation" />
            <asp:BoundField DataField="Type" HeaderText="Type" />
            <asp:BoundField DataField="Department" HeaderText="Department" />
            <asp:BoundField DataField="WorkingDay" HeaderText="Working Day" />
            <asp:BoundField DataField="NumberOfDaysOff" HeaderText="Number Of Days Off" />
            <asp:BoundField DataField="MaximumNumberOfDaysOff" HeaderText="Maximum Number Of Days Off" />
        </Columns>
    </asp:GridView>
    <%--<table class="table-shareholders" border="1px">
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
    </table>--%>
</asp:Content>
