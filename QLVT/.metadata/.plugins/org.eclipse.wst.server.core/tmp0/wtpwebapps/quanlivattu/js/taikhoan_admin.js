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

function getBase64Image(img) {
    var canvas = document.createElement('canvas');
    var ctx = canvas.getContext('2d');
    canvas.width = img.width;
    canvas.height = img.height;
    ctx.drawImage(img, 0, 0);
    return canvas.toDataURL('image/jpeg').split(',')[1]; // Trả về base64 string
}


//add data
// Lấy các thành phần
const table = document.getElementById("myTable").getElementsByTagName("tbody")[0];
const addRowBtn = document.getElementById("addRowBtn");

// Thêm sự kiện click cho nút "Thêm"
addRowBtn.addEventListener("click", function () {
    // Lấy giá trị từ các ô input
    const userid = document.getElementById("user-id").value;
    const username = document.getElementById("user-name").value;
    const email = document.getElementById("email").value;
    const password = document.getElementById("password").value;
    const phonenumber = document.getElementById("phonenumber").value;
    const birthday = document.getElementById("birthday").value;
    const address = document.getElementById("address").value;
    const datecreate = document.getElementById("date-create").value;
    const role = document.getElementById("role").value;


    // Kiểm tra nếu các ô trống thì không thêm
    if (!userid || !username || !email || !password || !phonenumber || !birthday || !address || !datecreate ||!role) {
        alert("Vui lòng điền đầy đủ thông tin!");
        return;
    }

    // Tạo một dòng mới
    const newRow = table.insertRow();

    // Thêm các ô dữ liệu vào dòng mới
    newRow.insertCell(0).innerText = userid;
    newRow.insertCell(1).innerText = username;
    newRow.insertCell(2).innerText = email;
    newRow.insertCell(3).innerText = password;
    newRow.insertCell(4).innerText = phonenumber;
    newRow.insertCell(5).innerText = address;
    newRow.insertCell(6).innerText = birthday;
    newRow.insertCell(7).innerText = datecreate;
    newRow.insertCell(8).innerText = role;

    var cell = newRow.insertCell(9); // Tạo cell mới tại cột thứ 8
    var div = document.createElement("div"); // Tạo div container
    div.classList.add("d-flex", "gap-2"); // Thêm class d-flex và gap-2 (để có khoảng cách giữa các nút)
    
    var button1 = document.createElement("button"); // Tạo button đầu tiên
    button1.innerText = "Sửa"; // Đặt văn bản cho button 1
    button1.classList.add("btn", "btn-primary"); // Thêm class "btn" và "btn-primary"
    
    var button2 = document.createElement("button"); // Tạo button thứ hai
    button2.innerText = "Xóa"; // Đặt văn bản cho button 2
    button2.classList.add("btn", "btn-danger"); // Thêm class "btn" và "btn-primary"
    
    // Thêm các button vào div container
    div.appendChild(button1);
    div.appendChild(button2);
    
    // Thêm div chứa các button vào cell
    cell.appendChild(div);


    // Xóa dữ liệu trong ô input sau khi thêm
    document.getElementById("user-id").value = "";
    document.getElementById("user-name").value = "";
    document.getElementById("email").value = "";
    document.getElementById("password").value = "";
    document.getElementById("phonenumber").value = "";
    document.getElementById("birthday").value = "";
    document.getElementById("address").value = "";
    document.getElementById("date-create").value = "";
    document.getElementById("role").value = "";
});