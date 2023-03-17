const storename = document.getElementById('storename');
const president = document.getElementById('president');
const tel = document.getElementById('tel');
const addr1 = document.getElementById('addr1');

const commands = document.querySelectorAll('button[type=button]');
commands.forEach(function(command) {
	command.addEventListener('click', function(e) {
		e.preventDefault();
	
		switch(command.value) {
			case "insert":
				//유효성 검사
				let isValid = validateStoreInfo();
				if(!isValid) return;	
				insertStore(); 
				break;
			case "list":
				location.href = '/store/list'; 
				break;
		}
		
		//버튼 수만큼 반복하므로 return을 하지 않으면 버튼 수만큼 반복 동작된다
		return;	
	});
})

//매장등록
function insertStore() {
	showModal(true, "매장을 등록하시겠습니까?");
	const confirmBtn = document.getElementById('modal-confirm-btn');
	confirmBtn.addEventListener('click', function() {
		const datas = {
			storename: storename.value,
			president: president.value,
			tel: tel.value,
			addr1: addr1.value
		}
		
		$.ajax({
			url: '/api/store/insert',
			type: 'POST',
			contentType: 'application/json; charset=UTF-8',
			dataType: 'text',
			data: JSON.stringify(datas),
			success: function(result) {
				if(result === 'success')
					location.href = '/store/list';			
			} 
		});
	});	
}

//유효성 검사: 입력여부
function validateStoreInfo() {
	//매장명
	if(storename.value.trim().length === 0) {
		storename.value = null;
		showModal(false, '매장명을 입력하세요');
		return false;
	}

	//대표자
	if(president.value.trim().length === 0) {
		president.value = null;
		showModal(false, '대표자를 입력하세요');
		return false;
	}
	
	//연락처
	if(tel.value.trim().length === 0) {
		tel.value = null;
		showModal(false, '연락처를 입력해주세요');
		return false;
	} else {
		regex = /^[0-9]*$/i;
		isRegex = regex.test(tel.value.trim());
		if(!isRegex) {
			showModal(false, '연락처는 숫자만 입력해주세요');
			return false;
		}
	}	
	
	//주소
	if(addr1.value.trim().length === 0) {
		showModal(false, '주소를 입력하세요');
		return false;
	}	
	
	return true;
}

//우편주소 API
const target = document.getElementById('addr1'); 
let content = document.getElementById('modal-content'); 
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
			closeModal();
	    }
	}).embed(content);
});