<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAdvisor.Master" AutoEventWireup="true" CodeBehind="Page_Advisor3.aspx.cs" Inherits="Academic.PagesAdvisor.Page_Advisor3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10.16.6/dist/sweetalert2.min.css" />
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.16.6/dist/sweetalert2.min.js"></script>
         <style>
        #page3{
            color:#f0ad4e;
        }
        .swal2-styled.swal2-confirm{
       background:#E4A11B;
   }
   .swal2-icon.swal2-success [class^=swal2-success-line]{
       background:#E4A11B
   }
   .swal2-styled:focus{
           box-shadow: 0 0 0 3px rgba(100,150,200,.5);
   }
   .swal2-icon.swal2-success .swal2-success-ring{
       border: 0.25em solid #E4A11B;
   }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="div-basic d-flex justify-content-center w-100 mt-4">
            <div class="div-emelment2 shedow ">
                <i class="fa fa-comments" style="font-size:40px"></i>
                <h4 class="text-dark" style="font-size: 20px;display: inline-block; margin-bottom: 20px;">مراسلة طلابــــي</h4><br />
                <form runat="server">
                <span> بحث عن طلاب فرقة :
                        <asp:DropDownList ID="ddlLevel" class="select" runat="server" AutoPostBack="true" DataSourceID="DataLevel" DataTextField="LevelName" DataValueField="LevelID">
                         </asp:DropDownList>
                       <hr class="text-success" />
                         <asp:SqlDataSource runat="server" ID="DataLevel" ConnectionString='<%$ ConnectionStrings:AcademicDBConnectionString %>' SelectCommand="SELECT [LevelID], [LevelName] FROM [Levels]"></asp:SqlDataSource>
                </span><br>
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                <asp:Panel ID="Pval" Visible="true"  runat="server">
                <asp:Panel ID="pEmpty" Visible="true"  CssClass="alert alert-warning text-center mt-3 p-0" runat="server">سيتم ارسال نص االرسالة الى طلاب الفرقة <asp:Label runat="server" ID="lblTitle" Text="الاولى"></asp:Label></asp:Panel>
                <div class="form-outline mb-1 col-md-8 col-12">
                        <asp:TextBox  ID="txthoer" runat="server" class="form-control"  placeholder="من فضلك ادخل عدد نص الرسالة" required Height="252px" TextMode="MultiLine" ></asp:TextBox>
                    </div>
                        <div  class="pt-3 col-8 d-flex justify-content-end  ">
                            <asp:Button OnClientClick="showSweetAlert()" ID="btnAdd" class="btn w-25 btn-warning  btn-lg btn-block"  runat="server" Text="ارســــال" OnClick="btnAdd_Click"  />
                        </div>
                    </asp:Panel>
                        </ContentTemplate>
                    </asp:UpdatePanel>

                    </form>
            </div>
       </div>
    
    <script>
         window.onload = function () {
             var element = document.getElementById("show");
             element.classList.add("show");
        };
        function showSweetAlert() {
            // استدعاء Sweet Alert
            Swal.fire({
                title: 'تنبية هام!',
                text: 'تم ارســـال الرسالة بنجاح',
                icon: 'success',
                confirmButtonText: 'حسناً'
            })
        }
    </script>
</asp:Content>
