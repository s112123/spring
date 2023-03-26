/* ---------- COMMON ---------- */
//현재 Nav 탭 유지
//HEADER의 <a>의 PathName을 배열에 담음
const navLinks = document.querySelectorAll('nav a');
const navPathNames = [];
navLinks.forEach(function(navLink) {
	navPathNames.push('/' + navLink.pathname.split('/')[1]);
});

//현재 URL의 PathName
let locationPathName = '/' + document.location.pathname.split('/')[1];
for(let i=0; i<navPathNames.length; i++) {
	if(navPathNames[i] === locationPathName) {
		removeClassName(navLinks, 'active');
		navLinks[i].classList.add('active');
	}
}	

//현재 Aside 탭 유지
//ASIDE의 <a>의 PathName을 배열에 담음
if(locationPathName === '/customer') {
	locationPathName = '/customer/' + document.location.pathname.split('/')[2];
} else if (locationPathName === '/mypage') {
	locationPathName = '/customer/' + document.location.pathname.split('/')[2];
}

const asideLinks = document.querySelectorAll('aside a');
const asidePathNames = [];
asideLinks.forEach(function(asideLink) {
	if(locationPathName.indexOf('/customer') !== -1) {
		asidePathNames.push('/customer/' + asideLink.pathname.split('/')[2]);
	} else if(locationPathName.indexOf('/mypage') !== -1) {
		asidePathNames.push('/mypage/' + asideLink.pathname.split('/')[2]);
	} else {
		asidePathNames.push('/' + asideLink.pathname.split('/')[1]);
	}
});	

//현재 URL의 PathName
for(let i=0; i<asidePathNames.length; i++) {
	if(asidePathNames[i] === locationPathName) {
		removeClassName(asideLinks, 'active');
		asideLinks[i].classList.add('active');
	}
}		

//클래스 이름 제거
function removeClassName(elems, removeClassName) {
	/*
		elems: 제거할 클래스 요소 집합
		removeClassName: 제거할 클래스 이름
	*/
	
	for(let ele of elems) {
		ele.classList.remove(removeClassName);
	}
}

//항목전체선택
function checkAll(selectedItem) {
	let items = document.querySelectorAll('input[name="selectedItem"]');
	items.forEach((item) => {
		item.checked = selectedItem.checked;
	});
}

//form - submit
function submitForm(form, action, method) {
		form.action = action;
		form.method = method;
		form.submit();	
}

/* ---------- AJAX ---------- */
//Ajax - Insert
function ajaxInsert(requestURL, datas, callback) {
	/*
		requestURL: 요청주소
		datas: <form>에서 서버로 전송할 데이터
		callback: 통신 성공시, 실행함수
	*/
	
	$.ajax({
		url: requestURL,
		type: 'POST',
		contentType: 'application/json; charset=UTF-8',
		dataType: 'json',
		data: JSON.stringify(datas),
		success: function(result) {	
			if(result.message === 'inserted') {
				callback();
			}
		}
	});	
}

//Ajax - Insert For File
function ajaxInsertForFile(requestURL, formData, callback) {
	/*
		requestURL: 요청주소
		formData: <form enctype="multipart/form-data">에서 서버로 전송할 데이터
		callback: 통신 성공시, 실행함수
	*/
	
	$.ajax({
		url: requestURL,
		type: 'POST',
        processData: false,
        contentType: false,
		dataType: 'json',
		data: formData,
		success: function(result) {
			if(result.message === 'inserted') {
				callback();
			}
		}
	});	
}

//Ajax - Update For File
function ajaxUpdateForFile(requestURL, formData, callback) {
	/*
		requestURL: 요청주소
		formData: <form enctype="multipart/form-data">에서 서버로 전송할 데이터
		callback: 통신 성공시, 실행함수
	*/
	
	$.ajax({
		url: requestURL,
		type: 'POST',
        processData: false,
        contentType: false,
		dataType: 'json',
		data: formData,
		success: function(result) {
			if(result.message === 'updated') {
				callback();
			}
		}
	});	
}

//Ajax - Delete
function ajaxDelete(requestURL, callback) {
	/*
		requestURL: 요청주소
		callback: 통신 성공시, 실행함수
	*/
	
	$.ajax({
		url: requestURL,
		type: 'GET',
		dataType: 'json',
		success: function(result) {	
			if(result.message === 'deleted') {
				callback();
			}
		}
	});	
}


/* ---------- MODAL ---------- */
const modal = document.getElementById('modal-overlay');
const modalBox = document.getElementById('modal-box');
const modalHeader = document.getElementById('modal-header');
const modalContent = document.getElementById('modal-content');

//모달닫기
function closeModal() {
	//모달 닫기
	modal.style.display = 'none';
	//모달이 닫혔을 때, body 부분 스크롤 복구
	document.body.style.overflow = 'auto';	
}

//모달열기
function showModal(isCancelBtn, msg, width, height) {
	/*
		isCancelBtn: true는 확인버튼과 취소버튼이 생성되고, false는 확인버튼만 생성
		msg: null이 아니면 모달크기가 고정설정되고 modal-content에 내용 삽입
		width, height: msg이 null인 경우, 모달 크기 설정
	*/
	
	document.body.style.overflow = 'hidden';
	modal.style.display = 'block';
	
	if(msg !== null) {
		modalHeader.style.display = 'none';	
		modalBox.style.width = '350px';
		modalBox.style.height = (msg.indexOf('<br />') == -1) ? '130px' : '150px';
		
		let content = '';
		content += '<p id="modal-message">' + msg + '</p>';
		content += '<div id="modal-btn">';
		if (isCancelBtn) {
			content += '  <button id="modal-confirm-btn">확인</button>';
			content += '  <button class="modal-close-btn" onclick="closeModal()">닫기</button>';			
		} else {
			content += '  <button id="modal-confirm-btn" onclick="closeModal()">확인</button>';
		}
		content += '</div>';
		
		modalContent.innerHTML = content;
	} else {
		modalHeader.style.display = 'block';
		modalContent.innerHTML = '';	
		modalBox.style.width = width + 'px';
		modalBox.style.height = height + 'px';			
	}	
}