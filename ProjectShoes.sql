USE [master];
GO
drop table Account
drop table Orders
drop table Products
IF DB_ID('ProjectShoes') IS NOT NULL 
BEGIN
	ALTER DATABASE [ProjectShoes] SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE [ProjectShoes];
END

CREATE DATABASE [ProjectShoes];
GO
USE [ProjectShoes];
GO


CREATE TABLE [EULA] (
	[ID]			INT IDENTITY (1, 1),
	[EULA]			NTEXT NOT NULL,

	PRIMARY KEY		([ID]),
);


CREATE TABLE [Account] (
	[UserID]		INT IDENTITY (1, 1),
	[Username]		VARCHAR (150) NOT NULL,
	[Password]		VARCHAR (150) NOT NULL,
	[Role]			INT NOT NULL,

	PRIMARY KEY		([UserID]),
	UNIQUE			([Username]),
);


CREATE TABLE [User] (
	[UserID]		INT,
	[Name]			NVARCHAR (150),
	[Email]			NVARCHAR (150),
	[Address]		NVARCHAR (MAX),
	[Phone]			NVARCHAR (10),

	PRIMARY KEY		([UserID]),
	FOREIGN KEY		([UserID]) REFERENCES [Account]([UserID]) ON DELETE CASCADE,
);


CREATE TABLE [Bill] (
	[BillID]		INT IDENTITY (1, 1),
	[CustomerID]	INT,
	[Date]			DATETIME NOT NULL,
	[Address]		NVARCHAR(MAX)
	
	PRIMARY KEY		([BillID]),
	FOREIGN KEY		([CustomerID]) REFERENCES [Account]([UserID]) ON DELETE SET NULL,
);


CREATE TABLE [Brand] (
	[BrandID]		INT IDENTITY (1, 1),
	[Name]			NVARCHAR (150),
	[Description]	NTEXT,

	PRIMARY KEY		([BrandID]),
);


CREATE TABLE [Product] (
	[ProductID]		INT IDENTITY (1, 1),
	[Name]			NVARCHAR (150),
	[Description]	NTEXT,
	[Price]			INT,
	[Image]			VARCHAR(MAX),
	[BrandID]		INT,

	PRIMARY KEY		([ProductID]),
	FOREIGN KEY		([BrandID])	REFERENCES [Brand]([BrandID])
);


CREATE TABLE [Size](
	[ProductID] INT,
	[Size] VARCHAR(150),
	[Quantity] INT

	FOREIGN KEY		([ProductID])	REFERENCES [Product]([ProductID]) ON DELETE CASCADE
);


CREATE TABLE [Order](
	[OrderID]		INT IDENTITY (1, 1),
	[ProductID]		INT,
	[BillID]		INT,
	[Quantity]		INT,
	[Payment]		INT,

	PRIMARY KEY		([OrderID]),
	FOREIGN KEY		([ProductID]) REFERENCES [Product]([ProductID]) ON DELETE SET NULL,
	FOREIGN KEY		([BillID]) REFERENCES [Bill]([BillID]) ON DELETE SET NULL,

	CHECK			([Quantity] >= 0),
);


CREATE TABLE [Cart] (
	[UserID]		INT,
	[ProductID]		INT,
	[Quantity]		INT,
	[Size]			VARCHAR(150),

	FOREIGN KEY		([UserID]) REFERENCES [Account]([UserID]) ON DELETE CASCADE,
	FOREIGN KEY		([ProductID])	REFERENCES [Product]([ProductID])
);

-------------------------------------------------------------
GO
CREATE PROCEDURE [sp_create_account]
	@Username VARCHAR (150),
	@Password VARCHAR (150),
	@Name NVARCHAR (150),
	@Email NVARCHAR (150),
	@Address NVARCHAR (MAX),
	@Phone NVARCHAR (10),
	@Role INT
AS 
BEGIN
	INSERT INTO [Account]([Username], [Password], [Role]) 
	VALUES (@Username, @Password, @Role);

	INSERT INTO [User]([UserID], [Name], [Email], [Address], [Phone]) 
	VALUES (
		(SELECT [UserID] FROM [Account] WHERE [Username] = @Username),
		@Name,
		@Email,
		@Address,
		@Phone
	);
END

