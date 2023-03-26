/* ----- SLIDE ----- */

let slideWrap = document.querySelector('.slide-wrapper');
let slides = slideWrap.querySelectorAll('li');
const cntInitSlides = slides.length;
let currIdx = 0;

//첫 번째 슬라이드 복제 후, 마지막 슬라이드에 뒤에 붙이기
const cloneFirstSlide = slides[0].cloneNode(true);
slideWrap.appendChild(cloneFirstSlide);
//마지막 슬라이드 복제 후, 첫 번째 슬라이드 앞에 붙이기
const cloneLastSlide = slides[slides.length-1].cloneNode(true);
slideWrap.prepend(cloneLastSlide);

//모든 슬라이드를 가로로 배치
slides = slideWrap.querySelectorAll('li');
slides.forEach(function(slide, i) {
    slide.style.left = (i * 100) + '%';
});

//슬라이드 초기 위치를 기존의 첫 번째 위치가 보이도록 위치
slideWrap.style.transform = 'translateX(-100%)';

//pager 생성
const pager = document.querySelector('.pager');
let pagerHTML = '';

for(let i=0; i<cntInitSlides; i++) {
	pagerHTML += '<a href=""></a>';
}
pager.innerHTML = pagerHTML;
let pagerBtns = pager.querySelectorAll('a');

pagerBtns.forEach(function(pagerBtn, i) {
	pagerBtn.addEventListener('click', function(e) {
		e.preventDefault();
		clearInterval(timer);
		moveSlide(i);
		autoSlide();
	});
});

//좌우버튼 클릭시
let prevBtn = document.querySelector('#prev');
let nextBtn = document.querySelector('#next');

prevBtn.addEventListener('click', function(e) {
	e.preventDefault();
		if(currIdx > 0) {
		clearInterval(timer);
		moveSlide(currIdx - 1);
		autoSlide();   
	}
});

nextBtn.addEventListener('click', function(e) {
	e.preventDefault();
		if(currIdx != (cntInitSlides - 1)) {
		clearInterval(timer);
		moveSlide(currIdx + 1);
		autoSlide();   
	}
});

//슬라이드 이동 함수
function moveSlide(idx) {
	slideWrap.style.left = -(idx * 100) + '%';
	currIdx = idx;
	
	if(currIdx == cntInitSlides || currIdx == -cntInitSlides) {
		//애니메이션 잠시 멈추고 첫 번째 슬라이드로 위치 이동 (애니메이션 동작시간인 1.5s 동안 중지 후, 위치 이동)
		setTimeout(function() {
			slideWrap.classList.remove('animated');
			slideWrap.style.left = '0px';
			currIdx = 0;
		}, 1500);
		//애니메이션 다시 설정
		setTimeout(function() {
			slideWrap.classList.add('animated');
		}, 1600);
	}
	
	//페이저 하이라이트
	for(let pagerBtn of pagerBtns) {
		pagerBtn.classList.remove('active');
	}
	
	if(currIdx > 0 && currIdx < cntInitSlides) {
		pagerBtns[currIdx].classList.add('active');
	} else {
		pagerBtns[0].classList.add('active');
	}
	
	//좌우 버튼 숨기기
	if(currIdx < 1 || currIdx == (cntInitSlides)) {
		prevBtn.classList.add('disabled');
	} else {
		prevBtn.classList.remove('disabled');
	}
	
	if(currIdx == (cntInitSlides-1)) {
		nextBtn.classList.add('disabled');
	} else {
		nextBtn.classList.remove('disabled');
	}
}
moveSlide(0);

//자동 슬라이드
let timer = '';
function autoSlide() {
	timer = setInterval(function() {
		moveSlide(currIdx + 1);
	}, 3500);
}
autoSlide();