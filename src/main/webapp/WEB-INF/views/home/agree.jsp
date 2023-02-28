<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="agree-box">
	<h2>약관동의</h2>
	<div class="agree-item">
		<input type="checkbox" onclick="selectAll(this);" />
		<span>전체 동의</span>
	</div>
	<div class="agree-item">
		<div class="agree-chk">
			<input type="checkbox" name="checked[]" />
			<span>만 14세 이상입니다 <small>(필수)</small></span>
		</div>
	</div>
	<div class="agree-item">
		<div class="agree-chk flex justify-sb">
			<div>
				<input type="checkbox" name="checked[]" />
				<span>이용약관 <small>(필수)</small></span>
			</div>
			<div>
			<div>
				<button type="button" class="show-content-btn" id="show-1">
					<i class="fa-solid fa-chevron-down"></i>
				</button>
				<button type="button" class="hide-content-btn" id="hide-1">
					<i class="fa-solid fa-chevron-up"></i>
				</button>
			</div>
			</div>
		</div>
		<div class="agree-content" id="content-1" >
			ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEF
			GHIJKLMNOPQRSTUVWXYZABCDEFG
			HIJKLMNOP
			QRSTUVWXYZABCDEFGHIJKLMNOPQRSTU
			VWXYZA
			BCDEFGHIJKLMNOPQRSTUVWXY
			ZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEF
			GHIJKLM
			NOPQRSTUVWXYZABCDEFGHIJKLMNOPQRST
			UVWXYZABCDEFGHIJKLMNOPQRSTUVW
			XYZABCD
			EFGHIJKLMNOP
			QRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVW
			XYZABCDEFGHIJKLMNOPQRSTUVWXYZ
			ABCDEFGH
			IJKLMNOPQRS
			TUVWXYZABCDEFGH
			IJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQR
			STUVWXYZABCDEF
			GHIJKLMNOPQRSTUVWXYZABCDEFGHI
			JKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRS
			TUVWXYZABCDEF
			GH
			IJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOP
			QRSTUVWXYZABC
			DEFGHIJKL
			MNOPQRSTUVWXYZABCDEFGHIJKLMNOP
			QRSTUVWXYZABCDEFGHIJK
			LMNOPQRSTUVWXYZABCDEFGHIJKLMNO
			PQRSTUVWXYZ
		</div>
	</div>
	<div class="agree-item">
		<div class="agree-chk flex justify-sb">
			<div>
				<input type="checkbox" name="checked[]" required />
				<span>개인정보수집 및 이용동의 <small>(필수)</small></span>
			</div>
			<div>
			<div>
				<button type="button" class="show-content-btn" id="show-2">
					<i class="fa-solid fa-chevron-down"></i>
				</button>
				<button type="button" class="hide-content-btn" id="hide-2">
					<i class="fa-solid fa-chevron-up"></i>
				</button>
			</div>
			</div>
		</div>
		<div class="agree-content" id="content-2" >
			ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEF
			GHIJKLMNOPQRSTUVWXYZABCDEFG
			HIJKLMNOP
			QRSTUVWXYZABCDEFGHIJKLMNOPQRSTU
			VWXYZA
			BCDEFGHIJKLMNOPQRSTUVWXY
			ZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEF
			GHIJKLM
			NOPQRSTUVWXYZABCDEFGHIJKLMNOPQRST
			UVWXYZABCDEFGHIJKLMNOPQRSTUVW
			XYZABCD
			EFGHIJKLMNOP
			QRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVW
			XYZABCDEFGHIJKLMNOPQRSTUVWXYZ
			ABCDEFGH
			IJKLMNOPQRS
			TUVWXYZABCDEFGH
			IJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQR
			STUVWXYZABCDEF
			GHIJKLMNOPQRSTUVWXYZABCDEFGHI
			JKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRS
			TUVWXYZABCDEF
			GH
			IJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOP
			QRSTUVWXYZABC
			DEFGHIJKL
			MNOPQRSTUVWXYZABCDEFGHIJKLMNOP
			QRSTUVWXYZABCDEFGHIJK
			LMNOPQRSTUVWXYZABCDEFGHIJKLMNO
			PQRSTUVWXYZ
		</div>
	</div>
	<div class="agree-item">
		<div class="agree-chk flex justify-sb">
			<div>
				<input type="checkbox" name="checked[]" />
				<span>개인정보 마케팅 활용 동의 <small style="color:rgb(150, 150, 150)">(선택)</small></span>
			</div>
			<div>
				<button type="button" class="show-content-btn" id="show-3">
					<i class="fa-solid fa-chevron-down"></i>
				</button>
				<button type="button" class="hide-content-btn" id="hide-3">
					<i class="fa-solid fa-chevron-up"></i>
				</button>
			</div>
		</div>
		<div class="agree-content" id="content-3" >
			ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEF
			GHIJKLMNOPQRSTUVWXYZABCDEFG
			HIJKLMNOP
			QRSTUVWXYZABCDEFGHIJKLMNOPQRSTU
			VWXYZA
			BCDEFGHIJKLMNOPQRSTUVWXY
			ZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEF
			GHIJKLM
			NOPQRSTUVWXYZABCDEFGHIJKLMNOPQRST
			UVWXYZABCDEFGHIJKLMNOPQRSTUVW
			XYZABCD
			EFGHIJKLMNOP
			QRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVW
			XYZABCDEFGHIJKLMNOPQRSTUVWXYZ
			ABCDEFGH
			IJKLMNOPQRS
			TUVWXYZABCDEFGH
			IJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQR
			STUVWXYZABCDEF
			GHIJKLMNOPQRSTUVWXYZABCDEFGHI
			JKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRS
			TUVWXYZABCDEF
			GH
			IJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOP
			QRSTUVWXYZABC
			DEFGHIJKL
			MNOPQRSTUVWXYZABCDEFGHIJKLMNOP
			QRSTUVWXYZABCDEFGHIJK
			LMNOPQRSTUVWXYZABCDEFGHIJKLMNO
			PQRSTUVWXYZ
		</div>
	</div>
	<div class="agree-next-btn">
		<button type="button" onClick="location.href='/register';">다음</button>
	</div>
