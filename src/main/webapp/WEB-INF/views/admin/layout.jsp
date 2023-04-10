<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Administrator Tea & Coffee</title>
<tiles:insertAttribute name="head" />
</head>
<body>

	<div class="container">

		<!-- header -->
		<header class="row">
			<div align="center">
				<a href="/home/index"><img
					src="${pageContext.request.contextPath}/static/imgs/logo/logo_1.png"
					width="85px" height="65px" alt=""></a>
			</div>

		</header>

		<!-- menu -->
		<nav class="row">
			<tiles:insertAttribute name="menu" />
		</nav>



		<!-- body -->
		<div>
			<tiles:insertAttribute name="body" />






		</div>




	</div>
	
</body>
<!-- footer -->
	<footer class="row">
		<tiles:insertAttribute name="footer" />
	</footer>
</html>
