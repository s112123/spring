//유효성 검사
function validateAgreeForm() {
	const chkBoxs = document.querySelectorAll('input[name="checked[]"]');
	//필수항목체크여부: 이용약관, 개인정보수집 및 이용동의
	for(let i=0; i<chkBoxs.length-1; i++) {
		if(!chkBoxs[i].checked) {
			const msg = chkBoxs[i].parentNode.getElementsByTagName('span')[0].innerText;
			openModal(350, 115, msg + '는 필수입니다');
			
			document.getElementById('modal-confirm-btn').addEventListener('click', function() {
				const target = document.getElementById("show-" + i);
				target.click();			
			});
			
			return;
		}
	}	
	location.href='/register?agree=' + (chkBoxs[chkBoxs.length-1].checked ? 'Y' : 'N');
}

//전체선택
function selectAll(checkedBox) {
	let chkBoxs = document.querySelectorAll('input[name="checked[]"]');
	chkBoxs.forEach((chkBox) => {
		chkBox.checked = checkedBox.checked;
	});
}

//약관내용보기
$(function(){
	//이용약관
	$("#show-0").click(function(){
		$(this).hide();
		$("#hide-0").show();
		$("#content-0").slideDown(100);
		
		$("#show-1").show();
		$("#hide-1").hide();
		$("#content-1").slideUp(100);
		
		$("#show-2").show();
		$("#hide-2").hide();
		$("#content-2").slideUp(100);
	});
	
	$("#hide-0").click(function(){
		$(this).hide();
		$("#show-0").show();			
		$("#content-0").slideUp(100);
	});
	
	
	//개인정보수집 및 이용동의
	$("#show-1").click(function(){
		$(this).hide();
		$("#hide-1").show();
		$("#content-1").slideDown(100);
		
		$("#show-0").show();
		$("#hide-0").hide();
		$("#content-0").slideUp(100);
		
		$("#show-2").show();
		$("#hide-2").hide();
		$("#content-2").slideUp(100);
	});
	
	$("#hide-1").click(function(){
		$(this).hide();
		$("#show-1").show();			
		$("#content-1").slideUp(100);
	});
	
	//개인정보 마케팅 활용 동의
	$("#show-2").click(function(){
		$(this).hide();
		$("#hide-2").show();
		$("#content-2").slideDown(100);
		
		$("#show-0").show();
		$("#hide-0").hide();
		$("#content-0").slideUp(100);
		
		$("#show-1").show();
		$("#hide-1").hide();
		$("#content-1").slideUp(100);
	});
	
	$("#hide-2").click(function(){
		$(this).hide();
		$("#show-2").show();			
		$("#content-2").slideUp(100);
	});
})