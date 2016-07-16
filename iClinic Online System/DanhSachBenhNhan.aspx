<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DanhSachBenhNhan.aspx.cs" Inherits="iClinic_Online_System.DanhSachBenhNhan" %>
<% @ Import Namespace = "System.Data" %>
<% @ Import Namespace = "System.Data.OleDb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Danh Sach Benh Nhan</title>
    <style type="text/css">
        body {
            background-color:rgb(230, 255, 255);
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
         <asp:Image ID="Image1" runat="server" Height="123px" ImageUrl="~/images/monaco.png" Width="263px" />
         <h1 style="text-align:center;color:rgb(255, 102, 0);font-family:Verdana">Monaco Healthcare Web Service</h1>
         <h2 style="text-align:center;color:rgb(0, 122, 204);font-family:Verdana">Receive new patient</h2>
        <p></p>
        <div>
        <asp:GridView ID="gridView" DataKeyNames="stor_id" runat="server"
                AutoGenerateColumns="false" ShowFooter="true" HeaderStyle-Font-Bold="true"
                onrowcancelingedit="gridView_RowCancelingEdit"
                onrowdeleting="gridView_RowDeleting"
                onrowediting="gridView_RowEditing"
                onrowupdating="gridView_RowUpdating"
                onrowcommand="gridView_RowCommand"
                OnRowDataBound="gridView_RowDataBound">
        <Columns>
            <asp:TemplateField HeaderText="stor_id">
                <ItemTemplate>
                    <asp:Label ID="txtstorid" runat="server" Text='<%#Eval("stor_id") %>'/>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Label ID="lblstorid" runat="server" width="40px" Text='<%#Eval("stor_id") %>'/>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="instorid" width="40px" runat="server"/>
                    <asp:RequiredFieldValidator ID="vstorid" runat="server" ControlToValidate="instorid" Text="?" ValidationGroup="validaiton"/>
                </FooterTemplate>
            </asp:TemplateField>
             <asp:TemplateField HeaderText="stor_name">
                  <ItemTemplate>
                     <asp:Label ID="lblname" runat="server" Text='<%#Eval("stor_name") %>'/>
                 </ItemTemplate>
                 <EditItemTemplate>
                     <asp:TextBox ID="txtname" width="70px"  runat="server" Text='<%#Eval("stor_name") %>'/>
                 </EditItemTemplate>
                 <FooterTemplate>
                     <asp:TextBox ID="inname"  width="120px" runat="server"/>
                     <asp:RequiredFieldValidator ID="vname" runat="server" ControlToValidate="inname" Text="?" ValidationGroup="validaiton"/>
                 </FooterTemplate>
             </asp:TemplateField>
             <asp:TemplateField HeaderText="stor_address">
                 <ItemTemplate>
                     <asp:Label ID="lbladdress" runat="server" Text='<%#Eval("stor_address") %>'/>
                 </ItemTemplate>
                 <EditItemTemplate>
                     <asp:TextBox ID="txtaddress" width="70px"  runat="server" Text='<%#Eval("stor_address") %>'/>
                 </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="inaddress" width="110px"  runat="server"/>
                    <asp:RequiredFieldValidator ID="vaddress" runat="server" ControlToValidate="inaddress" Text="?" ValidationGroup="validaiton"/>
                </FooterTemplate>
             </asp:TemplateField>
              <asp:TemplateField HeaderText="city">
                   <ItemTemplate>
                     <asp:Label ID="lblcity" runat="server" Text='<%#Eval("city") %>'/>
                 </ItemTemplate>
                 <EditItemTemplate>
                     <asp:TextBox ID="txtcity" width="50px"   runat="server" Text='<%#Eval("city") %>'/>
                 </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="incity" width="60px"  runat="server"/>
                    <asp:RequiredFieldValidator ID="vcity" runat="server" ControlToValidate="incity" Text="?" ValidationGroup="validaiton"/>
                </FooterTemplate>
             </asp:TemplateField>
               <asp:TemplateField HeaderText="state">
                 <ItemTemplate>
                     <asp:Label ID="lblstate" runat="server" Text='<%#Eval("state") %>'/>
                 </ItemTemplate>
                 <EditItemTemplate>
                     <asp:TextBox ID="txtstate" width="30px"  runat="server" Text='<%#Eval("state") %>'/>
                 </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="instate" width="40px"   runat="server"/>
                    <asp:RequiredFieldValidator ID="vstate" runat="server" ControlToValidate="instate" Text="?" ValidationGroup="validaiton"/>
                </FooterTemplate>
             </asp:TemplateField>
                <asp:TemplateField HeaderText="zip">
                 <ItemTemplate>
                     <asp:Label ID="lblzip" runat="server" Text='<%#Eval("zip") %>'/>
                 </ItemTemplate>
                <EditItemTemplate>
                     <asp:TextBox ID="txtzip" width="30px"  runat="server" Text='<%#Eval("zip") %>'/>
                 </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="inzip" width="40px"   runat="server"/>
                    <asp:RequiredFieldValidator ID="vzip" runat="server" ControlToValidate="inzip" Text="?" ValidationGroup="validaiton"/>
                </FooterTemplate>
             </asp:TemplateField>
             <asp:TemplateField>
                <EditItemTemplate>
                    <asp:Button ID="ButtonUpdate" runat="server" CommandName="Update"  Text="Update"  />
                    <asp:Button ID="ButtonCancel" runat="server" CommandName="Cancel"  Text="Cancel" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Button ID="ButtonEdit" runat="server" CommandName="Edit"  Text="Edit"  />
                    <asp:Button ID="ButtonDelete" runat="server" CommandName="Delete"  Text="Delete"  />
                </ItemTemplate>
                <FooterTemplate>
                    <asp:Button ID="ButtonAdd" runat="server" CommandName="AddNew"  Text="Add New Row" ValidationGroup="validaiton" />
                </FooterTemplate>
             </asp:TemplateField>
         </Columns>
        </asp:GridView>
            </div>
        <div >
        <br />&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblmsg" runat="server"></asp:Label>
        </div>
    </form>
</body>
</html>
