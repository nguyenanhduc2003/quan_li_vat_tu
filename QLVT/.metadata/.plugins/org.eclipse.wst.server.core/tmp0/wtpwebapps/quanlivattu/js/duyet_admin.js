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

// xu li button
$(document).ready(function () {
    // Xử lý nút "Duyệt"
    $(document).on('click', '.btn-approve', function () {
        if (confirm('Bạn có chắc chắn muốn duyệt yêu cầu này không?')) {
            const actionCell = $(this).closest('.action-cell');
            actionCell.html('<span class="text-primary">Đã Duyệt</span>');
            alert('Yêu cầu đã được duyệt.');
        }
    });

    // Xử lý nút "Từ Chối"
    $(document).on('click', '.btn-reject', function () {
        if (confirm('Bạn có chắc chắn muốn từ chối yêu cầu này không?')) {
            const actionCell = $(this).closest('.action-cell');
            actionCell.html('<span class="text-danger">Từ Chối</span>');
            alert('Yêu cầu đã bị từ chối.');
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