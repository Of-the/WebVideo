<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!--<base href="http://localhost:8080/Voids/">-->
<base href=".">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>course</title>

<link href="./static/js/bootstrap.css" rel="stylesheet">

<script src="./static/js/jquery-1.js"></script>
<script src="./static/js/bootstrap.js"></script>
<script src="./static/js/confirm.js"></script>
<script src="./static/js/jquery.js"></script>
<script src="./static/js/message_cn.js"></script>

<style type="text/css">
th {
	text-align: center;
}
</style>
</head>

<body>
	<nav class="navbar-inverse">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand" href="">视频管理系统</a>
		</div>

		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-9">
			<ul class="nav navbar-nav">
				<li><a href="videoShow.do">视频管理</a></li>
				<li><a href="speakerShow.do">主讲人管理</a></li>
				<li class="active"><a href="courseShow.do">课程管理</a></li>
			</ul>
			<p class="navbar-text navbar-right">
				<span>${sessionScope.accounts}</span> 
				<i  class="glyphicon glyphicon-log-in" aria-hidden="true"></i>&nbsp;&nbsp;
				<a href="adminLogin.do" class="navbar-link">退出</a>
			</p>
		</div>
		<!-- /.navbar-collapse -->

	</div>
	<!-- /.container-fluid --> </nav>

	<div class="jumbotron" style="padding-top: 15px; padding-bottom: 15px;">
		<div class="container">
			<h2>课程管理</h2>
		</div>
	</div>

	<form action="deletecAll.do">
		<div class="container">
			<button onclick="showAddPage()" type="button"
				class="btn btn-info dropdown-toggle" data-toggle="dropdown"
				aria-haspopup="true" aria-expanded="false">添加</button>

			<button onclick="deleteAll()" type="submit" id="btn"
				class="btn btn-info dropdown-toggle">批量删除</button>
		</div>

		<div class="container" style="margin-top: 20px;">

			<table class="table table-bordered table-hover"
				style="text-align: center; table-layout: fixed;">
				<thead>
					<tr class="active">
						<th><input type="checkbox" id="all"></th>
						<th>序号</th>
						<th style="width: 16%">标题</th>
						<th style="width: 60%">简介</th>
						<th>编辑</th>
						<th>删除</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${allcourse}" var="course">
						<tr>
							<td><input type="checkbox" id="c${course.courseId}"
								value="${course.courseId}" name="ids"></td>
							<td>${course.courseId}</td>
							<td>${course.courseTitle }</td>
							<td
								style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">${course.courseDesc}</td>
							<td><a href="editorc.do?id=${course.courseId }">✎</a></td>
							<td><a onclick="deletec(${course.courseId })"
								id="a${course.courseId}">X</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
				<!-- <td colspan="6"> -->
				<font>总共${total}条,当前第${pageNum}页</font>
				<c:forEach var="i" begin="1" step="1" end="${lastPage}">
					<a href="courseShow.do?page=${i}"> ${i} </a>
				</c:forEach>
				<!--  </td> -->
</div>
		
	</form>
	<script type="text/javascript">
		    var arr = document.getElementsByName("ids");
		    var totol = arr.length;
		    var count = 0;
		
		$("input[id='all']").click(function () {
			if ($(this).prop('checked') == true) {
				$("input[id!='all']").prop('checked',true);
				$(btn).text('批量删除'+totol);
				count = totol;
			}else {
				$("input[id!='all']").prop('checked',false);
				$(btn).text('批量删除'+0);
				count = 0;
			}
			
		});
		
		$("input[id!='all']").click(function () {
			if ($(this).prop('checked') == true) {
				count  ++;
				
			}else {
				count --;
				$("input[id='all']").prop('checked',false);
				
			}
			if (count == totol) {
				$("input[id='all']").prop('checked',true);
			}
			$(btn).text('批量删除'+count);
		});
	
	</script>
	<script type="text/javascript">
		function deletec(a) {
			$.ajax({
				url:"deletec.do",
				data:"id="+a,
				success:function(){
					alert("确定删除该信息吗？")
					$("#a"+a).parent().parent().remove();
					
				}
			})
		}			
	</script>

	<script type="text/javascript">
		function showAddPage(){
			location.href="addCourse.do";
		}
		function delCourseById(Obj,id,title){

			Confirm.show('温馨提示：', '确定要删除'+title+'么？', {
				'Delete': {
					'primary': true,
					'callback': function() {
						var param={"id":id};
						$.post("admin/course/delCourse.action",param,function(data){
							if(data=='success'){
								Confirm.show('温馨提示：', '删除成功');
								$(Obj).parent().parent().remove();
							}else{
								Confirm.show('温馨提示：', '操作失败');
							}
						});
					}
				}
			});
		}
	</script>
	<script type="text/javascript">
	   window.onunload = initSpeakerSelect();
	   function initSpeakerSelect()
	    {
	        $.ajax({
	            type:'POST',
	            url: 'courseShow.do',
	        })
	    }
	  </script>

	<div id="modal-background" class=""></div>
	<div id="confirm-modal" class="modal fade role=" dialog"=""
		tabindex="-1">
		<div class="modal-dialog modal-undefined">
			<div class="modal-content">
				<div class="modal-header">
					<button id="modal-upper-close" class="close modal-close"
						aria-label="Close" type="button">
						<span aria-hidden="true">×</span>
					</button>
					<h4 id="modal-title" class="modal-title">Modal Title</h4>
				</div>
				<div id="modal-body" class="modal-body">Modal Message</div>
				<div id="modal-footer" class="modal-footer"></div>
			</div>
		</div>
	</div>
	<div id="modal-background" class=""></div>
</body>
</html>