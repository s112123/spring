//button[name=button]을 클릭한 경우
const btns = document.getElementsByName('button');
btns.forEach(function(btn) {
	btn.addEventListener('click', function() {
		switch(btn.value) {
			case 'next': 
				validateAgreeForm();
		}
		
		//버튼 수만큼 반복하므로 return을 하지 않으면 버튼 수만큼 반복 동작된다
		return;
	});
});

//유효성 검사
function validateAgreeForm() {
	const chkBoxs = document.querySelectorAll('input[name="selectedItem"]');
	
	//필수항목체크여부: 이용약관, 개인정보수집 및 이용동의
	for(let i=0; i<chkBoxs.length-1; i++) {
		if(!chkBoxs[i].checked) {
			const msg = chkBoxs[i].parentNode.getElementsByTagName('span')[0].innerText;
			const target = document.getElementById("show-" + i);
			
			showModal(false, msg + '는 필수입니다');
			const confirmBtn = document.getElementById('modal-confirm-btn');
			confirmBtn.addEventListener('click', function() {
				target.click();			
			});
		
			return;
		}
	}	

	location.href='/member/register?agree=' + (chkBoxs[chkBoxs.length-1].checked ? 'Y' : 'N');
}

//전체선택 후, 선택항목 체크 해제시 전체선택 체크해제
const chkBoxs = document.querySelectorAll('input[name="selectedItem"]');
chkBoxs.forEach(function(chkBox) {
	chkBox.addEventListener('click', function() {
		const target = document.getElementById('all-check');
		if(!this.checked) {
			target.checked = false;
		} else {
			let i = 0;
			for(i=0; i<chkBoxs.length; i++) {
				if(chkBoxs[i].checked == false) break;
			}			
			if(i==3) target.checked = true;	
		}
	});
});

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