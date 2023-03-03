<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="container flex justify-ctr">
	<aside>
		<ul>
			<li>
				<a href="/notices">
					<span><i class="fa-solid fa-bullhorn"></i></span> 
					<span>공지사항</span>
				</a>
			</li>
			<li>
				<a href="/qnas">
					<span><i class="fa-solid fa-comments"></i></span> 
					<span>QnA</span>
				</a>
			</li>
		</ul>	
	</aside>
	<div class="content">
		<h3>문의등록</h3>
		<div class="write-box">	
			<div class="write-title">
				<input type="text" placeholder="제목을 입력해주세요" />
			</div>
			<div class="write-content">
				<textarea></textarea>
			</div>
			<div class="write-btn">
				<button>등록</button>
				<button>취소</button>
			</div>	
		</div>
	</div>
</div>