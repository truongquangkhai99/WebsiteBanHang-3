USE master

create DATABASE online_bookstore
-- ON PRIMARY
-- (NAME = N'SQL_TriThucOnline_BanSach', FILENAME = 'G:\TTFC\Learn_ASP_NET\TRITHUCONLINE_FINAL\Data_TriThucOnline\SQL_TriThucOnline_BanSach.mdf', SIZE = 100, MAXSIZE = 2GB, FILEGROWTH = 10)

-- LOG ON
-- (NAME = N'SQL_TriThucOnline_BanSach_Log', FILENAME = 'G:\TTFC\Learn_ASP_NET\TRITHUCONLINE_FINAL\Data_TriThucOnline\SQL_TriThucOnline_BanSach_Log.ldf', SIZE = 200, MAXSIZE = UNLIMITED, FILEGROWTH = 20)


GO

USE online_bookstore

GO

create table publishers
(
    id int IDENTITY(1,1) PRIMARY KEY,
    name nvarchar(50),
)
create table authors
(
    id int IDENTITY(1,1) PRIMARY KEY,
    name nvarchar(50),
    info nvarchar(max),
    picture varchar(max),
)
create TABLE categories
(
    id int IDENTITY(1,1) PRIMARY KEY,
    name nvarchar(50),
)

create table provinces
(
    province_code int not null primary key,
    name nvarchar(100)
)

create table districts
(
    district_code int not null primary key,
    name nvarchar(100),
    province_code INT FOREIGN KEY REFERENCES provinces(province_code)
)

create table wards
(
    ward_code int not null primary key,
    name nvarchar(100),
    district_code INT FOREIGN KEY REFERENCES districts(district_code)
)

create table users
(
    id int IDENTITY(1,1) NOT NULL PRIMARY KEY,
    name NVARCHAR(50),
    username nvarchar(50),
    password VARCHAR(50),
    address nvarchar(100),
    phone VARCHAR(11),
    email varchar(100),
    picture varchar(max),
    province_code INT FOREIGN KEY REFERENCES provinces(province_code),
    district_code INT FOREIGN KEY REFERENCES districts(district_code),
    ward_code INT FOREIGN KEY REFERENCES wards(ward_code),
	is_admin BIT
)

CREATE TABLE coupons
(
	id int IDENTITY(1,1) NOT NULL PRIMARY KEY,
    code VARCHAR(10) NOT NULL UNIQUE,
	description NVARCHAR(100),
    discount FLOAT,
	max_value FLOAT,
    valid_from DATETIME,
    valid_until DATETIME,
    count INT,
	is_enable BIT
)

create table books
(
    id int IDENTITY(1,1) PRIMARY KEY ,
    title nvarchar(150),
    price FLOAT,
	sale_price FLOAT,
    publish_year INT,
    picture VARCHAR(max),
    page_number INT,
    quantity INT,
    quotes_about NVARCHAR(max),
    author_id int FOREIGN KEY REFERENCES authors(id) ON DELETE CASCADE ,
    publisher_id int FOREIGN KEY REFERENCES publishers(id) ON DELETE CASCADE ,
    category_id int FOREIGN KEY REFERENCES categories(id) ON DELETE CASCADE ,
    new BIT
)

create table reviews
(
    id int IDENTITY(1,1) PRIMARY KEY,
    post_date datetime,
    star int,
    comment NVARCHAR(max),
    user_id int FOREIGN KEY REFERENCES users(id) ON DELETE CASCADE,
    book_id int FOREIGN KEY REFERENCES books(id) ON DELETE CASCADE,
)

create table orders
(
    id int IDENTITY(1,1) PRIMARY KEY,
    order_date datetime,
    required_date datetime,
    shipped_date DATETIME,
    status NVARCHAR(50),
    comment NVARCHAR(max),
    total FLOAT,
    user_id int FOREIGN KEY REFERENCES users(id) ON DELETE CASCADE,
    coupon_code VARCHAR(10) FOREIGN KEY REFERENCES coupons(code)
)

CREATE TABLE order_details
(
    id int IDENTITY(1,1) PRIMARY KEY,
    quantity INT,
    price FLOAT(53),
    order_id INT FOREIGN KEY REFERENCES orders(id),
    book_id int FOREIGN KEY REFERENCES books(id) ON DELETE CASCADE
)