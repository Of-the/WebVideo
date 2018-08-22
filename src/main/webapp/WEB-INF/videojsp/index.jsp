<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--<base href="http://localhost:8080/Voids/">--><base href=".">
 

<!-- base href="http://localhost:8080/video/" -->
<meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">

<meta name="renderer" content="webkit">
<meta name="keywords" content="Web前端视频教程,大数据视频教程,HTML5视频教程,UI视频教程,PHP视频教程,java视频教程,python基础教程">
<meta name="description" content="智游教育在线课程视频,为您提供java,python,HTML5,UI,PHP,大数据等学科经典视频教程在线浏览学习,精细化知识点解析,深入浅出,想学不会都难,智游教育,学习成就梦想！">

<link rel="stylesheet" href="./static/z/base.css">
<link rel="stylesheet" href="./static/z/css.css">
<link rel="icon" href="http://localhost:8080/Voids/static/z/favicon.png" type="image/png">
<title>index</title>
</head>
<body class="w100">
	<header>
	<div class="container">
		<span>欢迎来到视频学习管理系统！</span>
			<div id="regBlock" style="float: right">
				<c:if test="${empty email}">
				<a href="#" id="reg_open">
				<img src="./static/z/we.png">注册</a> 
				<a href="#" id="login_open">
				<img src="./static/z/we.png">登录</a>
				</c:if>
			   <c:if test="${not empty email}">
				<a href="forget.do?id=${email.userEmail}">
				<img src="./static/z/we.png">${email.userEmail}</a> 
				<a href="judgeuser.do" >
				<img src="./static/z/we.png">退出</a>
			</c:if>
			</div>
		<a onclick="addFavorite2()">
		<img src="./static/z/sc.png" draggable="false">加入收藏</a>
		 <a target="_blank" href="adminLogin.do">
		 <img src="./static/z/we.png" draggable="false" >后台管理</a> 
		 <a class="color_e4">
		</div>	 
	</div>
	</header>
	<!--banner图-->
	
	<div class="banner index-banner">
		<img alt="" src="./static/z/banner-2.jpg">
	</div>
	<!--模块化课程-->
	<div class="course">
		<div class="container">
			<p class="title">模块化课程，从入门到精通，大神并不遥远</p>
			<div class="course-info">
				<table cellspacing="10">
					<tbody>
					<tbody>
						<tr>
							<td colspan="2">
							<a href="webCourse.do?s_id=1"> <img src="./static/z/html5.jpg" alt="" class="image scale" draggable="false">
									<div class="headline">
										<span>Web前端教程</span> 
										<img src="./static/z/arrow.png" alt="">
									</div>
							</a></td>
							<td>
								<!--上线时修改id--> 
								<a href="webCourse.do?s_id=6">
								 <img src="./static/z/ui.jpg" alt="" class="image scale" draggable="false">
									<div class="headline">
										<span>UI设计教程</span>
										 <img src="./static/z/arrow.png" alt="">
									</div>
							</a>
							</td>
							<td rowspan="2" class="one_three">
							<a href="webCourse.do?s_id=2" class="opacity5"> 
							<img src="./static/z/java.jpg" alt="" class="image" draggable="false">
									<div class="headline">
										<span>Java教程</span>
										 <img src="./static/z/arrow.png" alt="">
									</div>
							</a></td>
						</tr>
						<tr>
							<td><a href="webCourse.do?s_id=3" class="opacity5"> 
							<img src="./static/z/bigdata.jpg" alt="" class="image" draggable="false">
									<div class="headline">
										<span>大数据教程</span>
										 <img src="./static/z/arrow.png" alt="">
									</div>
							</a></td>
							<td colspan="2">
							<a href="webCourse.do?s_id=10">
									<img src="./static/z/python.jpg" alt="" class="image scale" draggable="false">
									<div class="headline">
										<span>Python教程</span> 
										<img src="./static/z/arrow.png" alt="">
									</div>
							</a></td>
						</tr>
						<tr>
							<td colspan="2">
							<a href="webCourse.do?s_id=11">
									<img src="./static/z/php.jpg" alt="" class="image scale" draggable="false">
									<div class="headline">
										<span>PHP教程</span> <img src="./static/z/arrow.png" alt="">
									</div>
							</a></td>
							<td colspan="2" class="three_two"><img src="./static/z/qidai.jpg" alt="" class="image" draggable="false">
								<div class="headline">更多课程，敬请期待...</div></td>
						</tr>
					</tbody>
				</table>
				<!--马上试听-->
				<a onclick="pyRegisterCvt()" target="_blank" 
				href="http://wpa.qq.com/msgrd?v=3&amp;uin=2580094677&amp;site=qq&amp;menu=yes">
					<div class="audition">高级课程</div>
				</a>
			</div>
		</div>
	</div>



	<!--报名表单-->
	<div class="form_area">
		<div class="container">
			<p class="title">
				<b>这个世界上可以选择的很多，可以改变命运的选择很少<br>你现在准备好向梦想出发了吗？
				</b>
			</p>
			<form id="iform" action="http://localhost:8080/090/plus/dmail.php" enctype="multipart/form-data" method="post">
				<div class="form_line1"></div>
				<div class="form_line2"></div>
				<div class="wrap">
					<input name="action" value="post" type="hidden"> <input name="diyid" value="3" type="hidden"> <input name="do" value="2" type="hidden"> <input name="ip" value="" type="hidden"> <input name="time" value="" type="hidden">
					<div>
						<label for="name">姓名：</label><input name="name" id="name" class="form-control" type="text">
					</div>
					<div>
						<label for="tel">手机号：</label><input name="tel" id="tel" class="form-control" type="text">
					</div>
					<div>
						<label for="qq">QQ：</label><input name="qq" id="qq" class="form-control" type="text">
					</div>
				</div>
				<input class="button" value="联系我" type="submit">
			</form>
		</div>
	</div>


	<!--页脚-->
	<footer style="align-content: center;">
				Copyright &copy; 学生成绩管理系统 By LD
	</ul>
