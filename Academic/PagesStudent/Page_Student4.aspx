<%@ Page Title="" Language="C#" MasterPageFile="~/MasterStudent.Master" AutoEventWireup="true" CodeBehind="Page_Student4.aspx.cs" Inherits="Academic.PagesStudent.Page_Student4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
    #page4{
            color:#198754;
        }
            .message {
    height: auto;
    border-radius: 10px;
    box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
    padding: 30px
}
            .titel{
                font-size:18px !important
            }
            .body-message{
    width: auto;
    height: 120px;
    margin-top: 20px;
    padding: 20px;
    box-shadow: rgba(0, 0, 0, 0.02) 0px 1px 3px 0px, rgba(27, 31, 35, 0.15) 0px 0px 0px 1px;
            }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="div-basic d-flex justify-content-center w-100 mt-4">
            <div class="div-emelment shedow ">
                <!-- <create here GradView> -->
                <h4 class="text-dark">مرشدي الاكاديمـــــي</h4>
                <form runat="server">
                <span> المرشد الاكاديمي الخاص بك: <asp:Label ID="lblAdd" runat="server" CssClass="text-success"  Text="اسم المرشد"></asp:Label></span><br>
               <div class="text-center ">
                    <h5 class="text-dark">الساعات المكتبية للمرشد الاكاديمي</h5>
                   </div>
                
                    <div class="div-table">
                    <asp:GridView ID="DgvStudent" CssClass="table" runat="server"></asp:GridView>
                    </div>
                    <hr class="text-center"/>
                    <h4 class="text-dark">رسالة المرشد الاكاديمي</h4>
                    <div class="message mt-5">
                        <img src="../img/Dashboard/Doctor.png" style="width:50px" />
                        <asp:Label ID="lblADID"  runat="server" Text="اسم المرشد"></asp:Label>
                    <div class="body-message">
                        <div>
                            <asp:Label ID="txtMessageBody" CssClass="titel" runat="server" Text="نص الرسالة"></asp:Label> 
                        </div>
                    </div>
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
