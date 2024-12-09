const signUpButton = document.getElementById('signUp');
const signInButton = document.getElementById('signIn');
const container = document.getElementById('container');

signUpButton.addEventListener('click', () => {
	container.classList.add("right-panel-active");
});

signInButton.addEventListener('click', () => {
	container.classList.remove("right-panel-active");
});

 //test lỗi sai
  window.onload = function() {
        var params = new URLSearchParams(window.location.search);
        var error = params.get('error');
        var success = params.get('success');
        
        // Nếu có tham số error hoặc success, hiển thị thông báo
        if (error) {
            if (error == '1') {
                alert("Mật khẩu không đúng!");
            } else if (error == '2') {
                alert("Email đã tồn tại!");
            } else if (error == '3') {
                alert("Có lỗi xảy ra. Vui lòng thử lại!");
            }
            else if (error == '4') {
                alert("Mật khẩu chưa chính xác");
            }
            else if (error == '5') {
                alert("Địa chỉ Email không hợp lệ!");
            }
        }
        
        if (success) {
            if (success == '1') {
                alert("Đăng ký thành công, vui lòng đăng nhập!");
            }
        }
    }