<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>


<c:forEach var="p" items="${list}">
<jsp:include page="dialog.jsp"/>
	<div class="col-sm-4">
		<div class="img-thumbnail pro-icon-wraper">
		
		<c:choose>
			<c:when test="${p.special}">
				<img class="pro-icon" src="/static/imgs/special.png">
			</c:when>
			<c:when test="${p.discount > 0}">
				<img class="pro-icon" src="/static/imgs/discount.png">
			</c:when>
			<c:when test="${p.available}">
				<img class="pro-icon" src="/static/imgs/newleft.gif">
			</c:when>
			<c:when test="${p.available == false}">
				<img class="pro-icon" src="/static/imgs/blank.png">
			</c:when>		
		</c:choose>
		
		
		
		
			<a href="/product/detail/${p.id}"> <img class="teastore-prod"
				src="/static/imgs/products/${p.image}">
			</a>
			
			<div class="caption">
				<p>${p.name}</p>

				<p> <f:formatNumber value="${p.unitPrice}"
					pattern="#,###.## đ" /></p>
				<div data-id="${p.id}" class="pull-right">
					<button class="btn btn-sm btn-danger click-star">
						<i class="glyphicon glyphicon-star"></i>
					</button>
					<button class="btn btn-sm btn-info click-open-dialog" data-toggle="modal" data-target="#myModal">
						<i class="glyphicon glyphicon-envelope"></i>
					</button>
				</div>
				<div data-id="${p.id}" class="pull-left">
					<button class="btn btn-sm btn-success ">
						<i class="glyphicon glyphicon-shopping-cart btn-add-to-cart"> Mua Hàng</i>
					</button>
				</div>
			</div>
			
		</div>
	</div>
</c:forEach>

