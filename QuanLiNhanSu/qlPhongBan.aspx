<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="qlPhongBan.aspx.cs" Inherits="QuanLiNhanSu.qlPhongBan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .panel-center {
            text-align: center;
            margin: auto;
            width: 50%; /* hoặc giá trị phù hợp */
            padding: 20px;
        }

        .dropdown-center {
            margin: auto;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 class="text-center"> DANH SÁCH PHÒNG BAN</h2>
    <asp:SqlDataSource ID="DSPhongBan" runat="server" ConnectionString="<%$ ConnectionStrings:QLNhanVienConnectionString6 %>" DeleteCommand="DELETE FROM [PhongBan] WHERE [MaPhong] = @MaPhong" InsertCommand="INSERT INTO [PhongBan] ([TenPhong]) VALUES (@TenPhong)" ProviderName="<%$ ConnectionStrings:QLNhanVienConnectionString6.ProviderName %>" SelectCommand="SELECT * FROM [PhongBan]" UpdateCommand="UPDATE [PhongBan] SET [TenPhong] = @TenPhong WHERE [MaPhong] = @MaPhong">
        <DeleteParameters>
            <asp:Parameter Name="MaPhong" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="TenPhong" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="TenPhong" Type="String" />
            <asp:Parameter Name="MaPhong" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="DSNhanVienTheoBan" runat="server" ConnectionString="<%$ ConnectionStrings:QLNhanVienConnectionString7 %>" SelectCommand="SELECT * FROM [NhanVien] WHERE ([MaPhong] = @MaPhong)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DDLPhongBan" Name="MaPhong" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:Panel CssClass="text-center panel-center"  ID="Panel1" runat="server" GroupingText="Phòng ban" BorderColor="Black" BorderWidth="2px">
        <asp:DropDownList CssClass="m-auto text-center dropdown-center" ID="DDLPhongBan" runat="server" DataSourceID="DSPhongBan" DataTextField="TenPhong" DataValueField="MaPhong"  AutoPostBack="true"></asp:DropDownList>

    </asp:Panel><br>
    <asp:GridView CssClass="m-auto text-center" ID="GridNhanVienTheoPhongBan" runat="server" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="DSNhanVienTheoBan" Width="1379px" AutoGenerateColumns="False" DataKeyNames="MaNV">
        <Columns>
            <asp:BoundField DataField="MaNV" HeaderText="MaNV" InsertVisible="False" ReadOnly="True" SortExpression="MaNV" />
            <asp:BoundField DataField="HoNV" HeaderText="HoNV" SortExpression="HoNV" />
            <asp:BoundField DataField="TenNV" HeaderText="TenNV" SortExpression="TenNV" />
            <asp:CheckBoxField DataField="Phai" HeaderText="Phai" SortExpression="Phai" />
            <asp:BoundField DataField="NgaySinh" HeaderText="NgaySinh" SortExpression="NgaySinh" />
            <asp:BoundField DataField="NoiSinh" HeaderText="NoiSinh" SortExpression="NoiSinh" />
            <asp:BoundField DataField="MaPhong" HeaderText="MaPhong" SortExpression="MaPhong" />
            <asp:CommandField ShowDeleteButton="True" />
        </Columns>
        <EmptyDataTemplate>
            <div class="alert alert-warning">
                <h1>
                    Không có nhân viên nào thuộc phòng ban này
                </h1>
            </div>
        </EmptyDataTemplate>
        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
        <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
        <RowStyle ForeColor="#330099" BackColor="White" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
        <SortedAscendingCellStyle BackColor="#FEFCEB" />
        <SortedAscendingHeaderStyle BackColor="#AF0101" />
        <SortedDescendingCellStyle BackColor="#F6F0C0" />
        <SortedDescendingHeaderStyle BackColor="#7E0000" />
    </asp:GridView>
    </asp:Content>

