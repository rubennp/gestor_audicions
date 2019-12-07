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
			<h1 class="display-4">Benvingut/da!</h1>
			<div class="jumbotron d-flex justify-content-between align-items-center" style="background-color: #e6f2ff;">
				<div class="mr-5">
  					<p class="lead">Aquest és el gestor d'audicions de la teva escola de música</p>
  					<hr class="my-4">
  					<p>Ets administrador? Gestiona les audicions, professors i alumnes que hi intervenen!</p>
  					<p>Ets professor/a? Podràs consultar a quines audicions toquen els teus alumnes.</p>
  					<p>Ets alumne/a? Podràs consultar a quines audicions has de tocar!.</p>
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
