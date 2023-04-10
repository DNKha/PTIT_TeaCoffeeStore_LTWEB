<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>

<div class="row">
	<div class="col-sm-5 text-left">
		<img class="detail-img-prod" src="/static/imgs/products/${prod.image}" />
	</div>
	<div class="col-sm-7">
		<ul class="detail-info-prod">
			<p>
				<br> <br>
			</p>
			<li>Tên: ${prod.name}</li>
			<li>Giá: <f:formatNumber value="${prod.unitPrice}"
					pattern="#,###.## đ" /></li>
			<li>Ngày nhập: <f:formatDate value="${prod.productDate}"
					pattern="dd-MM-yyyy" /></li>
			<li>Loại sản phẩm: ${prod.category.nameVN}</li>
			<li>quantity: ${prod.quantity}</li>
			<li>Giảm giá: <f:formatNumber value="${prod.discount}"
					pattern="percent"></f:formatNumber></li>
			<li>view count: ${prod.viewCount}</li>
			<li>Trạng thái: ${prod.available? 'Còn hàng':'Hết Hàng'}</li>
			<li>Sản phẩm đặt biệt: ${prod.special?'Đặc biệt':' '}</li>
		</ul>
		<div data-id="${p.id}" class="pull-left">
			<button class="btn btn-sm btn-danger click-star">
				<i class="glyphicon glyphicon-star"></i>
			</button>
			<button class="btn btn-sm btn-info click-open-dialog" data-toggle="modal" data-target="#myModal">
				<i class="glyphicon glyphicon-envelope"></i>
			</button>
		</div>
		<div data-id="${p.id}" class="pull-left">
			<button class="btn btn-sm btn-success">
				<i class="glyphicon glyphicon-shopping-cart btn-add-to-cart"> Mua Hàng</i>
			</button>
		</div>

	</div>
	<div class="text-justify">${prod.description}</div>

</div>

<ul class="nav nav-tabs">
	<li class="active"><a data-toggle="tab" href="#tab1">SẢN PHẦM LIÊN QUAN</a></li>
	<li><a data-toggle="tab" href="#tab2">SẢN PHẦM YÊU THÍCH</a></li>
	<li><a data-toggle="tab" href="#tab3">SẢN PHẦM ĐÃ XEM</a></li>
</ul>

<div class="tab-content">
	<div id="tab1" class="tab-pane fade in active">
		<div>
			<h3>SẢN PHẦM LIÊN QUAN</h3>
			<c:forEach var="p" items="${list}">
				<a href="/product/detail/${p.id}"> <img class="thumb-img-prod"
					src="/static/imgs/products/${p.image}" />
				</a>
			</c:forEach>
		</div>
	</div>
	<div id="tab2" class="tab-pane fade">
		<div>
			<h3>SẢN PHẦM YÊU THÍCH</h3>
			<c:forEach var="p" items="${favo}">
				<a href="/product/detail/${p.id}"> <img class="thumb-img-prod"
					src="/static/imgs/products/${p.image}" />
				</a>
			</c:forEach>
		</div>
	</div>
	<div id="tab3" class="tab-pane fade">
		<div>
			<h3>SẢN PHẦM ĐÃ XEM</h3>
			<c:forEach var="p" items="${viewed}">
				<a href="/product/detail/${p.id}"> <img class="thumb-img-prod"
					src="/static/imgs/products/${p.image}" />
				</a>
			</c:forEach>
		</div>

	</div>
</div>














