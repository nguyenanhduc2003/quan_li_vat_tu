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

