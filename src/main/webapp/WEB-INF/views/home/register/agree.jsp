<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div class="container flex-ctr">
	<div class="agree-box">
		<h2>약관동의</h2>
		<div class="agree-item">
			<input type="checkbox" id="all-check" onclick="checkAll(this)" />
			<span>전체 동의</span>
		</div>
		<div class="agree-item">
			<div class="agree-chk">
				<div>
					<input type="checkbox" name="selectedItem" />
					<span>이용약관 동의</span><small> (필수)</small>
				</div>
				<div>
					<button type="button" class="show-content-btn" id="show-0">
						<i class="fa-solid fa-chevron-down"></i>
					</button>
					<button type="button" class="hide-content-btn" id="hide-0">
						<i class="fa-solid fa-chevron-up"></i>
					</button>
				</div>
			</div>
			<div class="agree-content" id="content-0" >
				제 1 조 (목적) <br />
				STEAKEHOUSE(이하 '회사')가 제공하는 다양한 서비스를 이용하여 주셔서 감사합니다. <br />
				회사는 이용자가 더 편리하게 이용할 수 있도록 서비스 이용약관(이하 '본 약관')을 마련하였습니다. <br />
				본 약관은 이용자가 서비스를 이용하는데 필요한 권리, 의무 및 책임사항 기타 필요한 사항을 규정하고 있으므로 
				주의깊게 살펴봐 주시기 바랍니다. <br />
				<br />
				제 2 조 (분쟁해결) <br />
				회사는 이용자와 파트너 사이에 분쟁이 발생하지 않도록 최선을 다할 것입니다. <br />
				그럼에도 불구하고 서비스 이용과 관련하여 분쟁이 발생할 경우 이는 거래당사자인 이용자와 
				파트너가 해결하여야 함을 유의하여 주시기 바랍니다. <br />
				다만, 회사는 가능한 한 최선의 노력을 다하여 거래당사자 간의 분쟁이 신속하게 처리될 수 있도록 
				성실하게 협조할 것입니다.	
			</div>
		</div>
		<div class="agree-item">
			<div class="agree-chk">
				<div>
					<input type="checkbox" name="selectedItem" />
					<span>개인정보수집 및 이용 동의</span><small> (필수)</small>
				</div>
				<div>
					<button type="button" class="show-content-btn" id="show-1">
						<i class="fa-solid fa-chevron-down"></i>
					</button>
					<button type="button" class="hide-content-btn" id="hide-1">
						<i class="fa-solid fa-chevron-up"></i>
					</button>
				</div>
			</div>
			<div class="agree-content" id="content-1" >
				1. 수집하는 개인정보 <br />
				이용자는 회원가입을 하지 않아도 매장위치확인, 게시판보기 등 대부분의 서비스를 회원과 동일하게 이용할 수 있습니다. 
				이용자가 주문, 게시글 작성 등과 같은 서비스를 이용하기 위해 회원가입을 할 경우, 서비스 이용을 위해 필요한 최소한의 개인정보를 수집합니다.
				회원 가입 시 필수항목으로 아이디, 비밀번호, 이름, 휴대전화번호, 주소, 선택항목으로 개인정보 마케팅 활용 동의여부를 수집합니다.<br />
				<br />
				2. 개인정보의 보관기간 <br />
				회사는 원칙적으로 이용자의 개인정보를 회원 탈퇴 시 지체없이 파기하고 있습니다. 단, 이용자에게 개인정보 보관기간에 대해 별도의 동의를 얻은 경우, 
				또는 법령에서 일정 기간 정보보관 의무를 부과하는 경우에는 해당 기간 동안 개인정보를 안전하게 보관합니다.
			</div>
		</div>
		<div class="agree-item">
			<div class="agree-chk">
				<div>
					<input type="checkbox" name="selectedItem" />
					<span>마케팅 정보수신 동의</span><small style="color:rgb(150, 150, 150)"> (선택)</small>
				</div>
				<div>
					<button type="button" class="show-content-btn" id="show-2">
						<i class="fa-solid fa-chevron-down"></i>
					</button>
					<button type="button" class="hide-content-btn" id="hide-2">
						<i class="fa-solid fa-chevron-up"></i>
					</button>
				</div>
			</div>
			<div class="agree-content" id="content-2" >
				회사가 제공하는 이벤트/혜택 등 다양한 정보를 회원가입시 기입하신 휴대전화, 이메일로 받아보실 수 있습니다.
			</div>
		</div>
		<div class="form-btn">
			<button type="button" name="button" value="next">다음</button>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/common/modal.jsp" flush="false" />
<script type="text/javascript" src="/resources/js/home/register/agree.js"></script>

