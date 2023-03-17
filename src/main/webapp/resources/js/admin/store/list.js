//매장목록 리스트
$.ajax({
	url: '/api/store/list',
	type: 'GET',
	async: false,
	cache: 'true',
	dataType: 'json',
	success: function(results) {
		const tbody = document.getElementById('tbody');
		let tr = document.createElement('tr');
		
		if(results.length === 0) {
				temp = '';
				temp += '<td colspan="7">등록된 매장이 없습니다</td>';	
					
				tr.innerHTML = temp;	
				tbody.append(tr);			
		} else {			
			for(let i=0; i<results.length; i++) {
				temp = '';
				temp += '<td>' + results[i].id + '</td>';
				temp += '<td>';
				temp += '    <a href="/store/view?id=' + results[i].id + '">' + results[i].storename + '</a>';
				temp += '</td>';
				temp += '<td>' + results[i].president + '</td>';
				temp += '<td>' + results[i].tel + '</td>';
				temp += '<td>' + results[i].addr1 + '</td>';
				temp += '<td>' + results[i].regdate + '</td>';
				temp += '<td>';
				temp += '    <a href="/store/view?id=' + results[i].id  + '"><i class="fa-solid fa-pen-to-square"></i></a>';
				temp += '    <a href="javascript:void(0);" onclick="deleteStore(' + results[i].id  + ')"><i class="fa-solid fa-trash-can"></i></a>';
				temp += '</td>';
				
				tr.innerHTML = temp;	
				tbody.append(tr);
				tr = document.createElement('tr');
			}			
		}
	}
});

const commands = document.querySelectorAll('button[type=button]');
commands.forEach(function(command) {
	command.addEventListener('click', function(e) {
		e.preventDefault();
	
		switch(command.value) {
			case "insert":
				location.href = '/store/write'; 
				break;
		}
		
		//버튼 수만큼 반복하므로 return을 하지 않으면 버튼 수만큼 반복 동작된다
		return;	
	});
})

//매장삭제
function deleteStore(id) {
	showModal(true, "매장을 삭제하시겠습니까?");
	const confirmBtn = document.getElementById('modal-confirm-btn');
	confirmBtn.addEventListener('click', function() {
		$.ajax({
			url: '/api/store/delete/' + id,
			type: 'GET',
			dataType: 'text',
			success: function(result) {
				if(result === 'success') {
					closeModal();
					location.href = '/store/list';
				}			
			} 
		});
	});	
}