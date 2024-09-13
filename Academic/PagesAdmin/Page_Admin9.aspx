<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAdmin.Master" AutoEventWireup="true" CodeBehind="Page_Admin9.aspx.cs" Inherits="Academic.PagesAdmin.Page_Admin9" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
    #page9{
            color:#dc3545;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script>
         window.onload = function () {
             var element = document.getElementById("show2");
             element.classList.add("show");
         };
    </script>
</asp:Content>
