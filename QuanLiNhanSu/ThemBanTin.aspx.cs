﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net.NetworkInformation;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace QuanLiNhanSu
{
    public partial class ThemBanTin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string chuoi_ket_noi = ConfigurationManager.ConnectionStrings["QLNhanVienConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(chuoi_ket_noi);
            conn.Open();
            //Tạo sql để thêm nhân viên
            string sql = "insert into bantin(tieude,tomtat,noidung,hinh,ngaydang,trangthai,theloaiid)" +
                " values(@tieude,@tomtat,@noidung,@hinh,@ngaydang,@trangthai,@theloaiid)";
            SqlCommand cmd = new SqlCommand(sql, conn);
            //Truyền giá trị cho các tham số truyền vào
            cmd.Parameters.AddWithValue("@tieude", txttieude.Text);
            cmd.Parameters.AddWithValue("@tomtat", txttomtat.Text);
            cmd.Parameters.AddWithValue("@noidung", hdnNoidung.Value);
            if (FHinh.HasFile)
            {
                string duong_dan = Server.MapPath("~/Uploads/") + FHinh.FileName;
                FHinh.SaveAs(duong_dan);
                cmd.Parameters.AddWithValue("@hinh", FHinh.FileName);
            }
            else
            {
                cmd.Parameters.AddWithValue("@hinh", "no_image.png");
            }
                
            cmd.Parameters.AddWithValue("@ngaydang", txtngaydang.Text);
            cmd.Parameters.AddWithValue("@trangthai", cbkhienan.Checked);
            cmd.Parameters.AddWithValue("@theloaiid", ddltheloai.SelectedValue);
            //Thực hiện câu lệnh truy vấn sql
            if (cmd.ExecuteNonQuery() > 0)
                Response.Redirect("qlTinTuc.aspx");
            else
                lblketqua.Text = "Thêm tin thất bại";
        }
    }
}