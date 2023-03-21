//매장목록
function listStore() {
	location.href = '/store/list'; 
}

//매장등록
function insertStore() {
	const requestURL = '/api/store/insert';
	
	let isValid = validateStoreInfo();
	if(!isValid) return;

	const form = document.getElementById('store-form');
	let formData = new FormData(form);
	
	const result = function () {
		showModal(false, '매장이 등록되었습니다');
		const confirmBtn = document.getElementById('modal-confirm-btn');
		confirmBtn.addEventListener('click', function() {
			listStore();
		});	
	}
	
	ajaxInsertForFile(requestURL, formData, result);	
}

//유효성 검사: 입력여부
function validateStoreInfo() {
	const storename = document.getElementById('storename');
	const filename = document.getElementById('filename');
	const tel = document.getElementById('tel');
	const addr1 = document.getElementById('addr1');	
	
	//매장명
	if(storename.value.trim().length === 0) {
		storename.value = null;
		showModal(false, '매장명을 입력하세요');
		return false;
	}
	
	//이미지파일
	if (filename.value.trim().length === 0) {
		filename.value = null;
		showModal(false, "이미지를 첨부하세요");
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

//파일선택시, 파일이름넣기
const attached = document.getElementById('attached');
attached.addEventListener('change', function() {
	const target = document.getElementsByClassName('filename')[0];
	target.value = attached.value;
});

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