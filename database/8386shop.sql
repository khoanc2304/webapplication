-- Tạo Database
CREATE DATABASE IF NOT EXISTS 8386shop;
USE 8386shop;

-- ============= TẠO BẢNG =============

-- Bảng Users: Quản lý thông tin người dùng
CREATE TABLE IF NOT EXISTS Users (
    userID INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    fullName VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    address VARCHAR(255),
    avatar VARCHAR(255),
    userCreatedDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    userUpdatedDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    userStatus ENUM('active', 'suspended') DEFAULT 'active',
    userRole ENUM('admin', 'manager', 'employee', 'customer') DEFAULT 'customer'
);

-- Bảng Brand: Quản lý thương hiệu sản phẩm
CREATE TABLE IF NOT EXISTS Brand (
    BrandID INT AUTO_INCREMENT PRIMARY KEY,
    BrandName VARCHAR(255) NOT NULL UNIQUE,
    Country VARCHAR(100)
);

-- Bảng Product: Quản lý sản phẩm
CREATE TABLE IF NOT EXISTS Product (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    BrandID INT NOT NULL,
    Name VARCHAR(255) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    Stock INT NOT NULL,
    Description TEXT,
    ImageURL VARCHAR(255),
    ProductCreatedDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ProductUpdatedDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (BrandID) REFERENCES Brand(BrandID) ON DELETE CASCADE
);

-- Bảng ProductDetail: Chi tiết thuộc tính của sản phẩm
CREATE TABLE IF NOT EXISTS ProductDetail (
    DetailID INT AUTO_INCREMENT PRIMARY KEY,
    ProductID INT NOT NULL,
    AttributeName VARCHAR(255) NOT NULL,
    AttributeValue VARCHAR(255) NOT NULL,
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID) ON DELETE CASCADE
);

-- Bảng Orders: Quản lý đơn hàng
CREATE TABLE IF NOT EXISTS Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT NOT NULL,
    OrderDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    TotalAmount DECIMAL(10, 2) NOT NULL,
    Status ENUM('Pending', 'Processing', 'Completed', 'Cancelled') DEFAULT 'Pending',
    FOREIGN KEY (CustomerID) REFERENCES Users(userID) ON DELETE CASCADE
);

-- Bảng OrderDetail: Chi tiết đơn hàng
CREATE TABLE IF NOT EXISTS OrderDetail (
    OrderDetailID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID) ON DELETE CASCADE,
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID) ON DELETE CASCADE
);

-- Bảng ProductReview: Đánh giá sản phẩm
CREATE TABLE IF NOT EXISTS ProductReview (
    ReviewID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT NOT NULL,
    ProductID INT NOT NULL,
    Rating INT NOT NULL CHECK (Rating BETWEEN 1 AND 5),
    Comment TEXT,
    ReviewDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (CustomerID) REFERENCES Users(userID) ON DELETE CASCADE,
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID) ON DELETE CASCADE
);

-- ============= CHÈN DỮ LIỆU =============

-- Dữ liệu cho bảng Users
INSERT INTO Users (username, password, fullName, email, phone, address, avatar, userStatus, userRole) 
VALUES 
("admin", "admin", "ADMIN", "admin@gmail.com", "0123456789", "Đà Nẵng", "https://img.hoidap247.com/picture/question/20201024/large_1603547313777.jpg?v=0", "active", "admin"),
("admin1", "admin", "ADMIN1", "admin1@gmail.com", "012345678910", "Đà Nẵng", "https://img.hoidap247.com/picture/question/20201024/large_1603547313777.jpg?v=0", "active", "admin"),
("8386", "8386", "8386", "8386@gmail.com", "0142399999", "Đà Nẵng", "https://img.hoidap247.com/picture/question/20201024/large_1603547313777.jpg?v=0", "active", "manager"),
("abcxyz", "abcxyz", "ABC XYZ", "abcxyz@gmail.com", "09998887776", "Sài Gòn", "https://img.hoidap247.com/picture/question/20201024/large_1603547313777.jpg?v=0", "active", "manager"),
("emp1", "emp1", "Tuấn", "emp1@gmail.com", "011223344", "Hà Nội", "https://img.hoidap247.com/picture/question/20201024/large_1603547313777.jpg?v=0", "active", "employee"),
("emp2", "emp2", "Thiện", "emp2@gmail.com", "0112233443", "Hội An", "https://img.hoidap247.com/picture/question/20201024/large_1603547313777.jpg?v=0", "active", "employee"),
("cus1", "cus1", "Quang", "cus1@gmail.com", "044556677", "Huế", "https://img.hoidap247.com/picture/question/20201024/large_1603547313777.jpg?v=0", "active", "customer"),
("cus2", "cus2", "Ngân", "cus2@gmail.com", "0445566773", "Thành Phố Hồ Chí Minh", "https://img.hoidap247.com/picture/question/20201024/large_1603547313777.jpg?v=0", "active", "customer");

-- Dữ liệu cho bảng Brand
INSERT INTO Brand (BrandName, Country) 
VALUES 
("ASUS", "Taiwan"),
("ACER", "Taiwan"),
("MSI", "Taiwan"),
("LENOVO", "China"),
("GIGABYTE", "Taiwan");

