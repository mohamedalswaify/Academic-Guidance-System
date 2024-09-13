<%@ Page Title="" Language="C#" MasterPageFile="~/MasterStudent.Master" AutoEventWireup="true" CodeBehind="Page_Student1.aspx.cs" Inherits="Academic.Page_Student1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #page1{
            color:#198754;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="div-basic d-flex justify-content-center w-100 mt-4">
            <div class="div-emelment shedow ">
                <h4 class="text-dark">مقررات قمت بدراستها</h4>
                <span> اجمالي المواد : <asp:Label ID="lbltotal" runat="server" Text="0"></asp:Label></span><br>
                <span>اجمالي مواد النجاح: <asp:Label ID="lblSeccess" runat="server" Text="0"></asp:Label></span><br>
                <span>اجمالي مواد الرسوب: <asp:Label ID="lblfuluer" runat="server" Text="0"></asp:Label></span><br>
                <form runat="server">
                <div class="div-table">
                <!-- <create here GradView> -->
                    <asp:GridView ID="DgvStudent" class="table" runat="server"  >
                      
                    </asp:GridView>
                </div>
                    </form>
                <!-- <create here GradView> -->
            </div>
        </div>

     <script>
         window.onload = function () {
             var element = document.getElementById("show");
             element.classList.add("show");
         };
     </script>
</asp:Content>
