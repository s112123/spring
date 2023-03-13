//<form>을 submit 한 경우
const form = document.getElementById('register-form');
form.addEventListener('submit', function(e) {
	e.preventDefault();
	
	//유효성 검사
	//let isValid = validateRegisterInfo();
	//if(!isValid) return;
	
	//button[name=submit]인 버튼 요소들 저장 => 바로 가입하면 되므로 필요없는 코드
	const commands = document.getElementsByName('submit');
	commands.forEach(function(command) {
		switch(command.value) {
			case "insert" :	
		}
	});
});

//유효성 검사
function validateRegisterInfo() {
	const info = form.getElementsByClassName('register-item');

	for(let i=0; i<info.length; i++) {
		let target = info[i].getElementsByClassName('item-info')[0];
		
		if(target.value.trim().length === 0) {
			target.focus();
			info[i].getElementsByTagName('small')[0].style.display = 'block';	
			return false;
		} else {
			info[i].getElementsByTagName('small')[0].style.display = 'none';
		}
	}
	
	form.submit();
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