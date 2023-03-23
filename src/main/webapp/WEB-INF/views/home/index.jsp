<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div class="container">
	<div class="slide-wrapper">
		<ul class="slide-container">
			<li>
				<img src="${contextPath}/resources/images/banners/banner1.jpg" />
			</li>
			<li>
				<img src="${contextPath}/resources/images/banners/banner2.jpg" />
			</li>
			<li>
				<img src="${contextPath}/resources/images/banners/banner2.jpg" />
			</li>
		</ul>
		<a href="#" id="prev" class="controls"><i class="fa-solid fa-chevron-left"></i></a>
		<a href="#" id="next" class="controls"><i class="fa-solid fa-chevron-right"></i></a> 
		<p class="pager"></p>
	</div>

	<!-- ---------------- -->
	<div class="banner">
		
	</div>
	<div class="banner">
		Product
	</div>
	<div class="banner">
		Store
	</div>
</div>
<script>
	let slideWrapper = document.querySelector(".slide-wrapper");
	let slideContainer = document.querySelector(".slide-container");
	let slides = slideContainer.querySelectorAll('li');
	let slideCount = slides.length;
	let currentIndex = 0;
	let pager = slideWrapper.querySelector('.pager');
	let pagerHTML = '';
	let timer = '';
	let navPrev = slideWrapper.querySelector('#prev');
	let navNext = slideWrapper.querySelector('#next');

	
	//슬라이드 생성
	if(slideCount > 0) {
		slides.forEach(function(slide, index) {
			slide.style.left = index * 100 + '%';
			pagerHTML += '<a href=""></a>';
		});
		pager.innerHTML = pagerHTML;
	}
	
	let pagerBtn = pager.querySelectorAll('a');
	
	//슬라이드 이동 함수
	function goToSlide(index) {
		slideContainer.style.left = index * -100 + '%';
		currentIndex = index;	
		
		for(let pb of pagerBtn) {
			pb.classList.remove('active');
		}
		pagerBtn[index].classList.add('active');
		
		//좌우 버튼 생성
		if(currentIndex == (slideCount-1)) {
			navNext.classList.add('disabled');
		} else {
			navNext.classList.remove('disabled');
		}
		if(currentIndex == 0) {
			navPrev.classList.add('disabled');
		} else {
			navPrev.classList.remove('disabled');
		}
	}
	
	//좌우 버튼 클릭으로 슬라이드 이동시키기
	navNext.addEventListener('click', (e) => {
		e.preventDefault();
		if(currentIndex != (slideCount -1)) {
			clearInterval(timer);
			goToSlide(currentIndex + 1);
			startAutoSlide();
		}
	});
	navPrev.addEventListener('click', (e) => {
		e.preventDefault();
		if(currentIndex > 0) {
			clearInterval(timer);
			goToSlide(currentIndex - 1);
			startAutoSlide();
		}
	});
	goToSlide(0);

	//pager로 슬라이드 이동하기
	pagerBtn.forEach((item, index) => {
		item.addEventListener('click', e => {
			e.preventDefault();
			clearInterval(timer);
			goToSlide(index);
			startAutoSlide();
		});
	});
	
	//자동으로 슬라이드 움직이기
	function startAutoSlide() {
		timer = setInterval(() => {
			let nextIndex = (currentIndex + 1) % slideCount;
			if(currentIndex === (slideCount-1)) {
				slideContainer.style.transition = 'right 1.5s ease-in';
				//slideContainer.style.left = '0px';
			} else {
				slideContainer.style.transition = 'left 1.5s ease-in';
			}
			
			
			goToSlide(nextIndex);
		}, 3000);
	}
	startAutoSlide();
</script>