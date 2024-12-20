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
    const table = document.querySelector("#myTable");
    $(table).DataTable({
        language: {
            url: "https://cdn.datatables.net/plug-ins/1.13.1/i18n/vi.json"
        }
    });
});

//datatable1
document.addEventListener("DOMContentLoaded", function() {
    const table = document.querySelector("#myTable1");
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
    
 // xuất file 1
 function exportToExcel1() {

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
            const departmentId = cells[0].innerText;
            const departmentName = cells[1].innerText;
            const departmentUnit = cells[2].innerText;
            const departmentSpecialized = cells[3].innerText;

            // Đưa dữ liệu lên modal
            document.querySelector("#updateInfoForm input[name='department_id1']").value = departmentId;
            document.querySelector("#updateInfoForm input[name='department_name1']").value = departmentName;
            document.querySelector("#updateInfoForm input[name='department_unit1']").value = departmentUnit;
            document.querySelector("#updateInfoForm input[name='department_specialized1']").value = departmentSpecialized;

        });
    });
});

document.addEventListener("DOMContentLoaded", function () {
    // Lấy tất cả các nút sửa
    const editButtons = document.querySelectorAll(".btn-edit1");

    editButtons.forEach((button) => {
        button.addEventListener("click", function () {
            // Lấy hàng chứa nút được nhấn
            const row = button.closest("tr");
            const cells = row.querySelectorAll("td");

            // Lấy dữ liệu từ các ô trong hàng
            const personnelId = cells[0].innerText;
            const personnelName = cells[1].innerText;
            const personnelGender = cells[2].innerText;
            const personnelBirthday = cells[3].innerText;
            const personnelPhone = cells[4].innerText;
            const personnelAddress = cells[5].innerText;
            const departmentId = cells[6].innerText;

            // Đưa dữ liệu lên modal
            document.querySelector("#updateInfoForm1 input[name='personnel_id1']").value = personnelId;
            document.querySelector("#updateInfoForm1 input[name='personnel_name1']").value = personnelName;
            document.querySelector("#updateInfoForm1 select[name='personnel_gender1']").value = personnelGender;
            document.querySelector("#updateInfoForm1 input[name='personnel_birthday1']").value = personnelBirthday;
            document.querySelector("#updateInfoForm1 input[name='personnel_phone1']").value = personnelPhone;
            document.querySelector("#updateInfoForm1 input[name='personnel_address1']").value = personnelAddress;
            document.querySelector("#updateInfoForm1 input[name='department_id11']").value = departmentId;

        });
    });
});

// Xử lý form "Thêm phòng ban mới"
document.getElementById("addDepartmentForm").addEventListener("submit", function (event) {
    // Lấy giá trị từ các trường
    const departmentId = document.getElementById("department_id").value.trim();
    const departmentName = document.getElementById("department_name").value.trim();
    const departmentUnit = document.getElementById("department_unit").value.trim();
    const departmentSpecialized = document.getElementById("department_specialized").value.trim();

    let isValid = true;
    let errorMessages = [];

    // Kiểm tra mã phòng ban
    if (!departmentId) {
        isValid = false;
        errorMessages.push("Mã phòng ban không được để trống.");
    } else if (departmentId.length > 10) {
        isValid = false;
        errorMessages.push("Mã phòng ban không được dài quá 10 ký tự.");
    }

    // Kiểm tra tên phòng ban
    if (!departmentName) {
        isValid = false;
        errorMessages.push("Tên phòng ban không được để trống.");
    } else if (departmentName.length > 50) {
        isValid = false;
        errorMessages.push("Tên phòng ban không được dài quá 50 ký tự.");
    }

    // Kiểm tra đơn vị trực thuộc
    if (!departmentUnit) {
        isValid = false;
        errorMessages.push("Đơn vị trực thuộc không được để trống.");
    }

    // Kiểm tra chuyên ngành
    if (!departmentSpecialized) {
        isValid = false;
        errorMessages.push("Chuyên ngành không được để trống.");
    }

    // Nếu có lỗi, hiển thị bằng SweetAlert2
    if (!isValid) {
        event.preventDefault(); // Ngăn form submit

        Swal.fire({
            title: "Lỗi nhập liệu",
            html: errorMessages.map(msg => `<p>${msg}</p>`).join(""),
            icon: "error",
            confirmButtonText: "Đã hiểu",
            customClass: {
                popup: "rounded-3",
                title: "text-danger",
                confirmButton: "btn btn-primary rounded-pill"
            },
            buttonsStyling: false
        });
    }
});

