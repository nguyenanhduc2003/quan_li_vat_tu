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

        var table = $('#myTable').DataTable();


        var data = table.rows({ search: 'applied' }).data();


        var ws_data = [];


        var headers = [];
        $('#myTable th').each(function() {
            headers.push($(this).text());
        });
        ws_data.push(headers);


        data.each(function(row) {
            ws_data.push(row);
        });


        var ws = XLSX.utils.aoa_to_sheet(ws_data);


        var wb = XLSX.utils.book_new();
        XLSX.utils.book_append_sheet(wb, ws, "Sheet1");


        XLSX.writeFile(wb, "Xuat_File_Excel.xlsx");
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

// hien thi modal
    const editButtons = document.querySelectorAll(".btn-edit");

    editButtons.forEach((button) => {
        button.addEventListener("click", function () {

            const row = button.closest("tr");
            const cells = row.querySelectorAll("td");

            const supplierId = cells[0].innerText;
            const supplierName = cells[1].innerText;
            const supplierEmail = cells[2].innerText;
            const supplierPhone = cells[3].innerText;
            const supplierAddress = cells[4].innerText;
            const supplierWebsite = cells[5].querySelector("a").href;
            const supplierDescribe = cells[6].querySelector("abbr").title;
            const supplierDateCreated = cells[7].innerText;

            document.querySelector("#updateInfoForm input[name='supplierId1']").value = supplierId;
            document.querySelector("#updateInfoForm input[name='supplier_name']").value = supplierName;
            document.querySelector("#updateInfoForm input[name='supplier_email']").value = supplierEmail;
            document.querySelector("#updateInfoForm input[name='supplier_phone']").value = supplierPhone;
            document.querySelector("#updateInfoForm input[name='supplier_address']").value = supplierAddress;
            document.querySelector("#updateInfoForm input[name='supplier_website']").value = supplierWebsite;
            document.querySelector("#updateInfoForm textarea[name='supplier_describe']").value = supplierDescribe;
            document.querySelector("#updateInfoForm input[name='supplier_date_created']").value = supplierDateCreated;
        });
    });

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


// Xử lý form thêm nhà cung cấp
    document.getElementById("addRowForm").addEventListener("submit", function (event) {
        // Lấy giá trị từ các trường trong form
        const supplierId = document.getElementById("supplier_id").value.trim();
        const supplierName = document.getElementById("supplier_name").value.trim();
        const supplierEmail = document.getElementById("supplier_email").value.trim();
        const supplierPhone = document.getElementById("supplier_phone").value.trim();
        const supplierAddress = document.getElementById("supplier_address").value.trim();
        const supplierDateCreated = document.getElementById("supplier_date_created").value;
        const supplierDescribe = document.getElementById("supplier_describe").value.trim();

        let isValid = true;
        let errorMessages = [];

        // Kiểm tra mã nhà cung cấp
        if (!supplierId) {
            isValid = false;
            errorMessages.push("Mã nhà cung cấp không được để trống.");
        }

        // Kiểm tra tên nhà cung cấp
        if (!supplierName) {
            isValid = false;
            errorMessages.push("Tên nhà cung cấp không được để trống.");
        } else if (supplierName.length > 100) {
            isValid = false;
            errorMessages.push("Tên nhà cung cấp không được dài quá 100 ký tự.");
        }

        // Kiểm tra email
        if (!supplierEmail) {
            isValid = false;
            errorMessages.push("Email không được để trống.");
        } else if (!/\S+@\S+\.\S+/.test(supplierEmail)) {
            isValid = false;
            errorMessages.push("Email không hợp lệ.");
        }

        // Kiểm tra số điện thoại
        if (!supplierPhone) {
            isValid = false;
            errorMessages.push("Số điện thoại không được để trống.");
        } else if (!/^\d{10,11}$/.test(supplierPhone)) {
            isValid = false;
            errorMessages.push("Số điện thoại phải là số có từ 10 đến 11 chữ số.");
        }

        // Kiểm tra địa chỉ
        if (!supplierAddress) {
            isValid = false;
            errorMessages.push("Địa chỉ không được để trống.");
        } else if (supplierAddress.length > 200) {
            isValid = false;
            errorMessages.push("Địa chỉ không được dài quá 200 ký tự.");
        }

        // Kiểm tra ngày tạo
        if (!supplierDateCreated) {
            isValid = false;
            errorMessages.push("Ngày tạo không được để trống.");
        }

        // Kiểm tra mô tả
        if (!supplierDescribe) {
            isValid = false;
            errorMessages.push("Mô tả không được để trống.");
        }

        if (!isValid) {
            event.preventDefault(); // Ngừng gửi form

            // Hiển thị thông báo lỗi bằng SweetAlert2
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

    
