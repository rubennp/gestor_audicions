<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="ca">
	<head>
		<meta charset="ISO-8859-1">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    	<!-- Bootstrap CSS -->
    	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<title>Gestor Audicions</title>
	</head>
	<body class="container">
		<%@ include file = "header.jsp" %>
		<div class="container mt-2">
			<h1 class="display-4 text-center">Administrador</h1>
			<div class="jumbotron d-flex justify-content-between align-items-center" style="background-color: cornsilk;">
				<table class = "table table-hover table-bordered table-striped mb-4">
					<thead class = "thead-dark text-center">
						<tr>
							<th scope = "col">Usuari</th>
							<th scope = "col">Rols</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var = "user" items = "${users}">
							<tr>
								<th scope = "row" class = "text-center lead font-weight-normal text-info">${user.username}</th>
								<th scope = "row" class = "text-center lead font-weight-normal text-info">
									<c:forEach var = "authority" items = "${user.authorities}">
										<c:if test="${authority.getAuthority() == 'ROLE_ADMIN'}">Administrador</c:if>
										<c:if test="${authority.getAuthority() == 'ROLE_PROFESSOR'}">Professor</c:if>
										<c:if test="${authority.getAuthority() == 'ROLE_ALUMNE'}">Alumne</c:if>
									</c:forEach>
								</th>
							</tr>
						</c:forEach>				
					</tbody>
				</table>
			</div>
		</div>
		
		<!-- Bootstrap JS's -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	</body>
</html>
