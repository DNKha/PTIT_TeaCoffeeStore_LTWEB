<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>



<table class="table table-hover">
	<thead>

		<tr>
			<th>Id</th>
			<th>Name</th>
			<th>NameVN</th>
		</tr>
		

	</thead>
	<tbody id = "tbody">
		
	</tbody>
</table>

<ul class="pager">
  <li class="#"><a href="#"><i class="glyphicon glyphicon-fast-backward"></i></a></li>
  <li class="#"><a href="#"><i class="glyphicon glyphicon-backward"></i></a></li>
   <li class="#"><a href="#"><span id ="info">5/15</span></a></li>
  <li class="#"><a href="#"><i class="glyphicon glyphicon-forward"></i></a></li>
  <li class="#"><a href="#"><i class="glyphicon glyphicon-fast-forward"></i></a></li>
</ul>

<script>
	$(function(){
		var pageNo = 0 ;
		var pageCount = 0 ;
		var pageSize = 2;
		
		$.ajax({
			url:'/pager/category/page-count',
			success: function(response){
				pageCount = response;
				$(".pager a:eq(0)").click();
			}
		})
		
		$(".pager a:eq(0)").click(function(){
			pageNo=0;
			$.ajax({
				url:'/pager/category/page/'+pageNo,
				success: fnSuccess
			})
			return false;
		});
		
		
		$(".pager a:eq(1)").click(function(){
			if(pageNo >0){
				pageNo--;
				$.ajax({
					url:'/pager/category/page/'+pageNo,
					success: fnSuccess
				})
			}
			
			return false;
		});
		$(".pager a:eq(3)").click(function(){
			if(pageNo<pageCount-1){
				pageNo++;
				$.ajax({
					url:'/pager/category/page/'+pageNo,
					success: fnSuccess
				})
			}
			return false;
		});
		$(".pager a:eq(4)").click(function(){
			pageNo= pageCount - 1;
			$.ajax({
				url:'/pager/category/page/'+pageNo,
				success: fnSuccess
			})
			return false;
		});
		
		function fnSuccess(response){
			$("#tbody").html("");
			$(response).each(function(index, category){
				var tr = $("<tr/>");
				$("<td/>").html(category.id).appendTo(tr);
				$("<td/>").html(category.name).appendTo(tr);
				$("<td/>").html(category.nameVN).appendTo(tr);
				var s=`<td class = "text center">
					<a class="btn btn-sm btn-info" href="/admin/category/edit/`+category.id+`">Edit</a>
					<a class="btn btn-sm btn-danger" href="/admin/category/delete/`+category.id+`">Delete</a>
				</td>`;
				$(s).appendTo(tr);
				tr.appendTo("#tbody");
				//console.log(tr.html());
				
				$("#info").html((pageNo+1)+'/'+pageCount);
			})
		}
		
		
	})
</script>