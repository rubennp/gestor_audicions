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
    	<style>
    		.error {
    			font-size: 0.5em;
    			color: red;
    		}
    	</style>
		<title>GA - Nou usuari</title>
	</head>
	<body class="container">
		<%@ include file = "header.jsp" %>
		<div class="container mt-2">
			<h1 class="display-4 text-center">Nou usuari</h1>
			<h2 class="lead text-center">Dades d'usuari</h2>
			<form:form action="${pageContext.request.contextPath}/admin/user/guarda-usuari" modelAttribute="usuari" method="post">
				<c:url var="linkCancela" value = "/admin/user/cancela">
					<c:param name="username" value = "${username}" />
				</c:url>
				<div class="container border pt-3 pl-3 pr-3 mb-3" style="background-color: #f2f2f2;">
					<div class = "form-group row">
						<label for="username" class ="col-sm-2 col-form-label" style="color: #a0a0a0;"><em>USUARI</em></label>
						<div class="col-sm-10">
							<form:input path = "username" class = "form-control" disabled = "true" style="color: #a0a0a0;"/>
						</div>
					</div>
					<div class = "form-group row">
						<label for="nom" class ="col-sm-2 col-form-label">Nom</label>
						<div class="col-sm-10">
							<form:input path = "nom" class = "form-control"/>
							<form:errors path = "nom" cssClass = "error" element="div" />
						</div>
					</div>
					<div class = "form-group row">
						<label for="cognom1" class ="col-sm-2 col-form-label">Cognom 1</label>
						<div class="col-sm-10">
							<form:input path = "cognom1" class = "form-control"/>
							<form:errors path = "nom" cssClass = "error" />
						</div>
					</div>
					<div class = "form-group row">
						<label for="cognom2" class ="col-sm-2 col-form-label">Cognom 2</label>
						<div class="col-sm-10">
							<form:input path = "cognom2" class = "form-control"/>
							<form:errors path = "nom" cssClass = "error" />
						</div>
					</div>
					<div class = "form-group row">
						<label for="email" class ="col-sm-2 col-form-label">Email</label>
						<div class="col-sm-10">
							<form:input path = "email" class = "form-control"/>
							<form:errors path = "nom" cssClass = "error" />
						</div>
					</div>
				</div>
				<div class = "d-flex justify-content-end">
					<input type = "submit" value = "Guardar"  class = "btn btn-success mr-3" name="username" value="${username}"/>
					<a  href = "${linkCancela}" 
						onclick = "if(!confirm('Està segur que vol cancel·lar la creació de l'usuari [${username}]?')) return false"
						class = "btn btn-outline-danger">Cancel·lar</a>
				</div>
			</form:form>
		</div>
		
		<!-- Bootstrap JS's -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	</body>
</html>