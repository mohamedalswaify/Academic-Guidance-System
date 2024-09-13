<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAdmin.Master" AutoEventWireup="true" CodeBehind="Page_Admin4.aspx.cs" Inherits="Academic.PagesAdmin.Page_Admin4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
    #page9 {
            color: #dc3545;
        }
       </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="div-basic d-flex justify-content-center w-100 mt-4">
        <div class="div-emelment2 shedow ">
            <i class="fa-solid fa-users ico"></i>
            <h4 class="text-dark" style="font-size: 20px; margin-bottom: 20px; display: inline-block;">التــــــرم الحالي
            </h4>
            
            <form runat="server">
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <telerik:RadGrid ID="RadGrid1" runat="server" CellSpacing="-1" DataSourceID="DataTerm" GridLines="Both" AutoGenerateEditColumn="True" AllowAutomaticUpdates="True" >
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>

                    <MasterTableView DataSourceID="DataTerm" AutoGenerateColumns="False">
                        <Columns>
                            <telerik:GridTemplateColumn DataField="term" FilterControlAltText="Filter term column" HeaderText="الترم الحالـــي" SortExpression="term" UniqueName="term">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="select" SelectedValue='<%# Bind("term") %>'>
                                        <asp:ListItem Value="1">الترم الاول</asp:ListItem>
                                        <asp:ListItem Value="2">الترم الثاني</asp:ListItem>
                                        <asp:ListItem Value="3">الترم الصيفي</asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="termLabel" runat="server" Text='<%# Eval("term") %>'></asp:Label>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                        </Columns>
                    </MasterTableView>
                        <HeaderStyle BackColor="#6c757d" BorderStyle="Solid" Font-Bold="True" Font-Size="12pt" ForeColor="White" />
                </telerik:RadGrid>
                <asp:SqlDataSource runat="server" ID="DataTerm" UpdateCommand="UPDATE [Terms] SET [term] = @term" ConnectionString='<%$ ConnectionStrings:AcademicDBConnectionString %>' SelectCommand="SELECT * FROM [Terms]" DeleteCommand="DELETE FROM [Terms] WHERE [term] = @term" InsertCommand="INSERT INTO [Terms] ([term]) VALUES (@term)">
                    <DeleteParameters>
                        <asp:Parameter Name="term" Type="String"></asp:Parameter>
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="term" Type="String"></asp:Parameter>
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="term" Type="String"></asp:Parameter>
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
