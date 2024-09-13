<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAdmin.Master" AutoEventWireup="true" CodeBehind="Page_Admin6.aspx.cs" Inherits="Academic.PagesAdmin.Page_Admin6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
    #page6{
            color:#dc3545;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="div-basic d-flex justify-content-center w-100 mt-4">
            <div class="div-emelment2 shedow ">
                <i class="fa-solid fa-book ico"></i><i class="fa-solid fa-user-graduate ico"></i>
                <h4 class="text-dark" style="font-size: 20px; margin-bottom: 20px; display:inline-block ;">
                    درجـــات مقررات الطالـــب
                </h4>
                <div class="collapse show" id="dis">
                    <form  runat="server">
                        <div class="row">
                           
                        </div>
                </div>
                <i class="fa fa-television" id="movehide" onclick="clickDisplay()" aria-hidden="true"></i>
                <i class="fa fa-television" id="move" onclick="clickhere()" aria-hidden="true"></i>
                <div class="div-table">
                    
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <telerik:RadGrid ID="RadGrid1" runat="server" DataSourceID="DataStudent" AllowAutomaticUpdates="True" AutoGenerateEditColumn="True" AllowFilteringByColumn="True" CellSpacing="-1" GridLines="Both" AllowSorting="True" >
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>

                        <MasterTableView DataKeyNames="stNationalID,SubjectID" DataSourceID="DataStudent" AutoGenerateColumns="False">
                            <Columns>
                                <telerik:GridBoundColumn DataField="Name" ReadOnly="true" HeaderText="اسم الطالب" SortExpression="Name" UniqueName="Name" FilterControlAltText="Filter Name column"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="SeatNumber" ReadOnly="true" HeaderText="رقم الجلوس" SortExpression="SeatNumber" UniqueName="SeatNumber" DataType="System.Int32" FilterControlAltText="Filter SeatNumber column"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="SubjectID" ReadOnly="true"  HeaderText="كود المادة" SortExpression="SubjectID" UniqueName="SubjectID" FilterControlAltText="Filter SubjectID column"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="AcademicYear" ReadOnly="true"  HeaderText="السنة الدارسية" SortExpression="AcademicYear" UniqueName="AcademicYear" FilterControlAltText="Filter AcademicYear column"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Term" ReadOnly="true" HeaderText="الترم" SortExpression="Term" UniqueName="Term" FilterControlAltText="Filter Term column"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="GradeWorksYear"  DataType="System.Double"  FilterControlAltText="Filter GradeWorksYear column" HeaderText="درجة اعمال السنة" SortExpression="GradeWorksYear" UniqueName="GradeWorksYear">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="ExamDegree" DataType="System.Double" FilterControlAltText="Filter ExamDegree column" HeaderText="درجة الامتحان" SortExpression="ExamDegree" UniqueName="ExamDegree">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="TotalScore" ReadOnly="true"  DataType="System.Double" FilterControlAltText="Filter TotalScore column" HeaderText="اجمالي الدرجة" SortExpression="TotalScore" UniqueName="TotalScore">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Appreciation" ReadOnly="true" FilterControlAltText="Filter Appreciation column" HeaderText="التقدير" SortExpression="Appreciation" UniqueName="Appreciation">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="GPA" ReadOnly="true" DataType="System.Double" FilterControlAltText="Filter GPA column" HeaderText="GPA" SortExpression="GPA" UniqueName="GPA">
                                </telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                        <HeaderStyle BackColor="LightSlateGray" BorderStyle="Solid" Font-Bold="True" Font-Size="13pt" ForeColor="White" />

                    </telerik:RadGrid>
                    <asp:SqlDataSource runat="server" ID="DataStudent" ConnectionString='<%$ ConnectionStrings:AcademicDBConnectionString %>' DeleteCommand="DELETE FROM [Student_Subject] WHERE [stNationalID] = @stNationalID AND [SubjectID] = @SubjectID" InsertCommand="INSERT INTO [Student_Subject] ([ExamDegree], [GradeWorksYear], [stNationalID], [SubjectID], [EmpID]) VALUES (@ExamDegree, @GradeWorksYear, @stNationalID, @SubjectID, @EmpID)" SelectCommand="SELECT dbo.Student.Name, dbo.Student.SeatNumber, dbo.Student_Subject.*
FROM     dbo.Student INNER JOIN
                  dbo.Student_Subject ON dbo.Student.NationalID = dbo.Student_Subject.stNationalID" UpdateCommand="UPDATE [Student_Subject] SET [ExamDegree] = @ExamDegree, [GradeWorksYear] = @GradeWorksYear, [EmpID] = @EmpID WHERE [stNationalID] = @stNationalID AND [SubjectID] = @SubjectID">
                        <DeleteParameters>
                            <asp:Parameter Name="stNationalID" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="SubjectID" Type="String"></asp:Parameter>
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="ExamDegree" Type="Double"></asp:Parameter>
                            <asp:Parameter Name="GradeWorksYear" Type="Double"></asp:Parameter>
                            <asp:Parameter Name="stNationalID" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="SubjectID" Type="String"></asp:Parameter>
                            <asp:Parameter Name="EmpID" Type="Int32"></asp:Parameter>
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="ExamDegree" Type="Double"></asp:Parameter>
                            <asp:Parameter Name="GradeWorksYear" Type="Double"></asp:Parameter>
                            <asp:SessionParameter Name="EmpID" SessionField="EmployeeID" Type="Int32" />
                            <asp:Parameter Name="stNationalID" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="SubjectID" Type="String"></asp:Parameter>
                        </UpdateParameters>
                    </asp:SqlDataSource>
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
