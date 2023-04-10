<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>

<body data-spy="scroll" data-target=".navbar" data-offset="50">
<%-- <div class="col-sm-3">
	<div class="embed-responsive embed-responsive-4by3">
		<iframe class="embed-responsive-item"
			src="${pageContext.request.contextPath}/static/imgs/delivery.png"></iframe>
	</div>
</div> --%>



<!--navbar navbar-default  navbar-fixed-top -->
<nav class="navbar navbar-default"></nav>
<nav class="navbar navbar-default"></nav>
<nav class="navbar navbar-default  navbar-fixed-top">
	<div  align="center">
		<a href="/home/index"><img
			src="${pageContext.request.contextPath}/static/imgs/logo/logo_1.png"
			width="85px" height="65px"  alt=""></a>
	</div>
	<div class="container-fluid">

		<ul class="nav navbar-nav">
		<c:set value="${pageContext.response.locale.language}" var="lang"/>
			<li class="active"><a href="/home/index">
				<s:message code="lyt.menu.home"/>
				</a></li>
				
			<%-- <li><c:forEach var="c" items="${cates}">
					<li><a href="/product/list-by-category/${c.id}" class="list-group-item">${(lang=='vi')?c.nameVN:c.name}</a></li>
			</c:forEach></li> --%>
			<li><a href="/product/list-by-category/1"><s:message code="lyt.menu.drinks"/></a></li>
			<li><a href="/product/list-by-category/4"><s:message code="lyt.menu.dessert"/></a></li>
			<li><a href="/product/list-by-category/5"><s:message code="lyt.menu.tea"/></a></li>
			<li><a href="/product/list-by-category/6"><s:message code="lyt.menu.coffee"/></a></li>
			<li><a href="/home/aboutus"><s:message code="lyt.menu.aboutus"/></a></li>
			
		</ul>
		<ul class="nav navbar-nav navbar-right">
			<c:if test="${ not empty sessionScope.user }">
				<li>
					<a>Hi ${user.fullname}</a>
				</li>
			</c:if>
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#"><s:message code="lyt.menu.account"/><span class="caret"></span></a>
				<c:choose>
					<c:when test="${empty sessionScope.user}">
						<ul class="dropdown-menu">
							<li><a href="/account/login"><s:message code="lyt.menu.account.login"/></a></li>
							<li><a href="/account/register"><s:message code="lyt.menu.account.register"/></a></li>
							<li><a href="/account/forgot"><s:message code="lyt.menu.account.forgot"/></a></li>
						</ul>
					</c:when>
					<c:otherwise>
						<ul class="dropdown-menu">
							<li><a href="/account/change"><s:message code="lyt.menu.account.change"/></a></li>
							<li><a href="/account/edit"><s:message code="lyt.menu.account.profile"/></a></li>
							<li><a href="/order/list"><s:message code="lyt.menu.account.order"/></a></li>
							<li><a href="/account/logoff"><s:message code="lyt.menu.account.logout"/></a></li>
							<li><a href="/order/items"><s:message code="lyt.menu.account.bought"/></a></li>
						</ul>
					</c:otherwise>
				</c:choose></li>
			<li><a href="#" data-lang= "vi">VN</a></li>
			<li><a href="#" data-lang= "en">ENG</a></li>

		</ul>
	</div>
</nav>



<script>
	$('a[data-lang]').click(function(){
		var lang = $(this).attr("data-lang");
		$.ajax({
			url:'/home/language?lang='+lang,
			success: function(){
				location.reload();
			}
		});
		return false;
		
	})
</script>






