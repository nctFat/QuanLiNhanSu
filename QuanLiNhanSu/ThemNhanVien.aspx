<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ThemNhanVien.aspx.cs" Inherits="QuanLiNhanSu.ThemNhanVien" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
    .container {
        max-width: 800px;
        margin: 0 auto;
        padding: 20px;
        background-color: #f9f9f9;
        border: 1px solid #ddd;
    }

    .form-group {
        margin-bottom: 20px;
    }

    label {
        font-weight: bold;
    }

    input[type="text"],
    select {
        width: 100%;
        padding: 10px;
        border-radius: 5px;
        border: 1px solid #ccc;
        box-sizing: border-box;
    }
</style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div class="container">
       <form>
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="">Họ Nhân Viên</label>
        
    </div>
  </div>
           <asp:TextBox ID="txthonv" runat="server"></asp:TextBox>
  <div class="form-group">
    <label for="">Tên Nhân Viên</label>
      
  </div>
           <asp:TextBox ID="txttennv" runat="server"></asp:TextBox>
<div class="form-group">
        Nam <asp:CheckBox ID="cbkgioitinh" runat="server" /> 
  </div>
  <div class="form-group">
      Ngày Sinh <asp:TextBox ID="txtNgaySinh" type="date" runat="server"></asp:TextBox>
  </div>
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="">Nơi Sinh</label>
        <asp:TextBox ID="txtnoisinh" runat="server"></asp:TextBox>
    </div>
      </div>
        <div class="form-row">
    <div class="form-group col-md-6">
      <label for="">Phòng Ban</label>
        <asp:DropDownList ID="ddlphongban" runat="server" DataSourceID="dsPhongBan" DataTextField="TenPhong" DataValueField="MaPhong" AutoPostBack="true"></asp:DropDownList>
    </div>
            </div>
            <asp:SqlDataSource ID="dsPhongBan" runat="server" ConnectionString="<%$ ConnectionStrings:QLNhanVienConnectionString8 %>" ProviderName="<%$ ConnectionStrings:QLNhanVienConnectionString8.ProviderName %>" SelectCommand="SELECT * FROM [PhongBan]"></asp:SqlDataSource>
            <asp:Button ID="btnSave" runat="server"   CssClass="btn btn-primary" Text="Thêm" OnClick="btnSave_Click" />
</form>
       <asp:Label ID="lblketqua" runat="server" Text=""></asp:Label>
   </div>
</asp:Content>
