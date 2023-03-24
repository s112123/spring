<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div class="container flex-ctr">
	<div class="exception-box">
		<h2>ERROR PAGE</h2>
		<div class="exception-content">
			<p>잘못된 요청입니다.</p>
			<p>요청하신 주소를 다시 한번 확인해주시기 바랍니다.</p>
		</div>	
		<div class="exception-btn">
			<button type="button" onclick="location.href='/'">홈으로</button>
			<button type="button" onclick="history.back()">이전</button>
		</div>
	</div>
</div>
