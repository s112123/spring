<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
    
<div class="container">
	<div class="store-box">
		<div class="store-list-box">
			<ul class="store-navbar">
				<li><a href="javascript:void(0);">서울</a></li>
				<li><a href="javascript:void(0);">부산</a></li>
				<li><a href="javascript:void(0);">경기</a></li>
				<li><a href="javascript:void(0);">대전</a></li>
				<li><a href="javascript:void(0);">광주</a></li>
				<li><a href="javascript:void(0);">울산</a></li>
			</ul>
			<div class="store-list">
				<c:choose>
					<c:when test="${empty stores}">
						<div class="store-item">
							<div class="store-item-info">해당 지역에 매장이 없습니다</div>
						</div>						
					</c:when>
					<c:otherwise>
						<c:forEach var="store" items="${stores}">
							<div class="store-item">
								<div class="store-image">
									<img src="${contextPath}/resources/images/stores/${store.img}" />
								</div>
								<div class="store-info">
									<p>${store.storename}</p>
									<p>${store.addr1}</p>
									<p>${store.tel}</p>
								</div>
							</div>					
						</c:forEach>
						<!-- PAGENATION -->
						<div class="pagenation store-pagenation">
							<ul>
								<c:if test="${pagenation.prev}">
									<li>
										<a href="?page=${pagenation.startPN - 1}" data-num="${pagenation.startPN - 1}">
											<i class="fa-solid fa-angle-left" data-num="${pagenation.startPN - 1}"></i>
										</a>
									</li>
								</c:if>
								<c:forEach var="pageNum" begin="${pagenation.startPN}" end="${pagenation.endPN}">
									<li>
										<a href="?page=${pageNum}" data-num="${pageNum}" class="${pagenation.page == pageNum ? 'active' : ''}">${pageNum}</a>
									</li>
								</c:forEach>
								<c:if test="${pagenation.next}">
									<li>	
										<a href="?page=${pagenation.endPN + 1}" data-num="${pagenation.endPN + 1}">
											<i class="fa-solid fa-angle-right" data-num="${pagenation.endPN + 1}"></i>
										</a>
									</li>
								</c:if>
							</ul>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div id="map"></div>	
	</div>
</div>
<jsp:include page="${contextPath}/WEB-INF/views/common/modal.jsp" flush="flase" />
<script type="text/javascript" src="${contextPath}/resources/js/home/store/list.js"></script>
<script>
	/* ----- MAP API ----- */
	var mapContainer = document.getElementById('map'), //지도를 표시할 div 
	mapOption = {
	    center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표
	    level: 3 //지도의 확대 레벨
	};  
	
	//지도 설정
	var map = new kakao.maps.Map(mapContainer, mapOption); 
</script>



<!-- 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="map" style="width:1150px;height:700px;border:1px solid blue"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bca1dcf5c590ab01c4071e244ef5a994&libraries=services"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		        level: 11 // 지도의 확대 레벨
		    };  
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		/*
		// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
		var mapTypeControl = new kakao.maps.MapTypeControl();
		// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
		// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
		// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
		*/
		// 버튼 클릭에 따라 지도 확대, 축소 기능을 막거나 풀고 싶은 경우에는 map.setZoomable 함수를 사용합니다
		function setZoomable(zoomable) {
		    // 마우스 휠로 지도 확대,축소 가능여부를 설정합니다
		    map.setZoomable(zoomable);    
		}
		
		kakao.maps.event.addListener(map, 'zoom_changed', function(e) {
			if(map.getLevel() > 12) {
				map.setLevel(12);
			}
		});
		
		// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
		var imageSrc = 'http://localhost:8080/resources/images/markers/location.png', // 마커이미지의 주소입니다    
	    imageSize = new kakao.maps.Size(50, 50), // 마커이미지의 크기입니다
	    imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
	    
		var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);		
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		var addrs = ['부산 남구 용소로 45', '부산 남구 수영로 309', "서울 강남구 강남대로 238"];
		
		addrs.forEach(function(addr) {
			
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch(addr, function(result, status) {
			
			    // 정상적으로 검색이 완료됐으면 
			     if (status === kakao.maps.services.Status.OK) {
			
			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			
			        // 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new kakao.maps.Marker({
			            map: map,
			            position: coords,
			            image: markerImage 
			        });
			        
					
			        // 인포윈도우로 장소에 대한 설명을 표시합니다
			        var infowindow = new kakao.maps.InfoWindow({
			            content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
			        });
			        infowindow.open(map, marker);
			        
			        
			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        map.setCenter(coords);
			    } 
			}); 			

		});
	</script>
</body>
</html>
 -->