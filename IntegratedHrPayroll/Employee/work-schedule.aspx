<%@ Page Title="" Language="C#" MasterPageFile="~/Employee/Master.Master" AutoEventWireup="true" CodeBehind="work-schedule.aspx.cs" Inherits="IntegratedHrPayroll.Employee.work_schedule" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="work-schedule">
        <div id="title">work schedule</div>
        <table id="workScheduleTable">
            <tr>
                <th>Start Date</th>
                <th>End Date</th>
                <th>Job Title</th>
                <th>Department</th>
                <th>Location</th>
                <th>Supervisor</th>
            </tr>
            <asp:Repeater ID="repeaterWorkSchedule" runat="server">
                <ItemTemplate>
                    <tr>
                        <td><%# Eval("Start_Date") %></td>
                        <td><%# Eval("End_Date") %></td>
                        <td><%# Eval("Job_Title") %></td>
                        <td><%# Eval("Department") %></td>
                        <td><%# Eval("Location") %></td>
                        <td><%# Eval("Supervisor") %></td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </table>
    </div>
</asp:Content>
