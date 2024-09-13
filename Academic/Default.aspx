<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head runat="server">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!--Bootstrap-->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">

    <!--StyleSheet-->
    <link rel="stylesheet" href="css/bootstrap.min.css">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!--Font awesome-->
    <link rel="stylesheet" href="css/all.min.css">

    <link rel="stylesheet" href="css/style.css">
    <title>المعهد العالي للدراسات المتطورة-الصحفحة الرئيسية</title>
</head>
<body>
    <div class="container">
        <section class="vh-100">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col col-xl-10">
                        <div class="card" style="border-radius: 1rem;">
                            <div class="row g-0">
                                <div class="col-md-6 col-lg-5 d-none d-md-block bck-img">
                                </div>
                                <div class="col-md-6 col-lg-7 d-flex align-items-center ">
                                    <div class="card-body p-4 p-lg-5 text-black text-end">
                                        <form id="form1" runat="server">
                                            <div
                                                class="d-flex align-items-center mb-3 pb-4 text-end justify-content-center">
                                                <span class="h1 fw-bold mb-0 logo">تسجيل الدخول</span>
                                                <i class="fa-solid fa-graduation-cap text-success"
                                                    style="font-size: 40px;"></i>

                                                <br>
                                            </div>

                                            <h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">تسجيل الدخول الى حسابك</h5>
                                            <div class="form-outline mb-4">
                                                <asp:TextBox ID="txtuser" runat="server" placeholder="اسم المستخدم"
                                                    class="form-control form-control-lg text-end" required></asp:TextBox>

                                            </div>

                                            <div class="form-outline mb-4">
                                                 <asp:TextBox ID="txtpassword" runat="server" class="form-control form-control-lg text-end"
                                                    placeholder="كلمة المرور" autocomplete="off" required TextMode="Password" ></asp:TextBox>
                                            </div>

                                            <div class="pt-1 mb-4">
                                                <asp:Button ID="btnLogin" runat="server" Text=" تسجيل دخول"  class="btn w-100 btn-success btn-lg btn-block" OnClick="btnLogin_Click" />
                                            </div>
                                        </form>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <script src="js/popper.min.js"></script>
    <script src="js/jquery-3.6.3.min.js"></script>
    <script src="js/all.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</body>
</html>
