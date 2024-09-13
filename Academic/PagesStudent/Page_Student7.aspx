<%@ Page Title="" Language="C#" MasterPageFile="~/MasterStudent.Master" AutoEventWireup="true" CodeBehind="Page_Student7.aspx.cs" Inherits="Academic.PagesStudent.Page_Student7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
    #page7{
            color:#198754;
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
