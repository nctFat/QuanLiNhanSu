<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="qlTinTuc.aspx.cs" Inherits="QuanLiNhanSu.qlTinTuc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:SqlDataSource ID="dsTinTuc" runat="server" ConnectionString="<%$ ConnectionStrings:QLNhanVienConnectionString %>" DeleteCommand="DELETE FROM [BanTin] WHERE [Id] = @Id" InsertCommand="INSERT INTO [BanTin] ([TieuDe], [TomTat], [NoiDung], [Hinh], [NgayDang], [TrangThai], [TheLoaiID]) VALUES (@TieuDe, @TomTat, @NoiDung, @Hinh, @NgayDang, @TrangThai, @TheLoaiID)" SelectCommand="SELECT * FROM [BanTin]" UpdateCommand="UPDATE [BanTin] SET [TieuDe] = @TieuDe, [TomTat] = @TomTat, [NoiDung] = @NoiDung, [Hinh] = @Hinh, [NgayDang] = @NgayDang, [TrangThai] = @TrangThai, [TheLoaiID] = @TheLoaiID WHERE [Id] = @Id">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="TieuDe" Type="String" />
            <asp:Parameter Name="TomTat" Type="String" />
            <asp:Parameter Name="NoiDung" Type="String" />
            <asp:Parameter Name="Hinh" Type="String" />
            <asp:Parameter Name="NgayDang" Type="DateTime" />
            <asp:Parameter Name="TrangThai" Type="Boolean" />
            <asp:Parameter Name="TheLoaiID" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="TieuDe" Type="String" />
            <asp:Parameter Name="TomTat" Type="String" />
            <asp:Parameter Name="NoiDung" Type="String" />
            <asp:Parameter Name="Hinh" Type="String" />
            <asp:Parameter Name="NgayDang" Type="DateTime" />
            <asp:Parameter Name="TrangThai" Type="Boolean" />
            <asp:Parameter Name="TheLoaiID" Type="Int32" />
            <asp:Parameter Name="Id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <div class="container">
               
    <div class="form-group col-md-6 text-center" style="font-weight:bold;">
      <label for="">QUẢN LÝ TIN TỨC</label>    
        </div>

  </div>
<div class="container text-center">
    <a href="ThemBanTin.aspx" style="display: inline-block; padding: 10px 20px; background-color: #007bff; color: #fff; text-decoration: none; border-radius: 5px; transition: background-color 0.3s;">Thêm Bản Tin</a>
