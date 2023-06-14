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
        <asp:GridView ID="GridView1" runat="server" HeaderStyle-CssClass="colum-header"  BorderWidth="1px" runat="server" Width="100%" AutoGenerateColumns="False">
            <Columns>
                 <asp:boundfield itemstyle-cssclass="table-shareholders-colum" datafield="fullname" headertext="Employee Name"  />
                 <asp:boundfield itemstyle-cssclass="table-shareholders-colum" datafield="Gender" headertext="Gender"  />
                 <asp:boundfield itemstyle-cssclass="table-shareholders-colum" datafield="Ethnicity" headertext="Nation"  />
                 <asp:boundfield itemstyle-cssclass="table-shareholders-colum" datafield="Department" headertext="Department"  />
                 <asp:boundfield itemstyle-cssclass="table-shareholders-colum" datafield="Hire_Date" headertext="working day"  />
                 <asp:boundfield itemstyle-cssclass="table-shareholders-colum" datafield="Vacation_Days" headertext="Number Of Days Off"  />
                 <asp:boundfield itemstyle-cssclass="table-shareholders-colum" datafield="total_income" headertext="Total Income"  />
            </Columns>
        </asp:GridView>
       <%-- <table class="table-shareholders" border="1px">
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
           
            

        </table>--%>
    </div>
</asp:Content>
