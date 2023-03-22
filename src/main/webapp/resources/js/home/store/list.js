const areas = document.querySelectorAll('.store-navbar a');
areas.forEach(function(area) {
	area.addEventListener('click', function() {
		location.href = '/store?area=' + area.innerText;
	});
});
