<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAdmin.Master" AutoEventWireup="true" CodeBehind="Page_Admin13.aspx.cs" Inherits="Academic.PagesAdmin.Page_Admin13" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #page13 {
            color: #dc3545;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="div-basic d-flex justify-content-center w-100 mt-4">
        <div class="div-emelment2 shedow ">
            <form runat="server">
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <i class="fa fa-unlock-alt" aria-hidden="true" style="font-size: 30px"></i>
                <h4 class="text-dark" style="font-size: 20px; margin-bottom: 20px; display: inline-block;">صلاحــــيات المرشد
                </h4>
            </form>
        </div>
    </div>
    <script>
        window.onload = function () {
            var element = document.getElementById("show2");
            element.classList.add("show");
        };
    </script>
</asp:Content>
