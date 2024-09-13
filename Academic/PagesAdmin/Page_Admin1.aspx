<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAdmin.Master" AutoEventWireup="true" CodeBehind="Page_Admin1.aspx.cs" Inherits="Academic.PagesAdmin.Page_Admin1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      
    <style>
    #page1{
            color:#dc3545;
        }
  
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="div-basic d-flex justify-content-center w-100 mt-4">
            <div class="div-emelment2 shedow ">
                <i class="fa-solid fa-book ico"></i>
                <h4 class="text-dark" style="font-size: 20px;display: inline-block; margin-bottom: 20px;">المقررات
                    الدراسية</h4>
                <div class="input-group pb-4">
                    <div class="form-outline">
                        <input type="search" id="form1" placeholder="بحث عن قسم بالاسم" class="form-control" />
                    </div>
                    <button type="button" class="btn btn-secondary" style="margin-right: 1px;">
                        <i class="fas fa-search"></i>
                    </button>
                </div>
                <form runat="server">
                    <telerik:RadScriptManager ID="RadScriptManager1" runat="server"></telerik:RadScriptManager>
                        
                            <div class="row">
                    <div class="form-outline mb-1 col-md-6 col-12 col-md-6 col-12">
                        <span class="text-secondary">كود المادة:</span>
                        <asp:TextBox ID="txtsubID" runat="server" class="form-control" placeholder="من فضلك ادخل كود المادة" required></asp:TextBox>
                    </div>
                    <div class="form-outline mb-1 col-md-6 col-12">
                         <span class="text-secondary">اسم المادة:</span>
                        <asp:TextBox ID="txtSubName" runat="server" class="form-control" placeholder="من فضلك ادخل  اسم المادة" required></asp:TextBox>
                    </div>
                    <div class="form-outline mb-1 col-md-6 col-12">
                         <span class="text-secondary">عدد ساعات المادة:</span>
                        <asp:TextBox ID="txthoer" runat="server" class="form-control"  type="number"  min="3" max="5" placeholder="من فضلك ادخل عدد ساعات المادة" required></asp:TextBox>
                    </div>
                     <div class="form-outline mb-1 col-md-6 col-12">
                        <span class="text-secondary">دكتور المادة:</span>
                        <asp:DropDownList ID="ddlDoctor" class="form-select" runat="server" DataSourceID="SqlDataSource4" DataTextField="AdvName" DataValueField="NationalID" >
                        </asp:DropDownList>
                         <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:AcademicDBConnectionString %>" SelectCommand="SELECT * FROM [Advisor]"></asp:SqlDataSource>
                    </div>
                    <div class="form-outline mb-1 col-md-6 col-12">
                        <span class="text-secondary">حالة المادة:</span>
                        <asp:DropDownList ID="ddlstate" class="form-select" runat="server" >
                            <asp:ListItem Value="true">نشط</asp:ListItem>
                            <asp:ListItem Value="false">غير نشط</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="form-outline mb-1 col-md-6 col-12">
                        <span class="text-secondary">المادة السابقة:</span>
                        <asp:DropDownList ID="ddlpre" class="form-select text-dark" runat="server" DataSourceID="SqlDataSource1" DataTextField="SubjectID" DataValueField="SubjectID"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AcademicDBConnectionString %>" SelectCommand="SELECT * FROM [Subjects]"></asp:SqlDataSource>
                    </div>
                     <div class="form-outline mb-1 col-md-6 col-12">
                        <span class="text-secondary">اسم القسم :</span>
                         <asp:DropDownList ID="ddlDep" class="form-select" runat="server" DataSourceID="DataDep" DataTextField="DepName" DataValueField="DepID">
                         </asp:DropDownList>
                         <asp:SqlDataSource runat="server" ID="DataDep" ConnectionString='<%$ ConnectionStrings:AcademicDBConnectionString %>' SelectCommand="SELECT [DepID], [DepName] FROM [Department]"></asp:SqlDataSource>
                     </div>
                     <div class="form-outline mb-1 col-md-6 col-12">
                        <span class="text-secondary">الفرقة:</span>
                         <asp:DropDownList ID="ddlLevel" class="form-select" runat="server" DataSourceID="DataLevel" DataTextField="LevelName" DataValueField="LevelID">
                         </asp:DropDownList>
                         <asp:SqlDataSource runat="server" ID="DataLevel" ConnectionString='<%$ ConnectionStrings:AcademicDBConnectionString %>' SelectCommand="SELECT [LevelID], [LevelName] FROM [Levels]"></asp:SqlDataSource>
                     </div>
                   <div class="form-outline mb-1 col-12">
                        <span class="text-secondary">نوع المادة:</span>
                         <asp:DropDownList ID="ddlType" class="form-select" runat="server" >
                         <asp:ListItem>اجباري</asp:ListItem>                         
                             <asp:ListItem>اختياري</asp:ListItem>
                         </asp:DropDownList>
                     </div>
                   </div>
                    <div class="row">
                        <div data-toggle="collapse" class="pt-1 col-12  text-center">
                            <asp:Button ID="btnAdd" class="btn w-25 btn-danger  btn-lg btn-block"  runat="server" Text="اضـــــافة" OnClick="btnAdd_Click" />
                        </div>
                    </div>
                     <div class="form-outline mt-3  text-center">
                         <asp:Label ID="lblbAdded" runat="server" Text="تمت الاضافة بنجاح" ForeColor="#42BA96" Font-Bold="True" Font-Size="20px" Visible="False"></asp:Label>
                    </div>
                <div class="div-table">
                    <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>--%>
                    <telerik:RadGrid ID="dgv" runat="server" DataSourceID="DataSubject" AllowAutomaticDeletes="True" AllowAutomaticUpdates="True" AutoGenerateDeleteColumn="True" AutoGenerateEditColumn="True" >
                        <GroupingSettings CollapseAllTooltip="Collapse all groups" />
                        <MasterTableView AutoGenerateColumns="False" DataKeyNames="SubjectID,DepID" DataSourceID="DataSubject">
                            <Columns>
                                <telerik:GridTemplateColumn DataField="SubjectID" FilterControlAltText="Filter SubjectID column" HeaderText="كود المادة" SortExpression="SubjectID" UniqueName="SubjectID">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="SubjectIDTextBox" runat="server" Text='<%# Bind("SubjectID") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="SubjectIDLabel" runat="server" Text='<%# Eval("SubjectID") %>'></asp:Label>
                                    </ItemTemplate>                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn DataField="SubjectName" FilterControlAltText="Filter SubjectName column" HeaderText="اسم المادة" SortExpression="SubjectName" UniqueName="SubjectName">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="SubjectNameTextBox" runat="server" Text='<%# Bind("SubjectName") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="SubjectNameLabel" runat="server" Text='<%# Eval("SubjectName") %>'></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn DataField="Houres" DataType="System.Int32" FilterControlAltText="Filter Houres column" HeaderText="ساعات المادة" SortExpression="Houres" UniqueName="Houres">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="HouresTextBox" runat="server" Text='<%# Bind("Houres") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="HouresLabel" runat="server" Text='<%# Eval("Houres") %>'></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn DataField="SubjectType" FilterControlAltText="Filter SubjectType column" HeaderText="نوع المادة" SortExpression="SubjectType" UniqueName="SubjectType">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="SubjectTypeTextBox" runat="server" Text='<%# Bind("SubjectType") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="SubjectTypeLabel" runat="server" Text='<%# Eval("SubjectType") %>'></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn DataField="PreSbjectID" FilterControlAltText="Filter PreSbjectID column" HeaderText="المادة السابقة" SortExpression="PreSbjectID" UniqueName="PreSbjectID">
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="ddl3" runat="server" CssClass="select" DataSourceID="sqlDataso" DataTextField="SubjectID" DataValueField="SubjectID" SelectedValue='<%# Bind("PreSbjectID") %>'>
                                        </asp:DropDownList>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="PreSbjectIDLabel" runat="server" Text='<%# Eval("PreSbjectID") %>'></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn DataField="AdvName" FilterControlAltText="Filter AdvName column" HeaderText="اسم الدكتور" SortExpression="AdvName" UniqueName="AdvName">
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="select" DataSourceID="sds_advName" DataTextField="AdvName" DataValueField="NationalID" SelectedValue='<%# Bind("NationalID") %>'>
                                        </asp:DropDownList>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="AdvNameLabel" runat="server" Text='<%# Eval("AdvName") %>'></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn DataField="DepName" FilterControlAltText="Filter DepName column" HeaderText="اسم القسم" SortExpression="DepName" UniqueName="DepName" ReadOnly="True">
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="ddl3" runat="server" CssClass="select" DataSourceID="DataDep" DataTextField="DepName" DataValueField="DepID" SelectedValue='<%# Bind("DepID") %>'>
                                        </asp:DropDownList>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="DepNameLabel" runat="server" Text='<%# Eval("DepName") %>'></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn DataField="LevelID" DataType="System.Int32" FilterControlAltText="Filter LevelID column" HeaderText="الفرقة" SortExpression="LevelID" UniqueName="LevelID">
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="ddl4" runat="server" CssClass="select" DataSourceID="DataLevel" DataTextField="LevelName" DataValueField="LevelID" SelectedValue='<%# Bind("LevelID") %>'>
                                        </asp:DropDownList>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="LevelIDLabel" runat="server" Text='<%# Eval("LevelID") %>'></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridCheckBoxColumn DataField="Statu" DataType="System.Boolean" FilterControlAltText="Filter Statu column" HeaderText="حالة المادة" SortExpression="Statu" UniqueName="Statu">
                                </telerik:GridCheckBoxColumn>
                            </Columns>
                        </MasterTableView>
                        <HeaderStyle BackColor="LightSlateGray" BorderStyle="Solid" Font-Bold="True" Font-Size="13pt" ForeColor="White" />

                    </telerik:RadGrid>
                             <%--</ContentTemplate>
                    </asp:UpdatePanel>--%>
                    <asp:SqlDataSource ID="DataSubject" runat="server" ConnectionString="<%$ ConnectionStrings:AcademicDBConnectionString %>" SelectCommand="SELECT Subjects.SubjectID, Subjects.DepID, Subjects.SubjectName, Subjects.Statu, Subjects.Houres, Subjects.LevelID, Subjects.SubjectType, Subjects.NationalID, Subjects.PreSbjectID, Advisor.AdvName, Department.DepName FROM Subjects INNER JOIN Advisor ON Subjects.NationalID = Advisor.NationalID INNER JOIN Department ON Subjects.DepID = Department.DepID WHERE (Subjects.Ishide = @hide)" DeleteCommand="DELETE FROM [Subjects] WHERE [SubjectID] = @SubjectID AND [DepID] = @DepID" InsertCommand="INSERT INTO [Subjects] ([SubjectID], [DepID], [SubjectName], [Statu], [Houres], [LevelID], [SubjectType], [NationalID], [PreSbjectID]) VALUES (@SubjectID, @DepID, @SubjectName, @Statu, @Houres, @LevelID, @SybjectType, @NationalID, @PreSbjectID)" UpdateCommand="UPDATE [Subjects] SET [SubjectName] = @SubjectName, [Statu] = @Statu, [Houres] = @Houres, [LevelID] = @LevelID, [SubjectType] = @SubjectType, [NationalID] = @NationalID, [PreSbjectID] = @PreSbjectID WHERE [SubjectID] = @SubjectID AND [DepID] = @DepID">
                        <DeleteParameters>
                            <asp:Parameter Name="SubjectID" Type="String" />
                            <asp:Parameter Name="DepID" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:ControlParameter ControlID="txtsubID" Name="SubjectID" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="ddlDep" Name="DepID" PropertyName="SelectedValue" Type="Int32" />
                            <asp:ControlParameter ControlID="txtSubName" Name="SubjectName" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="ddlstate" Name="Statu" PropertyName="SelectedValue" Type="Boolean" />
                            <asp:ControlParameter ControlID="txthoer" Name="Houres" PropertyName="Text" Type="Int32" />
                            <asp:ControlParameter ControlID="ddlLevel" Name="LevelID" PropertyName="SelectedValue" Type="Int32" />
                            <asp:ControlParameter ControlID="ddlType" Name="SybjectType" PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="ddlDoctor" Name="NationalID" PropertyName="SelectedValue" Type="Int32" />
                            <asp:ControlParameter ControlID="ddlpre" Name="PreSbjectID" PropertyName="SelectedValue" Type="String" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:Parameter DefaultValue="False" Name="hide" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="SubjectName" />
                            <asp:Parameter Name="Statu" />
                            <asp:Parameter Name="Houres" />
                            <asp:Parameter Name="LevelID" />
                            <asp:Parameter Name="SubjectType" />
                            <asp:Parameter Name="NationalID" />
                            <asp:Parameter Name="PreSbjectID" />
                            <asp:Parameter Name="SubjectID" />
                            <asp:Parameter Name="DepID" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:AcademicDBConnectionString %>" SelectCommand="SELECT * FROM [VSubject]"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="sqlDataso" runat="server" ConnectionString="<%$ ConnectionStrings:AcademicDBConnectionString %>" DeleteCommand="DELETE FROM [Subjects] WHERE [SubjectID] = @SubjectID" InsertCommand="INSERT INTO [Subjects] ([SubjectID], [SubjectName], [Statu], [Houres], [NationalID], [PreSbjectID]) VALUES (@SubjectID, @SubjectName, @Statu, @Houres, @NationalID, @PreSbjectID)" SelectCommand="SELECT SubjectID FROM Subjects" UpdateCommand="UPDATE [Subjects] SET [SubjectName] = @SubjectName, [Statu] = @Statu, [Houres] = @Houres, [NationalID] = @NationalID, [PreSbjectID] = @PreSbjectID WHERE [SubjectID] = @SubjectID">
                        <DeleteParameters>
                            <asp:Parameter Name="SubjectID" Type="String" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:ControlParameter ControlID="txtsubID" Name="SubjectID" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="txtSubName" Name="SubjectName" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="ddlstate" Name="Statu" PropertyName="SelectedValue" Type="Boolean" />
                            <asp:ControlParameter ControlID="txthoer" Name="Houres" PropertyName="Text" Type="Int32" />
                            <asp:ControlParameter ControlID="ddlDoctor" Name="NationalID" PropertyName="SelectedValue" Type="Int32" />
                            <asp:ControlParameter ControlID="ddlpre" Name="PreSbjectID" PropertyName="SelectedValue" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="SubjectName" Type="String" />
                            <asp:Parameter Name="Statu" Type="Boolean" />
                            <asp:Parameter Name="Houres" Type="Int32" />
                            <asp:Parameter Name="NationalID" Type="Int32" />
                            <asp:Parameter Name="PreSbjectID" Type="String" />
                            <asp:Parameter Name="SubjectID" Type="String" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <br />
                    <asp:SqlDataSource ID="sds_advName" runat="server" ConnectionString="<%$ ConnectionStrings:AcademicDBConnectionString %>" SelectCommand="SELECT [NationalID], [AdvName] FROM [Advisor]"></asp:SqlDataSource>
                </div>
       
 
    </form>



     <script>
         window.onload = function () {
             var element = document.getElementById("show");
             element.classList.add("show");
         };
     </script>
     </div>
</div>
</asp:Content>