</div>

            
        <asp:ListView ID="lsvTinTuc" runat="server" DataKeyNames="Id" DataSourceID="dsTinTuc" InsertItemPosition="LastItem">
            <AlternatingItemTemplate>
                <tr style="background-color: #FAFAD2;color: #284775;">
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                    </td>
                    <td>
                        <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                    </td>
                    <td>
                        <asp:Label ID="TieuDeLabel" runat="server" Text='<%# Eval("TieuDe") %>' />
                    </td>
                    <td>
                        <asp:Label ID="TomTatLabel" runat="server" Text='<%# Eval("TomTat") %>' />
                    </td>
                    <td>
                        <asp:Label ID="NoiDungLabel" runat="server" Text='<%# Eval("NoiDung") %>' />
                    </td>
                    <td>
                        <asp:Label ID="HinhLabel" runat="server" Text='<%# Eval("Hinh") %>' />
                    </td>
                    <td>
                        <asp:Label ID="NgayDangLabel" runat="server" Text='<%# Eval("NgayDang") %>' />
                    </td>
                    <td>
                        <asp:CheckBox ID="TrangThaiCheckBox" runat="server" Checked='<%# Eval("TrangThai") %>' Enabled="false" />
                    </td>
                    <td>
                        <asp:Label ID="TheLoaiIDLabel" runat="server" Text='<%# Eval("TheLoaiID") %>' />
                    </td>
                </tr>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <tr style="background-color: #FFCC66;color: #000080;">
                    <td>
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                    </td>
                    <td>
                        <asp:Label ID="IdLabel1" runat="server" Text='<%# Eval("Id") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="TieuDeTextBox" runat="server" Text='<%# Bind("TieuDe") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="TomTatTextBox" runat="server" Text='<%# Bind("TomTat") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="NoiDungTextBox" runat="server" Text='<%# Bind("NoiDung") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="HinhTextBox" runat="server" Text='<%# Bind("Hinh") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="NgayDangTextBox" runat="server" Text='<%# Bind("NgayDang") %>' />
                    </td>
                    <td>
                        <asp:CheckBox ID="TrangThaiCheckBox" runat="server" Checked='<%# Bind("TrangThai") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="TheLoaiIDTextBox" runat="server" Text='<%# Bind("TheLoaiID") %>' />
                    </td>
                </tr>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                    <tr>
                        <td>No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                    </td>
                    <td>&nbsp;</td>
                    <td>
                        <asp:TextBox ID="TieuDeTextBox" runat="server" Text='<%# Bind("TieuDe") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="TomTatTextBox" runat="server" Text='<%# Bind("TomTat") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="NoiDungTextBox" runat="server" Text='<%# Bind("NoiDung") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="HinhTextBox" runat="server" Text='<%# Bind("Hinh") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="NgayDangTextBox" runat="server" Text='<%# Bind("NgayDang") %>' />
                    </td>
                    <td>
                        <asp:CheckBox ID="TrangThaiCheckBox" runat="server" Checked='<%# Bind("TrangThai") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="TheLoaiIDTextBox" runat="server" Text='<%# Bind("TheLoaiID") %>' />
                    </td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="background-color: #FFFBD6;color: #333333;">
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                    </td>
                    <td>
                        <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                    </td>
                    <td>
                        <asp:Label ID="TieuDeLabel" runat="server" Text='<%# Eval("TieuDe") %>' />
                    </td>
                    <td>
                        <asp:Label ID="TomTatLabel" runat="server" Text='<%# Eval("TomTat") %>' />
                    </td>
                    <td>
                        <asp:Label ID="NoiDungLabel" runat="server" Text='<%# Eval("NoiDung") %>' />
                    </td>
                    <td>
                        <asp:Label ID="HinhLabel" runat="server" Text='<%# Eval("Hinh") %>' />
                    </td>
                    <td>
                        <asp:Label ID="NgayDangLabel" runat="server" Text='<%# Eval("NgayDang") %>' />
                    </td>
                    <td>
                        <asp:CheckBox ID="TrangThaiCheckBox" runat="server" Checked='<%# Eval("TrangThai") %>' Enabled="false" />
                    </td>
                    <td>
                        <asp:Label ID="TheLoaiIDLabel" runat="server" Text='<%# Eval("TheLoaiID") %>' />
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr runat="server" style="background-color: #FFFBD6;color: #333333;">
                                    <th runat="server"></th>
                                    <th runat="server">Id</th>
                                    <th runat="server">TieuDe</th>
                                    <th runat="server">TomTat</th>
                                    <th runat="server">NoiDung</th>
                                    <th runat="server">Hinh</th>
                                    <th runat="server">NgayDang</th>
                                    <th runat="server">TrangThai</th>
                                    <th runat="server">TheLoaiID</th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="text-align: center;background-color: #FFCC66;font-family: Verdana, Arial, Helvetica, sans-serif;color: #333333;"></td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <tr style="background-color: #FFCC66;font-weight: bold;color: #000080;">
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                    </td>
                    <td>
                        <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                    </td>
                    <td>
                        <asp:Label ID="TieuDeLabel" runat="server" Text='<%# Eval("TieuDe") %>' />
                    </td>
                    <td>
                        <asp:Label ID="TomTatLabel" runat="server" Text='<%# Eval("TomTat") %>' />
                    </td>
                    <td>
                        <asp:Label ID="NoiDungLabel" runat="server" Text='<%# Eval("NoiDung") %>' />
                    </td>
                    <td>
                        <asp:Label ID="HinhLabel" runat="server" Text='<%# Eval("Hinh") %>' />
                    </td>
                    <td>
                        <asp:Label ID="NgayDangLabel" runat="server" Text='<%# Eval("NgayDang") %>' />
                    </td>
                    <td>
                        <asp:CheckBox ID="TrangThaiCheckBox" runat="server" Checked='<%# Eval("TrangThai") %>' Enabled="false" />
                    </td>
                    <td>
                        <asp:Label ID="TheLoaiIDLabel" runat="server" Text='<%# Eval("TheLoaiID") %>' />
                    </td>
                </tr>
            </SelectedItemTemplate>
                </asp:ListView>
    </div>
</asp:Content>