</div>

<!-- JAVASCRIPT -->
<script>
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
		$("#show-1").click(function(){
			$(this).hide();
			$("#hide-1").show();
			$("#content-1").slideDown(100);
			
			$("#show-2").show();
			$("#hide-2").hide();
			$("#content-2").slideUp(100);
			
			$("#show-3").show();
			$("#hide-3").hide();
			$("#content-3").slideUp(100);
		});
		
		$("#hide-1").click(function(){
			$(this).hide();
			$("#show-1").show();			
			$("#content-1").slideUp(100);
		});
		
		
		//개인정보수집 및 이용동의
		$("#show-2").click(function(){
			$(this).hide();
			$("#hide-2").show();
			$("#content-2").slideDown(100);
			
			$("#show-1").show();
			$("#hide-1").hide();
			$("#content-1").slideUp(100);
			
			$("#show-3").show();
			$("#hide-3").hide();
			$("#content-3").slideUp(100);
		});
		
		$("#hide-2").click(function(){
			$(this).hide();
			$("#show-2").show();			
			$("#content-2").slideUp(100);
		});
		
		//개인정보 마케팅 활용 동의
		$("#show-3").click(function(){
			$(this).hide();
			$("#hide-3").show();
			$("#content-3").slideDown(100);
			
			$("#show-1").show();
			$("#hide-1").hide();
			$("#content-1").slideUp(100);
			
			$("#show-2").show();
			$("#hide-2").hide();
			$("#content-2").slideUp(100);
		});
		
		$("#hide-3").click(function(){
			$(this).hide();
			$("#show-3").show();			
			$("#content-3").slideUp(100);
		});
	})
</script>