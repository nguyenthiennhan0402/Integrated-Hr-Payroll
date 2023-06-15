<%@ Page Title="" Language="C#" MasterPageFile="~/HR/masterHR.Master" AutoEventWireup="true" CodeBehind="EmployeeHR.aspx.cs" Inherits="IntegratedHrPayroll.HR.Employee" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="body-main-search">
        <form action="EmployeeHR.aspx" method="post">
            <input type="text" class="search-input" placeholder="Employee Name..." value="<%=(Session["search-input"]+"") %>" name="search_input">
            <button type="submit" class="search-btn">Find</button>
        </form>
    </div>
    <table class="table-shareholders" border="1px">
        <tr class="table-shareholders-row">
            <td class="table-shareholders-colum colum-header">Employee Name</td>
            <td class="table-shareholders-colum colum-header">Gender</td>
            <td class="table-shareholders-colum colum-header">Nation</td>
            <td class="table-shareholders-colum colum-header">Department</td>
            <td class="table-shareholders-colum colum-header">Working day</td>
            <td class="table-shareholders-colum colum-header">Number Of Days Off</td>
            <td class="table-shareholders-colum colum-header">Maximum Number Of Days Off</td>
        </tr>
        <% var dataemployee = Newtonsoft.Json.JsonConvert.DeserializeObject<dynamic>(Session["data_employee"] + ""); %>
        <% var dataemployee2 = Newtonsoft.Json.JsonConvert.DeserializeObject<dynamic>(Session["data_employee2"] + ""); %>
        <% for (int i = 0; i < dataemployee.Count; i++)
            { %>
        <% var itemnull = new { Day_Off = 0 }; %>
        <% var item = dataemployee[i]; %>
        <% var item2 = i >= dataemployee2.Count ? itemnull : dataemployee2[i]; %>
        <tr class="table-shareholders-row">
            <td class="table-shareholders-colum "><%= item.EmployeeName %></td>
            <td class="table-shareholders-colum "><%= item.Gender %></td>
            <td class="table-shareholders-colum "><%= item.Nation %></td>
            <td class="table-shareholders-colum "><%= item.Department %></td>
            <td class="table-shareholders-colum "><%= item.Working_Day %></td>
            <td class="table-shareholders-colum "><%= item2.Day_Off %></td>
            <td class="table-shareholders-colum ">25</td>
        </tr>
        <% } %>
        <tr class="table-shareholders-row">
            <td class="table-shareholders-colum "></td>
            <td class="table-shareholders-colum "></td>
            <td class="table-shareholders-colum "></td>
            <td class="table-shareholders-colum "></td>
            <td class="table-shareholders-colum "></td>
            <td class="table-shareholders-colum "></td>
            <td class="table-shareholders-colum "></td>
        </tr>
    </table>
</asp:Content>
