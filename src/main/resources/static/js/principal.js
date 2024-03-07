let memberId = getPrincipal();
function getPrincipal(){
	let username = "";
	$.ajax({
		type : "get",
		url : "/user/principal",
		async : false,
		success : function(data){
			username = data;
		},
		error : function(){
			alert("에러");
		}
	});
	return username;
}

