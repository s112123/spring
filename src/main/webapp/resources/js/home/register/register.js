//유효성 검사
function validateRegister() {
	const form = document.getElementById('registerForm');
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
	
	openModal(500, 560, null);
});