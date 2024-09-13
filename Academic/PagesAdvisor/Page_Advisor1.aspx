<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAdvisor.Master" AutoEventWireup="true" CodeBehind="Page_Advisor1.aspx.cs" Inherits="Academic.PagesAdvisor.Page_Advisor1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style>
        #page1{
            color:#f0ad4e;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="div-basic d-flex justify-content-center w-100 mt-4">
            <div class="div-emelment2 shedow ">
                <i class="fa fa-graduation-cap" style="font-size:40px"></i>
                <h4 class="text-dark" style="font-size: 20px;display: inline-block; margin-bottom: 20px;">طلاب تحت اشرافي</h4><br />
                <form runat="server">
                <span>اجمالي الطلاب تحت اشرافي: <asp:Label ID="lbltotal" CssClass="text-success" runat="server" Text="0"></asp:Label></span><br>
                 <div class="mt-4">
                    <span> بحث عن طلاب فرقة :
                        <asp:DropDownList ID="ddlLevel" class="select" runat="server" AutoPostBack="true" DataSourceID="DataLevel" DataTextField="LevelName" DataValueField="LevelID">
                         </asp:DropDownList>
                         <asp:SqlDataSource runat="server" ID="DataLevel" ConnectionString='<%$ ConnectionStrings:AcademicDBConnectionString %>' SelectCommand="SELECT [LevelID], [LevelName] FROM [Levels]"></asp:SqlDataSource>
                </span><br>
                     </div>
               <hr class="text-success">
                <span>اجمالي طلاب الفرقة تحت اشرافي: <asp:Label ID="lbltotalLevel" CssClass="text-success" runat="server" Text="0"></asp:Label></span><br>
                     <div class="text-center ">
                    <h6 class="text-dark">طلاب الفرقة <asp:Label ID="lblTitle" CssClass="text-success" style="font-size:18px" runat="server" Text="0" Font-Size="Large"></asp:Label> </h6>
                   </div>
                    <div class="div-table"> 
                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                        <telerik:RadGrid ID="RadGrid1" runat="server" CellSpacing="-1" DataSourceID="DataAdvisor" GridLines="Both">
                            <MasterTableView DataSourceID="DataAdvisor" AutoGenerateColumns="False">
                                <Columns>
                                    <telerik:GridBoundColumn DataField="StudentID" HeaderText="كود الطالب" SortExpression="StudentID" UniqueName="StudentID" DataType="System.Int32" FilterControlAltText="Filter StudentID column"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Name" HeaderText="اسم الطالب" SortExpression="Name" UniqueName="Name" FilterControlAltText="Filter Name column"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="LevelName" HeaderText="الفرقة" SortExpression="LevelName" UniqueName="LevelName" FilterControlAltText="Filter LevelName column"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="DepName" HeaderText="اسم القسم" SortExpression="DepName" UniqueName="DepName" FilterControlAltText="Filter DepName column"></telerik:GridBoundColumn>
                                </Columns>
                            </MasterTableView>
                        <HeaderStyle BackColor="LightSlateGray" BorderStyle="Solid" Font-Bold="True" Font-Size="13pt" ForeColor="White" />
                        </telerik:RadGrid>   
                        <asp:SqlDataSource runat="server" ID="DataAdvisor" ConnectionString='<%$ ConnectionStrings:AcademicDBConnectionString %>' SelectCommand="SELECT * FROM [ViewAdvisorStudent] where adNationalID=@adNationalID and LevelID=@LevelID">
                            <SelectParameters>
                                <asp:SessionParameter DefaultValue="" Name="adNationalID" SessionField="AdvisorID" />
                                <asp:ControlParameter ControlID="ddlLevel" DefaultValue="" Name="LevelID" PropertyName="SelectedValue" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
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
