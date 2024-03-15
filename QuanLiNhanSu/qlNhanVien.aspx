<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="qlNhanVien.aspx.cs" Inherits="QuanLiNhanSu.qlNhanVien" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 class="text-center"> DANH SÁCH NHÂN VIÊN</h2>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:QLNhanVienConnectionString %>" DeleteCommand="DELETE FROM [NhanVien] WHERE [MaNV] = @MaNV" InsertCommand="INSERT INTO [NhanVien] ([HoNV], [TenNV], [Phai], [NgaySinh], [NoiSinh], [MaPhong]) VALUES (@HoNV, @TenNV, @Phai, @NgaySinh, @NoiSinh, @MaPhong)" OnSelecting="SqlDataSource1_Selecting" SelectCommand="SELECT * FROM [NhanVien]" UpdateCommand="UPDATE [NhanVien] SET [HoNV] = @HoNV, [TenNV] = @TenNV, [Phai] = @Phai, [NgaySinh] = @NgaySinh, [NoiSinh] = @NoiSinh, [MaPhong] = @MaPhong WHERE [MaNV] = @MaNV">
        <DeleteParameters>
            <asp:Parameter Name="MaNV" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="HoNV" Type="String" />
            <asp:Parameter Name="TenNV" Type="String" />
            <asp:Parameter Name="Phai" Type="Boolean" />
            <asp:Parameter DbType="Date" Name="NgaySinh" />
            <asp:Parameter Name="NoiSinh" Type="String" />
            <asp:Parameter Name="MaPhong" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="HoNV" Type="String" />
            <asp:Parameter Name="TenNV" Type="String" />
            <asp:Parameter Name="Phai" Type="Boolean" />
            <asp:Parameter DbType="Date" Name="NgaySinh" />
            <asp:Parameter Name="NoiSinh" Type="String" />
            <asp:Parameter Name="MaPhong" Type="Int32" />
            <asp:Parameter Name="MaNV" Type="Int32" />
        </UpdateParameters>
</asp:SqlDataSource>
    <asp:GridView ID="GridView1" AllowPaging="true" PageSize="5" CssClass="text-center w-75 m-auto" runat="server" AutoGenerateColumns="False" DataKeyNames="MaNV" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="1171px">
        <Columns>
            <asp:BoundField DataField="MaNV" HeaderText="Mã Nhân Viên" InsertVisible="False" ReadOnly="True" SortExpression="MaNV" />
            <asp:BoundField DataField="HoNV" HeaderText="Họ Nhân Viên" SortExpression="HoNV" />
            <asp:BoundField DataField="TenNV" HeaderText="Tên Nhân Viên" SortExpression="TenNV" />
            <asp:CheckBoxField DataField="Phai" HeaderText="Phái" SortExpression="Phai" />
            <asp:BoundField DataField="NgaySinh" HeaderText="Ngày Sinh" SortExpression="NgaySinh" />
            <asp:BoundField DataField="NoiSinh" HeaderText="Nơi Sinh" SortExpression="NoiSinh" />
            <asp:BoundField DataField="MaPhong" HeaderText="Mã Phòng Ban" SortExpression="MaPhong" />
            <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" ItemStyle-CssClass="btn btn-primary" ControlStyle-CssClass="btn btn-danger" />
        </Columns>
        <PagerSettings FirstPageText="Đầu"
            LastPageText="Cuối" PreviousPageText="Trước" NextPageText="Sau"
            />
        <PagerStyle HorizontalAlign="Center"/>
        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
        <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
        <RowStyle BackColor="White" ForeColor="#330099" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
        <SortedAscendingCellStyle BackColor="#FEFCEB" />
        <SortedAscendingHeaderStyle BackColor="#AF0101" />
        <SortedDescendingCellStyle BackColor="#F6F0C0" />
        <SortedDescendingHeaderStyle BackColor="#7E0000" />
    </asp:GridView>
</asp:Content>