<!-- 		<li><img src="./static/z/footer_logo.png" alt="" draggable="false">
		</li>
		<li class="mt25">
			<h3>各校区地址</h3>
			<ul>
				<li>总部地址<br>中国-郑州经济技术开发区河南省通信产业园六层
				</li>
				<li>郑州校区一<br>中国-郑州经济技术开发区第一大街与经北一路
				</li>
				<li>郑州校区二<br>中国-郑州经济技术开发区第四大街经开人才市场七楼
				</li>
				<li>郑州校区三<br>中国-郑州经济技术开发区第八大街河南省留学生创业园九层、十层
				</li>
				<li>西安分校<br>中国-西安莲湖区 联系人：梁老师 13201570801
				</li>
			</ul>
		</li>
		<li class="mt25">
			<h3>联系我们</h3>
			<ul id="foo_icon">
				<li>中国-郑州经济技术开发区经北三路河南通信产业园六层</li>
				<li>e-mail:zy@zhiyou100.com</li>
				<li>电话:4006-371-555 0371-88888598</li>
				<li class="erwei"><br>
					<div>
						<img class="weixin" src="./static/z/a_002.png" alt="" draggable="false"> 
						<img class="weibo" src="./static/z/a.png" alt="" draggable="false">
					</div></li>
			</ul>
		</li>
	</ul>
	<div class="record">智游教育 © 豫ICP备17000832号-1 河南智游臻龙教育科技有限公司</div> -->
	</footer>


	<!--登录注册弹出框-->
	<div class="mask hidden" id="login">
		<div class="mask_content">
			<div class="mask_content_header">
				<img src="./static/z/logo.png" alt="" class="ma">
			</div>
			<div class="mask_content_body">
				<form id="loginForm" action="judgeuser.do">
					<h3>快速登录</h3>
					<input id="loginEmail" onblur="emaillogin()" placeholder="请输入邮箱" name="email" type="email"> 
					 
					<input id="loginPassword" placeholder="请输入密码" name="password" type="password">
					<div id="forget">
						<a href="forget.do?id=${user.userId}">忘记密码？</a>
					</div>
					<input onclick="commitLogin()"   value="登 录" type="submit">
				</form>
			</div>
			<div class="mask_content_footer">
				<span id="login_close">关 闭</span>
			</div>
		</div>
	</div>
	<div class="mask hidden" id="reg">
		<div class="mask_content">
			<div class="mask_content_header">
				<img src="./static/z/logo.png" alt="" class="ma">
			</div>
			<div class="mask_content_body">
				<form id="regForm" action="qiantai.do">
					<h3>新用户注册</h3>
					<input id="regEmail" placeholder="请输入邮箱" name="email" type="email">
					<span id="emailMsg"></span> 
					<input id="regPsw" placeholder="请输入密码" name="password" type="password"> 
					<input id="regPswAgain" placeholder="请再次输入密码" name="psw_again" type="password">
					<span id="passMsg"></span>
					<div id="yzm" class="form-inline">
						<input name="yzm" style="width: 45%; display: inline-block;" type="text">
						<div id="v_container" style="width: 45%; height: 40px; float: right;">
					</div>
					<input onclick="commitRegForm();" value="注　册" type="submit">
				</form>
			</div>
			<div class="mask_content_footer">
				<span id="reg_close">关 闭</span>
			</div>
		</div>
	</div>
	<script src="./static/z/jquery-1.js"></script>
	<script src="./static/z/gVerify.js"></script>
	<script src="./static/z/index.js"></script>
	
	<script type="text/javascript">
		function emaillogin() {
			$.ajax({
				url:"emaillogin.do",
				data:"email="+loginEmail.value,
				success:function(data){
					if (data=="0") {
						f1.innerHTML="帐号错误，请重新输入";
					}else {
						f1.innerHTML="";
					}
				}
			});			
		}
	</script>
	<c:if test="${log!=null}">
		<script type="text/javascript">
			alert("${log}");
		</script>

	</c:if>
</body>
</html>