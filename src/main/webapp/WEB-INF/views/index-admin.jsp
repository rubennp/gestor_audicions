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
		<title>GA - Llistat d'usuaris</title>
	</head>
	<body class="container">
		<%@ include file = "header.jsp" %>
		<div class="container mt-2">
			<h1 class="display-4 text-center">Llistat d'usuaris</h1>
			<div class="col-md-4 offset-md-4 mb-4">
				<a href="${pageContext.request.contextPath}/admin/user/nou/" class = "btn btn-primary btn-block btn-sm">Afegir usuari</a>
			</div>
			<table class = "table table-hover table-bordered table-striped table-sm">
				<thead class = "thead-dark text-center">
					<tr>
						<th scope = "col">Usuari</th>
						<th scope = "col">Nom</th>
						<th scope = "col">Cognoms</th>
						<th scope = "col">Email</th>
						<th scope = "col">Rols</th>
						<th scope = "col">Accions</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var = "usuari" items = "${usuaris}">
						<c:if test="${pageContext.request.userPrincipal.name != usuari.user.username}">
							<!-- <c:url var = "linkEditar" value = "/admin/user/edita">
								<c:param name = "username" value = "${usuari.user.username}" />
							</c:url> -->
							<c:url var = "linkBorrar" value = "/admin/user/borra">
								<c:param name = "username" value = "${usuari.user.username}" />
							</c:url>
							<tr>
								<td scope = "row" class = "lead font-weight-normal text-info">${usuari.user.username}</td>
								<td scope = "row" class = "lead font-weight-normal text-info">${usuari.nom}</td>
								<td scope = "row" class = "lead font-weight-normal text-info">${usuari.cognom1} ${usuari.cognom2}</td>
								<td scope = "row" class = "lead font-weight-normal text-info">${usuari.email}</td>
								<td scope = "row" class = "lead font-weight-normal text-info">
									<c:forEach var = "authority" items = "${usuari.user.authorities}">
										<c:if test="${authority.getAuthority() == 'ROLE_ADMIN'}">Administrador</c:if>
										<c:if test="${authority.getAuthority() == 'ROLE_PROFESSOR'}">Professor</c:if>
										<c:if test="${authority.getAuthority() == 'ROLE_ALUMNE'}">Alumne</c:if>
										<c:if test="${authority.getAuthority() == 'ROLE_USER'}">Sense rol</c:if>
									</c:forEach>
								</td>
								<td scope = "col" class = "d-flex justify-content-center">
									<!--  <a  href = "${linkEditar}" 
										class = "btn btn-outline-success btn-sm mr-2">Editar</a> -->
									<a  href = "${linkBorrar}" 
										onclick = "if(!confirm('Est� segur que vol eliminar usuari [${usuari.user.username}]?')) return false"
										class = "btn btn-outline-danger btn-sm">Eliminar</a>
								</td>
							</tr>
						</c:if>
					</c:forEach>				
				</tbody>
			</table>
		</div>
		
		<!-- Bootstrap JS's -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	</body>
</html>
