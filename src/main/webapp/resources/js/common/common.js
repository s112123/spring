//전체선택
function checkAll(selectedItem) {
	let items = document.querySelectorAll('input[name="selectedItem"]');
	items.forEach((item) => {
		item.checked = selectedItem.checked;
	});
}