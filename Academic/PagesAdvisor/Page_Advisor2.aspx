<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAdvisor.Master" AutoEventWireup="true" CodeBehind="Page_Advisor2.aspx.cs" Inherits="Academic.PagesAdvisor.Page_Advisor2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10.16.6/dist/sweetalert2.min.css" />
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.16.6/dist/sweetalert2.min.js"></script>

    <style>
        #page2{
            color:#f0ad4e;
        }
        .RadGridRTL_Bootstrap{
            margin-left:20px
        }
        [type=button]:not(:disabled), [type=reset]:not(:disabled), [type=submit]:not(:disabled), button:not(:disabled){
          font-weight:bold;

        }
   .RadGridRTL_Bootstrap input{
          font-size: 24px;
          width: 100px;
          padding:0;
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
                <i class="fa fa-bookmark" style="font-size:40px"></i>
                <h4 class="text-dark" style="font-size: 20px;display: inline-block; margin-bottom: 20px;">مقرارت طلابــــي</h4><br />
                <form runat="server">
                    <div class="mt-4">
                         <i class="fa fa-television text-success" id="movehide" onclick="clickDisplay()" aria-hidden="true"></i>
                         <i class="fa fa-television " id="move" onclick="clickhere()" aria-hidden="true"></i><br />
                    <span> بحث عن طلاب فرقة :
                        <asp:DropDownList ID="ddlLevel" class="select" runat="server" AutoPostBack="true" DataSourceID="DataLevel" DataTextField="LevelName" DataValueField="LevelID">
                         </asp:DropDownList>
                       <hr class="text-success" />
                         <asp:SqlDataSource runat="server" ID="DataLevel" ConnectionString='<%$ ConnectionStrings:AcademicDBConnectionString %>' SelectCommand="SELECT [LevelID], [LevelName] FROM [Levels]"></asp:SqlDataSource>
                </span><br>
                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                        <telerik:RadGrid CssClass="fole" ID="DgvStudent" runat="server" CellSpacing="-1" DataSourceID="DataAdvisor" GridLines="Both" AutoGenerateEditColumn="True" >
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>

                            <MasterTableView DataSourceID="DataAdvisor" AutoGenerateColumns="False">
                                <Columns>
                                    <telerik:GridTemplateColumn DataField="StudentID"  DataType="System.Int32" FilterControlAltText="Filter StudentID column" HeaderText=" كود الطالب" SortExpression="StudentID" UniqueName="StudentID">
                                        <EditItemTemplate >
                                            <div class="d-none">
                                            <asp:Label ID="StudentIDTextBox" ReadOnly="true" runat="server" Text='<%# Bind("StudentID") %>'></asp:Label>
                                            </div>
                                            <span>
                                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:AcademicDBConnectionString %>" DeleteCommand="DELETE FROM [Student_Subject] WHERE [stNationalID] = @stNationalID AND [SubjectID] = @SubjectID" InsertCommand="INSERT INTO [Student_Subject] ([stNationalID], [TypeOkayID], [SubjectID]) VALUES (@stNationalID, @TypeOkayID, @SubjectID)" SelectCommand="SELECT [stNationalID], [TypeOkayID], [SubjectID] FROM [Student_Subject]" UpdateCommand="UPDATE [Student_Subject] SET [TypeOkayID] = @TypeOkayID WHERE [stNationalID] = @stNationalID ">
                                                <DeleteParameters>
                                                    <asp:Parameter Name="stNationalID" Type="String" />
                                                    <asp:Parameter Name="SubjectID" Type="String" />
                                                </DeleteParameters>
                                                <InsertParameters>
                                                    <asp:Parameter Name="stNationalID" Type="String" />
                                                    <asp:Parameter Name="TypeOkayID" Type="Int32" />
                                                    <asp:Parameter Name="SubjectID" Type="String" />
                                                </InsertParameters>
                                                <UpdateParameters>
                                                    <asp:Parameter DefaultValue="2" Name="TypeOkayID" Type="Int32" />
                                                    <asp:ControlParameter ControlID="StudentIDTextBox" Name="stNationalID" PropertyName="Text" Type="String" />
                                                </UpdateParameters>
                                            </asp:SqlDataSource>
                                            </span>
                                            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:AcademicDBConnectionString %>" DeleteCommand="DELETE FROM [Student_Subject] WHERE [stNationalID] = @stNationalID AND [SubjectID] = @SubjectID" InsertCommand="INSERT INTO [Student_Subject] ([stNationalID], [SubjectID], [TypeOkayID]) VALUES (@stNationalID, @SubjectID, @TypeOkayID)" SelectCommand="SELECT Subjects.SubjectID, Subjects.SubjectName, Student_Subject.TypeOkayID FROM Student_Subject INNER JOIN Student ON Student_Subject.stNationalID = Student.NationalID INNER JOIN Subjects ON Student_Subject.SubjectID = Subjects.SubjectID WHERE (Student.StudentID = @StudentID)" UpdateCommand="UPDATE [Student_Subject] SET [TypeOkayID] = @TypeOkayID WHERE [stNationalID] = @stNationalID AND [SubjectID] = @SubjectID">
                                                <DeleteParameters>
                                                    <asp:Parameter Name="stNationalID" Type="String" />
                                                    <asp:Parameter Name="SubjectID" Type="String" />
                                                </DeleteParameters>
                                                <InsertParameters>
                                                    <asp:Parameter Name="stNationalID" Type="String" />
                                                    <asp:Parameter Name="SubjectID" Type="String" />
                                                    <asp:Parameter Name="TypeOkayID" Type="Int32" />
                                                </InsertParameters>
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="StudentIDTextBox" Name="StudentID" PropertyName="Text" />
                                                </SelectParameters>
                                                <UpdateParameters>
                                                    <asp:Parameter Name="TypeOkayID" Type="Int32" />
                                                    <asp:Parameter Name="stNationalID" Type="String" />
                                                    <asp:Parameter Name="SubjectID" Type="String" />
                                                </UpdateParameters>
                                            </asp:SqlDataSource>
                                            <br />
                                            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:AcademicDBConnectionString %>" SelectCommand="SELECT * FROM [DataStudent] where StudentID=@StudentID and Appreciation IS Not Null">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="StudentIDTextBox" Name="StudentID" PropertyName="Text" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AcademicDBConnectionString %>" DeleteCommand="DELETE FROM [Student_Subject] WHERE [stNationalID] = @stNationalID AND [SubjectID] = @SubjectID" InsertCommand="INSERT INTO [Student_Subject] ([stNationalID], [SubjectID], [TypeOkayID]) VALUES (@stNationalID, @SubjectID, @TypeOkayID)" SelectCommand="Select * from StudntOK where TypeOkayID=1 and StudentID=@StudentID" UpdateCommand="UPDATE [Student_Subject] SET [TypeOkayID] = @TypeOkayID WHERE [stNationalID] = @stNationalID AND [SubjectID] = @SubjectID">
                                                <DeleteParameters>
                                                    <asp:Parameter Name="stNationalID" Type="String" />
                                                    <asp:Parameter Name="SubjectID" Type="String" />
                                                </DeleteParameters>
                                                <InsertParameters>
                                                    <asp:Parameter Name="stNationalID" Type="String" />
                                                    <asp:Parameter Name="SubjectID" Type="String" />
                                                    <asp:Parameter Name="TypeOkayID" Type="Int32" />
                                                </InsertParameters>
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="StudentIDTextBox" Name="StudentID" PropertyName="Text" />
                                                </SelectParameters>
                                                <UpdateParameters>
                                                    <asp:Parameter Name="TypeOkayID" Type="Int32" />
                                                    <asp:Parameter Name="stNationalID" Type="String" />
                                                    <asp:Parameter Name="SubjectID" Type="String" />
                                                </UpdateParameters>
                                            </asp:SqlDataSource>
                                            <div class="d-flex">

                                              <telerik:RadGrid  ID="RadGrid3" runat="server" AutoGenerateEditColumn="True" DataSourceID="SqlDataSource5">
                                                <GroupingSettings CollapseAllTooltip="Collapse all groups" />
                                                <MasterTableView AutoGenerateColumns="False" DataSourceID="SqlDataSource5">
                                                    <Columns>
                                                        <telerik:GridBoundColumn DataField="SubjectID" FilterControlAltText="Filter SubjectID column" HeaderText="SubjectID" SortExpression="SubjectID" UniqueName="SubjectID">
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn DataField="SubjectName" FilterControlAltText="Filter SubjectName column" HeaderText="SubjectName" SortExpression="SubjectName" UniqueName="SubjectName">
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn DataField="TypeOkayID" DataType="System.Int32" FilterControlAltText="Filter TypeOkayID column" HeaderText="TypeOkayID" SortExpression="TypeOkayID" UniqueName="TypeOkayID">
                                                        </telerik:GridBoundColumn>
                                                    </Columns>
                                                </MasterTableView>
                        <HeaderStyle BackColor="LightSlateGray" BorderStyle="Solid" Font-Bold="True" Font-Size="13pt" ForeColor="White" />
                                            </telerik:RadGrid>
                                            <hr />
                                                <telerik:RadGrid ID="RadGrid5" runat="server" AllowAutomaticUpdates="True" AutoGenerateEditColumn="True">
                                                    <GroupingSettings CollapseAllTooltip="Collapse all groups" />
                                                    <MasterTableView AutoGenerateColumns="False">
                                                    </MasterTableView>
                                                </telerik:RadGrid>
                                            <telerik:RadGrid ID="RadGrid4" runat="server" CellSpacing="-1" GridLines="Both" DataSourceID="SqlDataSource4" style="margin-top: 0px">
                                                <GroupingSettings CollapseAllTooltip="Collapse all groups" />
                                                <MasterTableView AutoGenerateColumns="False" DataSourceID="SqlDataSource4">
                                                    <Columns>
                                                        
                                                        <telerik:GridBoundColumn DataField="SubjectID" FilterControlAltText="Filter SubjectID column" HeaderText="كود المادة" SortExpression="SubjectID" UniqueName="SubjectID">
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn DataField="SubjectName" FilterControlAltText="Filter SubjectName column" HeaderText="اسم المادة" SortExpression="SubjectName" UniqueName="SubjectName">
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn DataField="AcademicYear" FilterControlAltText="Filter AcademicYear column" HeaderText="السنة الدراسية" SortExpression="AcademicYear" UniqueName="AcademicYear">
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn DataField="Appreciation" FilterControlAltText="Filter Appreciation column" HeaderText="التقدير" SortExpression="Appreciation" UniqueName="Appreciation">
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn DataField="GPA" DataType="System.Decimal" FilterControlAltText="Filter GPA column" HeaderText="GPA" SortExpression="GPA" UniqueName="GPA">
                                                        </telerik:GridBoundColumn>
                                                    </Columns>
                                                </MasterTableView>
                        <HeaderStyle BackColor="LightSlateGray" BorderStyle="Solid" Font-Bold="True" Font-Size="13pt" ForeColor="White" />
                                            </telerik:RadGrid>
                                            <div class="d-flex align-items-end more">
                                          <asp:Button CssClass="btn btn-warning" ID="Button1" runat="server" Text="تاكيـــد" OnClick='Button1_Click'  />
                                            </div>
                                            </div>

                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="StudentIDLabel"  runat="server" Text='<%# Eval("StudentID") %>'></asp:Label>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn DataField="Name" ReadOnly="true" FilterControlAltText="Filter Name column" HeaderText="اسم الطالب" SortExpression="Name" UniqueName="Name">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn DataField="LevelName" ReadOnly="true" FilterControlAltText="Filter LevelName column" HeaderText="الفرقة" SortExpression="LevelName" UniqueName="LevelName">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="LevelNameTextBox" runat="server" Text='<%# Bind("LevelName") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="LevelNameLabel" runat="server" Text='<%# Eval("LevelName") %>'></asp:Label>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn DataField="DepName" ReadOnly="true" FilterControlAltText="Filter DepName column" HeaderText="اسم القسم" SortExpression="DepName" UniqueName="DepName">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="DepNameTextBox" runat="server" Text='<%# Bind("DepName") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="DepNameLabel" runat="server" Text='<%# Eval("DepName") %>'></asp:Label>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                </Columns>
                            </MasterTableView>
                        <HeaderStyle BackColor="LightSlateGray" BorderStyle="Solid" Font-Bold="True" Font-Size="13pt" ForeColor="White" />
                       
                            </telerik:RadGrid>  
                        <asp:SqlDataSource runat="server" ID="DataAdvisor" ConnectionString='<%$ ConnectionStrings:AcademicDBConnectionString %>' SelectCommand="SELECT * FROM [ViewAdvisorStudent] where adNationalID=@adNationalID and LevelID=@LevelID and TypeOkayID=1">
                            <SelectParameters>
                                <asp:SessionParameter DefaultValue="" Name="adNationalID" SessionField="AdvisorID" />
                                <asp:ControlParameter ControlID="ddlLevel" DefaultValue="" Name="LevelID" PropertyName="SelectedValue" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                     </div>
                         <div class="text-center">
                        <asp:Panel ID="pEmpty" Visible="false"  CssClass="alert alert-warning" runat="server">لايوجد طلبات جديدة في ذلك الوقت</asp:Panel>
                </div>
                    <div class="text-end mt-3">
                        <asp:Button OnClientClick="showSweetAlert()" CssClass="btn btn-lg  btn-warning" ID="Button2" runat="server" Text="تاكيــد الجميع" OnClick="Button2_Click" />
                    </div>
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
        function myFunction() {
            var x = document.getElementById('myDIV');
            if (x.style.display === 'none') {
                x.style.display = 'block';
            } else {
                x.style.display = 'none';
            }
        }
        function showSweetAlert() {
            // استدعاء Sweet Alert
            Swal.fire({
                title: 'تنبية هام!',
                text: 'تم الموافقة على جميع طلبات الفرقة',
                icon: 'success',
                confirmButtonText: 'حسناً'
            })
        }
    </script>
</asp:Content>
