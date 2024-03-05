let memberId = getPrincipal();
console.log("유저정보 : " + memberId);
function getPrincipal(){
	let username = "";
	$.ajax({
		type : "get",
		url : "/user/principal",
		async : false,
		success : function(data){
			console.log(data);
			username = data;
		},
		error : function(){
			alert("에러");
		}
	});
	return username;
}