<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<nav class="navbar navbar-default">
	<div class="container-fluid">

		<ul class="nav navbar-nav">
			<li class="active"><a href="/admin/home/index">TRANG CHỦ</a></li>
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#">Quản Lý <span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="/admin/category/index">Loại Hàng</a></li>
					<li><a href="/admin/product/index">Sản Phẩm</a></li>
					<li><a href="/admin/customer/index">Tài Khoản</a></li>
					<li><a href="/admin/order/index">Đơn Hàng</a></li>
				</ul></li>
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#">Thống Kê<span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="/admin/report/inventory">Theo loại</a></li>
					<li><a href="/admin/revenue/category">Doanh Thu Theo Loại</a></li>
					<li><a href="/admin/revenue/customer">Doanh Thu Theo Khách</a></li>
					<li><a href="/admin/revenue/year">Doanh Thu Theo Năm</a></li>
					<li><a href="/admin/revenue/month">Doanh Thu Theo Tháng</a></li>
					<li><a href="/admin/revenue/quarter">Doanh Thu Theo Quý</a></li>
				</ul></li>
			<li><a href="/admin/home/logoff">Đăng Xuất</a></li>

			
		</ul>
	</div>
</nav>