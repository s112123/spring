const form = document.getElementById('product-form');
form.addEventListener('submit', function(e) {
	e.preventDefault();
	//유효성검사 필요 => submit();
	submit(id);
});

function submit(id) {
	const btns = document.getElementsByName('submit-btn');
	for(let i=0; i<btns.length; i++) {
		const cmd = btns[i].value
		
		switch(cmd) {
			case 'insert':	//상품등록
				showModal(true, '상품을 등록하시겠습니까?');
				form.action = '/product/insert'; break;
			case 'update':	//상품수정
				showModal(true, '상품을 수정하시겠습니까?');
				//id값이 있는 <input>요소를 만들어 <form> 자식요소로 생성하고 POST로 전송
				const element = document.createElement('input');
				element.setAttribute('type', 'hidden');
				element.setAttribute('name', 'id');
				element.setAttribute('value', id);
				form.appendChild(element);
				form.action = '/product/update'; break;
		}
		
		const confirmBtn = document.getElementById('modal-confirm-btn');
		confirmBtn.addEventListener('click', function() {
			form.method = 'POST';
			form.submit();
		});	
	}
} 
    