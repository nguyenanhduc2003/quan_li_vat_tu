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
//datatable
document.addEventListener("DOMContentLoaded", function() {
    const table = document.querySelector(".table");
    $(table).DataTable({
        language: {
            url: "https://cdn.datatables.net/plug-ins/1.13.1/i18n/vi.json"
        }
    });
});

// nhap xuat
function handleNhap(button) {
    const row = button.closest('tr');
    const quantityCell = row.cells[3];
    const statusCell = row.cells[4];
    
    const inputQuantity = prompt("Nhập số lượng cần nhập:", "0");
    if (inputQuantity !== null) {
        const quantity = parseInt(inputQuantity, 10);
        if (!isNaN(quantity) && quantity > 0) {
            alert(`Bạn đã nhập thêm ${quantity} vào kho.`);
            const newQuantity = parseInt(quantityCell.textContent, 10) + quantity;
            quantityCell.textContent = newQuantity;
            updateStatus(newQuantity, statusCell);
        } else {
            alert("Vui lòng nhập số lượng hợp lệ.");
        }
    }
}

function handleXuat(button) {
    const row = button.closest('tr');
    const quantityCell = row.cells[3];
    const statusCell = row.cells[4];

    const outputQuantity = prompt("Nhập số lượng cần xuất:", "0");
    if (outputQuantity !== null) {
        const quantity = parseInt(outputQuantity, 10);
        if (!isNaN(quantity) && quantity > 0) {
            const currentQuantity = parseInt(quantityCell.textContent, 10);
            if (quantity <= currentQuantity) {
                alert(`Bạn đã xuất ${quantity} khỏi kho.`);
                const newQuantity = currentQuantity - quantity;
                quantityCell.textContent = newQuantity;
                updateStatus(newQuantity, statusCell);
            } else {
                alert("Số lượng xuất vượt quá số lượng hiện có.");
            }
        } else {
            alert("Vui lòng nhập số lượng hợp lệ.");
        }
    }
}

function updateStatus(quantity, statusCell) {
    if (quantity < 10) {
        statusCell.textContent = "Cần bổ sung";
        statusCell.className = "text-danger";
    } else {
        statusCell.textContent = "Bình thường";
        statusCell.className = "text-success";
    }
}

// them vat tu
function handleAddNew() {
    const maVatTu = prompt("Nhập mã vật tư:", "");
    const tenVatTu = prompt("Nhập tên vật tư:", "");
    const nhaCungCap = prompt("Nhập nhà cung cấp:", "");
    const soLuong = prompt("Nhập số lượng ban đầu:", "0");

    if (maVatTu && tenVatTu && nhaCungCap && soLuong !== null) {
        const quantity = parseInt(soLuong, 10);
        if (!isNaN(quantity) && quantity >= 0) {
            const tbody = document.querySelector("table tbody");
            const newRow = document.createElement("tr");

            const status = quantity < 10 ? "Cần bổ sung" : "Bình thường";
            const statusClass = quantity < 10 ? "text-danger" : "text-success";

            newRow.innerHTML = `
                <td>${maVatTu}</td>
                <td>${tenVatTu}</td>
                <td>${nhaCungCap}</td>
                <td>${quantity}</td>
                <td class="${statusClass}">${status}</td>
                <td>
                    <button class="btn btn-primary" onclick="handleNhap(this)">Nhập</button>
                    <button class="btn btn-success" onclick="handleXuat(this)">Xuất</button>
                </td>
            `;
            tbody.appendChild(newRow);
            alert("Đã thêm vật tư mới thành công.");
        } else {
            alert("Số lượng không hợp lệ.");
        }
    } else {
        alert("Vui lòng nhập đầy đủ thông tin.");
    }
}

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