GO
-------------------------------------------------------------------------
INSERT INTO [Brand]([Name], [Description]) VALUES (N'converse', N'')
INSERT INTO [Brand]([Name], [Description]) VALUES (N'vans', N'')
INSERT INTO [Brand]([Name], [Description]) VALUES (N'nike', N'')
INSERT INTO [Brand]([Name], [Description]) VALUES (N'puma', N'')
INSERT INTO [Brand]([Name], [Description]) VALUES (N'adidas', N'')
INSERT INTO [Brand]([Name], [Description]) VALUES (N'bitis', N'')

--------------------------------------------------------------------------

INSERT INTO [Product]([Name], [Description], [Price], [Image], [BrandID]) VALUES (N'Converse Chuck Taylor All Star Shoreline Knit Slip', N'', 1900000,'https://drake.vn/image/cache/catalog/Hinh%20add%20dut%20size/18.07/CONVERSE/565490C_PL57-200x200.jpg', 1),
(N'Converse Chuck Taylor All Star Shoreline Knit Slip', N'', 1900000,'https://drake.vn/image/cache/catalog/Hinh%20add%20dut%20size/18.07/CONVERSE/565489C_P39-200x200.jpg', 1),
(N'Converse Chuck Taylor All Star Seasonal Color', N'', 1450000,'https://drake.vn/image/cache/catalog/Converse/GIA%CC%80Y%202/1J794C/1J794_1-200x200.jpg', 1),
(N'Converse Chuck Taylor All Star Seasonal Color', N'', 1550000,'https://drake.vn/image/cache/catalog/Converse/GIA%CC%80Y%202/1J793C/1J793C_PL1-200x200.jpg', 1),
(N'Converse Chuck Taylor All Star Mono Canvas', N'', 1550000,'https://drake.vn/image/cache/catalog/Converse/GIA%CC%80Y%202/1U646/1U646_P1-200x200.jpg', 1),
(N'Converse Chuck Taylor All Star 1970s Archive Paint Splatter', N'', 2500000,'https://drake.vn/image/cache/catalog/Converse/GIA%CC%80Y%202/A01170C/A01170C_P1-200x200.jpg', 1),
(N'Converse Chuck Taylor All Star 1970s No Waste Canvas', N'', 1900000,'https://drake.vn/image/cache/catalog/Converse/GIA%CC%80Y%202/A00459C/A00459C_P1-200x200.jpg', 1),
(N'Converse Chuck Taylor All Star 1970s Recycled Rpet Canvas', N'', 2000000,'https://drake.vn/image/cache/catalog/Converse/GIA%CC%80Y%202/172680C/172680C_P3-200x200.jpg', 1),
(N'Converse Chuck Taylor All Star 1970s Recycled Rpet Canvas', N'', 2200000,'https://drake.vn/image/cache/catalog/Converse/GIA%CC%80Y%202/172677C/172677C_41-200x200.jpg', 1),
(N'Converse Chuck Taylor All Star 1970s Recycled Rpet Canvas', N'', 1900000,'https://drake.vn/image/cache/catalog/Converse/GIA%CC%80Y%202/172679C/172679C_PL2-200x200.jpg', 1),
(N'Converse Chuck Taylor All Star 1970s Recycled Rpet Canvas', N'', 2000000,'https://drake.vn/image/cache/catalog/Converse/GIA%CC%80Y%202/172676C/172676C_53-200x200.jpg', 1),
(N'Converse Chuck Taylor All Star 1970s Recycled Rpet Canvas', N'', 1900000,'https://drake.vn/image/cache/catalog/Converse/GIA%CC%80Y%202/172681C/172681C_P21-200x200.jpg', 1),
(N'Converse Chuck Taylor All Star 1970s Recycled Rpet Canvas', N'', 2000000,'https://drake.vn/image/cache/catalog/Converse/GIA%CC%80Y%202/172678C_4/172678C_P12-200x200.jpg', 1),
(N'Converse Chuck Taylor All Star Keith Haring', N'', 1600000,'https://drake.vn/image/cache/catalog/Hinh%20add%20dut%20size/05.05.2022/CONVERSE/51%20TOI%20120/171860C_P105-200x200.jpg', 1),
(N'Converse Chuck Taylor All Star Renew Sock Knit', N'', 2200000,'https://drake.vn/image/cache/catalog/Hinh%20add%20dut%20size/05.05.2022/CONVERSE/51%20TOI%20120/170367C_P101-200x200.jpg', 1),
(N'Converse Chuck Taylor All Star 1970s Archive Paint Splatter', N'', 2000000,'https://drake.vn/image/cache/catalog/Hinh%20add%20dut%20size/05.05.2022/CONVERSE/51%20TOI%20120/170802C_P102-200x200.jpg', 1),
(N'Converse Chuck Taylor All Star 1970s Archive Paint Splatter', N'', 1900000,'https://drake.vn/image/cache/catalog/Converse/GIA%CC%80Y%202/170804C/170804C-200x200.jpg', 1),
(N'Converse Chuck Taylor All Star Lift Archive Print', N'', 1800000,'https://drake.vn/image/cache/catalog/Hinh%20add%20dut%20size/05.05.2022/CONVERSE/51%20TOI%20120/570915C_P103-200x200.jpg', 1)

