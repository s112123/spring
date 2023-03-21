//검색구분 및 검색어
const searchOption = document.getElementById('search-option').value;
const searchKeyword = document.getElementById('search-keyword').value;
	
//글쓰기 페이지
function writeBoardForm() {
	location.href = '/board/write';
}

//글보기 <a> 태그 클릭시
function view(target) {
	const boardId = target.getAttribute('data-id');
	const pageNum = target.getAttribute('data-page');
	const requestURL = '/board/view?id=' + boardId + '&page=' + pageNum;
	
	//Request URL 파라미터 생성
	if(searchKeyword.trim().length === 0) {
		location.href = requestURL;	
	} else {	
		location.href = requestURL + getRequestURLParams(searchOption, searchKeyword);	
	}
}

//페이지 버튼 클릭시, 페이지 전환
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
		location.href = '/board/list?page=' + pageNum + getRequestURLParams(searchOption, searchKeyword);	
	}
});

//요청 파라미터 연결
function getRequestURLParams(searchOption, searchKeyword) {
	let params = '';
	
	params += '&searchOption=' + searchOption;
	params += '&searchKeyword=' + searchKeyword;		

	return params;
}


/* ----- SEARCH ----- */

//검색
function search() {
	//검색구분 및 검색어
	const searchOption = document.getElementById('search-option').value;
	const searchKeyword = document.getElementById('search-keyword').value;	
		
	if(!validateSearchForm(searchOption, searchKeyword)) return;
	location.href = '/board/list?page=1' + getRequestURLParams(searchOption, searchKeyword);	
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
