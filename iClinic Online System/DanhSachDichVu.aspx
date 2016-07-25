<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DanhSachDichVu.aspx.cs" Inherits="iClinic_Online_System.DanhSachDichVu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:GridView ID="grid" runat="server" AutoGenerateColumns="false"
        OnRowDataBound="GridView1_RowDataBound" OnSelectedIndexChanged = "OnSelectedIndexChanged">
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
 				<Columns>
					<asp:BoundField DataField="PAT_SER_ID" HeaderText="MA DICH VU" />
					<asp:BoundField DataField="QUANTITY" HeaderText="SO LUONG" />
					<asp:BoundField DataField="PRICE" HeaderText="DON GIA" />
                    <asp:ButtonField Text="Click" CommandName="Select" ItemStyle-Width="30"  />
				</Columns>
       </asp:GridView>
        <br />
        <asp:Label ID="msg" runat="server" Text=""></asp:Label>
    </div>
    </form>
</body>
</html>