INSERT INTO [Product]([Name], [Description], [Price], [Image], [BrandID]) VALUES (N'Vans UA Old Skool Style 36 Decon SF Mix Match', N'', 1800000,'https://drake.vn/image/cache/catalog/Vans/SNEAKERS%202/VN0A5HYRAYR/VN0A5HYRAYR_1-200x200.jpg', 2),
(N'Vans UA Classic Slip-On SF Mix Match', N'', 1450000,'https://drake.vn/image/cache/catalog/Vans/SNEAKERS%202/VN0A5HYQAYR/VN0A5HYQAYR_1-200x200.jpg', 2),
(N'Vans UA Authentic SF Mix Match', N'', 1450000,'https://drake.vn/image/cache/catalog/Vans/SNEAKERS%202/VN0A5HYPAYR/VN0A5HYPAYR_1-200x200.jpg', 2),
(N'Vans UA Old Skool Eco Theory Positivity', N'', 2450000,'https://drake.vn/image/cache/catalog/Vans/SNEAKERS%202/VN0A54F4AS1/VN0A54F4AS1_P1-200x200.jpg', 2),
(N'Vans UA Authentic Eco Theory Positivity', N'', 1900000,'https://drake.vn/image/cache/catalog/Vans/SNEAKERS%202/VN0A5KRDAS1/VN0A5KRDAS1_P1-200x200.jpg', 2),
(N'Vans UA Authentic Eco Theory Positivity', N'', 1800000,'https://drake.vn/image/cache/catalog/Vans/SNEAKERS%202/VN0A5KRDARG/VN0A5KRDARG_P1-200x200.jpg', 2),
(N'Vans UA Old Skool Style 36 Mule', N'', 2300000,'https://drake.vn/image/cache/catalog/Vans/SNEAKERS%202/VN0A7Q5YB9F/VN0A7Q5YB9F_1-200x200.jpg', 2),
(N'Vans UA Old Skool Style 36 Mule', N'', 2300000,'https://drake.vn/image/cache/catalog/Vans/SNEAKERS%202/VN0A7Q5YB9E/VN0A7Q5YB9E_1-200x200.jpg', 2),
(N'Vans UA Old Skool Style 36 Decon SF Hawaiian Jungle', N'', 1800000,'https://drake.vn/image/cache/catalog/Vans/SNEAKERS%202/VN0A5HYRB6R/VN0A5HYRB6R_P1-200x200.jpg', 2),
(N'Vans UA SK8-Low Reissue SF Island Dream', N'', 1750000,'https://drake.vn/image/cache/catalog/Vans/SNEAKERS%202/VN0A4UWIB80/VN0A4UWIB80_P1-200x200.jpg', 2),
(N'Vans UA Authentic SF Island Dream', N'', 1450000,'https://drake.vn/image/cache/catalog/Vans/SNEAKERS%202/VN0A5HYPAXV/VN0A5HYPAXV_P1-200x200.jpg', 2),
(N'Vans UA Classic Slip-On Mule Checkerboard', N'', 1550000,'https://drake.vn/image/cache/catalog/Vans/SNEAKERS%202/VN0004KTEO1/VN0004KTEO1_P1-200x200.jpg', 2),
(N'Vans UA Old Skool Mule', N'', 1850000,'https://drake.vn/image/cache/catalog/Vans/SNEAKERS%202/VN0A3MUS6BT/VN0A3MUS6BT_P1-200x200.jpg', 2),
(N'Vans UA Style 36 Marshmallow', N'', 1850000,'https://drake.vn/image/cache/catalog/Vans/SNEAKERS%202/VN0A3DZ3KE6/VN0A3DZ3KE6-200x200.jpg', 2),
(N'Vans UA Old Skool Style 36 Marshmallow Jolly Green', N'', 1850000,'https://drake.vn/image/cache/catalog/Vans/SNEAKERS%202/VN0A3DZ3RFX/VN0A3DZ3RFX-200x200.jpg', 2),
(N'Vans UA Era Classic Sport', N'', 1450000,'https://drake.vn/image/cache/catalog/Vans/SNEAKERS%202/VN0A54F19LY/VN0A54F19LY-200x200.jpg', 2),
(N'Vans UA Old Skool Style 36 Classic Sport', N'', 1750000,'https://drake.vn/image/cache/catalog/Vans/SNEAKERS%202/VN0A54F69LY/VN0A54F19LY_a1-200x200.jpg', 2),
(N'Vans UA Old Skool Style 36 Classic Sport', N'', 1850000,'https://drake.vn/image/cache/catalog/Vans/SNEAKER/VN0A54F69YG/VN0A54F69YG-200x200.jpg', 2)

