//검색구분 및 검색어
let searchOption = document.getElementById('search-option').value;
let searchKeyword = document.getElementById('search-keyword').value;

//button[type=button]을 클릭한 경우		
const btns = document.querySelectorAll('button[type=button]');
btns.forEach(function(btn) {
	btn.addEventListener('click', function() {
		switch(btn.value) {
			case "write":
				location.href = '/board/write';
				break;
			case "search":
				//검색구분 및 검색어
				searchOption = document.getElementById('search-option').value;
				searchKeyword = document.getElementById('search-keyword').value;
				
				if(!validateSearchForm(searchOption, searchKeyword)) return;
				location.href = '/board/list' + getRequestURLParams(1, searchOption, searchKeyword);		
		}

		//버튼 수만큼 반복하므로 return을 하지 않으면 버튼 수만큼 반복 동작된다
		return;
	});
});


//페이지 버튼 클릭시
const pagenation = document.querySelector('.pagenation ul');
pagenation.addEventListener('click', function(e) {
	e.preventDefault();
	//상위 엘리먼트로 이벤트 전파 막음
	e.stopPropagation();
	
    //클릭한게 A 태그인지 찾음
    const target = e.target;
    if(e.target.tagName === 'LI') return;
	
	//A 태그 또는 I 태그의 값을 가져옴: I 태그는 이전, 다음 버튼에 폰트어썸 때문
	const pageNum = target.getAttribute('data-num');
	
	//Request URL 파라미터 생성
	if(searchKeyword.trim().length === 0) {
		location.href = '/board/list?page=' + pageNum;	
	} else {	
		location.href = '/board/list' + getRequestURLParams(pageNum, searchOption, searchKeyword);	
	}
});


//요청 파라미터 연결
function getRequestURLParams(pageNum, searchOption, searchKeyword) {
	let params = '';
	
	params += '?page=' + pageNum; 
	params += '&searchOption=' + searchOption;
	params += '&searchKeyword=' + searchKeyword;		

	return params;
}

//검색옵션 선택 및 검색어 입력 여부
function validateSearchForm(searchOption, searchKeyword) {
	if(searchOption === 'select') {
		showModal(false, '검색옵션을 선택해주세요');
		return false;
	} else if(searchKeyword.trim().length === 0) {
		showModal(false, '검색어를 입력해주세요');	
		return false;
	}
	
	return true;
}