create database erd;
use erd;

create table phieu_xuat(
  so_px int primary key, ngay_xuat date
);

create table vat_tu(
  ma_vtu int primary key, 
  ten_vtu varchar(55)
);

create table chi_tiet_phieu_xuat(
  so_px int, 
  ma_vtu int, 
  foreign key (so_px) references phieu_xuat(so_px), 
  foreign key(ma_vtu) references vat_tu(ma_vtu), 
  dg_xuat double, 
  sl_xuat int
);

create table phieu_nhap(
  so_pn int primary key, ngay_nhap date
);

create table chi_tiet_phieu_nhap(
  ma_vtu int, 
  so_pn int, 
  foreign key(ma_vtu) references vat_tu(ma_vtu), 
  foreign key(so_pn) references phieu_nhap(so_pn), 
  dg_nhap int, 
  sl_nhap int
);

create table don_dh(so_dh int primary key, ngay_dh date);

create table chi_tiet_dat_hang(
  ma_vtu int, 
  foreign key(ma_vtu) references vat_tu(ma_vtu), 
  so_dh int, 
  foreign key(so_dh) references don_dh(so_dh)
);

create table nha_cc(
  ma_ncc int, 
  ten_ncc varchar(55), 
  dia_chi varchar(55), 
  sdt varchar(55)
);

create table so_dien_thoai(
  ma_so_dien_thoai int auto_increment primary key, 
  so_dien_thoai varchar(45)
);
