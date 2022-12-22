use furama_resort;

-- 16.  Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
set 
  sql_safe_updates = 0;
delete from 
  nhan_vien nv 
where 
  nv.ma_nhan_vien not in (
    select 
      hd.ma_nhan_vien 
    from 
      hop_dong hd 
    where 
      year(hd.ngay_lam_hop_dong) in (2019, 2020, 2021)
  );
  
-- 17.  Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum 
-- lên Diamond, chỉ cập nhật những khách hàng đã từng đặt phòng với 
-- Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.
set 
  sql_safe_updates = 0;
update 
  khach_hang 
set 
  ma_loai_khach = 1 
where 
  ma_khach_hang in (
    select 
      ma_khach_hang 
    from 
      (
        select 
          kh.ma_khach_hang 
        from 
          khach_hang kh 
          join hop_dong hd on hd.ma_khach_hang = kh.ma_khach_hang 
          join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu 
          join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong 
          join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem 
        where 
          year(ngay_lam_hop_dong) = 2021 
          and ma_loai_khach = 2 
        group by 
          kh.ma_khach_hang 
        having 
          sum(
            dv.chi_phi_thue + dvdk.gia * hdct.so_luong
          ) > 1000000
      ) as sua
  );
  
-- 18.  Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).
set 
  sql_safe_update = 0;
delete from 
  khach_hang kh 
where 
  kh.ma_khach_hang in (
    select 
      hd.ma_khach_hang 
    from 
      hop_dong 
    where 
      year(hd.ngay_lam_hop_dong) < 2021
  );
  
-- 19.  Cập nhật giá cho các dịch vụ đi kèm được sử dụng
--  trên 10 lần trong năm 2020 lên gấp đôi.
set 
  sql_safe_updates = 0;
update 
  dich_vu_di_kem 
set 
  gia = gia * 2 
where 
  ma_dich_vu_di_kem in (
    select 
      hd.ma_dich_vu_di_kem 
    from 
      hop_dong_chi_tiet hd 
      join hop_dong h on hd.ma_hop_dong = h.ma_hop_dong 
    where 
      year(h.ngay_lam_hop_dong) = 2020 
    group by 
      hd.ma_dich_vu_di_kem 
    having 
      sum(hd.so_luong) > 10
  );
  
-- 20.  Hiển thị thông tin của tất cả các nhân viên và khách hàng 
-- có trong hệ thống, thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), 
-- ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.
select 
  nv.ma_nhan_vien, 
  nv.ho_ten, 
  nv.email, 
  nv.so_dien_thoai, 
  nv.ngay_sinh, 
  nv.dia_chi 
from 
  nhan_vien nv 
union 
select 
  kh.ma_khach_hang, 
  kh.ho_ten, 
  kh.email, 
  kh.so_dien_thoai, 
  kh.ngay_sinh, 
  kh.dia_chi 
from 
  khach_hang kh;