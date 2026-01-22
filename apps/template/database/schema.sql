-- =========================
-- MASTER DATA
-- =========================

CREATE TABLE Products (
    ProductID INT IDENTITY PRIMARY KEY,
    MaBo NVARCHAR(50) NOT NULL,
    MaCai NVARCHAR(50) NOT NULL,
    TenSP NVARCHAR(255) NOT NULL,
    CreatedAt DATETIME DEFAULT GETDATE()
);

CREATE TABLE Colors (
    ColorID INT IDENTITY PRIMARY KEY,
    MaMau NVARCHAR(20) NOT NULL,
    TenMau NVARCHAR(100) NOT NULL
);

CREATE TABLE Suppliers (
    SupplierID INT IDENTITY PRIMARY KEY,
    TenNCC NVARCHAR(255) NOT NULL,
    LoaiNCC NVARCHAR(50)
);

-- =========================
-- PRODUCTION
-- =========================

CREATE TABLE ProductionOrders (
    LsxID INT IDENTITY PRIMARY KEY,
    MaLsxGc NVARCHAR(50) NOT NULL,
    ProductID INT NOT NULL,
    ColorID INT NOT NULL,
    Tkdh NVARCHAR(50),
    SlgBo INT NOT NULL,
    SlgCai INT NOT NULL,
    CreatedAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (ColorID) REFERENCES Colors(ColorID)
);

CREATE TABLE OutsourcingContracts (
    ContractID INT IDENTITY PRIMARY KEY,
    LsxID INT NOT NULL,
    SupplierID INT NOT NULL,
    SlgGc INT NOT NULL,
    GiaGc DECIMAL(18,2),
    CreatedAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (LsxID) REFERENCES ProductionOrders(LsxID),
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

-- =========================
-- DOCUMENTS (CORE)
-- =========================

CREATE TABLE Documents (
    DocID INT IDENTITY PRIMARY KEY,
    SoChungTu NVARCHAR(50) NOT NULL,
    LoaiCT NVARCHAR(20) NOT NULL, -- NHAP_GC, XUAT_GC, NHAP_KHO, XUAT_KHO
    LsxID INT NOT NULL,
    SupplierID INT NULL,
    Slg INT NOT NULL,
    NgayLap DATE NOT NULL,
    GhiChu NVARCHAR(255),
    CreatedAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (LsxID) REFERENCES ProductionOrders(LsxID),
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);
