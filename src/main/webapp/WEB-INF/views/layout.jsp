<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Tea & Coffee</title>
<tiles:insertAttribute name="head" />
</head>
<!-- header -->
<header class="row">
	<tiles:insertAttribute name="header" />
	<!-- menu -->
	<nav class="row">
		<tiles:insertAttribute name="menu" />
	</nav>
</header>



<body>

	<div class="container">
	
		<!-- body -->

			<article class="col-sm-9">
				<tiles:insertAttribute name="body" />
			</article>


			<aside class="col-sm-3">
				<tiles:insertAttribute name="aside" />
			</aside>

		
	</div>
	
	<!-- footer -->
	<footer class="row">
		<tiles:insertAttribute name="footer" />
	</footer>
	
</body>
</html>
