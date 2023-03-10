//전체선택
function checkAll(checkedBox) {
	let items = document.querySelectorAll('input[name="selectItem[]"]');
	items.forEach((item) => {
		item.checked = checkedBox.checked;
	});
}