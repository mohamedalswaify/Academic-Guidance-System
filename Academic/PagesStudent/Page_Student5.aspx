<%@ Page Title="" Language="C#" MasterPageFile="~/MasterStudent.Master" AutoEventWireup="true" CodeBehind="Page_Student5.aspx.cs" Inherits="Academic.PagesStudent.Page_Student5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
    #page5{
            color:#198754;
        }
    .div-emelment span{
        font-size:18px
    }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="div-basic d-flex justify-content-center w-100 mt-4">
            <div class="div-emelment shedow ">
                <!-- <create here GradView> -->
                <h4 class="text-dark">ملفي الشخصي</h4>
                <section>
                    <div class="container py-5">
                        <div class="row">
                            <div class="col-lg-4">
                                <div class="card mb-4">
                                    <div class="card-body text-center">
                                        <img src="../img/Dashboard/Student.png"
                                            alt="avatar" class="rounded-circle img-fluid" style="width: 150px;">
                                        <h5 class="my-3"><asp:Label ID="lblName" runat="server" Text="Label"></asp:Label></h5>
                                        <p class="text-muted mb-1"><asp:Label ID="lblStudentCode" runat="server" Text="Label"></asp:Label></p>
                                        <p class="text-muted mb-4"><asp:Label ID="lblDepartment" runat="server" Text="Label"></asp:Label></p>
                                    </div>
                                </div>

                            </div>
                            <div class="col-lg-8">
                                <div class="card mb-4">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-sm-3">
                                                <p class="mb-0">البريد الالكتورني</p>
                                            </div>
                                            <div class="col-sm-9">
                                                <p class="text-muted mb-0"><asp:Label ID="lblEmail" runat="server" Text="Label"></asp:Label></p>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row">
                                            <div class="col-sm-3">
                                                <p class="mb-0">الهاتف</p>
                                            </div>
                                            <div class="col-sm-9">
                                                <p class="text-muted mb-0"><asp:Label ID="lblPhone" runat="server" Text="Label"></asp:Label></p>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row">
                                            <div class="col-sm-3">
                                                <p class="mb-0">الرقم القومي</p>
                                            </div>
                                            <div class="col-sm-9">
                                                <p class="text-muted mb-0"><asp:Label ID="lblNational" runat="server" Text="lblN"></asp:Label></p>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row">
                                            <div class="col-sm-3">
                                                <p class="mb-0">المعدل التراكمي</p>
                                            </div>
                                            <div class="col-sm-9">
                                                <p class="text-muted mb-0"><asp:Label ID="lblGPA" runat="server" Text="Label"></asp:Label></p>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row">
                                            <div class="col-sm-3">
                                                <p class="mb-0">عدد مواد النجاح</p>
                                            </div>
                                            <div class="col-sm-9">
                                                <p class="text-muted mb-0"><asp:Label ID="lblSeccess" runat="server" Text="Label"></asp:Label></p>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row">
                                            <div class="col-sm-3">
                                                <p class="mb-0">عدد مواد الرسوب</p>
                                            </div>
                                            <div class="col-sm-9">
                                                <p class="text-muted mb-0"><asp:Label ID="lblFull" runat="server" Text="Label"></asp:Label></p>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row">
                                            <div class="col-sm-3">
                                                <p class="mb-0">عدد مواد قمت بدراستها</p>
                                            </div>
                                            <div class="col-sm-9">
                                                <p class="text-muted mb-0"><asp:Label ID="lbltotal" runat="server" Text="Label"></asp:Label></p>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row">
                                            <div class="col-sm-3">
                                                <p class="mb-0">عدد المواد المتبقية</p>
                                            </div>
                                            <div class="col-sm-9">
                                                <p class="text-muted mb-0"<asp:Label ID="lblfill" runat="server" Text="Label"></asp:Label></p>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row">
                                            <div class="col-sm-3">
                                                <p class="mb-0">عدد المواد الاجباري</p>
                                            </div>
                                            <div class="col-sm-9">
                                                <p class="text-muted mb-0"<asp:Label ID="lblMandtory" runat="server" Text="Label"></asp:Label></p>
                                            </div>
                                        </div>
                                         <hr>
                                         <div class="row">
                                            <div class="col-sm-3">
                                                <p class="mb-0">عدد المواد الاختياري</p>
                                            </div>
                                            <div class="col-sm-9">
                                                <p class="text-muted mb-0"<asp:Label ID="lblchoess" runat="server" Text="Label"></asp:Label></p>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row">
                                            <div class="col-sm-3">
                                                <p class="mb-0">المواد الاجباري المدروسة</p>
                                            </div>
                                            <div class="col-sm-9">
                                                <p class="text-muted mb-0"<asp:Label ID="lbltotalmandtory" runat="server" Text="Label"></asp:Label></p>
                                            </div>
                                        </div>
                                        <hr>
                                         <div class="row">
                                            <div class="col-sm-3">
                                                <p class="mb-0">المواد الاختياري المدروسة</p>
                                            </div>
                                            <div class="col-sm-9">
                                                <p class="text-muted mb-0"<asp:Label ID="lbltotalChoess" runat="server" Text="Label"></asp:Label></p>
                                            </div>
                                        </div>
                                        <hr>
                                         <div class="row">
                                            <div class="col-sm-3">
                                                <p class="mb-0">الساعات المطلوبة</p>
                                            </div>
                                            <div class="col-sm-9">
                                                <p class="text-muted mb-0"<asp:Label ID="lblHour" runat="server" Text="Label"></asp:Label></p>
                                            </div>
                                        </div>
                                        <hr>
                                         <div class="row">
                                            <div class="col-sm-3">
                                                <p class="mb-0">الساعات المدروسة</p>
                                            </div>
                                            <div class="col-sm-9">
                                                <p class="text-muted mb-0"<asp:Label ID="lblHourT" runat="server" Text="Label"></asp:Label></p>
                                            </div>
                                        </div>
                                        <hr>
                                         <div class="row">
                                            <div class="col-sm-3">
                                                <p class="mb-0">الساعات المتبقية</p>
                                            </div>
                                            <div class="col-sm-9">
                                                <p class="text-muted mb-0"<asp:Label ID="lblHourB" runat="server" Text="Label"></asp:Label></p>
                                            </div>
                                        </div>
                                       
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
     <script>
         window.onload = function () {
             var element = document.getElementById("show2");
             element.classList.add("show");
         };
     </script>
</asp:Content>
