<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ca">
	<head>
		<meta charset="ISO-8859-1">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
		<title>Log In</title>
	</head>
	<body class = "container">
		<nav class="navbar sticky-top navbar-light">
			<div class="navbar-brand">
				<a href="${pageContext.request.contextPath}/">
					<img 
						src = "${pageContext.request.contextPath}/resources/img/logo240x240.png"
						alt = "logotip" height = "30" />
				</a>
				<span class="lead align-text-top pl-2 small font-weight-lighter">Gestor Audicions</span>
			</div>
			<form:form class="form-inline">
    			<a  class="btn btn btn-outline-secondary"
    				href="${pageContext.request.contextPath}">Inici</a>
  			</form:form>
  		</nav>
  		<div class="text-center m-5">
			<h1 class="display-1">Login</h1>
			<h2 class= "lead">Introdueixi les seves dades</h2>
		</div>
		<div class="d-flex justify-content-center">
			<div class = "col-6 jumbotron">
				<c:if test="${param.error!=null}">
					<div class="alert alert-danger">
						<strong>Error:</strong> Nom o contrassenya incorrectes.
					</div>
				</c:if>
				<c:if test="${param.logout!=null}">
					<div class="alert alert-warning">
						<strong>Sortir:</strong> Ha sortit del sistema.
					</div>
				</c:if>
				<form:form action="${pageContext.request.contextPath}/authenticateTheUser" method="POST">
					<div class="input-group mb-3">
						<div class="input-group-prepend w-25">
							<span class="input-group-text w-100">Usuari</span>
						</div>
						<input type="text" class="form-control" placeholder="Usuari" name="username">
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend w-25">
							<span class="input-group-text w-100">Contrassenya</span>
						</div>
						<input type="password" class="form-control" placeholder="Contrassenya" name="password">
					</div>
					<button type="submit" class="btn btn-lg btn-block btn-primary mt-5">Login</button>
				</form:form>
			</div>
		</div>
		
		<!-- Bootstrap JS's -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	</body>
</html>