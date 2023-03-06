<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div id="member-infomation">
	<h3>회원정보</h3>
	<form>
		<!-- <input type="text" id="id" /> -->
		<table>
			<tr>
				<td>E-Mail</td>
				<td><input type="text" id="email" readonly /></td>
				<td>가입일</td>
				<td><input type="text" id="regdate" readonly /></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" id="username" readonly /></td>
				<td>연락처</td>
				<td><input type="text" id="phone" readonly /></td>
			</tr>					
			<tr>
				<td>주소</td>
				<td colspan="3">
					<input type="text" id="addr" readonly />
				</td>
			</tr>	
			<tr>
				<td>회원등급</td>
				<td>
					<select id="grade">
						<option value="common">common</option>
						<option value="admin">admin</option>
					</select>
				</td>
				<td>비밀번호</td>
				<td><input type="text" id="passwd" /></td>
			</tr>									
		</table>
		<div class="modal-info-btn">
			<button type="submit">수정</button>
			<!-- <button type="button" onclick="openModalForMessage(null, '삭제하시겠습니까?');">삭제</button>  -->
		</div>
	</form>
</div>
