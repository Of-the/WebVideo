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
<title>video</title>
	
<link href="./static/js/bootstrap.css" rel="stylesheet">

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
				<li class="active"><a href="videoShow.do">视频管理</a></li>
				<li><a href="speakerShow.do">主讲人管理</a></li>
				<li><a href="courseShow.do">课程管理</a></li>
			</ul>
			<p class="navbar-text navbar-right">
				<span>${sessionScope.accounts}</span> <i class="glyphicon glyphicon-log-in" aria-hidden="true">
				</i>&nbsp;&nbsp;<a href="adminLogin.do" class="navbar-link">退出</a>
			</p>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid -->
</nav>
	<div class="jumbotron" style="padding-top: 15px;padding-bottom: 15px;">
		<div class="container">
			<h2>视频管理</h2>
		</div>
	</div>
	<div class="container">	
		<div class="row">
			<div class="col-md-2">
					<button onclick="showAddPage()" type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		     		 添加
			</button>
			<button id="btn" class="btn btn-primary deleteVideos" type="submit">
					批量删除 <span class="badge" id="delNum">0</span>
				</button>
			</div>
			<div class="col-md-4"></div>
			<div class="col-md-6">
				<!-- 查询相关组件 -->
				<form class="navbar-form navbar-right" action="selectSome.do">
					<input name="videoTitle" class="form-control" placeholder="标题" type="text">
					<div class="btn-group">
						<button type="button" id="speakerName" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							--请选择老师--<span class="caret"></span>
						</button>
					
					 <ul class="dropdown-menu">
                        <c:forEach items="${allspeaker}" var="i">
                            <li value="${i.speakerId}">
                            <a href="#" onclick="showName(this,${i.speakerId},1)">${i.speakerName}</a></li>
                        </c:forEach>

                    </ul>
						 <input name="courseId" id="courseId" type="hidden" value="0"> 
						 <input name="speakerId" id="speakerId" type="hidden" value="0"> 
					</div>
					<div class="btn-group">
						<button type="button" id="courseName" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							--请选择课程--<span class="caret"></span>
						</button>
						  <ul class="dropdown-menu">
                        <c:forEach items="${allcourse}" var="i">
                            <li value="${i.courseId}">
                            <a href="#" onclick="showName(this,${i.courseId},2)">${i.courseTitle}</a></li>
                        </c:forEach	>	
                        </ul>		
					</div>
					<button type="submit" class="btn btn-info dropdown-toggle" >查询</button>
				</form>
			</div>
		</div>
	</div>
	<div class="container" style="margin-top: 20px;">
		<form action="deleteVAll.do" id="myform" method="get">
			<table class="table table-bordered table-hover" style="text-align: center;table-layout:fixed">
				<thead>
					<tr class="active">
						<th style="width:3%">
						<input onclick="selectAll(this)" id="checkAllId" type="checkbox"></th>
						<th style="width:5%">序号</th>
						<th style="width:15%">名称</th>
						<th style="width:42%;">介绍</th>
						<th>讲师</th>
						<th>时长</th>
						<th style="width:7%">播放次数</th>
						<th>编辑</th>
						<th>删除</th>
					</tr>
				</thead>
				<tbody>
			<c:forEach items="${allvideo }" var="i" >
			<tr>
			<td><input type="checkbox" onclick="selectOne(this)" id="a${i.getVideoId()}"  value="${i.getVideoId()}" name="ids"></td>
			<td>${i.videoId}</td>
			<td>${i.videoTitle}</td>
			<td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">${i.videoDesc}</td>
			<td>${i.speakerId}</td>
			<td>${i.videoTime}</td>
			<td>${i.videoPlayNum}</td>
			<td><a href="editorv.do?id=${i.videoId}">✎</a></td>
         	<td><a onclick="deletev(${i.videoId})" id="a${i.videoId}" >X</a></td>
			</tr>
			</c:forEach>	
					
		  <tr>
                <td colspan="2">
                    <font>总共${total}条,当前第${pageNum}页</font>
                    <c:forEach var="i" begin="1" step="1" end="${lastPage}" >
                        <a href="videoShow.do?page=${i}">  ${i} </a>
                    </c:forEach>
                </td>
            </tr>
				</tbody>
			</table>
			         
			           				
		</form>
	</div>

	<!-- å¦æIEçæ¬å°äº9ï¼å è½½ä»¥ä¸js,è§£å³ä½çæ¬å¼å®¹é®é¢ -->
