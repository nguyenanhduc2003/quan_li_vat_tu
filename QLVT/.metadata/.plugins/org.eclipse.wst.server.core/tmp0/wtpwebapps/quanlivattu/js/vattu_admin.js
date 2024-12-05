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
    var sheet = wb.Sheets['Sheet1'];
    var images = document.querySelectorAll('.img-set');  
    images.forEach(function (img, index) {
        var base64 = getBase64Image(img);
        var cell = XLSX.utils.decode_cell('K' + (index + 2)); 
        sheet['!images'] = sheet['!images'] || [];
        sheet['!images'].push({
            name: 'image' + (index + 1) + '.jpg',
            data: base64,
            position: {
                s: {r: cell.r, c: cell.c},
                e: {r: cell.r, c: cell.c}  
            }
        });
    });

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

//hien thi modal

const editButtons = document.querySelectorAll(".btn-edit");

editButtons.forEach(button => {
    button.addEventListener("click", function () {
        const row = button.closest("tr");

        const materialId = row.cells[0].innerText;
        const materialName = row.cells[1].innerText;
        const materialDescribe = row.cells[2].querySelector("abbr").title;
        const materialUnit = row.cells[3].innerText;
        const materialDate = row.cells[4].innerText;
        const materialExpiry = row.cells[5].innerText;
        const materialUse = row.cells[6].querySelector("abbr").title;
        const materialSupplier = row.cells[7].innerText;
        const materialCountry = row.cells[8].innerText;
        const materialValue = row.cells[9].innerText;
        const materialImage = row.cells[10].querySelector("img").src;

        document.getElementById("material_id1").value = materialId;
        document.getElementById("material_name1").value = materialName;
        document.getElementById("material_describe1").value = materialDescribe;
        document.getElementById("material_unit1").value = materialUnit;
        document.getElementById("material_date1").value = materialDate;
        document.getElementById("material_expiry1").value = materialExpiry;
        document.getElementById("material_use1").value = materialUse;
        document.getElementById("material_supplier1").value = materialSupplier;
        document.getElementById("material_country1").value = materialCountry;
        document.getElementById("material_value1").value = materialValue;
        document.getElementById("material_image1").value = materialImage;
    });
});


