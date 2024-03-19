<%@ Page Title="" Language="C#" ValidateRequest="false" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ThemBanTin.aspx.cs" Inherits="QuanLiNhanSu.ThemBanTin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="Scripts/ckeditor/ckeditor.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <form>
            <h1>Thêm Bản Tin</h1>
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label style="display: block;">Tiêu đề</label>
                    <asp:TextBox ID="txttieude" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <label style="display: block;">Tóm tắt</label>
                <asp:TextBox ID="txttomtat" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
    <label style="display: block;">Nội dung</label>
    <textarea id="txtnoidung" name="txtnoidung" rows="30"></textarea>
    <asp:HiddenField ID="hdnNoidung" runat="server" />
</div>
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label style="display: block;">Hình đại diện</label>
                    <asp:FileUpload ID="FHinh" runat="server" CssClass="form-control-file"></asp:FileUpload>
                </div>
            </div>
                        <div class="form-row">
                <div class="form-group col-md-6">
                    <label style="display: block;">Ngày đăng</label>
                    <asp:TextBox ID="txtngaydang" type="date" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <asp:CheckBox ID="cbkhienan" runat="server" Text="Hiện" />
                <label for="cbkhienan" style="margin-left: 10px;">Trạng thái</label>
            </div>
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label style="display: block;">Thể loại</label>
                    <asp:DropDownList ID="ddltheloai" runat="server" CssClass="form-control" DataSourceID="dsTheLoai" DataTextField="TenTheLoai" DataValueField="Id"></asp:DropDownList>
                </div>
            </div>
            <asp:SqlDataSource ID="dsTheLoai" runat="server" ConnectionString="<%$ ConnectionStrings:QLNhanVienConnectionString %>" DeleteCommand="DELETE FROM [TheLoai] WHERE [Id] = @Id" InsertCommand="INSERT INTO [TheLoai] ([TenTheLoai], [TrangThai]) VALUES (@TenTheLoai, @TrangThai)" SelectCommand="SELECT * FROM [TheLoai]" UpdateCommand="UPDATE [TheLoai] SET [TenTheLoai] = @TenTheLoai, [TrangThai] = @TrangThai WHERE [Id] = @Id">
                <DeleteParameters>
                    <asp:Parameter Name="Id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="TenTheLoai" Type="String" />
                    <asp:Parameter Name="TrangThai" Type="Boolean" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="TenTheLoai" Type="String" />
                    <asp:Parameter Name="TrangThai" Type="Boolean" />
                    <asp:Parameter Name="Id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:Button ID="btnSave" runat="server" CssClass="btn btn-primary" OnClientClick="GetCKEditorContent();" Text="Thêm" OnClick="btnSave_Click" />
        </form>
        <asp:Label ID="lblketqua" runat="server" Text=""></asp:Label>
    </div>
    <script>
        function GetCKEditorContent() {
            var editor = CKEDITOR.instances.txtnoidung;
            var content = editor.getData();
            document.getElementById('<%= hdnNoidung.ClientID %>').value = content;
        }
    </script>
    <script>
        CKEDITOR.replace('txtnoidung');
    </script>
</asp:Content>
