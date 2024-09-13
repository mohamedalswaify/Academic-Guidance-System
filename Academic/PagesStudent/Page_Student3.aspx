<%@ Page Title="" Language="C#" MasterPageFile="~/MasterStudent.Master" AutoEventWireup="true" CodeBehind="Page_Student3.aspx.cs" Inherits="Academic.PagesStudent.Page_Student3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
    #page3{
            color:#198754;
        }
    .drop{
        width:70% !important;
        font-size:14px!important;
    }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="div-basic d-flex justify-content-center w-100 mt-4">
            <div class="div-emelment shedow ">
                <!-- <create here GradView> -->
                <h4 class="text-dark">تسجيل مقررات الترم الحالي</h4>
                <span> الحد الاقصــى لتجسل المواد 5 </span><br>
                <div class="select-sbject w-100 d-flex text-center">
                    <form runat="server">
                    <span>مقرارت اجباري متاحة الترم الحالي: 
                        <asp:DropDownList CssClass="select drop" ID="DDlMandatory" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DDlMandatory_SelectedIndexChanged"></asp:DropDownList>
                    </span><br>
                </div>
                <div class="select-sbject w-100 d-flex text-center">
                    <span>مقرارت اختياري متاحة الترم الحالي:<asp:DropDownList CssClass="select drop" ID="DDlChose" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DDlChose_SelectedIndexChanged"></asp:DropDownList>
                    </span><br>
                </div>
                    <asp:Panel ID="Pfull" runat="server" class="select-sbject w-100 d-flex text-center" style="text-align: center">
                    <span>مقررات الرسوب متاحة الترم الحالي :<asp:DropDownList CssClass="select drop" ID="DDlFul" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DDlFul_SelectedIndexChanged" ></asp:DropDownList>
                    </span><br>
                </asp:Panel>
                 
                <asp:Panel ID="pEmpty" Visible="false"  CssClass="alert alert-danger text-center mt-3 p-0" runat="server">لقد اخترت المادة من قبل</asp:Panel>
                <asp:Panel ID="pEmpty1" Visible="false"  CssClass="alert alert-danger text-center mt-3 p-0" runat="server">لقد وصلت للحد الاقصى من تسجيل المواد</asp:Panel>
               <div class="div-table">
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

                    <asp:SqlDataSource runat="server" ID="DataStudent" ConnectionString='<%$ ConnectionStrings:AcademicDBConnectionString %>' DeleteCommand="DELETE FROM [Student_Subject] WHERE [stNationalID] = @stNationalID AND [SubjectID] = @SubjectID" InsertCommand="INSERT INTO [Student_Subject] ([stNationalID], [SubjectID], [Term], [TypeOkayID], [LevelID]) VALUES (@stNationalID, @SubjectID, @Term, @TypeOkayID, @LevelID)" SelectCommand="SELECT Student_Subject.SubjectID, Subjects.SubjectName, TblTypeOkay.TypeOkayName, Student_Subject.stNationalID, Student_Subject.LevelID, Student_Subject.TypeOkayID, Subjects.SubjectType FROM Student_Subject INNER JOIN Subjects ON Student_Subject.SubjectID = Subjects.SubjectID INNER JOIN TblTypeOkay ON Student_Subject.TypeOkayID = TblTypeOkay.TypeOkayID WHERE (Student_Subject.TypeOkayID = 1) or (Student_Subject.TypeOkayID = 3)  AND (Student_Subject.stNationalID = @StudnetID) " UpdateCommand="UPDATE [Student_Subject] SET [Term] = @Term, [TypeOkayID] = @TypeOkayID, [LevelID] = @LevelID WHERE [stNationalID] = @stNationalID AND [SubjectID] = @SubjectID">
                        <DeleteParameters>
                            <asp:Parameter Name="stNationalID" Type="String"></asp:Parameter>
                            <asp:Parameter Name="SubjectID" Type="String"></asp:Parameter>
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:SessionParameter Name="stNationalID" SessionField="StudentID" Type="String" />
                            <asp:SessionParameter Name="SubjectID" SessionField="SubjectID" Type="String" />
                            <asp:SessionParameter Name="Term" SessionField="TermID" Type="Int32" />
                            <asp:Parameter Name="TypeOkayID" Type="Int32" DefaultValue="1"></asp:Parameter>
                            <asp:SessionParameter DefaultValue="" Name="LevelID" SessionField="LevelID" Type="Int32" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:SessionParameter DefaultValue="" Name="StudnetID" SessionField="StudID" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Term" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="TypeOkayID" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="LevelID" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="stNationalID" Type="String"></asp:Parameter>
                            <asp:Parameter Name="SubjectID" Type="String"></asp:Parameter>
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <telerik:RadGrid class="table" ID="DgvStudent" runat="server" CellSpacing="-1" DataSourceID="DataStudent" GridLines="Both" AllowAutomaticDeletes="True" AutoGenerateDeleteColumn="True">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>

                        <MasterTableView DataKeyNames="SubjectID,stNationalID" DataSourceID="DataStudent" AutoGenerateColumns="False">
                            <Columns>
                                <telerik:GridBoundColumn DataField="SubjectID" FilterControlAltText="Filter SubjectID column" HeaderText="كود المادة" ReadOnly="True" SortExpression="SubjectID" UniqueName="SubjectID">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="SubjectName" FilterControlAltText="Filter SubjectName column" HeaderText="اسم المادة" SortExpression="SubjectName" UniqueName="SubjectName">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="SubjectType" FilterControlAltText="Filter SubjectType column" HeaderText="نوع المادة" SortExpression="SubjectType" UniqueName="SubjectType">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="TypeOkayName" FilterControlAltText="Filter TypeOkayName column" HeaderText="حالة الطلب" SortExpression="TypeOkayName" UniqueName="TypeOkayName">
                                </telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                        <HeaderStyle BackColor="#6c757d" BorderStyle="Solid" Font-Bold="True" Font-Size="12pt" ForeColor="White" />

                    </telerik:RadGrid>

                </div>
                <!-- <create here GradView> -->
                <div class="pt-1 mb-4 text-center">
                    <button class="btn  btn-success btn-lg btn-block w-25" type="button">تأكـــــيد</button>
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
