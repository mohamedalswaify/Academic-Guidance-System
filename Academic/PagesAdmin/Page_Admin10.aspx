<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAdmin.Master" AutoEventWireup="true" CodeBehind="Page_Admin10.aspx.cs" Inherits="Academic.PagesAdmin.Page_Admin10" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #page10 {
            color: #dc3545;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="div-basic d-flex justify-content-center w-100 mt-4">
        <div class="div-emelment2 shedow ">
            <form runat="server">
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <i class="fa fa-tasks" aria-hidden="true" style="font-size: 30px"></i>
                <h4 class="text-dark" style="font-size: 20px; margin-bottom: 20px; display: inline-block;">لائحــــة المعهد
                </h4>
                <telerik:RadGrid ID="RadGrid1" runat="server" DataSourceID="Data" AutoGenerateEditColumn="True" AllowAutomaticUpdates="True">
                    <MasterTableView DataSourceID="Data" AutoGenerateColumns="False" DataKeyNames="KeyID">
                        <Columns>
                            <telerik:GridBoundColumn DataField="TotalSubject" HeaderText="اجمالي المواد" SortExpression="TotalSubject" UniqueName="TotalSubject" DataType="System.Int32" FilterControlAltText="Filter TotalSubject column"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="SubjectMantory" HeaderText=" اجمالي المواد الاجباري" SortExpression="SubjectMantory" UniqueName="SubjectMantory" DataType="System.Int32" FilterControlAltText="Filter SubjectMantory column"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="SubjectChooes" HeaderText="اجمالي المواد الاختياري" SortExpression="SubjectChooes" UniqueName="SubjectChooes" DataType="System.Int32" FilterControlAltText="Filter SubjectChooes column"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="SubjectHour" HeaderText="عدد ساعات المادة" SortExpression="SubjectHour" UniqueName="SubjectHour" DataType="System.Int32" FilterControlAltText="Filter SubjectHour column"></telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                    <HeaderStyle BackColor="LightSlateGray" Font-Bold="True" Font-Size="13pt" ForeColor="White" />
                </telerik:RadGrid>
                <asp:SqlDataSource runat="server" ID="Data" ConnectionString='<%$ ConnectionStrings:AcademicDBConnectionString %>' DeleteCommand="DELETE FROM [Slate] WHERE [KeyID] = @KeyID" InsertCommand="INSERT INTO [Slate] ([KeyID], [TotalSubject], [SubjectMantory], [SubjectChooes], [SubjectHour]) VALUES (@KeyID, @TotalSubject, @SubjectMantory, @SubjectChooes, @SubjectHour)" SelectCommand="SELECT * FROM [Slate]" UpdateCommand="UPDATE [Slate] SET [TotalSubject] = @TotalSubject, [SubjectMantory] = @SubjectMantory, [SubjectChooes] = @SubjectChooes, [SubjectHour] = @SubjectHour WHERE [KeyID] = @KeyID">
                    <DeleteParameters>
                        <asp:Parameter Name="KeyID" Type="Int32"></asp:Parameter>
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="KeyID" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="TotalSubject" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="SubjectMantory" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="SubjectChooes" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="SubjectHour" Type="Int32"></asp:Parameter>
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="TotalSubject" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="SubjectMantory" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="SubjectChooes" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="SubjectHour" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="KeyID" Type="Int32"></asp:Parameter>
                    </UpdateParameters>
                </asp:SqlDataSource>
            </form>
        </div>
    </div>

    <script>
        window.onload = function () {
            var element = document.getElementById("show");
            element.classList.add("show");
        };
    </script>
</asp:Content>
