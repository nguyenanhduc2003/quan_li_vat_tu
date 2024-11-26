USE quanlivattu;
/*
INSERT INTO `tblaccount` (`account_name`,`account_email`, `account_pass`,`account_phone`,`account_address`,`account_birthday`,`account_created_date`,`account_role`) VALUES
('Nguyễn Anh Đức','anhduc0853@gmail.com','Duc@12#$%','0853514241','Bắc từ liêm - Hà nội','15-10-2000','01-01-2024','admin'),
('Nguyễn Ngọc Anh','ngocanh324@gmail.com','Ngocanh@343','0674829134','Nam từ liêm - Hà nội','16-06-2000','12-04-2024','user'),
('Trần Minh Tuấn','minhtuan.tran@gmail.com','Tuan@123#','0987654321','Thanh Xuân - Hà Nội','10-02-1999','15-05-2024','user'),
('Phạm Thị Hồng','hongpham1997@yahoo.com','Hong@1997*','0912345678','Hoàng Mai - Hà Nội','08-03-1997','20-06-2024','user'),
('Nguyễn Văn Quang','quang.nguyen@mail.com','Quang@2024!','0978123456','Đống Đa - Hà Nội','12-12-2000','05-07-2024','admin'),
('Lê Thị Thanh','lethanh@gmail.com','Thanh@789&','0854123678','Cầu Giấy - Hà Nội','20-09-1998','25-07-2024','user'),
('Đặng Văn Hùng','danghung23@gmail.com','Hung@567#','0962138745','Long Biên - Hà Nội','01-05-1996','15-08-2024','user'),
('Vũ Thị Lan','lanvu@gmail.com','Lan@234$','0923184765','Ba Đình - Hà Nội','22-04-1999','18-09-2024','admin'),
('Ngô Quang Huy','huyngo@gmail.com','Huy@890%','0932451879','Hà Đông - Hà Nội','30-11-2001','05-10-2024','user'),
('Hoàng Minh Hà','hoangha@yahoo.com','Ha@6789#','0941234875','Tây Hồ - Hà Nội','15-07-1995','10-11-2024','user'),
('Phan Thị Cúc','phanthicuc@mail.com','Cuc@4567&','0912475863','Hai Bà Trưng - Hà Nội','18-01-1994','01-12-2024','admin'),
('Nguyễn Văn Tài','nguyentai@gmail.com','Tai@987#','0982143657','Hà Đông - Hà Nội','09-03-2002','10-12-2024','user'),
('Đỗ Thu Trang','thutrang@gmail.com','Trang@654%','0857694132','Hoàn Kiếm - Hà Nội','24-10-1993','20-12-2024','user'),
('Lý Quốc Hưng','lyquochung@mail.com','Hung@321!','0976143258','Thanh Trì - Hà Nội','05-06-2001','25-12-2024','admin'),
('Mai Thị Thu','maithithu@gmail.com','Thu@789&','0865314782','Sóc Sơn - Hà Nội','11-08-1996','28-12-2024','user'),
('Bùi Quốc Bảo','baoquocbui@yahoo.com','Bao@432$','0946823751','Gia Lâm - Hà Nội','07-09-2003','29-12-2024','user'),
('Ngô Thị Thảo','ngothithao@mail.com','Thao@987%','0918576423','Chương Mỹ - Hà Nội','03-10-1998','30-12-2024','user'),
('Trương Quang Khải','truongkhoi@gmail.com','Khai@6547#','0932641785','Hoàng Mai - Hà Nội','14-04-1992','31-12-2024','admin'),
('Lê Ngọc Dung','lengocdung@mail.com','Dung@321&','0952473184','Từ Liêm - Hà Nội','06-07-1997','31-12-2024','user'),
('Đinh Thị Hạnh','hanhdinh@gmail.com','Hanh@678$','0846321579','Đông Anh - Hà Nội','25-12-1990','31-12-2024','user');
*/
/*
INSERT INTO `tblmaterial` (`material_name`,`material_describe`,`material_unit`,`material_date`,`material_expiry`,`material_use`,`material_supplier`,`material_country`,`material_value`,`material_image`) VALUES
('Máy đo đường huyết On Call EZ II','Máy đo đường huyết On Call EZ II được sản xuất bởi tập đoàn ACON Laboratories Inc., USA dựa trên công nghệ mới với chất lượng rất cao, cách sử dụng đơn giản, tiện lợi và
 kết quả đo chính xác. Đặc biệt nguồn cung cấp que  thử dồi dào với giá cả rất hợp lý đã đáp ứng được nguyện vọng của đông đảo bệnh nhân tiểu đường trên toàn thế giới. Máy được sử dụng rộng rãi tại các bệnh 
 viện, trung tâm y tế, phòng mạch cũng như tại gia đình.','Chiếc','03-04-2017','Đến khi hỏng','Chuẩn bị các dụng cụ đo. Lắp kim mới vào bút lấy máu. Chuẩn bị một que đo mới. Chuẩn bị một miếng cồn để sát khuẩn.
Rửa tay bằng xà phòng và lau khô. Sát khuẩn vị trí lấy máu (đầu ngón tay) bằng cồn và chờ cho cồn bay hơi hết (đầu ngón tay khô).
Gắn que đo vào máy, máy sẽ tự động bật lên. Chờ cho đến khi trên màn hình xuất hiện biểu tượng giọt máu.
Sau khi điều chỉnh độ nông sâu phù hợp áp đầu bút lấy máu vào ngón tay để chích máu. Mẹo để lấy máu ít đau là bạn nên chích kim ở bên cạnh đầu ngón tay. Không nên chích ở giữa vì ở giữa là nơi tập trung nhiều dây thần kinh do vậy bạn sẽ cảm thấy đau nhiều hơn.
Thấm máu vào que đo. Lưu ý bạn cần cung cấm lượng máu đủ để đo. Trong trường hợp thiếu máu máy sẽ báo lỗi và que đo đó sẽ không được sử dụng lại.
Máy sẽ bắt đầu đếm ngược và sau 10s kết quả sẽ hiện trên màn hình.','ArtCare Medical - Công Ty Cổ Phần Thương Mại Và Dịch Vụ ArtCare','Mỹ','499.000','https://ytesaigon.com/wp-content/uploads/2023/02/May-do-duong-huyet-On-Call-EZ-II.jpg.webp'),
('Máy đo huyết áp Omron HEM-7121','Máy đo huyết áp bắp tay tự động Omron HEM-7121 với công nghệ Intellisense tự động, cho kết quả nhanh chóng, chính xác, dễ sử dụng và nhỏ gọn, phù hợp cho người dùng tại gia đình.','Chiếc','05-01-2020','Đến khi hỏng','Quấn vòng bít quanh bắp tay. Nhấn nút khởi động để đo. Chờ kết quả hiển thị trên màn hình sau 1 phút.','Omron Healthcare Việt Nam','Nhật Bản','1.200.000','https://m.yte247.vn/data/products/lmh1543307457.jpg'),
('Nhiệt kế điện tử Microlife MT550','Nhiệt kế điện tử Microlife MT550 có thiết kế nhỏ gọn, dễ sử dụng, cho kết quả chính xác chỉ sau vài giây.','Chiếc','10-12-2019','Đến khi hỏng','Đặt nhiệt kế ở vị trí cần đo (miệng, nách hoặc hậu môn). Chờ báo hiệu hoàn thành đo để đọc kết quả.','Microlife Việt Nam','Thụy Sĩ','350.000','https://microlife.com.vn/wp-content/uploads/2021/10/MT-550-01.png'),
('Khẩu trang y tế 4 lớp','Khẩu trang y tế 4 lớp giúp lọc bụi, vi khuẩn và chống giọt bắn, đảm bảo an toàn cho người sử dụng.','Hộp','01-01-2021','3 năm','Đeo khẩu trang che kín mũi và miệng.','Công ty TNHH Khải Hoàn','Việt Nam','50.000','https://cdn.tgdd.vn/Products/Images/5872/283254/khau-trang-y-te-mask-care-4-lop-trang-hop-50-cai-thumb-1-600x600.jpg'),
('Găng tay y tế Latex','Găng tay y tế Latex bột loại dùng một lần, bảo vệ tay khỏi tác nhân bên ngoài.','Hộp','15-05-2021','5 năm','Đeo găng trước khi tiếp xúc với hóa chất hoặc tác nhân gây hại.','Công ty TNHH SHIELD','Malaysia','85.000','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcReavncEkr3yVRV3Q6Kbxbju52UjUTaeqYkHA&s'),
('Cồn y tế 70%','Cồn y tế 70% dùng để sát khuẩn, lau vết thương hoặc dụng cụ y tế.','Chai','20-07-2020','2 năm','Dùng bông thấm cồn và lau trực tiếp lên vùng cần sát khuẩn.','Công ty Dược Hậu Giang','Việt Nam','25.000','https://cdn.nhathuoclongchau.com.vn/unsafe/https://cms-prod.s3-sgn09.fptcloud.com/00031523_con_xit_sat_khuan_ethanol_opc_70_do_60ml_6175_62b5_large_8756364a13.jpg'),
('Bông gạc y tế','Bông gạc y tế tiệt trùng dùng để băng bó vết thương, bảo vệ vùng da bị tổn thương.','Túi','01-09-2021','3 năm','Dùng gạc băng vùng vết thương sau khi sát khuẩn.','Công ty TNHH An Lành','Việt Nam','30.000','https://cdn.nhathuoclongchau.com.vn/unsafe/https://cms-prod.s3-sgn09.fptcloud.com/00017885_bong_gac_dap_vet_thuong_bao_thach_8cm_x_12cm_2863_62ae_large_ca54514759.jpg'),
('Ống tiêm 5ml','Ống tiêm 5ml sử dụng một lần, dùng trong tiêm thuốc hoặc hút dịch.','Hộp','05-10-2021','3 năm','Lắp kim tiêm vào ống, hút thuốc và tiêm theo chỉ dẫn.','Công ty TNHH Y Tế Việt','Việt Nam','100.000','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5zUlthKvfKGmvxBwnTNkJ94SfSrmlx169QA&s'),
('Máy xông khí dung Omron NE-C28','Máy xông khí dung Omron NE-C28 được sử dụng để điều trị các bệnh về đường hô hấp như viêm phổi, viêm mũi.','Chiếc','10-08-2020','Đến khi hỏng','Đổ dung dịch thuốc vào cốc, bật máy và xông trong 10-15 phút.','Omron Healthcare Việt Nam','Nhật Bản','1.500.000','https://m.yte247.vn/data/products/fny1538723781.jpg'),
('Nạng y tế bằng nhôm','Nạng y tế bằng nhôm nhẹ, chắc chắn, hỗ trợ di chuyển cho bệnh nhân chấn thương chân.','Cặp','15-09-2021','Đến khi hỏng','Điều chỉnh chiều cao phù hợp trước khi sử dụng.','Công ty TNHH Việt Phát','Việt Nam','400.000','https://thietbiytephuan.vn/wp-content/uploads/2019/05/nanglucass.jpg'),
('Xe lăn y tế','Xe lăn y tế tiện dụng, thiết kế nhỏ gọn và an toàn, hỗ trợ di chuyển cho người khuyết tật hoặc bệnh nhân.','Chiếc','01-06-2020','Đến khi hỏng','Kiểm tra và bảo dưỡng xe định kỳ, sử dụng đúng mục đích.','Công ty TNHH Đức Minh','Việt Nam','2.500.000','https://bizweb.dktcdn.net/thumb/grande/100/397/542/products/0732331xe-lan-lucass-x9-ytethaihung1-jpeg.jpg?v=1596591043307'),
('Dây truyền dịch','Dây truyền dịch vô trùng, dùng để truyền dịch hoặc máu cho bệnh nhân.','Hộp','25-04-2021','3 năm','Kết nối dây truyền vào bình dịch và kim tiêm, điều chỉnh tốc độ dòng chảy phù hợp.','Công ty TNHH Hòa Bình','Việt Nam','150.000','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRGd0ljumvi90xcb8Gv_SaKXfYwkl3O4NBusw&s'),
('Que thử đường huyết Accu-Chek','Que thử đường huyết Accu-Chek dùng với máy đo đường huyết cùng loại, cho kết quả chính xác.','Hộp','05-07-2021','2 năm','Lắp que thử vào máy đo, nhỏ máu vào đầu que và đọc kết quả.','Roche Diagnostics','Đức','600.000','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT4h-L2o7MZyIFgELQMt4eThtRDFaMsvPrzvA&s'),
('Bộ sơ cứu cá nhân','Bộ sơ cứu cá nhân bao gồm đầy đủ dụng cụ y tế cơ bản như băng gạc, kéo, cồn sát khuẩn.','Bộ','01-03-2022','3 năm','Sử dụng trong trường hợp sơ cứu khẩn cấp.','Công ty TNHH Việt Y Tế','Việt Nam','250.000','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOe4bvcUjb1sWnu4femtzEkHlmExptOJfTOw&s'),
('Đèn khám y tế LED','Đèn khám y tế LED có ánh sáng trắng, tiết kiệm năng lượng, hỗ trợ khám bệnh chi tiết.','Chiếc','20-08-2020','Đến khi hỏng','Bật đèn và sử dụng để chiếu sáng vùng cần khám.','Công ty TNHH Meditech','Việt Nam','800.000','https://hoangminhmed.com/wp-content/uploads/2023/10/mplent-den-kham-1.png.webp'),
('Tủ thuốc gia đình','Tủ thuốc gia đình nhỏ gọn, chứa các ngăn lưu trữ thuốc và dụng cụ y tế.','Chiếc','15-10-2021','Đến khi hỏng','Sắp xếp và bảo quản thuốc trong tủ khô ráo.','Công ty TNHH Việt Thành','Việt Nam','1.200.000','https://file.hstatic.net/1000236744/file/tu-thuoc-y-te-gia-dinh-hoac-cty-size-trung_dddabdad94274748a12eb36974708c52.jpg'),
('Nhiệt kế hồng ngoại','Nhiệt kế hồng ngoại đo nhiệt độ không cần tiếp xúc, phù hợp với mọi lứa tuổi.','Chiếc','25-12-2020','Đến khi hỏng','Hướng cảm biến về phía trán và nhấn nút đo.','Microlife Việt Nam','Thụy Sĩ','1.000.000','https://thietbiytegiagoc.com/wp-content/uploads/2020/08/nhiet-ke-dien-tu-hong-ngoai-infrared-thermometer-ck-t1803_Thietbiytegiagoc.jpg'),
('Máy đo SpO2 Beurer PO30','Máy đo SpO2 Beurer PO30 kiểm tra nồng độ oxy trong máu và nhịp tim.','Chiếc','15-06-2021','Đến khi hỏng','Kẹp máy vào ngón tay và đọc kết quả trên màn hình.','Beurer GmbH','Đức','850.000','https://www.beurer.vn/wp-content/uploads/2018/09/po30-1.jpg'),
('Găng tay phẫu thuật tiệt trùng','Găng tay phẫu thuật tiệt trùng dùng trong các ca mổ hoặc tiểu phẫu.','Hộp','01-11-2021','5 năm','Mang găng trước khi tiến hành phẫu thuật.','Công ty TNHH An Bình','Việt Nam','120.000','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSB0YPCxEkV31-7S6MaLIwNUQgutCjw7f_VwA&s');
*/
/*
INSERT INTO `tblrequest` (`request_name`,`request_email`,`request_phone`,`request_date`,`request_materialname`,`request_quantity`,`request_reason`,`request_note`,`request_status`) VALUES
('Nguyễn Văn Quang','quang.nguyen@mail.com','0978123456','03-08-2024','Bộ sơ cứu cá nhân',2,'Thay cho phòng y tế','Không có ghi chú','Đã duyệt'),
('Lê Thị Hồng','hong.le@mail.com','0987456123','10-08-2024','Khẩu trang y tế 4 lớp',50,'Cấp phát cho nhân viên y tế','Yêu cầu gấp','Đang chờ'),
('Trần Quốc Bảo','bao.tran@mail.com','0967321456','12-08-2024','Máy đo huyết áp Omron HEM-7121',1,'Phục vụ khám sức khỏe','Không có ghi chú','Đã duyệt'),
('Nguyễn Hoài Nam','nam.nguyen@mail.com','0945123789','15-08-2024','Nhiệt kế điện tử Microlife MT550',3,'Dùng cho khoa Nhi','Ưu tiên xử lý sớm','Đã duyệt'),
('Phạm Thu Trang','trang.pham@mail.com','0932145678','18-08-2024','Cồn y tế 70%',10,'Vệ sinh phòng khám','Không có ghi chú','Đang chờ'),
('Đặng Minh Tuấn','tuan.dang@mail.com','0921436578','20-08-2024','Bông gạc y tế',100,'Bổ sung kho dự trữ','Không có ghi chú','Từ chối'),
('Hoàng Thị Lan','lan.hoang@mail.com','0912345678','25-08-2024','Máy đo đường huyết On Call EZ II',2,'Phục vụ điều trị bệnh nhân','Cần gấp trong tuần','Đã duyệt'),
('Phạm Quốc Việt','viet.pham@mail.com','0908765432','28-08-2024','Que thử đường huyết Accu-Chek',50,'Dùng cho bệnh nhân tiểu đường','Không có ghi chú','Đã duyệt'),
('Võ Thị Mai','mai.vo@mail.com','0971234567','30-08-2024','Dây truyền dịch',20,'Hỗ trợ cấp cứu','Yêu cầu xử lý nhanh','Đang chờ'),
('Nguyễn Thị Hằng','hang.nguyen@mail.com','0983214567','03-09-2024','Găng tay y tế Latex',100,'Dùng trong phòng thí nghiệm','Không có ghi chú','Đã duyệt'),
('Trần Đức Long','long.tran@mail.com','0965214789','05-09-2024','Máy xông khí dung Omron NE-C28',1,'Hỗ trợ điều trị bệnh nhân hen','Không có ghi chú','Đã duyệt'),
('Nguyễn Minh Khang','khang.nguyen@mail.com','0954123678','08-09-2024','Tủ thuốc gia đình',5,'Cấp phát cho phòng khám nhỏ','Ưu tiên xử lý','Đang chờ'),
('Phạm Thị Lệ','le.pham@mail.com','0945123768','10-09-2024','Nhiệt kế hồng ngoại',2,'Dùng tại phòng khám','Không có ghi chú','Đã duyệt'),
('Hoàng Minh Nhật','nhat.hoang@mail.com','0932145689','12-09-2024','Máy đo SpO2 Beurer PO30',3,'Phục vụ bệnh nhân nặng','Không có ghi chú','Đã duyệt'),
('Nguyễn Phương Linh','linh.nguyen@mail.com','0921456789','15-09-2024','Nạng y tế bằng nhôm',2,'Hỗ trợ bệnh nhân chấn thương','Không có ghi chú','Từ chối'),
('Đỗ Hoàng Anh','anh.do@mail.com','0912567893','18-09-2024','Găng tay phẫu thuật tiệt trùng',50,'Dùng trong phẫu thuật','Không có ghi chú','Đã duyệt'),
('Lê Văn Hải','hai.le@mail.com','0986543212','20-09-2024','Xe lăn y tế',1,'Hỗ trợ bệnh nhân khuyết tật','Không có ghi chú','Đã duyệt'),
('Trần Văn Bình','binh.tran@mail.com','0978654321','22-09-2024','Đèn khám y tế LED',5,'Dùng tại phòng khám mới','Không có ghi chú','Đang chờ'),
('Ngô Thị Ngọc','ngoc.ngo@mail.com','0967452319','25-09-2024','Bộ sơ cứu cá nhân',10,'Bổ sung cho các trạm y tế','Không có ghi chú','Đã duyệt'),
('Vũ Minh Thảo','thao.vu@mail.com','0945678123','28-09-2024','Ống tiêm 5ml',200,'Bổ sung kho vật tư','Không có ghi chú','Đã duyệt'),
('Trịnh Quốc Hùng','hung.trinh@mail.com','0932765431','30-09-2024','Khẩu trang y tế 4 lớp',100,'Phòng dịch cho nhân viên','Yêu cầu xử lý gấp','Đã duyệt');
*/
/*
INSERT INTO `tblsupplier` (`supplier_name`,`supplier_email`,`supplier_phone`,`supplier_address`,`supplier_website`,`supplier_describe`,`supplier_date_created`) VALUES
('ArtCare Medical - Công Ty Cổ Phần Thương Mại Và Dịch Vụ ArtCare','ac.hailevan@gmail.com','0935283339','Lô 6, Khu B2-26, KDT Công Nghệ FPT Đà Nẵng, P. Hòa Hải, Q. Ngũ Hành Sơn, Tp. Đà Nẵng, Việt Nam','http://artcare.com.vn/','ArtCare Medical - Nhà phân phối và kinh doanh Thiết bị Y tế số 1 Đà Nẵng!
Chúng tôi được ủy quyền phân phối chính thức các sản phẩm: Bộ kim sinh thiết hãng TSK-Nhật Bản, HS-Italy, Pajunk-Đức, Thiết bị, vật tư tiêu hao khoa nhi hãng Mediprema-Pháp, Thiết bị, vật tư tiêu hao khoa tiết niệu hãng Maflow-Thụy Sỹ,..','14-05-2024'),
('Công ty TNHH Y Tế Sao Việt','contact@saovietmedical.vn','0978123456','Số 15, Đường Lê Văn Lương, Quận Thanh Xuân, Hà Nội, Việt Nam','http://saovietmedical.vn/','Cung cấp thiết bị y tế, vật tư tiêu hao hàng đầu tại miền Bắc','20-05-2024'),
('Công ty TNHH Thiết Bị Y Tế Đại Nam','info@dainammedical.com','0932456789','Số 7, Đường Nguyễn Văn Linh, Quận 7, TP.HCM, Việt Nam','http://dainammedical.com/','Chuyên phân phối thiết bị y tế, hóa chất và dụng cụ xét nghiệm','22-05-2024'),
('Công ty Cổ phần Dược phẩm Gia Đình','support@gdf.vn','0965321478','Số 9, Đường Trần Duy Hưng, Quận Cầu Giấy, Hà Nội, Việt Nam','http://giadinhpharma.vn/','Phân phối thuốc, thiết bị y tế và dịch vụ chăm sóc sức khỏe','25-05-2024'),
('Công ty TNHH Thiết Bị Y Tế Á Châu','sales@achau-med.vn','0908123456','Số 20, Đường Lê Thánh Tông, Quận 1, TP.HCM, Việt Nam','http://achau-med.vn/','Nhà phân phối thiết bị y tế chính hãng tại Việt Nam','27-05-2024'),
('Công ty TNHH Thương Mại Y Tế Minh Khang','info@minhkhangmedical.vn','0935467821','Số 11, Đường Hoàng Văn Thụ, Quận Tân Bình, TP.HCM, Việt Nam','http://minhkhangmedical.vn/','Chuyên cung cấp thiết bị và vật tư y tế nhập khẩu','30-05-2024'),
('Công ty Cổ phần Y Tế Việt Nhật','contact@vietnhatmed.vn','0976543210','Số 8, Đường Võ Chí Công, Quận Tây Hồ, Hà Nội, Việt Nam','http://vietnhatmed.vn/','Nhà phân phối độc quyền thiết bị y tế từ Nhật Bản','01-06-2024'),
('Công ty TNHH Thiết Bị Y Tế Đức Tín','info@ductinmedical.com','0921345678','Số 22, Đường Phan Đình Phùng, Quận Phú Nhuận, TP.HCM, Việt Nam','http://ductinmedical.com/','Cung cấp giải pháp y tế toàn diện','03-06-2024'),
('Công ty Cổ phần Vật Tư Y Tế Quốc Tế','support@qtmed.vn','0945123678','Số 10, Đường Bạch Đằng, Quận Hai Bà Trưng, Hà Nội, Việt Nam','http://qtmed.vn/','Chuyên nhập khẩu và phân phối vật tư y tế từ các nước Châu Âu','05-06-2024'),
('Công ty TNHH Dịch Vụ Y Tế Hồng Phúc','sales@hongphucmed.com','0932156789','Số 5, Đường Nguyễn Huệ, Quận 1, TP.HCM, Việt Nam','http://hongphucmed.com/','Cung cấp dịch vụ tư vấn và thiết bị y tế chất lượng cao','07-06-2024'),
('Công ty TNHH Thương Mại Y Tế Phương Đông','contact@phuongdongmed.vn','0907541236','Số 18, Đường Láng, Quận Đống Đa, Hà Nội, Việt Nam','http://phuongdongmed.vn/','Chuyên cung cấp vật tư y tế tiêu hao','10-06-2024'),
('Công ty Cổ phần Thiết Bị Y Tế Toàn Cầu','info@globalmed.vn','0986543219','Số 25, Đường Ngô Quyền, Quận 5, TP.HCM, Việt Nam','http://globalmed.vn/','Nhập khẩu và phân phối thiết bị y tế hiện đại','12-06-2024'),
('Công ty TNHH Thiết Bị Y Tế Thành Đạt','sales@thanhdatmedical.com','0912456789','Số 3, Đường Trần Hưng Đạo, Quận Hoàn Kiếm, Hà Nội, Việt Nam','http://thanhdatmedical.com/','Cung cấp các thiết bị y tế và dụng cụ phòng thí nghiệm','15-06-2024'),
('Công ty TNHH Thiết Bị Y Tế Thiên An','contact@thienanmed.vn','0976543128','Số 14, Đường Điện Biên Phủ, Quận Bình Thạnh, TP.HCM, Việt Nam','http://thienanmed.vn/','Cung cấp thiết bị y tế chính hãng','18-06-2024'),
('Công ty Cổ phần Vật Tư Y Tế Hà Nội','info@hnmed.vn','0932145679','Số 6, Đường Giải Phóng, Quận Hoàng Mai, Hà Nội, Việt Nam','http://hnmed.vn/','Phân phối vật tư y tế tiêu hao tại khu vực miền Bắc','20-06-2024'),
('Công ty TNHH Dược Phẩm Bình Minh','support@binhminhpharma.vn','0967452189','Số 21, Đường Nguyễn Thị Minh Khai, Quận 3, TP.HCM, Việt Nam','http://binhminhpharma.vn/','Chuyên cung cấp dược phẩm và vật tư y tế','22-06-2024'),
('Công ty TNHH Thiết Bị Y Tế Ánh Dương','sales@anhduongmed.vn','0923456781','Số 30, Đường Nguyễn Văn Cừ, Quận Long Biên, Hà Nội, Việt Nam','http://anhduongmed.vn/','Cung cấp thiết bị y tế cho các cơ sở bệnh viện','25-06-2024'),
('Công ty TNHH Y Tế Hòa Bình','contact@hoabinhmed.vn','0945678129','Số 12, Đường Cộng Hòa, Quận Tân Bình, TP.HCM, Việt Nam','http://hoabinhmed.vn/','Cung cấp vật tư y tế cho các phòng khám đa khoa','28-06-2024'),
('Công ty TNHH Dịch Vụ Y Tế Tân Phát','info@tanphatmed.vn','0912345679','Số 16, Đường Nguyễn Tri Phương, Quận 10, TP.HCM, Việt Nam','http://tanphatmed.vn/','Nhà phân phối vật tư và thiết bị y tế chính hãng','30-06-2024'),
('Công ty TNHH Thiết Bị Y Tế Nam Việt','support@namvietmed.vn','0908765432','Số 4, Đường Tô Hiến Thành, Quận 10, TP.HCM, Việt Nam','http://namvietmed.vn/','Nhập khẩu và phân phối thiết bị y tế chuyên nghiệp','02-07-2024');
*/
/*
INSERT INTO `tblwarehouse` (`material_id`,`warehouse_name`,`warehouse_supplier`,`warehouse_quantity`) VALUES
(1,'Găng tay phẫu thuật tiệt trùng','Công ty TNHH Thiết Bị Y Tế Thiên An',20),
(2,'Bông băng y tế','Công ty Cổ phần Vật Tư Y Tế Hà Nội',50),
(3,'Ống tiêm nhựa 3ml','Công ty TNHH Dược Phẩm Bình Minh',100),
(4,'Khẩu trang y tế 3 lớp','Công ty TNHH Y Tế Sao Việt',200),
(5,'Máy đo huyết áp điện tử','Công ty Cổ phần Thiết Bị Y Tế Toàn Cầu',15),
(6,'Nhiệt kế hồng ngoại','Công ty TNHH Thiết Bị Y Tế Đức Tín',30),
(7,'Dây truyền dịch','Công ty TNHH Y Tế Hòa Bình',120),
(8,'Dung dịch sát khuẩn tay','Công ty TNHH Dịch Vụ Y Tế Tân Phát',75),
(9,'Máy đo đường huyết','ArtCare Medical - Công Ty Cổ Phần Thương Mại Và Dịch Vụ ArtCare',10),
(10,'Que test nhanh COVID-19','Công ty TNHH Thiết Bị Y Tế Nam Việt',300),
(11,'Bộ dụng cụ sơ cứu cá nhân','Công ty TNHH Thương Mại Y Tế Minh Khang',25),
(12,'Gạc vô trùng','Công ty TNHH Dịch Vụ Y Tế Hồng Phúc',80),
(13,'Bộ dụng cụ phẫu thuật','Công ty TNHH Thiết Bị Y Tế Thành Đạt',10),
(14,'Ống nghiệm thủy tinh','Công ty TNHH Thương Mại Y Tế Phương Đông',50),
(15,'Dụng cụ đo nhiệt độ cơ thể','Công ty TNHH Thiết Bị Y Tế Á Châu',40),
(16,'Dung dịch khử trùng dụng cụ','Công ty TNHH Dịch Vụ Y Tế Ánh Dương',60),
(17,'Giường bệnh đa năng','Công ty Cổ phần Y Tế Việt Nhật',5),
(18,'Bộ hóa chất xét nghiệm','Công ty TNHH Thiết Bị Y Tế Đại Nam',35),
(19,'Máy thở oxy','Công ty Cổ phần Vật Tư Y Tế Quốc Tế',8),
(20,'Bộ truyền máu','Công ty TNHH Dịch Vụ Y Tế Tân Phát',50);
*/
