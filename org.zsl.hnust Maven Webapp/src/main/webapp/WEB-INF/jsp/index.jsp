<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="zh">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>主页</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/Static/css/default.css"/>">
<link href='http://fonts.useso.com/css?family=Open+Sans:400,700' rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css" href="<c:url value="/Static/css/demo-1.css"/>">
<!--[if IE]>
	<script src="http://libs.useso.com/js/html5shiv/3.7/html5shiv.min.js"></script>
<![endif]-->

</head>
<body>
<div class="htmleaf-container">
	<div id="wrapper">
		<div class="menu">
			<img id="menu-bg" src="<c:url value="/Static/img/golden-gate-lights.jpg"/>" />
			<ul>
				<li><a href="">查询</a></li>
				<li><a href="">修改密码</a></li>
				<li><a href="login.jsp">退出</a></li>
					<!-- <li><a href="">Settings</a></li>
					<li><a href="">Contact</a></li> -->
			</ul>
		</div>

		<div class="screen">
			<div class="navbar"></div>
			<div class="list">
				<div class="item">
					<div class="img"></div>
					<span></span>
					<span></span>
					<span></span>
				</div>

				<div class="item">
					<div class="img"></div>
					<span></span>
					<span></span>
					<span></span>
				</div>

				<div class="item">
					<div class="img"></div>
					<span></span>
					<span></span>
					<span></span>
				</div>

				<div class="item">
					<div class="img"></div>
					<span></span>
					<span></span>
					<span></span>
				</div>
			</div>

			<div class="burger">
				<div class="x"></div>
				<div class="y"></div>
				<div class="z"></div>
			</div>
		</div>
	 </div>
</div>

<script src="<c:url value="/Static/js/stopExecutionOnTimeout.js?t=1"/>"></script>
<script src="<c:url value="/Static/js/jquery-2.1.1.min.js"/>" type="text/javascript"></script>
<script>
  if ('ontouchstart' in window) {
		var click = 'touchstart';
	} else {
		var click = 'click';
	}
	$('div.burger').on(click, function () {
		if (!$(this).hasClass('open')) {
			openMenu();
		} else {
			closeMenu();
		}
	});
	$('div.menu ul li a').on(click, function (e) {
		e.preventDefault();
		closeMenu();
	});
	function openMenu() {
		$('div.burger').addClass('open');
		$('div.y').fadeOut(100);
		$('div.screen').addClass('animate');
		setTimeout(function () {
			$('div.x').addClass('rotate30');
			$('div.z').addClass('rotate150');
			$('.menu').addClass('animate');
			setTimeout(function () {
				$('div.x').addClass('rotate45');
				$('div.z').addClass('rotate135');
			}, 100);
		}, 10);
	}
	function closeMenu() {
		$('div.screen, .menu').removeClass('animate');
		$('div.y').fadeIn(150);
		$('div.burger').removeClass('open');
		$('div.x').removeClass('rotate45').addClass('rotate30');
		$('div.z').removeClass('rotate135').addClass('rotate150');
		setTimeout(function () {
			$('div.x').removeClass('rotate30');
			$('div.z').removeClass('rotate150');
		}, 50);
		setTimeout(function () {
			$('div.x, div.z').removeClass('collapse');
		}, 70);
	}
</script>

</body>
</html>
