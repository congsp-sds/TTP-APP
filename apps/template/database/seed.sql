-- PRODUCTS
INSERT INTO Products (MaBo, MaCai, TenSP)
VALUES
('B-POLO-01', 'C-POLO-01', N'Áo Thun Polo'),
('B-JEAN-02', 'C-JEAN-02', N'Quần Jean');

-- COLORS
INSERT INTO Colors (MaMau, TenMau)
VALUES
('NV', N'Navy'),
('BK', N'Black');

-- SUPPLIERS
INSERT INTO Suppliers (TenNCC, LoaiNCC)
VALUES
(N'Xưởng May Hùng Phát', N'Gia công');

-- LSX
INSERT INTO ProductionOrders (MaLsxGc, ProductID, ColorID, Tkdh, SlgBo, SlgCai)
VALUES
('LSX-2024-001', 1, 1, 'TK-8890', 1000, 2000);

-- CONTRACT
INSERT INTO OutsourcingContracts (LsxID, SupplierID, SlgGc, GiaGc)
VALUES
(1, 1, 1000, 15000);

-- DOCUMENTS
INSERT INTO Documents (SoChungTu, LoaiCT, LsxID, SupplierID, Slg, NgayLap)
VALUES
('CT-0001', 'XUAT_GC', 1, 1, 500, GETDATE()),
('CT-0002', 'NHAP_GC', 1, 1, 480, GETDATE());
