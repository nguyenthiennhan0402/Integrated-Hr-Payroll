<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="IntegratedHrPayroll.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
       

            <asp:GridView ID="GridView1" runat="server">
                <Columns>
                   <asp:TemplateField>
                       <ItemTemplate>
                           <asp:TextBox Text='<%#Eval("id")%>' ID="txtsl" runat="server"></asp:TextBox>
                       </ItemTemplate>
                   </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
