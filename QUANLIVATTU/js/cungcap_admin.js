document.getElementById('toggle').addEventListener('click', function() {
    const sidebar = document.getElementById('sidebar');
    const mainContent = document.getElementById('main-content');
    
    // Toggle the 'hidden' class
    sidebar.classList.toggle('hidden');
    mainContent.classList.toggle('hidden');
});

//Đổi màu tên
const colors = ['red', 'blue', 'green', 'orange', 'purple','black'];
let currentIndex = 0;

function changeColor() {
    const textElement = document.getElementById('name');
    textElement.style.color = colors[currentIndex]; // Thay đổi màu sắc
    currentIndex = (currentIndex + 1) % colors.length; // Lặp lại danh sách màu
}

setInterval(changeColor, 500); // Đổi màu sau mỗi 0,5 giây


document.querySelectorAll('.fade-link').forEach(link => {
    link.addEventListener('click', function(e) {
        e.preventDefault(); // Ngăn chặn hành động mặc định
        document.body.classList.add('fade-out'); // Thêm class để fade-out
        setTimeout(() => {
            window.location.href = link.href; // Chuyển hướng sau hiệu ứng
        }, 500); // Thời gian fade-out (0.5s)
    });
});


// xuất file

function exportToExcel() {
    var wb = XLSX.utils.table_to_book(document.getElementById('myTable'), {sheet: "Sheet1"});
    
    // Xử lý hình ảnh (thêm ảnh vào Excel)
    var sheet = wb.Sheets['Sheet1'];
    var images = document.querySelectorAll('.img-set');  // Chọn tất cả hình ảnh
    images.forEach(function (img, index) {
        var base64 = getBase64Image(img);
        var cell = XLSX.utils.decode_cell('K' + (index + 2)); // K: Cột ảnh (thêm vào cột 11)
        sheet['!images'] = sheet['!images'] || [];
        sheet['!images'].push({
            name: 'image' + (index + 1) + '.jpg',
            data: base64,
            position: {
                s: {r: cell.r, c: cell.c}, // Vị trí hình ảnh
                e: {r: cell.r, c: cell.c}  // Vị trí kết thúc
            }
        });
    });

    // Xuất file Excel
    XLSX.writeFile(wb, 'xuat_file_du_lieu.xlsx');
}

function getBase64Image(img) {
    var canvas = document.createElement('canvas');
    var ctx = canvas.getContext('2d');
    canvas.width = img.width;
    canvas.height = img.height;
    ctx.drawImage(img, 0, 0);
    return canvas.toDataURL('image/jpeg').split(',')[1]; // Trả về base64 string
}

//xu li table
$(document).ready(function () {
    // Hàm thêm dòng mới
    function addRow(data) {
        const row = `
            <tr>
                <td>${data.name}</td>
                <td>${data.email}</td>
                <td>${data.phone}</td>
                <td>${data.address}</td>
                <td>${data.website}</td>
                <td>${data.description}</td>
                <td>${data.createdDate}</td>
                <td>
                    <button class="btn btn-primary btnEdit">Sửa</button>
                    <button class="btn btn-danger btnDelete">Xóa</button>
                </td>
            </tr>`;
        $("#dataTableBody").append(row);
    }

    // Xử lý thêm mới
    $("#btnAdd").click(function () {
        const newData = {
            name: prompt("Tên nhà cung cấp:"),
            email: prompt("Email:"),
            phone: prompt("Số điện thoại:"),
            address: prompt("Địa chỉ:"),
            website: prompt("Website:"),
            description: prompt("Mô tả:"),
            createdDate: new Date().toLocaleDateString()
        };

        if (newData.name && newData.email) {
            addRow(newData);
            alert("Thêm mới thành công!");
        } else {
            alert("Thông tin không hợp lệ!");
        }
    });

    // Xử lý sửa
    $(document).on("click", ".btnEdit", function () {
        const row = $(this).closest("tr");
        const cells = row.find("td");
        const updatedData = {
            name: prompt("Tên nhà cung cấp:", cells.eq(0).text()),
            email: prompt("Email:", cells.eq(1).text()),
            phone: prompt("Số điện thoại:", cells.eq(2).text()),
            address: prompt("Địa chỉ:", cells.eq(3).text()),
            website: prompt("Website:", cells.eq(4).text()),
            description: prompt("Mô tả:", cells.eq(5).text()),
            createdDate: cells.eq(6).text() // giữ nguyên ngày tạo
        };

        if (updatedData.name && updatedData.email) {
            cells.eq(0).text(updatedData.name);
            cells.eq(1).text(updatedData.email);
            cells.eq(2).text(updatedData.phone);
            cells.eq(3).text(updatedData.address);
            cells.eq(4).text(updatedData.website);
            cells.eq(5).text(updatedData.description);
            alert("Cập nhật thành công!");
        } else {
            alert("Thông tin không hợp lệ!");
        }
    });

    // Xử lý xóa
    $(document).on("click", ".btnDelete", function () {
        if (confirm("Bạn có chắc chắn muốn xóa dòng này?")) {
            $(this).closest("tr").remove();
            alert("Xóa thành công!");
        }
    });
});

//datatable
document.addEventListener("DOMContentLoaded", function() {
    const table = document.querySelector(".table");
    $(table).DataTable({
        language: {
            url: "https://cdn.datatables.net/plug-ins/1.13.1/i18n/vi.json"
        }
    });
});

// xuất file

function exportToExcel() {
    var wb = XLSX.utils.table_to_book(document.getElementById('myTable'), {sheet: "Sheet1"});
    
    // Xử lý hình ảnh (thêm ảnh vào Excel)
    var sheet = wb.Sheets['Sheet1'];
    var images = document.querySelectorAll('.img-set');  // Chọn tất cả hình ảnh
    images.forEach(function (img, index) {
        var base64 = getBase64Image(img);
        var cell = XLSX.utils.decode_cell('K' + (index + 2)); // K: Cột ảnh (thêm vào cột 11)
        sheet['!images'] = sheet['!images'] || [];
        sheet['!images'].push({
            name: 'image' + (index + 1) + '.jpg',
            data: base64,
            position: {
                s: {r: cell.r, c: cell.c}, // Vị trí hình ảnh
                e: {r: cell.r, c: cell.c}  // Vị trí kết thúc
            }
        });
    });

    // Xuất file Excel
    XLSX.writeFile(wb, 'xuat_file_du_lieu.xlsx');
}