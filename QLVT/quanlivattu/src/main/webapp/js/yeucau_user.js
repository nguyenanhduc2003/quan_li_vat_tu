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