INSERT INTO [Product]([Name], [Description], [Price], [Image], [BrandID]) VALUES (N'Giày Sneaker Adidas Ultraboost 22 "Cloud White" Gx5459', N'', 3250000,'https://bizweb.dktcdn.net/100/413/756/products/giay-ultraboost-22-trang-gx5459-1657127674008.jpg?v=1657127694260', 5),
(N'Giày Sneaker Adidas Ultraboost 22 "Blue Tint" Gy6227', N'', 3250000,'https://bizweb.dktcdn.net/100/413/756/products/gy6227-01-1657508155444.png?v=1657508161640', 5),
(N'Giày Sneaker Adidas Ultraboost 20 Cc_1 "Core Black" Fz2546', N'', 2450000,'https://bizweb.dktcdn.net/100/413/756/products/1b922515-5a39-46fa-940d-3aa8b598cdba.jpg?v=1656241139720', 5),
(N'Giày Sneaker Adidas Stansmith "Cloud White" Ef4479', N'', 1450000,'https://bizweb.dktcdn.net/100/413/756/products/stan-smith-shoes-white-ef4479-01.jpg?v=1657017410103', 5),
(N'Giày Sneaker Adidas Ultra4d "Hurricanes" Q46439', N'', 4200000,'https://bizweb.dktcdn.net/100/413/756/products/bb77cf07-1fbc-4a43-ab9f-2d982a2bd681.jpg?v=1655638217490', 5)

INSERT INTO [Product]([Name], [Description], [Price], [Image], [BrandID]) VALUES (N'Giày Sneaker Nike Air Jordan 1 Low "Washed Denim" Dm8947-100', N'', 3650000,'https://bizweb.dktcdn.net/100/413/756/products/dm8947-100-01-1657444597796.png?v=1657444604197', 3),
(N'Giày Sneaker Nike Air Max 97 Valentine Day Cu9990-001', N'', 1450000,'https://bizweb.dktcdn.net/100/413/756/products/cu9990-001-01.jpg?v=1656473741723', 3),
(N'Giày Thể Thao Nike Magista Orden "University Red" 843812-061', N'', 1350000,'https://bizweb.dktcdn.net/100/413/756/products/843812-061-01.jpg?v=1656472675153', 3),
(N'Giày Bóng Rổ Nike Cosmic Unity Game "Royal Blue" Dm4426-400', N'', 3000000,'https://bizweb.dktcdn.net/100/413/756/products/dm4426-400-01.png?v=1655117930507', 3),
(N'Giày Sneaker Nike Revolution 6 Gs "Pink" Dd1096-608', N'', 1350000,'https://bizweb.dktcdn.net/100/413/756/products/c6c17252-1ce3-496c-bdf1-1682e9634e1a.jpg?v=1653464108520', 3)	

