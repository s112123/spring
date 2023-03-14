const frmLogin = document.getElementById('login-form');
frmLogin.addEventListener('submit', function(e) {
	e.preventDefault();
	
	const email = document.getElementById('email');
	const passwd = document.getElementById('passwd');
	const isSaved = document.getElementById('isSaved');
	const datas = {
		email: email.value,
		passwd: passwd.value,
		isSaved: isSaved.checked
	};
	
	$.ajax({
		url: '/login',
		type: 'POST',
		contentType: 'application/json',
		dataType: 'json',
		data: JSON.stringify(datas),
		success: function(result) {
			let message = result.message;
			switch(message) {
				case 'emptyE': 
					showMessage(email, "이메일을 입력하세요"); break;
				case 'emptyP': 
					showMessage(passwd, "비밀번호를 입력하세요"); break;
				case 'notFound': 
					showMessage(email, "존재하지 않는 이메일입니다"); break;
				case 'notMatch': 
					showMessage(passwd, "비밀번호가 일치하지 않습니다"); break;
				case 'success':
					location.href = "/";
			}
		}
	});
});

function showMessage(target, message) {
	let small = null;
	target.focus();
	target.style.border = "1px solid rgb(210, 40, 40)";
	small = target.nextElementSibling;
	small.innerText = message;
	small.style.display = 'block';	
}

const targets = document.querySelectorAll('.form-item > input');
for(let i=0; i<targets.length; i++) {
	targets[i].addEventListener('blur', function() {
		let small = this.nextElementSibling;
		small.style.display = 'none';
		targets[i].style.border = "1px solid #ccc";
	});
}