document.getElementById("addPersonnelForm").addEventListener("submit", function (event) {
    try {
        // Lấy giá trị từ form
        const personnelId = document.getElementById("personnel_id").value.trim();
        const personnelName = document.getElementById("personnel_name").value.trim();
        const personnelGender = document.getElementById("personnel_gender").value;
        const personnelBirthday = document.getElementById("personnel_birthday").value;
        const personnelPhone = document.getElementById("personnel_phone").value.trim();
        const departmentId = document.getElementById("department_id").value.trim();
        const personnelAddress = document.getElementById("personnel_address").value.trim();

        let isValid = true;
        let errorMessages = [];

        // Kiểm tra Mã nhân sự
        if (!personnelId) {
            isValid = false;
            errorMessages.push("Mã nhân sự không được để trống.");
        }

        // Kiểm tra Tên nhân sự
        if (!personnelName) {
            isValid = false;
            errorMessages.push("Tên nhân sự không được để trống.");
        }

        // Kiểm tra Giới tính
        if (!personnelGender) {
            isValid = false;
            errorMessages.push("Vui lòng chọn giới tính.");
        }

        // Kiểm tra Ngày sinh
        if (!personnelBirthday) {
            isValid = false;
            errorMessages.push("Ngày sinh không được để trống.");
        }

        // Kiểm tra Số điện thoại
        if (!personnelPhone) {
            isValid = false;
            errorMessages.push("Số điện thoại không được để trống.");
        } else if (!/^\d{10}$/.test(personnelPhone)) {
            isValid = false;
            errorMessages.push("Số điện thoại phải có đúng 10 chữ số.");
        }

        // Kiểm tra Mã phòng ban
        if (!departmentId) {
            isValid = false;
            errorMessages.push("Mã phòng ban không được để trống.");
        }

        // Kiểm tra Địa chỉ
        if (!personnelAddress) {
            isValid = false;
            errorMessages.push("Địa chỉ không được để trống.");
        }

        // Hiển thị thông báo lỗi nếu dữ liệu không hợp lệ
        if (!isValid) {
            event.preventDefault(); // Ngăn chặn form submit

            Swal.fire({
                title: "Lỗi nhập liệu",
                html: errorMessages.map(msg => `<p>${msg}</p>`).join(""),
                icon: "error",
                confirmButtonText: "Đã hiểu",
                customClass: {
                    popup: "rounded-3",
                    title: "text-danger",
                    confirmButton: "btn btn-primary rounded-pill"
                },
                buttonsStyling: false
            });
        }
    } catch (error) {
        // Xử lý ngoại lệ không mong muốn
        event.preventDefault();
        Swal.fire({
            title: "Đã xảy ra lỗi!",
            text: `Chi tiết: ${error.message}`,
            icon: "error",
            confirmButtonText: "Đóng",
            customClass: {
                popup: "rounded-3",
                title: "text-danger",
                confirmButton: "btn btn-primary rounded-pill"
            },
            buttonsStyling: false
        });
    }
});

// KIỂM TRA SỬA PHÒNG BAN
document.addEventListener("DOMContentLoaded", function () {
    const modalId = "#UpdateDepartment";
    const formId = "#updateInfoForm";

    try {
        // Kiểm tra modal tồn tại
        const modal = document.querySelector(modalId);
        if (!modal) {
            throw new Error("Modal không tồn tại trên trang.");
        }

        // Lắng nghe sự kiện submit của form
        const form = document.querySelector(formId);
        if (!form) {
            throw new Error("Form không tồn tại trong modal.");
        }

        form.addEventListener("submit", function (event) {
            event.preventDefault(); // Ngăn form gửi dữ liệu mặc định

            try {
                // Lấy dữ liệu từ các input
                const departmentName = document.querySelector("#department_name1").value;
                const departmentUnit = document.querySelector("#department_unit1").value;
                const departmentSpecialized = document.querySelector("#department_specialized1").value;

                // Kiểm tra các trường dữ liệu hợp lệ
                if (!departmentName.trim()) {
                    throw new Error("Tên phòng ban không được để trống.");
                }
                if (!departmentUnit.trim()) {
                    throw new Error("Đơn vị trực thuộc không được để trống.");
                }
                if (!departmentSpecialized.trim()) {
                    throw new Error("Chuyên ngành không được để trống.");
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
// KIỂM TRA SỬA NHÂN SỰ
document.addEventListener("DOMContentLoaded", function () {
    const modalId = "#UpdatePersonnel";
    const formId = "#updateInfoForm1";

    try {
        // Kiểm tra modal tồn tại
        const modal = document.querySelector(modalId);
        if (!modal) {
            throw new Error("Modal không tồn tại trên trang.");
        }

        // Lắng nghe sự kiện submit của form
        const form = document.querySelector(formId);
        if (!form) {
            throw new Error("Form không tồn tại trong modal.");
        }

        form.addEventListener("submit", function (event) {
            event.preventDefault(); // Ngăn form gửi dữ liệu mặc định

            try {
                // Lấy dữ liệu từ các input
                const personnelName = document.querySelector("#personnel_name1").value.trim();
                const personnelGender = document.querySelector("#personnel_gender1").value;
                const personnelBirthday = document.querySelector("#personnel_birthday1").value;
                const personnelPhone = document.querySelector("#personnel_phone1").value.trim();
                const personnelAddress = document.querySelector("#personnel_address1").value.trim();
                const departmentId = document.querySelector("#department_id11").value.trim();

                // Kiểm tra các trường dữ liệu hợp lệ
                if (!personnelName) {
                    throw new Error("Tên nhân sự không được để trống.");
                }
                if (!personnelGender) {
                    throw new Error("Giới tính không được để trống.");
                }
                if (!personnelBirthday) {
                    throw new Error("Ngày sinh không được để trống.");
                }
                if (!personnelPhone || !/^\d{10,11}$/.test(personnelPhone)) {
                    throw new Error("Số điện thoại không hợp lệ. Hãy nhập từ 10 đến 11 chữ số.");
                }
                if (!personnelAddress) {
                    throw new Error("Địa chỉ không được để trống.");
                }
                if (!departmentId || isNaN(departmentId)) {
                    throw new Error("Mã phòng ban phải là một số hợp lệ.");
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

