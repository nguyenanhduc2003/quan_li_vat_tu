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


function searchTable() {
    const input = document.getElementById("searchInput").value.toLowerCase();
    const table = document.getElementById("myTable");
    const rows = table.getElementsByTagName("tr");

    for (let i = 1; i < rows.length; i++) { // Bỏ qua hàng tiêu đề
        const cells = rows[i].getElementsByTagName("td");
        let match = false;

        for (let j = 0; j < cells.length; j++) {
            if (cells[j].innerText.toLowerCase().includes(input)) {
                match = true;
                break;
            }
        }

        rows[i].style.display = match ? "" : "none";
    }
}

  

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


//data table
$(document).ready(function () {
    $('#myTable').DataTable({
        language: {
            "sSearch": "Tìm kiếm:",
            "sLengthMenu": "Hiển thị _MENU_ dòng",
            "sInfo": "Hiển thị _START_ đến _END_ của _TOTAL_ mục",
            "sInfoEmpty": "Không có dữ liệu",
            "sZeroRecords": "Không tìm thấy kết quả phù hợp",
            "oPaginate": {
                "sPrevious": "Trước",
                "sNext": "Tiếp"
            }
        }
    });
});

// tim kiem va loc card


const sortAscButton = document.getElementById('sort-asc');
const sortDescButton = document.getElementById('sort-desc');
const cardContainer = document.querySelector('.row > .col-md-9 > .row');


sortAscButton.addEventListener('click', () => sortCards('asc'));


sortDescButton.addEventListener('click', () => sortCards('desc'));

function sortCards(order) {
    const cardContainer = document.getElementById("cardContainer");
    const cards = Array.from(cardContainer.getElementsByClassName('card-item'));

    // Sắp xếp thẻ sản phẩm theo tên
    cards.sort((a, b) => {
        const titleA = a.querySelector('.card-title').textContent.trim().toLowerCase();
        const titleB = b.querySelector('.card-title').textContent.trim().toLowerCase();

        if (order === 'asc') {
            return titleA.localeCompare(titleB); 
        } else {
            return titleB.localeCompare(titleA);
        }
    });

    // Xóa tất cả các thẻ hiện tại trong cardContainer và thêm lại các thẻ đã sắp xếp
    cardContainer.innerHTML = '';
    cards.forEach(card => cardContainer.appendChild(card));

    // Sau khi sắp xếp, gọi lại hàm lọc để giữ trạng thái ẩn/hiện của các thẻ
    filterMaterials();
}


// tim kiem vat tu

function filterMaterials() {
    var input = document.getElementById("searchInput");
    

    if (input) {
        console.log("Giá trị của input:", input.value);

        var filter = input.value.replace(/\s+/g, '').toLowerCase();
        

        var cardContainer = document.getElementById("cardContainer");
        var cards = cardContainer.getElementsByClassName("card-item");


        if (filter === "") {
            for (var i = 0; i < cards.length; i++) {
                cards[i].style.display = ""; 
            }
        } else {

            for (var i = 0; i < cards.length; i++) {
                var card = cards[i];


                var materialName = card.querySelector('.card-title').textContent.trim();
                

                if (materialName) {
                    materialName = materialName.replace(/\s+/g, '').toLowerCase();


                    if (materialName.includes(filter)) {
                        card.style.display = ""; 
                    } else {
                        card.style.display = "none"; 
                    }
                } else {
                    console.warn("Không tìm thấy tên sản phẩm trong thẻ card");
                }
            }
        }
    } else {
        console.error("Không tìm thấy phần tử input với id 'searchInput'");
    }
}

// Xử lý form cập nhật thông tin cá nhân
document.getElementById("UpdateInfoServlet").addEventListener("submit", function (event) {
    // Lấy giá trị từ các trường
    const fullName = document.getElementById("fullName").value.trim();
    const phoneNumber = document.getElementById("phoneNumber").value.trim();
    const birthDate = document.getElementById("birthDate").value;
    const address = document.getElementById("address").value.trim();

    let isValid = true;
    let errorMessages = [];

    // Kiểm tra họ và tên
    if (!fullName) {
        isValid = false;
        errorMessages.push("Họ và tên không được để trống.");
    } else if (fullName.length > 100) {
        isValid = false;
        errorMessages.push("Họ và tên không được dài quá 100 ký tự.");
    }

    // Kiểm tra số điện thoại
    if (!phoneNumber) {
        isValid = false;
        errorMessages.push("Số điện thoại không được để trống.");
    } else if (!/^\d{10,15}$/.test(phoneNumber)) {
        isValid = false;
        errorMessages.push("Số điện thoại phải là số có từ 10 đến 15 chữ số.");
    }

    // Kiểm tra ngày sinh
    if (!birthDate) {
        isValid = false;
        errorMessages.push("Ngày sinh không được để trống.");
    } else {
        const today = new Date();
        const selectedDate = new Date(birthDate);
        if (selectedDate >= today) {
            isValid = false;
            errorMessages.push("Ngày sinh phải nhỏ hơn ngày hiện tại.");
        }
    }

    // Kiểm tra địa chỉ
    if (!address) {
        isValid = false;
        errorMessages.push("Địa chỉ không được để trống.");
    } else if (address.length > 200) {
        isValid = false;
        errorMessages.push("Địa chỉ không được dài quá 200 ký tự.");
    }

    if (!isValid) {
        event.preventDefault(); // Ngăn form submit

        Swal.fire({
            title: "Lỗi nhập liệu",
            html: errorMessages.map(msg => `<p>${msg}</p>`).join(""),
            icon: "error",
            confirmButtonText: "Đã hiểu",
            customClass: {
			    popup: "rounded-3 bg-light",
			    title: "text-danger",
			    confirmButton: "btn btn-danger rounded-pill"
			},
            buttonsStyling: false
        });
    }
});


