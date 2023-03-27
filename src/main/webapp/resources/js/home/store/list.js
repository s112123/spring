let area = '서울';
let page = 1;
getStoreList(area, page);

//지역 버튼 클릭시
const areaLinks = document.querySelectorAll('.store-navbar a');
areaLinks.forEach(function(areaLink) {
	areaLink.addEventListener('click', function() {
		removeClassName(areaLinks, 'active');
		areaLink.classList.add('active');
		
		//매장 목록
		area = areaLink.innerText;
		getStoreList(area, page);
	});
});

//비동기 통신
function getStoreList(area, page) {
	$.ajax({
		url: '/api/store/list/' + area + '/' + page,
		type: 'GET',
		dataType: 'json',
		success: function(result) {
			//스토어 목록
			const storeListBox = document.getElementById('store-list');
			storeListBox.innerHTML = createStoreItem(result.stores);
			
			//지도 표시
			let storeInfos = [];	
			result.stores.forEach(function(store) {
				//스토어 정보를 담음
				storeInfos.push(store);
			});
			getMap(storeInfos);
			
			//Pagenation
			const pagenation = document.getElementById('store-pagenation');
			pagenation.innerHTML = createPagenation(area, result.pagenation);
		}
	});
}

//스토어 목록 요소 생성
function createStoreItem(stores) {
	let tempItem = '';
	
	if(stores.length === 0) {
		tempItem += '<div class="store-item">';
		tempItem += '    <div class="store-item-info">해당 지역에 매장이 없습니다</div>';
		tempItem += '</div>';		
	} else {
		for(let store of stores){
			tempItem += '<div class="store-item">';
			tempItem += '    <div class="store-image">';
			tempItem += '        <img src="/resources/images/stores/' + store.img + '" />';
			tempItem += '    </div>';
			tempItem += '    <div class="store-info">';
			tempItem += '        <p>' + store.storename + '</p>';
			tempItem += '        <p>' + store.addr1 + '</p>';
			tempItem += '        <p>' + store.tel + '</p>';
			tempItem += '    </div>';
			tempItem += '</div>';	
		}	
	}
	
	return tempItem;
}

//Pagenation
function createPagenation(area, pagenation) {
	let pageNums = '<ul>';
	
	//이전 버튼
	if(pagenation.prev) {
		pageNums += '<li>';
		pageNums += '    <a href="javascript:void(0);" onclick="getStoreList(\''+ area + '\', ' + (pagenation.startPN - 1) + ')">';
		pageNums += '        <i class="fa-solid fa-angle-left"></i>';
		pageNums += '    </a>';
		pageNums += '</li>';	
	}
	
	//페이지 번호
	for(let pageNum=pagenation.startPN; pageNum<=pagenation.endPN; pageNum++){
		pageNums += '<li>';
		pageNums += '    <a href="javascript:void(0);"' + (pageNum==pagenation.page ? ' class=active ' : ' ') + 'onclick="getStoreList(\'' + area + '\', ' + pageNum +')">'+ pageNum + '</a>';
		pageNums += '</li>';
	}
	
	//다음 버튼
	if(pagenation.next) {
		pageNums += '<li>';
		pageNums += '    <a href="javascript:void(0);" onclick="getStoreList(\''+ area + '\', ' + (pagenation.endPN + 1) + ')">';
		pageNums += '        <i class="fa-solid fa-angle-right"></i>';
		pageNums += '    </a>';
		pageNums += '</li>';	
	}

	pageNums += '</ul>';
	
	return pageNums;
}

/* ----- MAP API ----- */
function getMap(storeInfos) {
	var mapContainer = document.getElementById('map'), //지도를 표시할 div 
	mapOption = {
	    center: new kakao.maps.LatLng(37.5666103, 126.9783882), //지도의 중심좌표
	    level: 9 //지도의 확대 레벨
	};  
	
	//지도 생성
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 마커이미지 생성
	var imageSrc = '/resources/images/map/location2.svg';
	var imageSize = new kakao.maps.Size(45, 45);				// 마커 크기
	var imageOption = {offset: new kakao.maps.Point(23, 69)};	// 마커의 좌표와 일치시킬 이미지 안에서의 좌표 설정
	var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
	
	//주소-좌표 변환
	var geocoder = new kakao.maps.services.Geocoder();
	storeInfos.forEach(function(storeInfo) {	
		var infoContent = '';
		infoContent += '<div class="infoContent">';
		infoContent += '    <div class="info-storename">' + storeInfo.storename + '</div>';
		infoContent += '    <div class="info-addr">' + storeInfo.addr1 + '</div>';
		infoContent += '</div>';
		
		//주소로 좌표 검색
		geocoder.addressSearch(storeInfo.addr1, function(result, status) {
		    //정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {
		       	var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		       
		        //결과값으로 받은 위치를 마커로 표시
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords,
		            image: markerImage 
		        });
 
		        //인포윈도우로 장소에 대한 설명 표시
		        var infowindow = new kakao.maps.InfoWindow({
		            content: infoContent
		        });
		       	
		       	//인포윈도우 표시
		        //infowindow.open(map, marker);
	        	//마커에 마우스 이벤트 설정
				kakao.maps.event.addListener(marker, 'mouseover', function() {
				  	//인포윈도우 표시
				    infowindow.open(map, marker);
				});
				kakao.maps.event.addListener(marker, 'mouseout', function() {
				    //인포윈도우 숨김
				    infowindow.close();
				});
				
		        //지도의 중심을 결과값으로 받은 위치로 이동
		        map.setCenter(coords);
		    } 
		}); 		
	});	
}


