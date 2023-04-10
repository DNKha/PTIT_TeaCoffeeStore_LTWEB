
<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>

<c:set var="cart" value="${sessionScope['scopedTarget.cartService']}" />


<div class="panel panel-success class">
	<div class="panel-body">
			<a href="/cart/view"><img id="cart-img" src="${pageContext.request.contextPath}/static/imgs/cart-icon.png"
				class="col-sm-5" alt=""></a>
			<ul class="col-sm-7">
				<li><b id="cart-cnt">${cart.count}</b> 
							<s:message code="lyt.cart.product"/>
						</li>
				<li><b id="cart-amt"> <f:formatNumber
							value="${cart.amount}" pattern="#,000" /></b> VND</li>
			</ul>
		</div>
</div>


<div class="panel panel-success class">
	<div class="panel-heading"><s:message code="lyt.search.title"/></div>
	<div class="panel-body">
		<form action="/product/list-by-keywords" method="post">
			<label> <input value="${param.keywords}" name="keywords"
				class="form-control" placeholder="Keywords">
			</label>
		</form>
	</div>
</div>

<div class="panel panel-success class">
	<div class="panel-heading">
		<s:message code="lyt.cate.title"/>
	</div>
	<div class="list-group">
	
	<c:set value="${pageContext.response.locale.language}" var="lang"/>
		<c:forEach var="c" items="${cates}">
			<a href="/product/list-by-category/${c.id}" class="list-group-item">${(lang=='vi')?c.nameVN:c.name}</a>
		</c:forEach>
	</div>
</div>

<div class="panel panel-success class">
	<div class="panel-heading"><s:message code="lyt.special.title"/></div>
	<div class="list-group">
		<a href="/product/list-by-special/0" class="list-group-item"><s:message code="lyt.special.new"/></a> 
		<a href="/product/list-by-special/1" class="list-group-item"><s:message code="lyt.special.bestsell"/></a> 
		<a href="/product/list-by-special/2" class="list-group-item"><s:message code="lyt.special.view"/></a> 
		<a href="/product/list-by-special/3" class="list-group-item"><s:message code="lyt.special.discount"/></a>
		<a href="/product/list-by-special/4" class="list-group-item"><s:message code="lyt.special.special"/></a>
		<!-- <a href="/product/list-by-special/5" class="list-group-item">Yêu Thích</a> -->
	</div>
</div>

<style id = "cart-css"></style>
