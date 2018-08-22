<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" 
          uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>speaker</title>
<link href="./static/js/bootstrap.css" rel="stylesheet">
<script src="./static/js/jquery-1.js "></script>
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
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<a class="navbar-brand" href="videoShow.do">视频管理系统</a>
		</div>

		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-9">
			<ul class="nav navbar-nav">
				<li><a href="videoShow.do">视频管理</a></li>
				<li><a href="speakerShow.do">主讲人管理</a></li>
				<li><a href="courseShow.do">课程管理</a></li>
			</ul>
			<p class="navbar-text navbar-right">
				<span>${sessionScope.accounts}</span> <i class="glyphicon glyphicon-log-in" aria-hidden="true">
				</i>&nbsp;&nbsp;
				<a href="adminLogin.do" class="navbar-link">退出</a>
			</p>
		</div>
		<!-- /.navbar-collapse -->


	</div>
	<!-- /.container-fluid --> </nav>
	<div class="jumbotron" style="padding-top: 15px; padding-bottom: 15px;">
		<div class="container">
			<h2>主讲人管理</h2>
		</div>
	</div>
	<form action="deletesAll.do">
		<div class="container">
			<button onclick="showAddPage()" type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">添加</button>
			<button onclick="deleteAll()" type="submit" id="btn" class="btn btn-info dropdown-toggle">批量删除</button>
		</div>
		<div class="container" style="margin-top: 20px;">
			<table class="table table-bordered table-hover" style="text-align: center; table-layout: fixed;">
				<thead>
					<tr class="active">
						<th><input type="checkbox" id="all"></th>
						<th>序号</th>
						<th>名称</th>
						<th>职位</th>
						<th style="width: 60%;">简介</th>
						<th>编辑</th>
						<th>删除</th>
					</tr>
				</thead>
				<tbody>
							<c:forEach items="${allspeaker }" var="i" >
			<tr>
			<td><input type="checkbox" id="a${i.getSpeakerId()}" value="${i.getSpeakerId()}" name="ids"></td>
			<td>${i.speakerId}</td>
			<td>${i.speakerName}</td>
			<td>${i.speakerJob}</td>
			<td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">${i.speakerDesc}</td>
			<td><a href="editorSpeaker.do?id=${i.speakerId}">✎</a></td>
         	<td><a onclick="deletes(${i.speakerId})" id="a${i.speakerId}" >X</a></td>
			</tr>
			</c:forEach>
			<tr>
                <td colspan="3">
                    <font>总共${total}条,当前第${pageNum}页</font>
                    <c:forEach var="i" begin="1" step="1" end="${lastPage}" >
                        <a href="speakerShow.do?page=${i}">  ${i} </a>
                    </c:forEach>
                </td>
            </tr>
				</tbody>
			</table>
		</div>
	</form>		
	
<!-- 	<script type="text/javascript">
	   function deleteAll(){
		   if ($(":checkbox[name=ids:checked").size() == 0) {
				alert("请至少选择一条记录进行删除操作！");			
			} 
	    }
	  </script>  -->
	
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
		function deletes(a) {
			$.ajax({
				url : "deletes.do",
				data : "id=" + a,
				success : function() {
					alert("确定删除吗？")
					$("#a" + a).parent().parent().remove();
				}
			})
		}
		function showAddPage() {
			location.href = 'addSpeaker.do';
		}		 			
	</script>

<script type="text/javascript">
	   window.onunload = initSpeakerSelect();
	   function initSpeakerSelect()
	    {
	        $.ajax({
	            type:'POST',
	            url: 'speakerShow.do',
	        })
	    }
	  </script>
	
<div id="confirm-modal" class="modal fade role=" dialog"="" tabindex="-1">
<div class="modal-dialog modal-undefined"><div class="modal-content">
<div class="modal-header"><button id="modal-upper-close" class="close modal-close" aria-label="Close" type="button">
<span aria-hidden="true">×</span></button><h4 id="modal-title" class="modal-title">Modal Title</h4></div>
<div id="modal-body" class="modal-body"> Modal Message </div>
<div id="modal-footer" class="modal-footer"></div>
</div></div></div><div id="modal-background" class=""></div></body>

</html>