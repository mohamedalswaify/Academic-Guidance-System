<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAdmin.Master" AutoEventWireup="true" CodeBehind="Page_Admin11.aspx.cs" Inherits="Academic.PagesAdmin.Page_Admin11" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <style>
    #page12{
            color:#dc3545;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="div-basic d-flex justify-content-center w-100 mt-4">
            <div class="div-emelment shedow ">
                <h4 class="text-dark">تعديل كلمة المـــرور</h4>

                <div class="mt-4 p-1 card card-outline-secondary shedow">
                    <div class="card-body">
                        <form class="form" runat="server" role="form" autocomplete="off">
                            <div class="form-outline mb-4">
                                <asp:TextBox ID="txtOldPassword" runat="server" placeholder="كلمة المرور القديمة"
                                    class="form-control form-control-lg text-end" TextMode="Password" required></asp:TextBox>
                            </div>
                            <div class="form-outline mb-4">
                                <asp:TextBox ID="txtNewPassword" runat="server" placeholder="كلمة المرور الجديدة"
                                    class="form-control form-control-lg text-end" TextMode="Password" required></asp:TextBox>
                            </div>
                            <div class="form-outline mb-4">
                                <asp:TextBox ID="txtConfirmPassword" runat="server" placeholder="تأكيد كلمة المرور"
                                    class="form-control form-control-lg text-end" TextMode="Password"  required ></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:Button ID="Button1" class="btn btn-danger  w-25 btn-lg float-right" runat="server" Text="حفـــظ" OnClick="Button1_Click" />
                            </div>
                             <div class="text-center mt-4">
                        <asp:Panel ID="pEmpty" Visible="false"  CssClass="alert alert-danger" runat="server"><asp:Label ID="lblerror" runat="server" Text=""></asp:Label></asp:Panel>
                            </div>
                              <div class="text-center mt-4">
                        <asp:Panel ID="Panel1" Visible="false"  CssClass="alert alert-success" runat="server">تم تعـــديل كلمة المرور الخاصة بك بنجاح</asp:Panel>
                      </div>
                        </form>
                    </div>
                </div>
                <!-- /form card change password -->

            </div>
        </div>
    <script>
        window.onload = function () {
            var element = document.getElementById("show2");
            element.classList.add("show");
        };
    </script>
</asp:Content>
