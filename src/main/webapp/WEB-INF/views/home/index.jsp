<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<!-- banner -->
<div class="row">
	<jsp:include page="/WEB-INF/views/layout/bannermain.jsp"></jsp:include>
</div>


<br>

<div class="panel panel-success class">
	<div class="panel-heading">
		<h3>
			<s:message code="lyt.home.index" />
		</h3>
	</div>
	<div class="panel-item">

		<ul class="nav nav-tabs">
			<li class="active"><a data-toggle="tab" href="#tab1"><s:message
						code="lyt.special.special" /></a></li>
			<li><a data-toggle="tab" href="#tab2"><s:message
						code="lyt.special.bestsell" /></a></li>
			<li><a data-toggle="tab" href="#tab3"><s:message
						code="lyt.special.discount" /></a></li>
		</ul>

		<div class="tab-content">
			<div id="tab1" class="tab-pane fade in active">
				<!-- Specials -->
				<div class="panel panel-default class">
					<div class="panel-heading">
						<!-- <s:message code="lyt.cate.title" /> -->
						<a href="/product/list-by-special/4"><s:message
								code="lyt.special.special" /></a>
						<div class="panel-body">
							<c:forEach var="p" items="${listSpecial}">
								<div class="col-sm-4">
									<div class="img-thumbnail pro-icon-wraper">
										<img class="pro-icon" src="/static/imgs/special.png"> <a
											href="/product/detail/${p.id}"> <img
											class="teastore-prod" src="/static/imgs/products/${p.image}">
										</a>

										<div class="caption">
											<a href="/product/detail/${p.id}">${p.name}</a>

											<p>
												<f:formatNumber value="${p.unitPrice}" pattern="#,###.## đ" />
											</p>
										</div>

									</div>
								</div>
							</c:forEach>
						</div>

					</div>
				</div>
			</div>
			<div id="tab2" class="tab-pane fade">

				<!-- Best seller -->
				<div class="panel panel-default class">
					<div class="panel-heading">
						<!-- <s:message code="lyt.cate.title" /> -->
						<a href="/product/list-by-special/4"><s:message
								code="lyt.special.bestsell" /></a>
						<div class="panel-body">
							<c:forEach var="p" items="${listBS}">
								<div class="col-sm-4">
									<div class="img-thumbnail pro-icon-wraper">
										<img class="pro-icon" src="/static/imgs/special.png"> <a
											href="/product/detail/${p.id}"> <img
											class="teastore-prod" src="/static/imgs/products/${p.image}">
										</a>

										<div class="caption">
											<a href="/product/detail/${p.id}">${p.name}</a>

											<p>
												<f:formatNumber value="${p.unitPrice}" pattern="#,###.## đ" />
											</p>
										</div>

									</div>
								</div>
							</c:forEach>
						</div>

					</div>
				</div>
			</div>
			<div id="tab3" class="tab-pane fade">
				<!-- DISCOUNT -->
				<div class="panel panel-default class">
					<div class="panel-heading">
						<!-- <s:message code="lyt.cate.title" /> -->
						<a href="/product/list-by-special/4"><s:message
								code="lyt.special.discount" /></a>
						<div class="panel-body">
							<c:forEach var="p" items="${listDC}">
								<div class="col-sm-4">
									<div class="img-thumbnail pro-icon-wraper">
										<img class="pro-icon" src="/static/imgs/special.png"> <a
											href="/product/detail/${p.id}"> <img
											class="teastore-prod" src="/static/imgs/products/${p.image}">
										</a>

										<div class="caption">
											<a href="/product/detail/${p.id}">${p.name}</a>

											<p>
												<f:formatNumber value="${p.unitPrice}" pattern="#,###.## đ" />
											</p>
										</div>

									</div>
								</div>
							</c:forEach>
						</div>

					</div>
				</div>

			</div>
		</div>

	</div>
</div>
