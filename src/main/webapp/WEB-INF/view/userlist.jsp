
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User List</title>
<style>
table {
	border-collapse: collapse;
	width: 100%;
}

th, td {
	border: 1px solid #dddddd;
	text-align: left;
	padding: 8px;
}

th {
	background-color: #f2f2f2;
}
</style>
</head>
<body>

	<h2>User List</h2>

	<c:choose>
		<c:when test="${userList != null}">
			<table class="table table-striped">
				<thead class="table-dark">
					<tr>
						<th>ID</th>
						<th>Username</th>
						<th>Name</th>
						<th>Gender</th>
						<th>Email</th>
						<th>Phone</th>
						<th>Type</th>
						<th>Point</th>
						<th>Status</th>
					</tr>

				</thead>
				<tbody>
					<c:forEach var="user" items="${userList}">
						<tr>
							<td>${user.id}</td>
							<td>${user.username}</td>
							<td>${user.name}</td>
							<td>${user.gender == 1 ? 'Male' : 'Female'}</td>
							<td>${user.email}</td>
							<td>${user.phone}</td>
							<td>${user.type}</td>
							<td>${user.point}</td>
							<td>${user.status == 1 ? 'Active' : 'Inactive'}</td>

						</tr>

					</c:forEach>
				</tbody>
			</table>
			<hr />

			



		</c:when>
		<c:otherwise>
			<p>아직 생성된 유저가 없습니다.</p>
		</c:otherwise>
	</c:choose>


</body>
</html>
