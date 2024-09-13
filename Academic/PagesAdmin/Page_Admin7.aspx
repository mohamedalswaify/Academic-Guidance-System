<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAdmin.Master" AutoEventWireup="true" CodeBehind="Page_Admin7.aspx.cs" Inherits="Academic.PagesAdmin.Page_Admin7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
    #page7{
            color:#dc3545;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="div-basic d-flex justify-content-center w-100 mt-4">
            <div class="div-emelment2 shedow ">
                <i class="fa-solid fa-book ico"></i><i class="fa-solid fa-user-graduate ico"></i>
                <h4 class="text-dark" style="font-size: 20px; margin-bottom: 20px; display:inline-block ;">
                    المواد المتاحة الترم الحـــالي
                </h4>
                <div class="collapse show" id="dis">
                    <form runat="server">
                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                        <telerik:RadGrid ID="RadGrid1" runat="server" CellSpacing="-1" DataSourceID="DataSbject" GridLines="Both" AllowAutomaticUpdates="True" AutoGenerateEditColumn="True">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                            
                            <MasterTableView DataKeyNames="SubjectID,DepID" DataSourceID="DataSbject" AutoGenerateColumns="False">
                                <Columns>
                                    <telerik:GridBoundColumn DataField="SubjectID" ReadOnly="True" HeaderText="كود المادة" SortExpression="SubjectID" UniqueName="SubjectID" FilterControlAltText="Filter SubjectID column"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="SubjectName" ReadOnly="True" HeaderText="اسم المادة" SortExpression="SubjectName" UniqueName="SubjectName" FilterControlAltText="Filter SubjectName column"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="DepName" ReadOnly="True" FilterControlAltText="Filter DepName column" HeaderText="اسم القسم" SortExpression="DepName" UniqueName="DepName">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridCheckBoxColumn DataField="Statu" HeaderText="حالة المادة" SortExpression="Statu" UniqueName="Statu" DataType="System.Boolean" FilterControlAltText="Filter Statu column"></telerik:GridCheckBoxColumn>
                                </Columns>
                            </MasterTableView>
                        <HeaderStyle BackColor="LightSlateGray" BorderStyle="Solid" Font-Bold="True" Font-Size="13pt" ForeColor="White" />

                        </telerik:RadGrid>

                        <asp:SqlDataSource runat="server" ID="DataSbject" ConnectionString='<%$ ConnectionStrings:AcademicDBConnectionString %>' DeleteCommand="DELETE FROM [Subjects] WHERE [SubjectID] = @SubjectID AND [DepID] = @DepID" InsertCommand="INSERT INTO [Subjects] ([SubjectID], [DepID], [Statu]) VALUES (@SubjectID, @DepID, @Statu)" SelectCommand="SELECT Subjects.SubjectID, Subjects.DepID, Subjects.SubjectName, Department.DepName, Subjects.Statu, Subjects.Ishide FROM Subjects INNER JOIN Department ON Subjects.DepID = Department.DepID where 
Subjects.Ishide =@Hide" UpdateCommand="UPDATE [Subjects] SET [Statu] = @Statu WHERE [SubjectID] = @SubjectID AND [DepID] = @DepID">
                            <DeleteParameters>
                                <asp:Parameter Name="SubjectID" Type="String"></asp:Parameter>
                                <asp:Parameter Name="DepID" Type="Int32"></asp:Parameter>
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="SubjectID" Type="String"></asp:Parameter>
                                <asp:Parameter Name="DepID" Type="Int32"></asp:Parameter>
                                <asp:Parameter Name="Statu" Type="Boolean"></asp:Parameter>
                            </InsertParameters>
                            <SelectParameters>
                                <asp:Parameter DefaultValue="False" Name="Hide" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="Statu" Type="Boolean"></asp:Parameter>
                                <asp:Parameter Name="SubjectID" Type="String"></asp:Parameter>
                                <asp:Parameter Name="DepID" Type="Int32"></asp:Parameter>
                            </UpdateParameters>
                        </asp:SqlDataSource>
                </div>
                <div class="div-table">
                  
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
