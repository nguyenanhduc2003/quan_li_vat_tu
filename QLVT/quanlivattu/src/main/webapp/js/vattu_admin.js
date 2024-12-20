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
        const materialQuantity = row.cells[11].innerText;

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
        document.getElementById("material_quantity1").value = materialQuantity;
    });
});


//
 function forecastMaterial(materialId, type) {
        if (!materialId || !type) {
            console.error("Missing parameters for forecastMaterial");
            return;
        }

        fetch(`ForecastServlet?materialId=${materialId}&type=${type}`, {
            method: 'GET'
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                alert(`Dự báo ${type === 'import' ? 'Nhập' : 'Xuất'} thành công! Kết quả: ${data.forecast}`);
            } else {
                alert('Dự báo thất bại!');
            }
        })
        .catch(error => {
            console.error('Error:', error);
            alert('Có lỗi xảy ra khi dự báo!');
        });
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
    const formId = "#addRowForm";

    try {
        // Lấy form
        const form = document.querySelector(formId);
        if (!form) {
            throw new Error("Không tìm thấy form thêm vật tư.");
        }

        // Lắng nghe sự kiện submit
        form.addEventListener("submit", function (event) {
            event.preventDefault(); // Ngăn gửi form mặc định

            try {
                // Lấy giá trị từ các trường
                const materialId = document.querySelector("#material_id").value.trim();
                const materialName = document.querySelector("#material_name").value.trim();
                const materialUnit = document.querySelector("#material_unit").value.trim();
                const materialDescribe = document.querySelector("#material_describe").value.trim();
                const materialDate = document.querySelector("#material_date").value.trim();
                const materialExpiry = document.querySelector("#material_expiry").value.trim();
                const materialUse = document.querySelector("#material_use").value.trim();
                const materialSupplier = document.querySelector("#material_supplier").value.trim();
                const materialCountry = document.querySelector("#material_country").value.trim();
                const materialValue = document.querySelector("#material_value").value.trim();
                const materialImage = document.querySelector("#material_image").value.trim();
                const materialQuantity = document.querySelector("#material_quantity").value.trim();

                // Kiểm tra từng trường nhập
                if (!materialId) throw new Error("Mã vật tư không được để trống.");
                if (!materialName) throw new Error("Tên vật tư không được để trống.");
                if (!materialUnit) throw new Error("Đơn vị tính không được để trống.");
                if (!materialDescribe) throw new Error("Mô tả không được để trống.");
                if (!materialDate) throw new Error("Ngày sản xuất không được để trống.");
                if (!/^\d{4}-\d{2}-\d{2}$/.test(materialDate)) {
                    throw new Error("Ngày sản xuất phải có định dạng YYYY-MM-DD.");
                }
                if (!materialExpiry) throw new Error("Hạn sử dụng không được để trống.");
                if (!materialUse) throw new Error("Cách sử dụng không được để trống.");
                if (!materialSupplier) throw new Error("Nhà cung cấp không được để trống.");
                if (!materialCountry) throw new Error("Quốc gia sản xuất không được để trống.");
                if (!materialValue || isNaN(materialValue) || materialValue <= 0) {
                    throw new Error("Giá tiền phải là số dương.");
                }
                if (materialImage && !/^https?:\/\/.+\.(jpg|jpeg|png|gif|bmp|svg)$/.test(materialImage)) {
                    throw new Error("Link ảnh không hợp lệ. Đảm bảo URL là hình ảnh.");
                }
                if (!materialQuantity || isNaN(materialQuantity) || materialQuantity < 0) {
                    throw new Error("Số lượng phải là số không âm.");
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
    const formId = "#updateInfoForm";

    try {
        // Lấy form
        const form = document.querySelector(formId);
        if (!form) {
            throw new Error("Không tìm thấy form chỉnh sửa vật tư.");
        }

        // Lắng nghe sự kiện submit
        form.addEventListener("submit", function (event) {
            event.preventDefault(); // Ngăn gửi form mặc định

            try {
                // Lấy giá trị từ các trường
                const materialName = document.querySelector("#material_name1").value.trim();
                const materialUnit = document.querySelector("#material_unit1").value.trim();
                const materialDescribe = document.querySelector("#material_describe1").value.trim();
                const materialDate = document.querySelector("#material_date1").value.trim();
                const materialExpiry = document.querySelector("#material_expiry1").value.trim();
                const materialUse = document.querySelector("#material_use1").value.trim();
                const materialSupplier = document.querySelector("#material_supplier1").value.trim();
                const materialCountry = document.querySelector("#material_country1").value.trim();
                const materialValue = document.querySelector("#material_value1").value.trim();
                const materialImage = document.querySelector("#material_image1").value.trim();
                const materialQuantity = document.querySelector("#material_quantity1").value.trim();

                // Kiểm tra từng trường nhập
                if (!materialName) throw new Error("Tên vật tư không được để trống.");
                if (!materialUnit) throw new Error("Đơn vị tính không được để trống.");
                if (!materialDescribe) throw new Error("Mô tả không được để trống.");
                if (!materialDate) throw new Error("Ngày sản xuất không được để trống.");
                if (!/^\d{4}-\d{2}-\d{2}$/.test(materialDate)) {
                    throw new Error("Ngày sản xuất phải có định dạng YYYY-MM-DD.");
                }
                if (!materialExpiry) throw new Error("Hạn sử dụng không được để trống.");
                if (!materialUse) throw new Error("Cách sử dụng không được để trống.");
                if (!materialSupplier) throw new Error("Nhà cung cấp không được để trống.");
                if (!materialCountry) throw new Error("Quốc gia sản xuất không được để trống.");
                if (!materialValue || isNaN(materialValue) || materialValue <= 0) {
                    throw new Error("Giá tiền phải là số dương.");
                }
                if (materialImage && !/^https?:\/\/.+\.(jpg|jpeg|png|gif|bmp|svg|webp)$/.test(materialImage)) {
                    throw new Error("Link ảnh không hợp lệ. Đảm bảo URL là hình ảnh.");
                }
                if (materialQuantity && (isNaN(materialQuantity) || materialQuantity < 0)) {
                    throw new Error("Số lượng phải là số không âm.");
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


