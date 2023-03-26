//회원가입 폼에 입력할 때 유효성 검사
let isDuplicated = false; 
const $inputs = document.querySelectorAll('.form-item input[class="item-info"]');
$inputs.forEach(function($input) { 
	$input.addEventListener('keyup', function() {
		const $inputId = $input.id;
		const $inputVal = $input.value.trim();
		
		let regex = null;
		let isRegex = false;		

		//이메일
		if($inputId === 'email') {
			const json = {
				email: $input.value
			};
			
			$.ajax({
				url: "/member/register",
				type: "post",
				contentType: "application/json",
				dataType: "json",
				data: JSON.stringify(json),
				success: function(result) {
					if(result.isDuplicated) {
						//이메일 중복 확인
						showMessage($input, '이미 사용 중인 이메일입니다');
						isDuplicated = true;
						return;
					} else {
						isDuplicated = false;
						
						//이메일 형식 확인
						regex = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
						isRegex = regex.test($inputVal);
						if(!isRegex) {
							showMessage($input, '이메일 주소만 사용 가능합니다 ex) user@test.com');
							return;
						} else {
							hideMessage($input);
						}
					}
				}
			});							
		} //이메일 끝	
		
		//비밀번호
		if($inputId === 'passwd') {
			if($inputVal.length < 4) {
				showMessage($input, '4 ~ 12자까지 입력 가능합니다');
				return;
			} else {
				hideMessage($input);
			}
		} //비밀번호 끝			
		
		//비밀번호 확인
		if($inputId === 'repasswd') {
			if($inputVal.length > 0) {
				hideMessage($input);
			} 
		} //비밀번호 확인 끝
		
		//이름
		if($inputId === 'username') {
			if($inputVal.length > 0) {
				hideMessage($input);
			} 
		} //이름 끝

		//연락처
		if($inputId === 'phone') {
			if($inputVal.length > 0) {
				regex = /^[0-9]*$/i;
				isRegex = regex.test($inputVal);
				if(!isRegex) {
					showMessage($input, '숫자만 사용 가능합니다 ex) 01012341234');
					return;
				} else {
					hideMessage($input);
				}
			}
		} //연락처 끝				
	}); //keyup 이벤트 끝
}); //반복문 끝

//회원가입 버튼 클릭시
const form = document.getElementById('register-form');
form.addEventListener('submit', function(e) {
	e.preventDefault();
	
	//유효성 검사
	let isValid = validateRegisterInfo();
	//console.log('isValid: ' + isValid);
	//console.log('isDuplicated: ' + isDuplicated);
	if(!isValid || isDuplicated) return;

	//console.log('Submit!!');
	form.submit();
});

//회원가입 버튼을 눌렀을 때, 유효성 검사
function validateRegisterInfo() {
	let regex = null;
	let isRegex = false;
	let isValid = true;
	
	const $inputs = document.querySelectorAll('.form-item input[class="item-info"]');
	$inputs.forEach(function($input) {
		//입력여부
		if($input.value.trim().length === 0) {
			$input.value = null;
			showMessage($input, '필수 정보입니다');
			isValid = false;
			return false;
		}
		
		//이메일 형식, 비밀번호 길이 확인, 비밀번호 확인 일치, 전화번호 형식 확인
		if($input.id === 'email') {
			//이메일 형식 확인
			regex = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
			isRegex = regex.test($input.value);
			if(!isRegex) {
				showMessage($input, '이메일 주소만 사용 가능합니다 ex) user@test.com');
				isValid = false;
				return false;
			}	
		} else if($input.id === 'passwd') {	
			if($input.value.trim().length < 4) {
				showMessage($input, '4 ~ 12자까지 입력 가능합니다');
				isValid = false;
				return false;
			}			
		} else if($input.id === 'repasswd') {
			const passwd = document.getElementById('passwd');
			if($input.value.trim() !== passwd.value.trim()) {
				$input.value = null;
				showMessage($input, '비밀번호가 일치하지 않습니다');
				isValid = false;
				return false;
			}
		} else if($input.id === 'phone') {
			//연락처에는 숫자만 입력
			regex = /^[0-9]*$/i;
			isRegex = regex.test($input.value);
			if(!isRegex) {
				showMessage($input, '숫자만 사용 가능합니다 ex) 01012341234');
				isValid = false;
				return false;
			}
		}
		
		//메세지 숨기기	
		if($input.id === 'email') {
			if(!isDuplicated) 
				hideMessage($input);		
		} else {
			hideMessage($input);
		}
		
	});
	
	return isValid;
}





