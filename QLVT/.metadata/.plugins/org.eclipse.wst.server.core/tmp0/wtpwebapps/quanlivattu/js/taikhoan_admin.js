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


document.addEventListener("DOMContentLoaded", function () {
    // Lấy tất cả các nút sửa
    const editButtons = document.querySelectorAll(".btn-edit");

    editButtons.forEach((button) => {
        button.addEventListener("click", function () {
            // Lấy hàng chứa nút được nhấn
            const row = button.closest("tr");
            const cells = row.querySelectorAll("td");

            // Lấy dữ liệu từ các ô trong hàng
            const accountId = cells[0].innerText;
            const fullName = cells[1].innerText;
            const email = cells[2].innerText;
            const pass = cells[3].innerText;
            const phoneNumber = cells[4].innerText;
            const address = cells[5].innerText;
            const birthDate = cells[6].innerText;
            const role = cells[8].innerText;

            // Đưa dữ liệu lên modal
            document.querySelector("#updateInfoForm input[name='accountId1']").value = accountId;
            document.querySelector("#updateInfoForm input[name='fullName1']").value = fullName;
            document.querySelector("#updateInfoForm input[name='email1']").value = email;
            document.querySelector("#updateInfoForm input[name='pass1']").value = pass;
            document.querySelector("#updateInfoForm input[name='phoneNumber1']").value = phoneNumber;
            document.querySelector("#updateInfoForm input[name='birthDate1']").value = birthDate;
            document.querySelector("#updateInfoForm select[name='role1']").value = role;
            document.querySelector("#updateInfoForm textarea[name='address1']").value = address;
        });
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

document.addEventListener("DOMContentLoaded", function () {
    const formId = "#addRowForm";

    try {
        // Lắng nghe sự kiện submit của form
        const form = document.querySelector(formId);
        if (!form) {
            throw new Error("Form không tồn tại trong modal.");
        }

        form.addEventListener("submit", function (event) {
            event.preventDefault(); // Ngăn form gửi dữ liệu mặc định

            try {
                // Lấy dữ liệu từ các input
                const userId = document.querySelector("#user-id").value.trim();
                const userName = document.querySelector("#user-name").value.trim();
                const email = document.querySelector("#email").value.trim();
                const password = document.querySelector("#password").value.trim();
                const phoneNumber = document.querySelector("#phonenumber").value.trim();
                const birthday = document.querySelector("#birthday").value;
                const dateCreate = document.querySelector("#date-create").value;
                const role = document.querySelector("#role").value;

                // Kiểm tra các trường dữ liệu hợp lệ
                if (!userId) {
                    throw new Error("Mã người dùng không được để trống.");
                }
                if (!userName) {
                    throw new Error("Tên người dùng không được để trống.");
                }
                if (!email || !/^\S+@\S+\.\S+$/.test(email)) {
                    throw new Error("Email không hợp lệ.");
                }
                if (!password || password.length < 6) {
                    throw new Error("Mật khẩu phải có ít nhất 6 ký tự.");
                }
                if (!phoneNumber || !/^\d{10,11}$/.test(phoneNumber)) {
                    throw new Error("Số điện thoại phải từ 10 đến 11 chữ số.");
                }
                if (!birthday) {
                    throw new Error("Ngày sinh không được để trống.");
                }
                if (!dateCreate) {
                    throw new Error("Ngày tạo tài khoản không được để trống.");
                }
                if (!role) {
                    throw new Error("Vai trò không được để trống.");
                }

                // Nếu không có lỗi, cho phép gửi form
                form.submit();
            } catch (error) {
                Swal.fire({
                    icon: "error",
                    title: "Lỗi",
                    text: error.message
                });
            }
        });
    } catch (error) {
        Swal.fire({
            icon: "error",
            title: "Lỗi nghiêm trọng",
            text: error.message
        });
    }
});

document.addEventListener("DOMContentLoaded", function () {
    const formId = "#updateInfoForm";

    try {
        // Lấy form theo ID
        const form = document.querySelector(formId);
        if (!form) {
            throw new Error("Không tìm thấy form chỉnh sửa tài khoản.");
        }

        // Lắng nghe sự kiện submit
        form.addEventListener("submit", function (event) {
            event.preventDefault(); // Ngăn gửi form mặc định

            try {
                // Lấy giá trị từ các trường input
                const fullName = document.querySelector("#fullName1").value.trim();
                const email = document.querySelector("#email1").value.trim();
                const password = document.querySelector("#pass1").value.trim();
                const phoneNumber = document.querySelector("#phoneNumber1").value.trim();
                const birthDate = document.querySelector("#birthDate1").value.trim();
                const role = document.querySelector("#role1").value.trim();
                const address = document.querySelector("#address1").value.trim();

                // Kiểm tra từng trường nhập liệu
                if (!fullName) {
                    throw new Error("Họ và tên không được để trống.");
                }
                if (!email || !/^\S+@\S+\.\S+$/.test(email)) {
                    throw new Error("Email không hợp lệ.");
                }
                if (!password || password.length < 6) {
                    throw new Error("Mật khẩu phải có ít nhất 6 ký tự.");
                }
                if (!phoneNumber || !/^\d{10,11}$/.test(phoneNumber)) {
                    throw new Error("Số điện thoại phải là số từ 10 đến 11 ký tự.");
                }
                if (!birthDate || !/^\d{4}-\d{2}-\d{2}$/.test(birthDate)) {
                    throw new Error("Ngày sinh phải có định dạng YYYY-MM-DD.");
                }
                if (!role) {
                    throw new Error("Vai trò không được để trống.");
                }
                if (!address) {
                    throw new Error("Địa chỉ liên hệ không được để trống.");
                }

                // Nếu tất cả kiểm tra hợp lệ, gửi form
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
        // Xử lý lỗi nghiêm trọng khi không tìm thấy form
        Swal.fire({
            icon: "error",
            title: "Lỗi nghiêm trọng",
            text: error.message,
            confirmButtonText: "Đã hiểu",
        });
    }
});
