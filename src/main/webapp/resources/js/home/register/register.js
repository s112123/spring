//<form>을 submit 한 경우
const form = document.getElementById('register-form');
form.addEventListener('submit', function(e) {
	e.preventDefault();
	
	const email = document.getElementById('email');
	const passwd = document.getElementById('passwd');
	const repasswd = document.getElementById('repasswd');
	const username = document.getElementById('username');
	const phone = document.getElementById('phone');
	const addr1 = document.getElementById('addr1');	
	
	//유효성 검사
	validateRegisterInfo(email, passwd, repasswd, username, phone, addr1);


});

//이메일 중복체크
/*
const email = document.getElementById('email');
email.addEventListener('keyup', function() {
	const json = {
		email: email.value
	};
	
	$.ajax({
		url: "/member/register",
		type: "post",
		contentType: "application/json",
		dataType: "json",
		data: JSON.stringify(json),
		success: function(result) {
			const small = email.nextElementSibling;
			
			if(email.value.trim().length > 0) {
				if(result.isDuplicated) {
					small.innerText = '사용하실 수 없는 이메일입니다';
					small.style.display = 'block';	
				} else {
					small.innerText = '사용하실 수 있습니다';
					small.style.color = 'black';
					small.style.display = 'block';					
				}
			}
		}
	});	
});
*/


/*
/회원가입 유효성검사/
이메일: 입력여부, 중복확인, 이메일 정규식
폰번호: 입력여부, 하이픈 제거 처리, 숫자만 입력가능
주소: 입력여부
*/


//유효성 검사
function validateRegisterInfo(email, passwd, repasswd, username, phone, addr1) {
	let temp = '';
	let regex = null;
	let isRegex = false;
	
	//이메일
	temp = email.value.trim();
	if(temp.length == 0) {
		showMessage(email, '필수 정보입니다');
		return false;
	} else {
		//이메일 형식만 입력허용
		regex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		isRegex = regex.test(temp);
		
		if(!isRegex) {
			showMessage(email, '이메일 주소만 사용 가능합니다 (ex: abcd@test.com)');
			email.value = null;
			return false;
		}
	}
	
	//비밀번호
	temp = passwd.value.trim();
	if(temp.length == 0) {
		showMessage(passwd, '필수 정보입니다');
		return false;
	} else if(temp.length < 6) {
		isValid = showMessage(passwd, '6 ~ 12자만 입력 가능합니다');
		return false;
	}
	
	//비밀번호 확인
	temp = repasswd.value.trim();
	if(temp.length == 0) {
		showMessage(repasswd, '필수 정보입니다');
		return false;
	} else if(temp != passwd.value.trim()) {
		showMessage(repasswd, '비밀번호가 일치하지 않습니다');
		repasswd.value = null;
		return false;
	}	
	
	//이름
	temp = username.value.trim();
	if(temp.length == 0) {
		showMessage(username, '필수 정보입니다');
		return false;
	} 
	
	//연락처
	temp = phone.value.trim();
	if(temp.length == 0) {
		showMessage(phone, '필수 정보입니다');
		return false;
	} else {
		//숫자만 입력허용
		regex = /[0-9]/i;
		isRegex = regex.test(temp);
		
		if(!isRegex) {
			showMessage(phone, '숫자만 사용 가능합니다 (ex: 01012341234)');
			phone.value = null;
			return false;
		}
	}

	//주소
	temp = addr1.value.trim();
	if(temp.length == 0) {
		isValid = showMessage(addr1, '필수 정보입니다');
		return false;
	}
}

function showMessage(target, message) {
	let small = null;
	target.focus();
	target.style.border = "1px solid rgb(210, 40, 40)";
	
	if(target.id == 'addr1') {
		small = target.nextElementSibling.nextElementSibling;
	} else {
		small = target.nextElementSibling;
	}

	small.innerText = message;
	small.style.display = 'block';
}

//<input>에서 포커스가 떠나면 <small> 숨기기
const targets = document.querySelectorAll('.form-item > input');
for(let i=0; i<targets.length; i++) {
	targets[i].addEventListener('blur', function() {
		let small = null;
		if(targets[i].id == 'addr1') {
			small = targets[i].nextElementSibling.nextElementSibling;
		} else {
			small = targets[i].nextElementSibling;
		}
		small.style.display = 'none';
		targets[i].style.border = "1px solid #ccc";
	});
}

//우편주소 API
const target = document.getElementById('addr1'); 
const content = document.getElementById('modal-content'); 
target.addEventListener('click', function(){
	var themeObj = {
		bgColor: "#fff"
	}
	
	new daum.Postcode({
		theme: themeObj,
	    oncomplete: function(data) {
			var addr = '';
			
			if(data.userSelectedType === 'R') {
				//도로명 주소
				addr = data.roadAddress;
			} else {
				//지번 주소
				addr = data.jibunAddress;
			}
			target.value = addr;
			document.getElementById("addr2").focus();	
			closeModal();
	    }
	}).embed(content);
	
	showModal(false, null, 500, 560);
});