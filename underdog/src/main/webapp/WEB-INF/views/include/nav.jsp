<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Pinterest</title>

    <!-- Bootstrap Core CSS -->
    <link href="/resources/css/bootstrap.min.css" rel="stylesheet">

    <!-- Theme CSS -->
    <link href="/resources/css/freelancer.min.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/resources/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">
	<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet" />
	
	
	<!-- jQuery -->
    <script src="/resources/js/boot/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/resources/js/boot/bootstrap.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>

    <!-- Contact Form JavaScript -->
    <script src="/resources/js/boot/jqBootstrapValidation.js"></script>
    <script src="/resources/js/boot/contact_me.js"></script>

    <!-- Theme JavaScript -->
    <script src="/resources/js/boot/freelancer.min.js"></script>
	
	
<!--   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<!--   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> -->
<!--   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
	
	
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body id="page-top" class="index">

    <!-- Navigation -->
    <nav id="mainNav" class="navbar navbar-default navbar-fixed-top navbar-custom">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand" href="/">Pinterest</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li class="hidden">
                        <a href="#page-top"></a>
                    </li>
                    <li class="page-scroll">
                        <a href="#portfolio">능력자들</a>
                    </li>
                   
                    <li class="page-scroll">
						<li><a href="/mypage/mypage?me_email=${sessionScope.MEMBER.me_email}">마이페이지</a></li>
					</li>
					
					<li class="page-scroll">
						<button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">
							게시판 <span class="caret"></span>
						</button>
						<ul class="dropdown-menu" style="background-color: #2C3E50; width: 90px;">
							<li><a href="/board/slist?bo_bbsid=01" style="width: 90px;">공지사항</a></li>
							<li><a href="/board/slist?bo_bbsid=02" style="width: 90px;">자유게시판</a></li>
							<li><a href="/board/slist?bo_bbsid=03" style="width: 90px;">FAQ</a></li>
							<li><a href="/board/slist?bo_bbsid=04" style="width: 90px;">Q & A</a></li>
						</ul>
					</li>
					<li class="page-scroll">
                        <a href="#about">우리는</a>
                    </li>
                    <li class="page-scroll">
                        <a href="#contact">연락처</a>
                    </li>

					<li class="page-scroll">
						<button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">
						멤버십 <span class="caret"></span>
						</button>
						<ul class="dropdown-menu"
							style="background-color: #2C3E50; width: 90px;">
							<c:if test="${sessionScope.MEMBER == null}">
								<li><a href="/member/loginForm">로그인하기</a></li>
								<li><a href="/member/joinForm">회원 가입하기</a></li>
							</c:if>
							<c:if test="${sessionScope.MEMBER ne null }">
								<li><p>${sessionScope.MEMBER.me_name}님이입장하셨습니다.</p></li>
								<li><a
									href="/basket/view?me_email=${sessionScope.MEMBER.me_email}">장바구니</a></li>
								<li><a href="/member/logoutProc">로그아웃</a></li>
							</c:if>
							<c:if test="${sessionScope.MEMBER.me_grade eq 100}">
								<li><a href="/manager/manager">관리자모드</a></li>
							</c:if>
						</ul>
					</li>


<!-- 					<li class="page-scroll"> -->
<!--                         <a href="/member/loginForm">로그인</a> -->
<!--                     </li> -->
              
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>
    