<!--[if lt IE 9]>
<script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
<script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
<script src="./static/js/jquery-1.js"></script>
<script src="./static/js/bootstrap.js"></script>
<script src="./static/js/confirm.js"></script>
<script src="./static/js/jquery.js"></script>
<script src="./static/js/message_cn.js"></script>

	<script type="text/javascript">
		function deletev(a) {
			$.ajax({
				url : "deletev.do",
				data : "id=" + a,
				success : function() {
					alert("确定删除该信息吗？")
					$("#a" + a).parent().parent().remove();

				}
			})
		}	
	</script>
	<script type="text/javascript">
		function showAddPage() {
			location.href = "addVideo.do";
		}
		$(function() {
			$("#btn").click(function() {
				if (deleteNum > 0) {

					Confirm.show('溫馨提示', '您確定要刪除这' + deleteNum + '条记录嗎？', {
						'Delete' : {
							'primary' : true,
							'callback' : function() {
								//不是ajax，模拟提交
								$(myform).submit();
								//如果是一个正常表单的提交，按钮必须是type=submit,并且必须在form表单里面
							}
						}
					});

				}

			});

		});

		function delVideoById(obj, id, name) {

			Confirm.show('溫馨提示', '您確定要刪除' + name + '嗎？', {
				'Delete' : {
					'primary' : true,
					'callback' : function() {
						//此处需要调用ajax
						var params = {
							"id" : id
						};
						$.post("delVideo.action", params, function(data) {
							if (data == 'success') {
								Confirm.show('处理结果', '恭喜您删除成功');
								//请用js删除掉那条记录
								$(obj).parent().parent().remove();
							} else {
								Confirm.show('处理结果', '操作失败');
							}
						});

					}
				}
			});

			//阻止事件默认行为   a  href  onclick
			//先执行onclick  后跳转
			return false;
		}

		var deleteNum = 0;
		function selectAll(obj) {
			//dom  jquery
			var value = obj.checked;
			//alert(value);
			var arr = document.getElementsByName("ids");
			for (var i = 0; i < arr.length; i++) {
				arr[i].checked = value;
			}
			if (value) {
				deleteNum = arr.length;
			} else {
				deleteNum = 0;
			}

			$("#delNum").text(deleteNum);

		}

		function selectOne(obj) {
			if (obj.checked) {
				deleteNum += 1;
			} else {
				deleteNum -= 1;
				document.getElementById("checkAllId").checked = false;
			}

			if (deleteNum == 0) {
				document.getElementById("checkAllId").checked = false;
			}

			var arr = document.getElementsByName("ids");
			if (deleteNum == arr.length) {
				document.getElementById("checkAllId").checked = true;
			}

			$("#delNum").text(deleteNum);
		}

		//解决选择下拉框内容到输入框内容的问题
		function showName(obj, id, type) {
			var name = $(obj).text();

			if (type == 1) {
				$("#speakerName").html(name + "<span class='caret'></span>");
				$("#speakerId").val(id);
			} else {
				$("#courseName").html(name + "<span class='caret'></span>");
				$("#courseId").val(id);
			}

		}
	</script>
	<script type="text/javascript">
	   window.onunload = initCourseSelect();
	   function initCourseSelect()
	    {
	        $.ajax({
	            type:'POST',
	            url: 'videoShow.do',
	        })
	    }
	  </script>
		
<div id="modal-background" class=""></div>
<div id="confirm-modal" class="modal fade role=" dialog"="" tabindex="-1">
<div class="modal-dialog modal-undefined"><div class="modal-content">
<div class="modal-header">
<button id="modal-upper-close" class="close modal-close" aria-label="Close" type="button">
<span aria-hidden="true">×</span></button><h4 id="modal-title" class="modal-title">Modal Title</h4></div>
<div id="modal-body" class="modal-body"> Modal Message </div>
<div id="modal-footer" class="modal-footer"></div></div></div></div>
<div id="modal-background" class=""></div>
</body>
</html>