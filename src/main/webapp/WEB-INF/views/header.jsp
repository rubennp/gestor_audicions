<nav class="navbar sticky-top navbar-light">
	<div class="navbar-brand">
		<a href="${pageContext.request.contextPath}/">
		<img 
			src = "${pageContext.request.contextPath}/resources/img/logo240x240.png"
			alt = "logotip" height = "30" />
		</a>
		<span class="lead align-text-top pl-2 small font-weight-lighter">Gestor Audicions</span>
	</div>
	<sec:authorize access = "!isAuthenticated()">
		<form:form class="form-inline">
    		<a  class="btn btn-sm btn-outline-secondary"
    			href="${pageContext.request.contextPath}/login">Accedeix</a>
  		</form:form>
  	</sec:authorize>
  	<sec:authorize access = "isAuthenticated()">
  		<ul class="nav nav-pills">
  			<li class="nav-item dropdown">
  				<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button"aria-haspopup="true" aria-expanded="false">
  					<sec:authentication property = "name" />
  				</a>
  				<div class="dropdown-menu dropdown-menu-right dropdown-menu-left">
  					<a href="${pageContext.request.contextPath}/" class = "dropdown-item">Inici</a>
					<sec:authorize access = "hasRole('ADMIN')">
						<div class="dropdown-divider"></div>
						<a href="${pageContext.request.contextPath}/admin/" class="dropdown-item">Administra</a>
					</sec:authorize>
					<!--
					<sec:authorize access = "hasRole('PROFESSOR')">
						<a href="${pageContext.request.contextPath}/editor/" class="dropdown-item">P�gina d'Editor</a>
					</sec:authorize>
					<sec:authorize access = "hasRole('ALUMNE')">
						<a href="${pageContext.request.contextPath}/colaborador/" class="dropdown-item">P�gina de Col�laborador</a>
					</sec:authorize>
					-->
					<div class="dropdown-divider"></div>
  					<form:form action="${pageContext.request.contextPath}/logout" method="POST">
						<button type="submit" class="dropdown-item">Sortir</button>
					</form:form>
  				</div>
  			</li>
  		</ul>
  	</sec:authorize>
</nav>