/* 관리자페이지에서 제품정보 페이지 */

//submit 요청시, button[type=submit]인 버튼 요소들 저장 후 버튼에 따라 처리
const form = document.getElementById('product-form');
const commands = document.querySelectorAll('button[type=submit]');
commands.forEach(function(command) {
	command.addEventListener('click', function(e) {
		e.preventDefault();
		
		//유효성 검사
		let isValid = validateProductInfo(command.value);
		if(!isValid) return;		
		
		switch(command.value) {
			case "insert":
				insertProduct(form); break;
			case "update":
				updateProduct(form); break;
		}
		
		//버튼 수만큼 반복하므로 return을 하지 않으면 버튼 수만큼 반복 동작된다
		return;	
	});
});

//상품등록
function insertProduct(form) {
	showModal(true, "상품을 등록하시겠습니까?");
	const confirmBtn = document.getElementById('modal-confirm-btn');
	confirmBtn.addEventListener('click', function() {
		form.action = '/product/insert';
		form.method = 'POST';
		form.submit();
	});	
}

//상품수정
function updateProduct(form) {
	showModal(true, '상품을 수정하시겠습니까?');
	const confirmBtn = document.getElementById('modal-confirm-btn');
	confirmBtn.addEventListener('click', function() {
		form.action = '/product/update'; 
		form.method = 'POST';
		form.submit();
	});	
}
 
//유효성 검사
function validateProductInfo(command) {
	//구분
	const category = document.querySelector('select[name=category]');
	if (category.value === '선택') {
		showModal(false, "구분를 선택하세요");
		return false;
	}
	
	//상품명
	const pname = document.querySelector('input[name=pname]');
	if (pname.value.trim().length === 0) {
		showModal(false, "상품명을 입력하세요");
		return false;
	}	
	
	//상세설명
	const description = document.querySelector('input[name=description]');
	if (description.value.trim().length === 0) {
		showModal(false, "상세설명을 입력하세요");
		return false;
	}		
	
	if(command === 'insert') {
		//이미지파일
		const img = document.querySelector('input[name=attached]');
		if (img.value.trim().length === 0) {
			showModal(false, "이미지를 첨부하세요");
			return false;
		}			
	}
	
	//원산지
	const origin = document.querySelector('select[name=origin]');
	if (origin.value === '선택') {
		showModal(false, "원산지를 선택하세요");
		return false;
	}	
	
	//금액
	const price = document.querySelector('input[name=price]');
	if (price.value === '') {
		showModal(false, "금액을 입력하세요");
		return false;
	}		
	
	//용량
	const gram = document.querySelector('input[name=gram]');
	if (gram.value === '') {
		showModal(false, "용량(g)을 입력하세요");
		return false;
	}		

	//칼로리
	const kcal = document.querySelector('input[name=kcal]');
	if (kcal.value === '') {
		showModal(false, "칼로리(kal)을 입력하세요");
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






  