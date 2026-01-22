-- =========================
-- INVENTORY VIEW
-- =========================

CREATE VIEW V_Inventory AS
SELECT
    p.ProductID,
    p.MaCai,
    p.TenSP,
    SUM(CASE WHEN d.LoaiCT LIKE 'NHAP%' THEN d.Slg ELSE 0 END)
  - SUM(CASE WHEN d.LoaiCT LIKE 'XUAT%' THEN d.Slg ELSE 0 END) AS TonKho
FROM Documents d
JOIN ProductionOrders l ON d.LsxID = l.LsxID
JOIN Products p ON l.ProductID = p.ProductID
GROUP BY p.ProductID, p.MaCai, p.TenSP;


-- =========================
-- PRODUCTION REPORT
-- =========================

CREATE VIEW V_ProductionReport AS
SELECT
    l.MaLsxGc,
    p.TenSP,
    SUM(CASE WHEN d.LoaiCT = 'XUAT_GC' THEN d.Slg ELSE 0 END) AS SlgXuatGC,
    SUM(CASE WHEN d.LoaiCT = 'NHAP_GC' THEN d.Slg ELSE 0 END) AS SlgNhapGC
FROM ProductionOrders l
JOIN Products p ON l.ProductID = p.ProductID
LEFT JOIN Documents d ON l.LsxID = d.LsxID
GROUP BY l.MaLsxGc, p.TenSP;