/*
//<form>을 submit 한 경우
let isValid = true;
const form = document.getElementById('register-form');
form.addEventListener('submit', function(e) {
	e.preventDefault();
	//필수정보 입력여부 확인
	validateRegisterInfo();
	
	if(!isValid) return;
	form.submit();
});

//회원가입 폼에서 <input>요소 저장
const targets = document.querySelectorAll('.form-item > input');
targets.forEach(function(target) {
	//기본주소 값이 들어오면 에러메시지 숨기기
	target.addEventListener('blur', function() {
		if(target.id === 'addr1') hideMessage(target);
	});
	
	//<input> 요소에 입력시, 유효성 검사
	target.addEventListener('keyup', function() {
		const targetId = target.id;
		const targetVal = target.value.trim();
		
		let regex = null;
		let isRegex = false;		
		
		//이메일
		if(targetId === 'email') {
			const json = {
				email: target.value
			};
			
			$.ajax({
				url: "/member/register",
				type: "post",
				contentType: "application/json",
				dataType: "json",
				data: JSON.stringify(json),
				success: function(result) {
					if(result.isDuplicated) {
						//이메일 중복 확인
						showMessage(target, '이미 사용 중인 이메일입니다');
						return;
					} else {
						//이메일 형식 확인
						regex = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
						isRegex = regex.test(targetVal);
						if(!isRegex) {
							showMessage(target, '이메일 주소만 사용 가능합니다 (ex: user@test.com)');
							return;
						}
					}
				}
			});							
		}
		
		//비밀번호
		console.log(targetVal.length);
		if(targetId === 'passwd') {
			if(targetVal.length < 4) {
				showMessage(target, '4 ~ 12자까지 입력 가능합니다');
				return;
			} else {
				hideMessage(target);
			}
		}
		
		//연락처
		if(targetId === 'phone') {
			regex = /^[0-9]*$/i;
			isRegex = regex.test(targetVal);
			if(!isRegex) {
				showMessage(target, '숫자만 사용 가능합니다 (ex: 01012341234)');
				return;
			}
		}	
		
		hideMessage(target);	
	});	
});

//유효성 검사: 입력여부
function validateRegisterInfo() {
	const email = document.getElementById('email');
	const passwd = document.getElementById('passwd');
	const repasswd = document.getElementById('repasswd');
	const username = document.getElementById('username');
	const phone = document.getElementById('phone');
	const addr1 = document.getElementById('addr1');		
	
	//이메일
	if(email.value.trim().length === 0) {
		email.value = null;
		showMessage(email, '필수 정보입니다');
	}

	//비밀번호
	if(passwd.value.trim().length === 0) {
		passwd.value = null;
		showMessage(passwd, '필수 정보입니다');
	}
		
	//비밀번호 확인
	if(repasswd.value.trim() !== passwd.value.trim()) {
		repasswd.value = null;
		showMessage(repasswd, '비밀번호가 일치하지 않습니다');
	}
	
	//이름
	if(username.value.trim().length === 0) {
		username.value = null;
		showMessage(username, '필수 정보입니다');
	}

	//연락처
	if(phone.value.trim().length === 0) {
		phone.value = null;
		showMessage(phone, '필수 정보입니다');
	}
		
	//주소
	if(addr1.value.trim().length === 0) {
		showMessage(addr1, '필수 정보입니다');
	}	
}
*/
//에러메시지 표시하기
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

//에러메시지 숨기기
function hideMessage(target) {
	let small = null;
	if(target.id == 'addr1') {
		small = target.nextElementSibling.nextElementSibling;
	} else {
		small = target.nextElementSibling;
	}
	
	small.style.display = 'none';
	target.style.border = "1px solid #ccc";
}

//우편주소 API
const target = document.getElementById('addr1'); 
const content = document.getElementById('modal-content'); 
target.addEventListener('click', function(){
	showModal(false, null, 500, 560);
	
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
			hideMessage(target);
			document.getElementById("addr2").focus();	
			closeModal();
	    }
	}).embed(content);
});