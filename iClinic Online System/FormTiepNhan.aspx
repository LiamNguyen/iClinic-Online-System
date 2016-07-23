<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormTiepNhan.aspx.cs" Inherits="iClinic_Online_System.FormTiepNhan" %>
<% @ Import Namespace = "System.Data" %>
<% @ Import Namespace = "System.Data.OleDb" %>

<!DOCTYPE html>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset="utf-8" />
    <title>Tiep Nhan</title>    
    <style type="text/css">
        #form1 {
            height: 230px;
            width: 1299px;
        }
        .auto-style1 {
            width: 281px;
        }
        .auto-style13 {
            width: 47px;
        }
        body {
            background-color:rgb(230, 255, 255);
        }
        </style>
</head>
<body style="width: 1288px; height: 85px; margin-bottom: 10px;">
    <form id="form1" runat="server">
    <asp:Image ID="Image1" runat="server" Height="123px" ImageUrl="~/images/monaco.png" Width="263px" />
    <h1 style="text-align:center;color:rgb(255, 102, 0);font-family:Verdana">
        Monaco Healthcare Web Service</h1>
    <h2 style="text-align:center;color:rgb(0, 122, 204);font-family:Verdana">Receive new patient</h2>
        <fieldset><legend><strong>Tiếp nhận thông tin bệnh nhân</strong></legend>
            <table id="Table1" style="height:214px;width:1300px">
                <tr>
                    <td>ID-MSYT</td>
                    <td colspan="2">
                        <asp:TextBox ID="id_default" runat="server" Text="MH" Width="70" ForeColor="Blue"></asp:TextBox><asp:TextBox ID="id" Width="121" runat="server"></asp:TextBox><asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/images.png" Width="20" Height="20" ImageAlign="Middle"/></td>
                    <td>Giới Tính</td>
                    <td>
                        <asp:RadioButtonList ID="gioitinh" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Text="Nam" Value="nam"></asp:ListItem>
                            <asp:ListItem Text="Nữ" Value="nu"></asp:ListItem>
                        </asp:RadioButtonList></td>
                    <td>Số thứ tự</td>
                    <td><asp:TextBox ID="stt" runat="server" Width="70"></asp:TextBox></td>
                    <td>Địa chỉ</td>
                    <td class="auto-style1"><asp:TextBox ID="diachi" runat="server" Width="220"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Họ tên</td>
                    <td colspan="2">
                        <asp:TextBox ID="hoten" runat="server" Width="200"></asp:TextBox><asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/images/images.png" Width="20" Height="20" ImageAlign="Middle"/></td>
                    <td>Điện thoại</td>
                    <td><asp:TextBox ID="dienthoai" runat="server" Width="180"></asp:TextBox></td>
                    <td>Giờ tiếp nhận</td>
                    <td><asp:DropDownList ID="giotiepnhan" runat="server" Width="176px" Height="17px">
                            <asp:ListItem Text="27/06/2016 12:00:00"></asp:ListItem>
                        </asp:DropDownList></td>
                    <td>Phường/Xã</td>
                    <td class="auto-style1"><asp:TextBox ID="phuongxa" runat="server" Width="220"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Ngày sinh</td>
                    <td style="width:200px">
                        <asp:TextBox ID="ngaysinh" runat="server" Width="130"></asp:TextBox><asp:TextBox ID="tuoi" runat="server" Width="50"></asp:TextBox></td>
                    <td style="text-align:left" class="auto-style13">Tuổi</td>
                    <td>Email</td>
                    <td><asp:TextBox ID="email" runat="server" Width="180"></asp:TextBox></td>
                    <td>Số CMND</td>
                    <td><asp:TextBox ID="cmnd" runat="server" Width="173"></asp:TextBox></td>
                    <td>Quận/Huyện</td>
                    <td class="auto-style1"><asp:TextBox ID="quanhuyen" runat="server" Width="220"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Lý do tiếp nhận</td>
                    <td colspan="2">
                        <asp:DropDownList ID="lydotiepnhan" runat="server" Width="235">
                            <asp:ListItem Text="Khám bệnh"></asp:ListItem>
                        </asp:DropDownList></td>
                    <td>Đối tượng</td>
                    <td><asp:DropDownList ID="doituong" runat="server" Width="184px" Height="18px">
                        <asp:ListItem Text="Example"></asp:ListItem>
                        </asp:DropDownList></td>
                    <td>Nơi giới thiệu</td>
                    <td><asp:TextBox ID="noigioithieu" runat="server" Width="173"></asp:TextBox></td>
                    <td>Tỉnh/Thành</td>
                    <td class="auto-style1">
                        <asp:DropDownList ID="tinhthanh" runat="server" Width="224px" Height="18px"> 
                            <asp:ListItem Text="Hồ Chí Minh"></asp:ListItem>
                            <asp:ListItem Text="Huế"></asp:ListItem>
                            <asp:ListItem Text="Hà Nội"></asp:ListItem>
                        </asp:DropDownList></td>
                </tr>
                <tr>
                    <td>Hình thức đến</td>
                    <td colspan="2">
                        <asp:DropDownList ID="hinhthucden" runat="server" Width="235">
                            <asp:ListItem Text="Tự đến"></asp:ListItem>
                            <asp:ListItem Text="Được giới thiệu"></asp:ListItem>
                        </asp:DropDownList></td>
                    <td>ĐT chi tiết</td>
                    <td><asp:DropDownList ID="dtchitiet" runat="server" Width="184px" Height="17px">
                        <asp:ListItem Text="Example"></asp:ListItem>
                        </asp:DropDownList></td>
                    <td>Người liên hệ</td>
                    <td><asp:TextBox ID="nguoilienhe" runat="server" Width="173"></asp:TextBox></td>
                    <td>Quốc tịch</td>
                    <td class="auto-style1">
                        <asp:DropDownList ID="quoctich" runat="server" Width="224px" Height="16px">
                            <asp:ListItem Text="Việt Nam"></asp:ListItem>
                            <asp:ListItem Text="United State Of America"></asp:ListItem>
                            <asp:ListItem Text="Finland"></asp:ListItem>
                        </asp:DropDownList></td>
                </tr>
            </table>
        </fieldset><br /><br />
        <fieldset style="width: 1300px; height: auto;"><legend><strong>Thông tin khám bệnh</strong></legend>
            <table id="Table2" style="width:1299px; height: 185px; margin-top: 0px;">
               <tr>
                    <td rowspan="3" style="width:80px">Mã dịch vụ</td>
                    <td rowspan="3" style="width:100px"><asp:TextBox ID="madichvu" runat="server" Width="60" AutoPostBack="True" OnTextChanged="madichvu_TextChanged"></asp:TextBox><asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/images/list.png" Width="20" Height="20" ImageAlign="Middle"/></td>
                    <td style="width:90px">Nơi thực hiện</td>
                    <td style="width:200px">
                        <asp:DropDownList ID="noithuchien" runat="server" Width="141px">
                            <asp:ListItem Text="Phòng Khám Ngoại"></asp:ListItem>
                            <asp:ListItem Text="Phòng Khám Nội"></asp:ListItem>
                        </asp:DropDownList></td>
                    <td style="width:60px">Giảm</td>
                    <td style="width:60px"><asp:TextBox ID="giam" runat="server" Text="0" Width="44px" style="text-align:center"></asp:TextBox></td>
                    <td style="width:20px">%</td>
                </tr>
                <tr>
                    <td rowspan="2">Loại giá</td>
                    <td rowspan="2"><asp:DropDownList ID="loaigia" runat="server" Width="141px">
                                        <asp:ListItem Text="200"></asp:ListItem>
                                        <asp:ListItem Text="300"></asp:ListItem>
                                    </asp:DropDownList></td>
                    <td>Số lượng</td>
                    <td style="margin-left:5px"><asp:TextBox ID="soluong" runat="server" Width="44" Text="1"  style="text-align:center"></asp:TextBox></td>
                    <td style="color:red""><strong>x</strong></td>
                    <td style="width:70px"><asp:TextBox ID="giathuoc" runat="server" Text="0" Width="70"></asp:TextBox></td>
                    <td style="color:red; text-align:center; width:20px"><strong>=</strong></td>
                    <td><asp:TextBox ID="ketqua1" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td colspan="3" style="text-align:center">Giá cho phép</td>
                    <td>
                        <asp:TextBox ID="giachophep" runat="server" Width="70"></asp:TextBox></td>
                    <td style="color:blue"><strong><=</strong></td>
                    <td style="width:60px"><asp:TextBox ID="ketqua2" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Tên dịch vụ</td>
                    <td colspan="9" style="width:300px"><asp:TextBox ID="tendichvu" runat="server" Width="400px" AutoPostBack="True"></asp:TextBox></td>
                    <td rowspan="2" style="width:90px">
                        <asp:ImageButton ID="submitBtn" runat="server" OnClick="addService" height="50" Width="50" ImageUrl="~/images/submitBtn.png" /></td>
                    <td rowspan="2" style="width:90px">
                        <asp:ImageButton ID="ImageButton4" runat="server" OnClick="newPatient" height="60" Width="60" ImageUrl="~/images/save.png" />
                </tr>
            </table>
        </fieldset>
        <p></p>
        
        <asp:GridView id = "grid" DataKeyNames="PAT_SER_ID" runat = "server"
            bodercolor="black"
            cellpadding="5"
            headerstyle-forecolor="White"
            headerstyle-font-bold="true"
            headerstyle-backcolor="Navy"
            alternatingitemstyle-backcolor="lightblue"
            onrowdeleting="gridView_RowDeleting" AutoGenerateDeleteButton="True">
        </asp:GridView>  
    </form>
</body>
</html>
