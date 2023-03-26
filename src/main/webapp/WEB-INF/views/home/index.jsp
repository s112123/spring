<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="container">
	<div class="main-banner">
		<img src="/resources/images/banners/banner1.jpg" />
	</div>
	<div class="slide-container">
		<ul class="slide-wrapper animated">
			<li>
				<div class="slide-image">
					<img src="/resources/images/slides/slide1.jpg" />
				</div>
				<div class="slide-content">
					<div class="slide-content-box">
						<h3>STEAK, ipsum dolor</h3>
						<p>
							Lorem ipsum dolor sit amet consectetur adipisicing elit.
							Nesciunt laboriosam ab nisi at nobis inventore!
						</p>
						<button onclick="location.href='/product'">READ MORE</button>
					</div>
				</div>
				<div class="slide-image">
					<img src="/resources/images/slides/slide2.jpg" />
				</div>
			</li>
			<li>
				<div class="slide-image">
					<img src="/resources/images/slides/slide3.jpg" />
				</div>
				<div class="slide-content">
					<div class="slide-content-box">
						<h3>PASTA! tempora</h3>
						<p>
							Vitae ratione cumque impedit quidem, 
							atque necessitatibus similique mollitia? Libero, voluptate provident
						</p>
						<button onclick="location.href='/product'">READ MORE</button>
					</div>
				</div>
				<div class="slide-image">
					<img src="/resources/images/slides/slide4.jpg" />
				</div>
			</li>
			<li>
				<div class="slide-image">
					<img src="/resources/images/slides/slide5.jpg" />
				</div>
				<div class="slide-content">
					<div class="slide-content-box">
						<h3>BEVERAGE? mollitia</h3>
						<p>
							Repellendus praesentium quisquam error nemo repellat 
							Architecto numquam nisi fugiat ducimus illo nam atque!
						</p>
						<button onclick="location.href='/product'">READ MORE</button>
					</div>
				</div>
				<div class="slide-image">
					<img src="/resources/images/slides/slide6.jpg" />
				</div>
			</li>
		</ul>
		<a href="#" id="prev" class="controls"><i class="fa-solid fa-chevron-left"></i></a>
		<a href="#" id="next" class="controls"><i class="fa-solid fa-chevron-right"></i></a> 
		<p class="pager"></p>
	</div>
	<div class="store-banner">
		<div class="store-banner-image">
			<img src="/resources/images/banners/banner3.jpg" />
		</div>
		<div class="store-banner-content">
			<h3>RESERVATION</h3>
			<p>
				Reservation sit amet consectetur adipisicing elit. 
				id ab quo iure corporis quisquam cum ipsum perspiciatis voluptas 
				tempora provident. Accusantium!
			</p>
			<div class="store-reservation-btn">
				<button onclick="location.href='/store'">RESERVATION</button>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript" src="/resources/js/home/index.js"></script>