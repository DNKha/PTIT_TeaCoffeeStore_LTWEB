<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f" %>




<h2>DOANH THU NĂM NAY</h2>

<html>
  <head>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
        	['Tháng', 'Doanh thu'],
            <c:forEach var="e" items="${data}">
            ["${e[0]}",  ${e[2]}],
            </c:forEach>
          ]);
        var options = {
          chart: {
            title: 'Biểu đồ doanh thu theo tháng',
            //subtitle: 'Sales, Expenses, and Profit: 2014-2017',
          }
        };

        var chart = new google.charts.Bar(document.getElementById('columnchart_material'));

        chart.draw(data, google.charts.Bar.convertOptions(options));
      }
    </script>
  </head>
  <body>
    <div id="columnchart_material" style="width: 800px; height: 500px;"></div>
  </body>
</html>


<h2>ĐƠN HÀNG GẦN ĐÂY</h2>

<c:set var="base" value="/admin/order" scope="request" />
<table class="table table-hover">
	<thead>

		<tr>
			<th>Id</th>
			<th>Customer</th>
			<th>OrderDate</th>
			<th>Shipping Address</th>
			<th>Amount</th>
			<th>Confirm?</th>
			<th>Delete?</th>
		</tr>
		

	</thead>
	<tbody id = "tbody">
		<%-- <c:forEach var="e" items="${list}">
			<tr>
			<td>${e.id}</td>
			<td>${e.customer.id}</td>
			<td>${e.orderDate}</td>
			<td>${e.address}</td>
			<td><f:formatNumber value="${e.amount}"
					pattern="#,###.## đ" /></td>
			<td>${e.ttconfirm?'Yes':'No'}</td>
			<td>${e.ttdelete?'Yes':'No'}</td>
			<td>
				<a class="btn btn-sm btn-info" href="${base}/edit/${e.id}">Edit</a>
			</td>
		</tr>
		</c:forEach> --%>
	</tbody>
</table>



<ul class="pager">
  <li class="hide"><a><span id ="info"></span></a></li>
  
</ul>

<script>
	$(function(){
		var pageNo = 0 ;
		var pageCount = 0 ;
		var pageSize = 5;
		
		$.ajax({
			url:'/pager/order/page-count',
			success: function(response){
				pageCount = response;
				$(".pager a:eq(0)").click();
			}
		})
		
		$(".pager a:eq(0)").click(function(){
			pageNo=0;
			$.ajax({
				url:'/pager/order/page/'+pageNo,
				success: fnSuccess
			})
			return false;
		});
		
		
		$(".pager a:eq(1)").click(function(){
			if(pageNo >0){
				pageNo--;
				$.ajax({
					url:'/pager/order/page/'+pageNo,
					success: fnSuccess
				})
			}
			
			return false;
		});
		$(".pager a:eq(3)").click(function(){
			if(pageNo<pageCount-1){
				pageNo++;
				$.ajax({
					url:'/pager/order/page/'+pageNo,
					success: fnSuccess
				})
			}
			return false;
		});
		$(".pager a:eq(4)").click(function(){
			pageNo= pageCount - 1;
			$.ajax({
				url:'/pager/order/page/'+pageNo,
				success: fnSuccess
			})
			return false;
		});
		
		function fnSuccess(response){
			$("#tbody").html("");
			$(response).each(function(index, user){
				var tr = $("<tr/>");
				$("<td/>").html(user.id).appendTo(tr);
				$("<td/>").html(user.customer.id).appendTo(tr);
				$("<td/>").html(user.orderDate).appendTo(tr);
				$("<td/>").html(user.address).appendTo(tr);
				$("<td/>").html(user.amount).appendTo(tr);
				$("<td/>").html(user.ttconfirm?'Yes':'No').appendTo(tr);
				$("<td/>").html(user.ttdelete?'Yes':'No').appendTo(tr);
				var s=`<td class = "text center">
					<a class="btn btn-sm btn-info" href="/admin/order/edit/`+user.id+`">Edit</a>
				</td>`;
				$(s).appendTo(tr);
				tr.appendTo("#tbody");
				//console.log(tr.html());
				
				$("#info").html((pageNo+1)+'/'+pageCount);
			})
		}
		
		
	})
</script>