INSERT INTO [Size]([ProductID], [Quantity], [Size]) VALUES
(1, 100,'5.5US - 36EUR - 22.5cm'),
(1, 100,'7US - 37.5EUR - 24cm'),
(2, 100,'5.5US - 36EUR - 22.5cm'),
(2, 100,'6US - 36.5EUR - 23cm'),
(2, 100,'6.5US - 37EUR - 23.5cm'),
(2, 100,'7US - 37.5EUR - 24cm'),
(2, 100,'7.5US - 38EUR - 24.5cm'),
(2, 100,'8US - 39EUR - 24.5cm'),
(3, 100,'3US - 35EUR - 22cm'),
(3, 100,'4.5US - 37EUR - 23.5cm'),
(3, 100,'5.5US - 38EUR - 24.5cm'),
(3, 100,'6US - 39EUR - 24.5cm'),
(3, 100,'6.5US - 39.5EUR - 25cm'),
(3, 100,'7US - 40EUR - 25.5cm'),
(3, 100,'7.5US - 41EUR - 26cm'),
(3, 100,'8US - 41.5EUR - 26.5cm'),
(3, 100,'8.5US - 42EUR - 27cm'),
(3, 100,'9US - 42.5EUR - 27.5cm'),
(3, 100,'10US - 44EUR - 28.5cm'),
(4, 100,'6.5US - 39.5EUR - 25cm'),
(4, 100,'7US - 40EUR - 25.5cm'),
(4, 100,'7.5US - 41EUR - 26cm'),
(4, 100,'8US - 41.5EUR - 26.5cm'),
(4, 100,'8.5US - 42EUR - 27cm'),
(4, 100,'9US - 42.5EUR - 27.5cm'),
(4, 100,'9.5US - 43EUR - 28cm'),
(4, 100,'10US - 44EUR - 28.5cm'),
(18, 100,'5US - 36.5EUR - 23cm'),
(19, 100,'3.5US - 34.5EUR - 21.5cm'),
(19, 100,'4US - 35EUR - 22cm'),
(19, 100,'4.5US - 36EUR - 22.5cm'),
(19, 100,'5US - 36.5EUR - 23cm'),
(37, 100, '7US - 40EUR - 25.5cm'),
(38, 100, '4.5US - 36EUR - 22.5cm'),
(39, 100,'8.5US - 42EUR - 27cm'),
(40, 100,'8US - 39EUR - 24.5cm'),
(41, 100,'7.5US - 38EUR - 24.5cm'),
(42, 100, '7US - 40EUR - 25.5cm'),
(43, 100, '4.5US - 36EUR - 22.5cm'),
(44, 100,'8.5US - 42EUR - 27cm'),
(45, 100,'8US - 39EUR - 24.5cm'),
(46, 100,'7.5US - 38EUR - 24.5cm')

INSERT INTO EULA([EULA]) VALUES 
(N'Khi quý khách truy cập vào trang web của chúng tôi có nghĩa là quý khách đồng ý với các điều khoản này.'),
(N'Trang web có quyền thay đổi, chỉnh sửa, thêm hoặc lược bỏ bất kỳ phần nào trong Quy định và Điều kiện sử dụng, vào bất cứ lúc nào.'),
(N'Các thay đổi có hiệu lực ngay khi được đăng trên trang web mà không cần thông báo trước và quý khách phải chấp nhận những thay đổi đó.'),
(N'Quý khách vui lòng kiểm tra thường xuyên để cập nhật những thay đổi của chúng tôi.'),
(N'Chúng tôi cấp giấy phép sử dụng để bạn có thể mua sắm trên web trong khuôn khổ Điều khoản và Điều kiện sử dụng đã đề ra.'),
(N'Nghiêm cấm sử dụng bất kỳ phần nào của trang web này với mục đích thương mại hoặc nhân danh bất kỳ đối tác thứ ba nào nếu không được chúng tôi cho phép bằng văn bản. Nếu vi phạm bất cứ điều nào trong đây, chúng tôi sẽ hủy giấy phép của bạn mà không cần báo trước.'),
(N'Trang web này chỉ dùng để cung cấp thông tin sản phẩm mà hệ thống phân phối chứ chúng tôi không phải nhà sản xuất.'),
(N'Tất cả nội dung trang web và ý kiến phê bình của quý khách đều là tài sản của chúng tôi. Nếu chúng tôi phát hiện bất kỳ thông tin giả mạo nào, chúng tôi sẽ khóa tài khoản của quý khách ngay lập tức hoặc áp dụng các biện pháp khác theo quy định của pháp luật Việt Nam.'),
(N'Khi quý khách đặt hàng tại 8Shoes, chúng tôi sẽ nhận được yêu cầu đặt hàng và gửi đến quý khách mã số đơn hàng. Tuy nhiên, yêu cầu đặt hàng cần thông qua một bước xác nhận đơn hàng, 8Shoes chỉ giao hàng khi đã liên hệ và xác nhận được với người nhận hàng.')

EXEC [sp_create_account] @Username = 'admin', @Password = '123', @Name = 'Hung', @Email = 'hungvmhe163268@fpt.edu.vn', @Address = 'Heaven', @Phone = '0357079822', @Role = 1