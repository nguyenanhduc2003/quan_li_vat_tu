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
