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
        OnRowDataBound="GridView1_RowDataBound">
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
 				<Columns>
					<asp:BoundField DataField="PAT_SER_ID" HeaderText="MA DICH VU" />
					<asp:BoundField DataField="QUANTITY" HeaderText="SO LUONG" />
					<asp:BoundField DataField="PRICE" HeaderText="DON GIA" />
                     <asp:TemplateField>
                         <ItemTemplate>
                             <asp:LinkButton ID="selectRowBtn" runat="server" Text="Select" CommandName="Select"
                                OnClientClick="return selectService(this)"></asp:LinkButton>
                         </ItemTemplate>
                     </asp:TemplateField>
				</Columns>
       </asp:GridView>
        <br />
        <asp:Label ID="msg" runat="server" Text=""></asp:Label>
    </div>

    <script type="text/javascript">
        function selectService(lkn) {
            var row = lkn.parentNode.parentNode;
            var id = row.cells[0].innerHTML;
            window.sessionStorage.setItem("PAT_SER_ID", id);
            document.getElementById("msg").innerHTML = "Service " + id + " has been selected!";
            return false;
        }
    </script>
    </form>
</body>
</html>
