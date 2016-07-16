<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TiepNhan.aspx.cs" Inherits="iClinic_Online_System.WebForm1" %>
<% @ Import Namespace = "System.Data" %>
<% @ Import Namespace = "System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Trang Chu</title>
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

    <div>
        <asp:GridView id="grid" runat="server"
            showheader="true"
            bodercolor="black"
            cellpadding="5"
            headerstyle-forecolor="White"
            headerstyle-font-bold="true"
            headerstyle-backcolor="Navy"
            width="100%"
            style="text-align:center"
        />
	</div>
    </form>
    </body>
</html>
