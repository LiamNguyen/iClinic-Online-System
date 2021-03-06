﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormTiepNhan.aspx.cs" Inherits="iClinic_Online_System.FormTiepNhan" %>
<% @ Import Namespace = "System.Data" %>
<% @ Import Namespace = "System.Data.OleDb" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ PreviousPageType VirtualPath="~/DanhSachDichVu.aspx" %>


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

        .Background
        {
            background-color: Black;
            filter: alpha(opacity=90);
            opacity: 0.8;
        }
        .Popup
        {
            background-color: #FFFFFF;
            border-width: 3px;
            border-style: solid;
            border-color: black;
            padding-top: 10px;
            padding-left: 10px;
            width: 400px;
            height: 350px;
        }
        </style>
</head>
<body style="width: 1288px; height: 85px; margin-bottom: 10px;">
    <form id="form1" runat="server">
    <asp:Image ID="Image1" runat="server" Height="123px" ImageUrl="~/images/monaco.png" Width="263px" />
    <h1 style="text-align:center;color:rgb(255, 102, 0);font-family:Verdana">
        Monaco Healthcare Web Service</h1>
    <h2 style="text-align:center;color:rgb(0, 122, 204);font-family:Verdana">Receive new patient</h2>
        <fieldset style="width: 1210px"><legend><strong>Thông tin bệnh nhân</strong></legend>
            <table id="Table1" style="height:130px;width:1100px">
                <tr>
                    <td>ID-MSYT</td>
                    <td colspan="2">
                        <asp:TextBox ID="id_default" runat="server" Text="MH" Width="70" ForeColor="Blue"></asp:TextBox><asp:TextBox ID="id" Width="121" runat="server"></asp:TextBox><asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/images.png" Width="20" Height="20" ImageAlign="Middle"/></td>
                    <td>Giới Tính</td>
                    <td>
                        <asp:RadioButtonList ID="gioitinh" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Text="Nam" Value="nam"></asp:ListItem>
                            <asp:ListItem Text="Nữ" Value="nu"></asp:ListItem>
                        </asp:RadioButtonList>
                     </td>
                    <td><asp:CheckBox ID="married" Text="Đã Kết Hôn" runat="server" /></td>
                    <td>Địa chỉ</td>
                    <td class="auto-style1"><asp:TextBox ID="diachi" runat="server" Width="220"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Họ tên</td>
                    <td colspan="2">
                        <asp:TextBox ID="hoten" runat="server" Width="200"></asp:TextBox><asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/images/images.png" Width="20" Height="20" ImageAlign="Middle"/></td>
                    <td>Số CMND</td>
                    <td colspan="2"><asp:TextBox ID="cmnd" runat="server" Width="190"></asp:TextBox></td>
                    <td>Phường/Xã</td>
                    <td class="auto-style1"><asp:TextBox ID="phuongxa" runat="server" Width="220"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Ngày sinh</td>
                    <td style="width:200px">
                        <asp:TextBox ID="ngaysinh" runat="server" Width="130" AutoPostBack="True" OnTextChanged="ngaysinh_TextChanged"></asp:TextBox><asp:TextBox ID="tuoi" runat="server" Width="50"></asp:TextBox></td>
                    <td style="text-align:left" class="auto-style13">Tuổi</td>
                    <td>Nơi Giới Thiệu</td>
                    <td colspan="2"><asp:TextBox ID="noigioithieu" runat="server" Width="190"></asp:TextBox></td>
                    <td>Quận/Huyện</td>
                    <td class="auto-style1"><asp:TextBox ID="quanhuyen" runat="server" Width="220"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Điện thoại</td>
                    <td colspan="2"><asp:TextBox ID="dienthoai" runat="server" Width="225"></asp:TextBox></td>
                    <td>Người Liên Hệ</td>
                    <td colspan="2"><asp:TextBox ID="nguoilienhe" runat="server"></asp:TextBox></td>
                    <td>Tỉnh/Thành</td>
                    <td class="auto-style1">
                        <asp:DropDownList ID="tinhthanh" runat="server" Width="224px" Height="18px"> 
                            <asp:ListItem Text="Hồ Chí Minh"></asp:ListItem>
                            <asp:ListItem Text="Huế"></asp:ListItem>
                            <asp:ListItem Text="Hà Nội"></asp:ListItem>
                        </asp:DropDownList></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td colspan="5"><asp:TextBox ID="email" runat="server" Width="180"></asp:TextBox></td>
                    <td>Quốc tịch</td>
                    <td class="auto-style1">
                        <asp:DropDownList ID="quoctich" runat="server" Width="224px" Height="16px">
                            <asp:ListItem Text="Việt Nam"></asp:ListItem>
                            <asp:ListItem Text="United State Of America"></asp:ListItem>
                            <asp:ListItem Text="Finland"></asp:ListItem>
                        </asp:DropDownList></td>
                </tr>
            </table>
        </fieldset><br />
        <fieldset style="width: 1210px"><legend><strong>Thông tin tiếp nhận</strong></legend>
            <table id="Table2" style="width:1000px">
                <tr>
                    <td>Lý Do Tiếp Nhận</td>
                    <td><asp:DropDownList ID="lydotiepnhan" runat="server">
                            <asp:ListItem Text="Khám bệnh"></asp:ListItem>
                            <asp:ListItem Text="Cấp cứu"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>Đối tượng</td>
                    <td>
                        <asp:DropDownList ID="doituong" runat="server">
                            <asp:ListItem Text="Khám Dịch Vụ"></asp:ListItem>
                            <asp:ListItem Text="Khám Sức Khỏe"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>Số Thứ Tự</td>
                    <td><asp:TextBox ID="sothutu" runat="server"></asp:TextBox></td>
                    <td>Giờ Tiếp Nhận</td>
                    <td><asp:TextBox ID="giotiepnhan" runat="server" Width="160px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Hình Thức Đến</td>
                    <td>
                        <asp:DropDownList runat="server">
                            <asp:ListItem Text="Tự Đến"></asp:ListItem>
                            <asp:ListItem Text="Dẫn Bệnh"></asp:ListItem>
                            <asp:ListItem Text="Khác"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>ĐT Chi Tiết</td>
                    <td>
                        <asp:DropDownList runat="server">
                            <asp:ListItem Text="Khám Dịch Vụ"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>Gói Khám</td>
                    <td colspan="3">
                        <asp:DropDownList runat="server" Width="430">
                            <asp:ListItem Text=""></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
        </fieldset> <br/>
        <asp:ScriptManager ID="ScriptManager1" runat="server" ></asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <fieldset style="width: 1210px; height: auto;"><legend><strong>Thông tin dịch vụ</strong></legend>
                    <table id="Table3" style="width:1100px; margin-top: 0px;">
                       <tr>
                            <td rowspan="3" style="width:80px">Mã dịch vụ</td>
                            <td rowspan="3" style="width:100px"><asp:TextBox ID="MaDichVuTxtBox" runat="server" Width="60" AutoPostBack="True" OnTextChanged="madichvu_TextChanged"></asp:TextBox><asp:ImageButton ID="PopUpServiceListBtn" runat="server" ImageUrl="~/images/list.png" Width="20" Height="20" ImageAlign="Middle"/></td>
                            <td style="width:90px">Nơi thực hiện</td>
                            <td style="width:200px">
                                <asp:DropDownList ID="noithuchien" runat="server" Width="141px">
                                    <asp:ListItem Text="Phòng Khám Ngoại"></asp:ListItem>
                                    <asp:ListItem Text="Phòng Khám Nội"></asp:ListItem>
                                </asp:DropDownList></td>
                            <td style="width:60px">Giảm</td>
                            <td style="width:60px"><asp:TextBox ID="GiamTxtBox" runat="server" Text="0" Width="44px" style="text-align:center"></asp:TextBox></td>
                            <td style="width:20px">%</td>
                        </tr>
                        <tr>
                            <td rowspan="2">Loại giá</td>
                            <td rowspan="2"><asp:DropDownList ID="loaigia" runat="server" Width="141px">
                                                <asp:ListItem Text="200"></asp:ListItem>
                                                <asp:ListItem Text="300"></asp:ListItem>
                                            </asp:DropDownList></td>
                            <td>Số lượng</td>
                            <td style="margin-left:5px"><asp:TextBox ID="SoLuongTxtBox" runat="server" Width="44" Text="1"  style="text-align:center"></asp:TextBox></td>
                            <td style="color:red""><strong>x</strong></td>
                            <td style="width:70px"><asp:TextBox ID="DonGiaTxtBox" runat="server" Text="0" Width="70"></asp:TextBox></td>
                            <td style="color:red; text-align:center; width:20px"><strong>=</strong></td>
                            <td><asp:TextBox ID="ketqua1" runat="server"></asp:TextBox></td>
                            <td rowspan="2" style="width:70px">
                                <asp:ImageButton ID="newService" runat="server" OnClick="addService" height="50" Width="50" ImageUrl="~/images/submitBtn.png" /></td>
                            <td rowspan="2" style="width:90px">
                                <asp:ImageButton ID="addPatient" runat="server" OnClick="newPatient" OnClientClick="return test()" height="60" Width="60" ImageUrl="~/images/save.png" /></td>
                
                        </tr>
                        <tr>
                            <td colspan="3" style="text-align:center">Giá cho phép</td>
                            <td>
                                <asp:TextBox ID="GiaChoPhepTxtBox" runat="server" Width="70"></asp:TextBox></td>
                            <td style="color:blue"><strong><=</strong></td>
                            <td style="width:60px"><asp:TextBox ID="ketqua2" runat="server"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>Tên dịch vụ</td>
                            <td colspan="9" style="width:300px"><asp:TextBox ID="TenDichVuTxtBox" runat="server" Width="400px" AutoPostBack="True"></asp:TextBox></td>
                        </tr>
                    </table>
                </fieldset>

            <p>
                <asp:Label ID="test" runat="server" Text="Label"></asp:Label>
            </p>
        
                <asp:GridView id = "grid" DataKeyNames="PAT_SER_ID" runat = "server"
                bodercolor="black"
                cellpadding="5"
                headerstyle-forecolor="White"
                headerstyle-font-bold="true"
                headerstyle-backcolor="Navy"
                alternatingitemstyle-backcolor="lightblue"
                AutoGenerateColumns="false">
                    <Columns>
                        <asp:TemplateField HeaderText="Mã Dịch Vụ">
                            <ItemTemplate>
                                <asp:Label ID="lblPatSerId" runat="server" Text='<%# Eval("PAT_SER_ID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Số Lượng">
                            <ItemTemplate>
                                <asp:Label ID="lblQuantity" runat="server" Text='<%# Eval("QUANTITY") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Giảm Giá(%)">
                            <ItemTemplate>
                                <asp:Label ID="lblPercentDown" runat="server" Text='<%# Eval("PERCENT_DOWN") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Đơn Giá">
                            <ItemTemplate>
                                <asp:Label ID="lblPrice" runat="server" Text='<%# Eval("PRICE") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="removeService" runat="server" OnClick="gridView_RowDeleting"
                                    OnClientClick="return confirm('Are you sure you want to delete this service?')" Text="Delete"
                                    CommandArgument='<%# Eval("PAT_SER_ID") %>'></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            

        <cc1:ModalPopupExtender ID="mp1" runat="server" PopupControlID="Panl1" TargetControlID="PopUpServiceListBtn"
            CancelControlID="closeModalPopUp" BackgroundCssClass="Background">
        </cc1:ModalPopupExtender>
        <asp:Panel ID="Panl1" runat="server" CssClass="Popup" align="center" style = "display:none">
            <iframe style=" width: 350px; height: 300px;" id="irm1" src="DanhSachDichVu.aspx" runat="server"></iframe>
           <br/>
            <asp:Button ID="closeModalPopUp" onClientClick="passValueToSrcPage()" runat="server" Text="Close" />
        </asp:Panel>
                </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="newService" />
            </Triggers>
        </asp:UpdatePanel>

        <asp:HiddenField ID="hdValue" runat="server" />

        <script type="text/javascript">
            var id = "";

            function alertPopUp(alertMessage) {
                alert(alertMessage);
                return false;
            }

            function clearTxtBox() {
                document.getElementById("MaDichVuTxtBox").value = "";
                document.getElementById("TenDichVuTxtBox").value = "";
            }

            function passValueToSrcPage() {
                var maDichVu = document.getElementById("MaDichVuTxtBox");
                id = window.sessionStorage.getItem("PAT_SER_ID");
                maDichVu.value = id;
            }
        </script>
    </form>
</body>
</html>
