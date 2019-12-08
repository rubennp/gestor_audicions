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
		<title>GA - Nou usuari</title>
	</head>
	<body class="container">
		<%@ include file = "header.jsp" %>
		<div class="container mt-2">
			<h1 class="display-4 text-center">Nou usuari</h1>
			<div class="jumbotron d-flex justify-content-between align-items-center" style="background-color: cornsilk;">
				<form:form action="${pageContext.request.contextPath}/admin/user/guarda" modelAttribute="user" method="post" class="form-group">
					<div class="container border pt-3 pl-3 pr-3 mb-3">
						<div class = "form-group row">
							<label for="username" class ="col-sm-2 col-form-label">Username</label>
							<div class="col-sm-10">
								<form:input path = "username" class = "form-control"/>
							</div>
						</div>
						<div class = "form-group row">
							<label for = "password" class = "col-sm-2 col-form-label">Contrassenya</label>
							<div class = "col-sm-10">
								<form:input type ="password" path = "password" class = "form-control" />
							</div>
						</div>
						<form:checkboxes items="${user.llistatAuthorities}" path="authorities"/>
					</div>
					<div class = "d-flex justify-content-end">
						<input type = "submit" value = "Guardar"  class = "btn btn-success mr-3" />
						<a  href = "${pageContext.request.contextPath}/admin/"
							class = "btn btn-outline-danger">Cancel·la</a>
						</div>
				</form:form>
			</div>
		</div>
		
		<!-- Bootstrap JS's -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	</body>
</html>