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
				<div class="mr-5">
  					<h2 class = "text-center">Els meus contactes</h2>
					<table class = "table table-hover table-bordered table-striped mb-4">
						<thead class = "thead-dark text-center">
							<tr>
								<th scope = "col">Usuari</th>
								<th scope = "col">Rols</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var = "user" items = "${users}">
								<!-- 
								<c:url var = "linkEditar" value = "/user/edita">
									<c:param name = "username" value = "${user.username}" />
								</c:url>
								<c:url var = "linkBorrar" value = "/user/borra">
									<c:param name = "username" value = "${user.username}" />
								</c:url>
								-->
								<tr>
									<th scope = "row" class = "text-center lead font-weight-normal text-info">${user.username}</th>
									<!-- 
									<td scope = "col">
										<c:forEach var = "rol" items = "${authorities}">
											<span>${rol.authority}</span>
										</c:forEach>
									</td>
									-->
									<!-- 
									<td scope = "col">${user.email}</td>
									<td scope = "col">${user.telefono}</td>
									<td scope = "col" class = "d-flex justify-content-center">
										<a  href = "${linkEditar}" 
											class = "btn btn-outline-success btn-sm mr-2">Editar</a>
										<a  href = "${linkBorrar}" 
											onclick = "if(!confirm('Està segur que vol eliminar el contacte?')) return false"
											class = "btn btn-outline-danger btn-sm">Eliminar</a>
									</td>
									-->
								</tr>
							</c:forEach>				
						</tbody>
					</table>
  				</div>
  				<img 
					src = "${pageContext.request.contextPath}/resources/img/logo240x240.png"
					alt = "logotip" height = "240"
				/>
			</div>
		</div>
		
		<!-- Bootstrap JS's -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	</body>
</html>