-- Dữ liệu cho bảng Product
INSERT INTO Product (BrandID, Name, Price, Stock, Description, ImageURL) 
VALUES 
(3, "MSI Bravo 15 B7ED 010VN", 15490000, 10, "AMD R5 7535HSH, Ram 16GB, SSD 512GB, Màn hình 15.6' FHD 144Hz, VGA RX6550M 4GB, Hệ điều hành Win11", "https://laptopaz.vn/media/product/3039_msi_bravo_15_b7ed_010vn.jpg"),
(3, "MSI GF63 12UCX-841VN", 15690000, 10, "AMD R5 7535HS, Ram 8GB, SSD 512GB, Màn hình 15.6' FHD 144Hz, RTX 2050 4GB, Hệ điều hành Win11", "https://laptopaz.vn/media/product/3215_3029_laptop_msi_gf63_thin_12ucx_841vn_fd16fbe6.jpg"),
(3, "MSI Cyborg 15 A12VF 267VN", 27690000, 10, "Intel Core i5-12450H, Ram 8GB, SSD 512GB, Màn hình 15.6' FHD 144Hz, VGA RTX 4060 8GB, Hệ điều hành Win11", "https://laptopaz.vn/media/product/2976_12429_msi_cyborg_15_a12v__3.jpg"),
(1, "Asus ROG Zephyrus G16 2023 GU603VU N3898W", 41790000, 10, "Intel Core i7-13620H, Ram 16GB, SSD 512GB, Màn hình 15.6' FHD+ 165Hz, Hệ điều hành Win11", "https://laptopaz.vn/media/product/2962_12172_asus_rog_zephyrus_g16_gu603__1.jpg"),
(1, "Asus Vivobook S14 OLED S5406 2024", 24990000, 10, "Intel Core Ultra 5 125H, Ram 16GB, SSD 1TB, Màn hình 14' 3k OLED, Hệ điều hành Win11", "https://laptopaz.vn/media/product/3218_asus_vivobook_s_14_oled_2024.jpg");

-- Dữ liệu cho bảng ProductDetail
INSERT INTO ProductDetail (ProductID, AttributeName, AttributeValue)
VALUES
(1, "CPU", "AMD R5 7535HSH"),
(1, "RAM", "16GB"),
(1, "Ổ cứng", "SSD 512GB"),
(2, "CPU", "AMD R5 7535HS"),
(2, "RAM", "8GB"),
(2, "Ổ cứng", "SSD 512GB"),
(3, "CPU", "Intel Core i5-12450H"),
(3, "RAM", "8GB"),
(3, "Ổ cứng", "SSD 512GB");

-- Dữ liệu cho bảng Orders
INSERT INTO Orders (CustomerID, TotalAmount, Status)
VALUES
(7, 15490000, "Completed"),
(8, 27690000, "Pending");

-- Dữ liệu cho bảng OrderDetail
INSERT INTO OrderDetail (OrderID, ProductID, Quantity, UnitPrice)
VALUES
(1, 1, 1, 15490000),
(2, 3, 1, 27690000);

-- Dữ liệu cho bảng ProductReview
INSERT INTO ProductReview (CustomerID, ProductID, Rating, Comment)
VALUES
(7, 1, 5, "Sản phẩm rất tốt, đáng tiền!"),
(8, 3, 4, "Hiệu năng ổn định, nhưng hơi nóng.");


--

-- Thêm dữ liệu vào bảng Brand
INSERT INTO Brand (BrandName, Country) 
VALUES 
("HP", "USA"),
("Dell", "USA"),
("Razer", "USA"),
("Apple", "USA"),
("Samsung", "South Korea");

-- Thêm dữ liệu vào bảng Product
INSERT INTO Product (BrandID, Name, Price, Stock, Description, ImageURL) 
VALUES 
(6, "Lenovo ThinkPad P16", 48490000, 10, "Intel Core i7-12850HX, Ram 64GB, SSD 1TB, Màn hình 16' 2K+, Hệ điều hành Win11", "'https://laptopaz.vn/media/product/3206_2719_6.png', '2024-12-09', '2024-12-09', 4),"),
(7, "Acer Predator Helios Neo 2024 PHN16-72-91RF", 33990000, 10, "Intel Core i9-14900HX, Ram 16GB, SSD 1TB, Màn hình 16' 2K+ 240Hz, Hệ điều hành Win11", "https://laptopaz.vn/media/product/3229_acer_predator_helios_neo_16_2024_front_thumbnail.png', '2024-12-09', '2024-12-09', 2");

-- Thêm dữ liệu vào bảng ProductDetail
INSERT INTO ProductDetail (ProductID, AttributeName, AttributeValue)
VALUES
(6, "CPU", "Intel Core i7-12850HX"),
(6, "RAM", "64GB"),
(6, "Ổ cứng", "SSD 1TB"),
(7, "CPU", "Intel Core i9-14900HX"),
(7, "RAM", "16GB"),
(7, "Ổ cứng", "SSD 1TB");

-- Thêm dữ liệu vào bảng Orders


-- Thêm dữ liệu vào bảng OrderDetail

-- Thêm dữ liệu vào bảng ProductReview

