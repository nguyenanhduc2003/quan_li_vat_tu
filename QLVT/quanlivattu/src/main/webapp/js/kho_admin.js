console.log("Script is loaded");  // Kiểm tra xem script có chạy không

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


    // xuất file1
function exportToExcel1() {

        var table = $('#myTable1').DataTable();


        var data = table.rows({ search: 'applied' }).data();


        var ws_data = [];


        var headers = [];
        $('#myTable1 th').each(function() {
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
     // xuất file2
function exportToExcel2() {

        var table = $('#myTable2').DataTable();


        var data = table.rows({ search: 'applied' }).data();


        var ws_data = [];


        var headers = [];
        $('#myTable2 th').each(function() {
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

//datatable1
const table1 = document.querySelector("#myTable1");
$(table1).DataTable({
    language: {
        url: "https://cdn.datatables.net/plug-ins/1.13.1/i18n/vi.json"
    }
});
//datatable2
const table2 = document.querySelector("#myTable2");
$(table2).DataTable({
    language: {
        url: "https://cdn.datatables.net/plug-ins/1.13.1/i18n/vi.json"
    }
});


// 
function filterTransactions() {
    const fromDate = document.getElementById("fromDate").value;
    const toDate = document.getElementById("toDate").value;
    
    if (!fromDate || !toDate) {
        alert("Vui lòng chọn cả hai ngày!");
        return;
    }


   fetch(`FilterTransactionServlet?fromDate=${fromDate}&toDate=${toDate}`)
    .then(response => response.json())
    .then(data => {
        console.log(data); 
        if (data.length === 0) {
            alert("Không có giao dịch trong khoảng thời gian này!");
        } else {
			console.log("Data received from server:", data);
            showTransactionsModal(data);
        }
    })
    .catch(error => console.error("Lỗi khi lấy dữ liệu:", error));

}

function showTransactionsModal(data) {
    const tableBody = document.getElementById("transactionTableBody");
    tableBody.innerHTML = "";

    data.forEach(transaction => {
        const row = `<tr>
            <td>${transaction.date}</td>
            <td>${transaction.type}</td>
            <td>${transaction.materialName}</td>
            <td>${transaction.quantity}</td>
        </tr>`;
        tableBody.innerHTML += row;
    });

    const modal = new bootstrap.Modal(document.getElementById("transactionModal"));
    modal.show();
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


document.addEventListener("DOMContentLoaded", function () {
    const formId = "form[action='ImportServlet']"; // Định danh form

    try {
        // Lấy form
        const form = document.querySelector(formId);
        if (!form) {
            throw new Error("Không tìm thấy form tạo phiếu nhập.");
        }

        // Lắng nghe sự kiện submit
        form.addEventListener("submit", function (event) {
            event.preventDefault(); // Ngăn gửi form mặc định

            try {
                // Lấy giá trị từ các trường
                const materialName = document.querySelector("#material_name").value.trim();
                const importName = document.querySelector("#import_name").value.trim();
                const importDate = document.querySelector("#import_date").value.trim();
                const importReceiver = document.querySelector("#import_receiver").value.trim();
                const importPhone = document.querySelector("#import_phone").value.trim();
                const importDepartment = document.querySelector("#import_department").value.trim();
                const importQuantity = document.querySelector("#import_quantity").value.trim();

                // Kiểm tra từng trường nhập
                if (!materialName) throw new Error("Vui lòng chọn vật tư.");
                if (!importName) throw new Error("Tên phiếu nhập không được để trống.");
                if (!importDate) throw new Error("Ngày nhập không được để trống.");
                if (!/^\d{4}-\d{2}-\d{2}$/.test(importDate)) {
                    throw new Error("Ngày nhập phải có định dạng YYYY-MM-DD.");
                }
                if (!importReceiver) throw new Error("Tên người nhập không được để trống.");
                if (!importPhone || !/^\d{10,11}$/.test(importPhone)) {
                    throw new Error("Số điện thoại phải là số hợp lệ (10-11 chữ số).");
                }
                if (!importDepartment) throw new Error("Vui lòng chọn phòng ban.");
                if (!importQuantity || isNaN(importQuantity) || importQuantity <= 0) {
                    throw new Error("Số lượng nhập phải là số dương.");
                }

                // Nếu tất cả hợp lệ, gửi form
                form.submit();
            } catch (error) {
                // Hiển thị thông báo lỗi
                Swal.fire({
                    icon: "error",
                    title: "Lỗi",
                    text: error.message,
                    confirmButtonText: "Đã hiểu",
                });
            }
        });
    } catch (error) {
        // Lỗi nghiêm trọng: Form không tồn tại
        Swal.fire({
            icon: "error",
            title: "Lỗi nghiêm trọng",
            text: error.message,
            confirmButtonText: "Đã hiểu",
        });
    }
});


document.addEventListener("DOMContentLoaded", function () {
    const formId = "form[action='ExportServlet']"; // Định danh form

    try {
        // Lấy form
        const form = document.querySelector(formId);
        if (!form) {
            throw new Error("Không tìm thấy form tạo phiếu xuất.");
        }

        // Lắng nghe sự kiện submit
        form.addEventListener("submit", function (event) {
            event.preventDefault(); // Ngăn gửi form mặc định

            try {
                // Lấy giá trị từ các trường
                const exportName = document.querySelector("#export_name").value.trim();
                const exportDate = document.querySelector("#export_date").value.trim();
                const exportReceiver = document.querySelector("#export_receiver").value.trim();
                const exportPhone = document.querySelector("#export_phone").value.trim();
                const exportDepartment = document.querySelector("#export_department").value.trim();
                const exportQuantity = document.querySelector("#export_quantity").value.trim();

                // Kiểm tra từng trường nhập
                if (!exportName) throw new Error("Tên phiếu xuất không được để trống.");
                if (!exportDate) throw new Error("Ngày xuất không được để trống.");
                if (!/^\d{4}-\d{2}-\d{2}$/.test(exportDate)) {
                    throw new Error("Ngày xuất phải có định dạng YYYY-MM-DD.");
                }
                if (!exportReceiver) throw new Error("Tên người xuất không được để trống.");
                if (!exportPhone || !/^\d{10,11}$/.test(exportPhone)) {
                    throw new Error("Số điện thoại phải là số hợp lệ (10-11 chữ số).");
                }
                if (!exportDepartment) throw new Error("Vui lòng chọn phòng ban.");
                if (!exportQuantity || isNaN(exportQuantity) || exportQuantity <= 0) {
                    throw new Error("Số lượng xuất phải là số dương.");
                }

                // Nếu tất cả hợp lệ, gửi form
                form.submit();
            } catch (error) {
                // Hiển thị thông báo lỗi
                Swal.fire({
                    icon: "error",
                    title: "Lỗi",
                    text: error.message,
                    confirmButtonText: "Đã hiểu",
                });
            }
        });
    } catch (error) {
        // Lỗi nghiêm trọng: Form không tồn tại
        Swal.fire({
            icon: "error",
            title: "Lỗi nghiêm trọng",
            text: error.message,
            confirmButtonText: "Đã hiểu",
        });
    }
});
