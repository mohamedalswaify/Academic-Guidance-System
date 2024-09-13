<%@ Page Title="" Language="C#" MasterPageFile="~/MasterStudent.Master" AutoEventWireup="true" CodeBehind="Page_Student2.aspx.cs" Inherits="Academic.PagesStudent.Page_Student2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
    #page2{
            color:#198754;
        }
        </style>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="div-basic d-flex justify-content-center w-100 mt-4">
            <div class="div-emelment shedow ">
                <!-- <create here GradView> -->
                <h4 class="text-dark">مقررات الترم الحالي</h4>
                <form runat="server">
                <span> اجمالي المواد : <asp:Label ID="lblTotal" runat="server" Text="0"></asp:Label></span><br>
                <span> اختر الترم :
                        <asp:DropDownList CssClass="select" AutoPostBack="true" SelectionMode="Single"  ID="ddlTerm" runat="server">
                            <asp:ListItem Value="1" >الترم الاول</asp:ListItem>
                            <asp:ListItem Value="2">الترم الثاني</asp:ListItem>
                            <asp:ListItem Value="3">الترم الصيفي</asp:ListItem>
                        </asp:DropDownList>
                </span><br>
                <div class="div-table">     
                    <!-- <create here GradView> -->
                        <asp:GridView class="table" ID="DgvStudent" runat="server"></asp:GridView>
                </div>
                    <div class="text-center">
                        <asp:Panel ID="pEmpty"  CssClass="alert alert-danger" runat="server">لايوجد مقررات قي ذلك الترم</asp:Panel>
                </div>
            </div>
          </form>
        </div>
     <script>
         window.onload = function () {
             var element = document.getElementById("show");
             element.classList.add("show");
         };
     </script>
</asp:Content>
