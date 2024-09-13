<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAdmin.Master" AutoEventWireup="true" CodeBehind="Page_Admin3.aspx.cs" Inherits="Academic.PagesAdmin.Page_Admin3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #page3 {
            color: #dc3545;
        }

        .validator {
            position: absolute;
            color: #dc3545;
            font-weight: bold;
            margin-right: -9px;
            margin-top: -5px;
            font-size: 20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="div-basic d-flex justify-content-center w-100 mt-4">
        <div class="div-emelment2 shedow ">
            <i class="fa-solid fa-users ico"></i>
            <h4 class="text-dark" style="font-size: 20px; margin-bottom: 20px; display: inline-block;">المستخدميـــــــن
            </h4>
            <div class="input-group pb-4">
                <div class="form-outline">
                    <input type="search" id="form1" placeholder="بحث عن بالرقم القومي" class="form-control" />
                </div>
                <button type="button" class="btn btn-secondary" style="margin-right: 1px;">
                    <i class="fas fa-search"></i>
                </button>
            </div>
            <form runat="server">

                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server"><ContentTemplate>
                
                <div class="row pb-3">
                    <div class="pb-1 col-md-3 col-lg-2">
                        <asp:RadioButton ID="radStudent" value="Student" type="radio" href="#Student" runat="server" Text="طالــــب" BorderStyle="None" Font-Bold="True" Font-Size="Large" AutoPostBack="True" Checked="true" OnCheckedChanged="radStudent_CheckedChanged" />
                    </div>
                    <div class="pb-1 col-md-3 col-lg-2">
                        <asp:RadioButton ID="radAdvisor" value="Addvisor" type="radio" href="#Student" runat="server" Text="مرشـــــد" BorderStyle="None" Font-Bold="True" Font-Size="Large" AutoPostBack="True" OnCheckedChanged="radAdvisor_CheckedChanged" />
                    </div>
                    <div class="pb-1 col-md-3 col-lg-2">
                        <asp:RadioButton ID="rademployee" value="Employee" type="radio" href="#Student" runat="server" Text="موظـــــف" BorderStyle="None" Font-Bold="True" Font-Size="Large" AutoPostBack="True" OnCheckedChanged="rademployee_CheckedChanged" />
                    </div>
                </div>
                <div class="row">
                    <div>
                        <asp:Panel ID="pStudent" Visible="true" runat="server">
                            <div class="row">
                            <div class="form-outline mb-1 col-md-4 col-12">
                                <span class="text-secondary">كود الطالب:</span>
                                <asp:TextBox ID="txtsID" runat="server" class="form-control" Type="number" onKeyDown="if(this.value.length==11 && event.keyCode!=8) return false;" placeholder="من فضلك ادخل كود الطالب" required></asp:TextBox>
                            </div>
                            <div class="form-outline mb-1 col-md-4 col-12">
                                <span class="text-secondary">الرقم القومي:</span>
                                <asp:TextBox ID="txtsN" runat="server" class="form-control" type="number" onKeyDown="if(this.value.length==14 && event.keyCode!=8) return false;" placeholder="من فضلك ادخل الرقم القومي" required></asp:TextBox>
                            </div>
                            <div class="form-outline mb-1 col-md-4 col-12">
                                <span class="text-secondary">رقم الجلوس:</span>
                                <asp:TextBox ID="txtsNumber" runat="server" class="form-control" type="number" onKeyDown="if(this.value.length==8 && event.keyCode!=8) return false;" placeholder="من فضلك ادخل رقم الجلوس" required></asp:TextBox>
                            </div>
                            <div class="form-outline mb-1 col-md-4 col-12">
                                <span class="text-secondary">اسم الطالب:</span>
                                <asp:TextBox ID="txtsName" runat="server" class="form-control" placeholder="من فضلك ادخل اسم الطالب" required></asp:TextBox>
                            </div>
                            <div class="form-outline mb-1 col-md-4 col-12">
                                <span class="text-secondary">الفرقة:</span>
                                <asp:DropDownList ID="ddslevel" class="form-select" runat="server" DataSourceID="DaraLevel" DataTextField="LevelName" DataValueField="LevelID">
                                </asp:DropDownList>
                                <asp:SqlDataSource runat="server" ID="DaraLevel" ConnectionString='<%$ ConnectionStrings:AcademicDBConnectionString %>' SelectCommand="SELECT * FROM [Levels]"></asp:SqlDataSource>
                            </div>
                            <div class="form-outline mb-1 col-md-4 col-12">
                                <span class="text-secondary">مرشد الطالب:</span>
                                <asp:DropDownList ID="ddlsDoctor" class="form-select" runat="server" DataSourceID="DataDoctor" DataTextField="AdvName" DataValueField="NationalID">
                                </asp:DropDownList>
                                <asp:SqlDataSource runat="server" ID="DataDoctor" ConnectionString='<%$ ConnectionStrings:AcademicDBConnectionString %>' SelectCommand="SELECT [NationalID], [AdvName] FROM [Advisor]"></asp:SqlDataSource>
                            </div>
                            <div class="form-outline mb-1  col-12">
                                <span class="text-secondary">القسم:</span>
                                <asp:DropDownList ID="ddsDep" class="form-select" runat="server" DataSourceID="DataDepartment" DataTextField="DepName" DataValueField="DepID">
                                </asp:DropDownList>
                                <asp:SqlDataSource runat="server" ID="DataDepartment" ConnectionString='<%$ ConnectionStrings:AcademicDBConnectionString %>' SelectCommand="SELECT [DepID], [DepName] FROM [Department]"></asp:SqlDataSource>
                            </div>
                                </div>
                        </asp:Panel>
                    </div>


                    <asp:Panel ID="PDoctor" Visible="false" runat="server">
                        <div class="row">
                        <div class="form-outline mb-1 col-md-4 col-12">
                            <span class="text-secondary">كود المرشد:</span>
                            <asp:TextBox ID="txtadID" runat="server" class="form-control" Type="number" onKeyDown="if(this.value.length==11 && event.keyCode!=8) return false;" placeholder="من فضلك ادخل كود المرشد" required></asp:TextBox>
                        </div>
                        <div class="form-outline mb-1 col-md-4 col-12">
                            <span class="text-secondary">الرقم القومي:</span>
                            <asp:TextBox ID="txtaNaDoctor" runat="server" class="form-control" Type="number" onKeyDown="if(this.value.length==11 && event.keyCode!=8) return false;" placeholder="من فضلك ادخل الرقم القومي الخاص بالمرشد" required></asp:TextBox>
                        </div>
                        <div class="form-outline mb-1 col-md-4 col-12">
                            <span class="text-secondary">اسم المرشد:</span>
                            <asp:TextBox ID="txtDName" runat="server" class="form-control" placeholder="من فضلك ادخل اسم المرشد" required></asp:TextBox>
                        </div>
                        <div class="form-outline mb-1 col-md-4 col-12">
                            <span class="text-secondary">الدرجة العلمية:</span>
                            <asp:DropDownList ID="ddDera" class="form-select" runat="server">
                                <asp:ListItem>معيد</asp:ListItem>
                                <asp:ListItem>مدرس مساعد</asp:ListItem>
                                <asp:ListItem>مدرس</asp:ListItem>
                                <asp:ListItem>استاذ مساعد</asp:ListItem>
                                <asp:ListItem>استاذ</asp:ListItem>
                            </asp:DropDownList>
                        </div>

                        <div class="form-outline mb-1 col-md-4 col-12">
                            <span class="text-secondary">التخصص:</span>
                            <asp:DropDownList ID="ddlsoliz" class="form-select" runat="server">
                                <asp:ListItem>علوم حاسب</asp:ListItem>
                                <asp:ListItem>نظم معلومات</asp:ListItem>
                                <asp:ListItem>بحوث عمليات</asp:ListItem>
                                <asp:ListItem>محاسبة</asp:ListItem>
                                <asp:ListItem>احصاء</asp:ListItem>
                                <asp:ListItem>ادراة اعمال</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="form-outline mb-1 col-md-4 col-12">
                            <span class="text-secondary">القسم:</span>
                            <asp:DropDownList ID="ddaddDep" class="form-select" runat="server" DataSourceID="DataDepartment" DataTextField="DepName" DataValueField="DepID">
                            </asp:DropDownList>
                        </div>
                            </
                    </asp:Panel>

                    <asp:Panel ID="pEmployee" Visible="false" runat="server">
                        <div class="row">
                        <div class="form-outline mb-1 col-md-4 col-12">
                            <span class="text-secondary">كود الموظف:</span>
                            <asp:TextBox ID="txtEmID" runat="server" class="form-control" Type="number" onKeyDown="if(this.value.length==11 && event.keyCode!=8) return false;" placeholder="من فضلك ادخل البريد الالكتروني" required></asp:TextBox>
                        </div>
                        <div class="form-outline mb-1 col-md-4 col-12">
                            <span class="text-secondary">الرقم القومي:</span>
                            <asp:TextBox ID="txtEmpN" runat="server" class="form-control" type="number" onKeyDown="if(this.value.length==14 && event.keyCode!=8) return false;" placeholder="من فضلك ادخل الرقم القومي" required></asp:TextBox>
                        </div>
                        <div class="form-outline mb-1 col-md-4 col-12">
                            <span class="text-secondary">اسم الموظف:</span>
                            <asp:TextBox ID="txtEmpName" runat="server" class="form-control" placeholder="من فضلك ادخل  اسم الموظف" required></asp:TextBox>
                        </div>
                        <div class="form-outline mb-1">
                            <span class="text-secondary">الوظيفة:</span>
                            <asp:DropDownList ID="ddljob" class="form-select" runat="server">
                                <asp:ListItem>المتابعة</asp:ListItem>
                                <asp:ListItem>شئون الطلاب</asp:ListItem>
                                <asp:ListItem>الشئون الاجتماعية</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                            </div>
                    </asp:Panel>



                    <div class="form-outline mb-1 col-md-4 col-122">
                        <span class="text-secondary">البريد الالكتروني:</span>
                        <asp:TextBox ID="txtEmail" runat="server" class="form-control" placeholder="من فضلك ادخل اسم المرشد"></asp:TextBox>
                    </div>
                    <div class="form-outline mb-1 col-md-4 col-12">
                        <span class="text-secondary">الهاتف:</span>
                        <asp:TextBox ID="txtPhone" runat="server" class="form-control" type="number" onKeyDown="if(this.value.length==11 && event.keyCode!=8) return false;" placeholder="من فضلك ادخل رقم الهاتف" required></asp:TextBox>
                    </div>
                    <div class="form-outline mb-1 col-md-4 col-12">
                        <span class="text-secondary">حالة المادة:</span>
                        <asp:DropDownList ID="ddlstate" class="form-select" runat="server">
                            <asp:ListItem Value="true">نشط</asp:ListItem>
                            <asp:ListItem Value="false">غير نشط</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                </div>

                <div class="row">
                    <div data-toggle="collapse" class="pt-1 col-12  text-center">
                        <asp:Button ID="btnAddDep" class="btn w-25 btn-danger  btn-lg btn-block" runat="server" Text="اضـــــافة" OnClick="btnAddDep_Click" />
                    </div>
                </div>
                <div class="form-outline mt-3  text-center">
                    <asp:Label ID="lblbAdded" runat="server" Text="تمت الاضافة بنجاح" ForeColor="#42BA96" Font-Bold="True" Font-Size="20px" Visible="False"></asp:Label>

                </div>
                <div class="div-table">
                    <telerik:RadGrid ID="DgvStudent" runat="server" CellSpacing="-1" DataSourceID="DataStudent" GridLines="Both" AllowAutomaticDeletes="True" AllowAutomaticUpdates="True" AutoGenerateDeleteColumn="True" AutoGenerateEditColumn="True">
                        <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>

                        <MasterTableView DataSourceID="DataStudent" AutoGenerateColumns="False" DataKeyNames="NationalID">
                            <Columns>
                                <telerik:GridTemplateColumn DataField="NationalID" DataType="System.Int32" FilterControlAltText="Filter NationalID column" HeaderText="الرقم القومي" SortExpression="NationalID" UniqueName="NationalID">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="NationalIDTextBox" runat="server" ReadOnly="true" Text='<%# Bind("NationalID") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="NationalIDLabel" runat="server" Text='<%# Eval("NationalID") %>'></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn DataField="StudentID" DataType="System.Int32" FilterControlAltText="Filter StudentID column" HeaderText="رقم الطالب" SortExpression="StudentID" UniqueName="StudentID">
                                    <EditItemTemplate>
                                        <asp:RequiredFieldValidator class="validator" ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="StudentIDTextBox"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="StudentIDTextBox" runat="server" Text='<%# Bind("StudentID") %>' onKeyDown="if(this.value.length==11 && event.keyCode!=8) return false;" placeholder="من فضلك ادخل كود الطالب" required></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="StudentIDLabel" runat="server" Text='<%# Eval("StudentID") %>'></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn DataField="SeatNumber" DataType="System.Int32" FilterControlAltText="Filter SeatNumber column" HeaderText="رقم الجلوس" SortExpression="SeatNumber" UniqueName="SeatNumber">
                                    <EditItemTemplate>
                                        <asp:RequiredFieldValidator class="validator" ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="SeatNumberTextBox"></asp:RequiredFieldValidator><asp:TextBox ID="SeatNumberTextBox" runat="server" Text='<%# Bind("SeatNumber") %>'  onKeyDown="if(this.value.length==11 && event.keyCode!=8) return false;" placeholder="من فضلك ادخل رقم الجلوس" required></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="SeatNumberLabel" runat="server" Text='<%# Eval("SeatNumber") %>'></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn DataField="Name" FilterControlAltText="Filter Name column" HeaderText="اسم الطالب" SortExpression="Name" UniqueName="Name">
                                    <EditItemTemplate>
                                        <asp:RequiredFieldValidator class="validator" ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="NameTextBox"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' placeholder="من فضلك ادخل اسم الطالب" required></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn DataField="Phone" FilterControlAltText="Filter Phone column" HeaderText="رقم الهاتف" SortExpression="Phone" UniqueName="Phone">
                                    <EditItemTemplate>
                                        <asp:RequiredFieldValidator class="validator" ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ControlToValidate="PhoneTextBox"></asp:RequiredFieldValidator><asp:TextBox ID="PhoneTextBox" runat="server" Text='<%# Bind("Phone") %>'  onKeyDown="if(this.value.length==11 && event.keyCode!=8) return false;" placeholder="من فضلك ادخل رقم الهاتف" required></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="PhoneLabel" runat="server" Text='<%# Eval("Phone") %>'></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn DataField="Email" FilterControlAltText="Filter Email column" HeaderText="البريد الالكتروني" SortExpression="Email" UniqueName="Email">
                                    <EditItemTemplate>
                                        <asp:RequiredFieldValidator class="validator" ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ControlToValidate="EmailTextBox"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' onKeyDown="if(this.value.length==11 && event.keyCode!=8) return false;" placeholder="من فضلك ادخل البريد الالكتروني" required></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn DataField="LevelName" FilterControlAltText="Filter LevelName column" HeaderText="الفرقة" SortExpression="LevelName" UniqueName="LevelName">
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="DropDownList3" runat="server" CssClass="select" DataSourceID="DaraLevel" DataTextField="LevelName" DataValueField="LevelID" SelectedValue='<%# Bind("LevelID") %>'>
                                        </asp:DropDownList>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="LevelNameLabel" runat="server" Text='<%# Eval("LevelName") %>'></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn DataField="DepName" FilterControlAltText="Filter DepName column" HeaderText="اسم القسم" SortExpression="DepName" UniqueName="DepName">
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="DropDownList4" runat="server" CssClass="select" DataSourceID="DataDepartment" DataTextField="DepName" DataValueField="DepID" SelectedValue='<%# Bind("DepID") %>'>
                                        </asp:DropDownList>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="DepNameLabel" runat="server" Text='<%# Eval("DepName") %>'></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn DataField="AdvName" FilterControlAltText="Filter AdvName column" HeaderText="اسم المرشد" SortExpression="AdvName" UniqueName="AdvName">
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="DropDownList5" runat="server" CssClass="select" DataSourceID="DataDoctor" DataTextField="AdvName" DataValueField="NationalID" SelectedValue='<%# Bind("adNationalID") %>'>
                                        </asp:DropDownList>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="AdvNameLabel" runat="server" Text='<%# Eval("AdvName") %>'></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridCheckBoxColumn DataField="Statu" DataType="System.Boolean" FilterControlAltText="Filter Statu column" HeaderText="حالة الطالب" SortExpression="Statu" UniqueName="Statu">
                                </telerik:GridCheckBoxColumn>
                            </Columns>
                        </MasterTableView>
                        <HeaderStyle BackColor="#6c757d" BorderStyle="Solid" Font-Bold="True" Font-Size="12pt" ForeColor="White" />
                    </telerik:RadGrid>
                    <asp:SqlDataSource ID="DataAddStudent" runat="server" ConnectionString="<%$ ConnectionStrings:AcademicDBConnectionString %>" DeleteCommand="DELETE FROM [Student] WHERE [NationalID] = @NationalID" InsertCommand="INSERT INTO Student(NationalID, StudentID, SeatNumber, Name, adNationalID, DepID, LevelID, Phone, Email, Statu, Password) VALUES (@NationalID, @StudentID, @SeatNumber, @Name, @adNationalID, @DepID, @LevelID, @Phone, @Email, @Statu,@Password)" SelectCommand="SELECT * FROM [Student]" UpdateCommand="UPDATE [Student] SET [StudentID] = @StudentID, [SeatNumber] = @SeatNumber, [Name] = @Name, [adNationalID] = @adNationalID, [DepID] = @DepID, [LevelID] = @LevelID WHERE [NationalID] = @NationalID">
                        <DeleteParameters>
                            <asp:Parameter Name="NationalID" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:ControlParameter ControlID="txtsN" Name="NationalID" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="txtsID" Name="StudentID" PropertyName="Text" Type="Int32" />
                            <asp:ControlParameter Name="SeatNumber" Type="Int32" ControlID="txtsNumber" PropertyName="Text" />
                            <asp:ControlParameter ControlID="txtsName" Name="Name" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="ddlsDoctor" Name="adNationalID" PropertyName="SelectedValue" Type="Int32" />
                            <asp:ControlParameter ControlID="ddsDep" Name="DepID" PropertyName="SelectedValue" Type="Int32" />
                            <asp:ControlParameter ControlID="ddslevel" Name="LevelID" PropertyName="SelectedValue" Type="Int32" />
                            <asp:ControlParameter ControlID="txtPhone" Name="Phone" PropertyName="Text" />
                            <asp:ControlParameter ControlID="txtEmail" Name="Email" PropertyName="Text" />
                            <asp:ControlParameter ControlID="ddlstate" Name="Statu" PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="txtsID" Name="Password" PropertyName="Text" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="StudentID" Type="Int32" />
                            <asp:Parameter Name="SeatNumber" Type="Int32" />
                            <asp:Parameter Name="Name" Type="String" />
                            <asp:Parameter Name="adNationalID" Type="Int32" />
                            <asp:Parameter Name="DepID" Type="Int32" />
                            <asp:Parameter Name="LevelID" Type="Int32" />
                            <asp:Parameter Name="NationalID" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="DataStudent" runat="server" ConnectionString='<%$ ConnectionStrings:AcademicDBConnectionString %>' DeleteCommand="DELETE FROM [Student] WHERE [NationalID] = @NationalID" InsertCommand="INSERT INTO [Student] ([NationalID], [StudentID], [SeatNumber], [Name], [adNationalID], [DepID], [LevelID]) VALUES (@NationalID, @StudentID, @SeatNumber, @Name, @adNationalID, @DepID, @LevelID)" SelectCommand="SELECT dbo.Student.*, dbo.Levels.LevelName, dbo.Department.DepName, dbo.Advisor.AdvName
FROM     dbo.Student INNER JOIN
                  dbo.Levels ON dbo.Student.LevelID = dbo.Levels.LevelID INNER JOIN
                  dbo.Department ON dbo.Student.DepID = dbo.Department.DepID INNER JOIN
                  dbo.Advisor ON dbo.Student.adNationalID = dbo.Advisor.NationalID"
                        UpdateCommand="UPDATE Student SET StudentID = @StudentID, SeatNumber = @SeatNumber, Name = @Name, adNationalID = @adNationalID, DepID = @DepID, LevelID = @LevelID, Phone = @Phone, Email = @Email, Statu = @Statu WHERE (NationalID = @NationalID)">
                        <DeleteParameters>
                            <asp:Parameter Name="NationalID" Type="Int32"></asp:Parameter>
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="NationalID" Type="String"></asp:Parameter>
                            <asp:Parameter Name="StudentID" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="SeatNumber" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="Name" Type="String"></asp:Parameter>
                            <asp:Parameter Name="adNationalID" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="DepID" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="LevelID" Type="Int32"></asp:Parameter>
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="StudentID" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="SeatNumber" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="Name" Type="String"></asp:Parameter>
                            <asp:Parameter Name="adNationalID" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="DepID" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="LevelID" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="NationalID" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="Phone" />
                            <asp:Parameter Name="Email" />
                            <asp:Parameter Name="Statu" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <telerik:RadGrid ID="DgvDoctor" runat="server" CellSpacing="-1" DataSourceID="DataAddDoctor" GridLines="Both" AutoGenerateDeleteColumn="True" AutoGenerateEditColumn="True" AllowAutomaticDeletes="True" AllowAutomaticUpdates="True" Visible="False" OnDeleteCommand="DgvDoctor_DeleteCommand">
                        <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                        <MasterTableView AutoGenerateColumns="False" DataKeyNames="NationalID" DataSourceID="DataAddDoctor">
                            <Columns>
                                <telerik:GridTemplateColumn DataField="NationalID" DataType="System.Int32" FilterControlAltText="Filter NationalID column" HeaderText="الرقم القومي" SortExpression="NationalID" UniqueName="NationalID">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="NationalIDTextBox" ReadOnly="true" runat="server" Text='<%# Bind("NationalID") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="NationalIDLabel" runat="server" Text='<%# Eval("NationalID") %>'></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn DataField="AdvisorID" DataType="System.Int32" FilterControlAltText="Filter AdvisorID column" HeaderText="كود المرشد" SortExpression="AdvisorID" UniqueName="AdvisorID">
                                    <EditItemTemplate>
                                        <asp:RequiredFieldValidator class="validator" ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ControlToValidate="AdvisorIDTextBox"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="AdvisorIDTextBox" runat="server" Text='<%# Bind("AdvisorID") %>'  onKeyDown="if(this.value.length==8 && event.keyCode!=8) return false;" placeholder="من فضلك ادخل كود المرشد" required></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="AdvisorIDLabel" runat="server" Text='<%# Eval("AdvisorID") %>'></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn DataField="AdvName" FilterControlAltText="Filter AdvName column" HeaderText="اسم المرشد" SortExpression="AdvName" UniqueName="AdvName">
                                    <EditItemTemplate>
                                        <asp:RequiredFieldValidator class="validator" ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="AdvNameTextBox"></asp:RequiredFieldValidator><asp:TextBox ID="AdvNameTextBox" runat="server" Text='<%# Bind("AdvName") %>' placeholder="من فضلك ادخل اسم المرشد" required></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="AdvNameLabel" runat="server" Text='<%# Eval("AdvName") %>'></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn DataField="Degree" FilterControlAltText="Filter Degree column" HeaderText="الدرجة العلمية" SortExpression="Degree" UniqueName="Degree">
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="DropDownList8" runat="server" CssClass="select" SelectedValue='<%# Bind("Degree") %>'>
                                            <asp:ListItem>معيد</asp:ListItem>
                                            <asp:ListItem>مدرس مساعد</asp:ListItem>
                                            <asp:ListItem>مدرس</asp:ListItem>
                                            <asp:ListItem>استاذ مساعد</asp:ListItem>
                                            <asp:ListItem>استاذ</asp:ListItem>


                                        </asp:DropDownList>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="DegreeLabel" runat="server" Text='<%# Eval("Degree") %>'></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn DataField="Specialization" FilterControlAltText="Filter Specialization column" HeaderText="التخصص" SortExpression="Specialization" UniqueName="Specialization">
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="DropDownList7" runat="server" CssClass="select" SelectedValue='<%# Bind("Specialization") %>'>
                                            <asp:ListItem>علوم حاسب</asp:ListItem>
                                            <asp:ListItem>نظم معلومات</asp:ListItem>
                                            <asp:ListItem>بحوث عمليات</asp:ListItem>
                                            <asp:ListItem>محاسبة</asp:ListItem>
                                            <asp:ListItem>احصاء</asp:ListItem>
                                            <asp:ListItem>ادراة اعمال</asp:ListItem>
                                        </asp:DropDownList>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="SpecializationLabel" runat="server" Text='<%# Eval("Specialization") %>'></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn DataField="Phone" FilterControlAltText="Filter Phone column" HeaderText="الهاتف" SortExpression="Phone" UniqueName="Phone">
                                    <EditItemTemplate>
                                        <asp:RequiredFieldValidator class="validator" ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ControlToValidate="PhoneTextBox"></asp:RequiredFieldValidator><asp:TextBox ID="PhoneTextBox" runat="server" Text='<%# Bind("Phone") %>' placeholder="من فضلك ادخل رقم الهاتف" required></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="PhoneLabel" runat="server" Text='<%# Eval("Phone") %>'></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn DataField="Email" FilterControlAltText="Filter Email column" HeaderText="البريد الالكتروني" SortExpression="Email" UniqueName="Email">
                                    <EditItemTemplate>
                                        <asp:RequiredFieldValidator class="validator" ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ControlToValidate="EmailTextBox"></asp:RequiredFieldValidator><asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' placeholder="من فضلك ادخل البريد الالكتروني" required></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn DataField="DepName" FilterControlAltText="Filter DepName column" HeaderText="اسم القسم" SortExpression="DepName" UniqueName="DepName">
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="DropDownList6" runat="server" CssClass="select" DataSourceID="DataDepartment" DataTextField="DepName" DataValueField="DepID" SelectedValue='<%# Bind("DepID") %>'>
                                        </asp:DropDownList>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="DepNameLabel" runat="server" Text='<%# Eval("DepName") %>'></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridCheckBoxColumn DataField="Statu" DataType="System.Boolean" FilterControlAltText="Filter Statu column" HeaderText="حالة المرشد" SortExpression="Statu" UniqueName="Statu">
                                </telerik:GridCheckBoxColumn>
                            </Columns>
                        </MasterTableView>
                        <HeaderStyle BackColor="#6c757d" BorderStyle="Solid" Font-Bold="True" Font-Size="12pt" ForeColor="White" />
                    </telerik:RadGrid>
                    <asp:SqlDataSource ID="DataAddDoctor" runat="server" ConnectionString="<%$ ConnectionStrings:AcademicDBConnectionString %>" DeleteCommand="DELETE FROM [Advisor] WHERE [NationalID] = @NationalID" InsertCommand="INSERT INTO Advisor(NationalID, AdvisorID, AdvName, DepID, Degree, Specialization, Phone, Email, Statu, Password) VALUES (@NationalID, @AdvisorID, @AdvName, @DepID, @Degree, @Specialization, @Phone, @Email, @Statu,@Password)" SelectCommand="SELECT dbo.Advisor.*, dbo.Department.DepName
FROM     dbo.Advisor INNER JOIN
                  dbo.Department ON dbo.Advisor.DepID = dbo.Department.DepID"
                        UpdateCommand="UPDATE [Advisor] SET [AdvisorID] = @AdvisorID, [AdvName] = @AdvName, [DepID] = @DepID, [Degree] = @Degree, [Specialization] = @Specialization, [Phone] = @Phone, [Email] = @Email, [Statu] = @Statu WHERE [NationalID] = @NationalID">
                        <DeleteParameters>
                            <asp:Parameter Name="NationalID" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:ControlParameter ControlID="txtaNaDoctor" Name="NationalID" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="txtadID" Name="AdvisorID" PropertyName="Text" Type="Int32" />
                            <asp:ControlParameter ControlID="txtDName" Name="AdvName" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="ddaddDep" Name="DepID" PropertyName="SelectedValue" Type="Int32" />
                            <asp:ControlParameter ControlID="ddDera" Name="Degree" PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="ddlsoliz" Name="Specialization" PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="txtPhone" Name="Phone" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="txtEmail" Name="Email" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="ddlstate" Name="Statu" PropertyName="SelectedValue" Type="Boolean" />
                            <asp:ControlParameter ControlID="txtadID" Name="Password" PropertyName="Text" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="AdvisorID" Type="Int32" />
                            <asp:Parameter Name="AdvName" Type="String" />
                            <asp:Parameter Name="DepID" Type="Int32" />
                            <asp:Parameter Name="Degree" Type="String" />
                            <asp:Parameter Name="Specialization" Type="String" />
                            <asp:Parameter Name="Phone" Type="String" />
                            <asp:Parameter Name="Email" Type="String" />
                            <asp:Parameter Name="Statu" Type="Boolean" />
                            <asp:Parameter Name="NationalID" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <telerik:RadGrid ID="DgvEmployee" Visible="False" runat="server"  AutoGenerateDeleteColumn="True" AutoGenerateEditColumn="True" DataSourceID="DataAddEmployee" AllowAutomaticDeletes="True" AllowAutomaticUpdates="True" OnDeleteCommand="DgvEmployee_DeleteCommand">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                        <MasterTableView AutoGenerateColumns="False" DataKeyNames="NationalID" DataSourceID="DataAddEmployee">
                            <Columns>
                                <telerik:GridTemplateColumn DataField="NationalID" DataType="System.Int32" FilterControlAltText="Filter NationalID column" HeaderText="لرقم القومي" SortExpression="NationalID" UniqueName="NationalID">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="NationalIDTextBox" runat="server" Text='<%# Bind("NationalID") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="NationalIDLabel" runat="server" Text='<%# Eval("NationalID") %>'></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn DataField="NumberInsurance" DataType="System.Int32" FilterControlAltText="Filter NumberInsurance column" HeaderText="كود الموظف" SortExpression="NumberInsurance" UniqueName="NumberInsurance">
                                    <EditItemTemplate>
                                        <asp:RequiredFieldValidator class="validator" ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ControlToValidate="NumberInsuranceTextBox"></asp:RequiredFieldValidator><asp:TextBox ID="NumberInsuranceTextBox" runat="server" Text='<%# Bind("NumberInsurance") %>'  onKeyDown="if(this.value.length==11 && event.keyCode!=8) return false;" placeholder="من فضلك ادخل كود الموظف" required ></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="NumberInsuranceLabel" runat="server" Text='<%# Eval("NumberInsurance") %>'></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn DataField="Name" FilterControlAltText="Filter Name column" HeaderText="اسم الموظف" SortExpression="Name" UniqueName="Name">
                                    <EditItemTemplate>
                                         <asp:RequiredFieldValidator class="validator" ID="RequiredFieldValidator7" runat="server" ErrorMessage="*" ControlToValidate="NameTextBox"></asp:RequiredFieldValidator><asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' placeholder=" من فضلك ادخل اسم الموظف " required></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn DataField="Job" FilterControlAltText="Filter Job column" HeaderText="الوظيفة" SortExpression="Job" UniqueName="Job">
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="DropDownList9" runat="server" CssClass="select" SelectedValue='<%# Bind("Job") %>'>
                                            <asp:ListItem>المتابعة</asp:ListItem>
                                <asp:ListItem>شئون الطلاب</asp:ListItem>
                                <asp:ListItem>الشئون الاجتماعية</asp:ListItem>
                                        </asp:DropDownList>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="JobLabel" runat="server" Text='<%# Eval("Job") %>'></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn DataField="Phone" FilterControlAltText="Filter Phone column" HeaderText="الهاتف" SortExpression="Phone" UniqueName="Phone">
                                    <EditItemTemplate>
                                        <asp:RequiredFieldValidator class="validator" ID="RequiredFieldValidator8" runat="server" ErrorMessage="*" ControlToValidate="PhoneTextBox"></asp:RequiredFieldValidator><asp:TextBox ID="PhoneTextBox" runat="server" Text='<%# Bind("Phone") %>' onKeyDown="if(this.value.length==11 && event.keyCode!=8) return false;" placeholder=" من فضلك ادخل رقم الهاتف " required></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="PhoneLabel" runat="server" Text='<%# Eval("Phone") %>'></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn DataField="Eamil" FilterControlAltText="Filter Eamil column" HeaderText="البريد الالكتروني" SortExpression="Eamil" UniqueName="Eamil">
                                    <EditItemTemplate>
                                        <asp:RequiredFieldValidator class="validator" ID="RequiredFieldValidator9" runat="server" ErrorMessage="*" ControlToValidate="EamilTextBox"></asp:RequiredFieldValidator><asp:TextBox ID="EamilTextBox" runat="server" Text='<%# Bind("Eamil") %>'  placeholder=" من فضلك ادخل البريد الالكتروني " required></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="EamilLabel" runat="server" Text='<%# Eval("Eamil") %>'></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridCheckBoxColumn DataField="Statu" DataType="System.Boolean" FilterControlAltText="Filter Statu column" HeaderText="حالة الموظف" SortExpression="Statu" UniqueName="Statu">
                                </telerik:GridCheckBoxColumn>
                            </Columns>
                        </MasterTableView>
                        <HeaderStyle BackColor="#6c757d" BorderStyle="Solid" Font-Bold="True" Font-Size="12pt" ForeColor="White" />
                    </telerik:RadGrid>
                    
    </ContentTemplate>

                </asp:UpdatePanel>
                    <asp:SqlDataSource ID="DataAddEmployee" runat="server" ConnectionString="<%$ ConnectionStrings:AcademicDBConnectionString %>" DeleteCommand="DELETE FROM [Employee] WHERE [NationalID] = @NationalID" InsertCommand="INSERT INTO Employee(NationalID, NumberInsurance, Name, Job, Phone, Eamil, Statu, Password) VALUES (@NationalID, @NumberInsurance, @Name, @Job, @Phone, @Eamil, @Statu,@Password)" SelectCommand="SELECT * FROM [Employee]" UpdateCommand="UPDATE [Employee] SET [NumberInsurance] = @NumberInsurance, [Name] = @Name, [Job] = @Job, [Phone] = @Phone, [Eamil] = @Eamil, [Statu] = @Statu WHERE [NationalID] = @NationalID">
                        <DeleteParameters>
                            <asp:Parameter Name="NationalID" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:ControlParameter ControlID="txtEmpN" Name="NationalID" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="txtEmID" Name="NumberInsurance" PropertyName="Text" Type="Int32" />
                            <asp:ControlParameter Name="Name" Type="String" ControlID="txtEmpName" PropertyName="Text" />
                            <asp:ControlParameter ControlID="ddljob" Name="Job" PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="txtPhone" Name="Phone" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="txtEmail" Name="Eamil" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="ddlstate" Name="Statu" PropertyName="SelectedValue" Type="Boolean" />
                            <asp:ControlParameter ControlID="txtEmID" Name="Password" PropertyName="Text" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="NumberInsurance" Type="Int32" />
                            <asp:Parameter Name="Name" Type="String" />
                            <asp:Parameter Name="Job" Type="String" />
                            <asp:Parameter Name="Phone" Type="String" />
                            <asp:Parameter Name="Eamil" Type="String" />
                            <asp:Parameter Name="Statu" Type="Boolean" />
                            <asp:Parameter Name="NationalID" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
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
</div>
</asp:Content>
