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

//datatable
    const table = document.querySelector("#myTable");
    $(table).DataTable({
        language: {
            url: "https://cdn.datatables.net/plug-ins/1.13.1/i18n/vi.json"
        }
    });
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


// hien thi modal
    const editButtons = document.querySelectorAll(".btn-edit");

    editButtons.forEach((button) => {
        button.addEventListener("click", function () {

            const row = button.closest("tr");
            const cells = row.querySelectorAll("td");

            const warehouseId = cells[0].innerText; 
            const warehouseName = cells[1].innerText; 
            const warehouseSupplier = cells[2].innerText; 
            const warehouseQuantity = cells[3].innerText; 
            
             console.log(warehouseId, warehouseName, warehouseSupplier, warehouseQuantity);

            document.querySelector("#warehouse_id1").value = warehouseId; 
            document.querySelector("#warehouse_name1").value = warehouseName;
            document.querySelector("#warehouse_supplier1").value = warehouseSupplier;
            document.querySelector("#warehouse_quantity1").value = warehouseQuantity;
        });
    });
