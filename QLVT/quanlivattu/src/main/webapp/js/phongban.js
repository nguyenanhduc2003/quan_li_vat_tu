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
