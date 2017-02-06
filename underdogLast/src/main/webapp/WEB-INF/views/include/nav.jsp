<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en" style="margin-top:140px;">

<head>

    <meta charset="utf-8">
    <meta name="robots" content="all,follow">
    <meta name="googlebot" content="index,follow,snippet,archive">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Obaju e-commerce template">
    <meta name="author" content="Ondrej Svestka | ondrejsvestka.cz">
    <meta name="keywords" content="">

    <title>
        Pinterest
    </title>

    <meta name="keywords" content="">

    <link href='http://fonts.googleapis.com/css?family=Roboto:400,500,700,300,100' rel='stylesheet' type='text/css'>

    <!-- styles -->
    <link href="/resources/css/font-awesome.css" rel="stylesheet">
    <link href="/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="/resources/css/animate.min.css" rel="stylesheet">
    <link href="/resources/css/owl.carousel.css" rel="stylesheet">
    <link href="/resources/css/owl.theme.css" rel="stylesheet">
	<link href="/resources/css/scrolling-nav.css" rel="stylesheet">
	
    <!-- theme stylesheet -->
    <link href="/resources/css/style.default.css" rel="stylesheet" id="theme-stylesheet">

    <!-- your stylesheet with modifications -->
    <link href="/resources/css/custom.css" rel="stylesheet">

    <script src="/resources/js/respond.min.js"></script>

    <link rel="shortcut icon" href="favicon.png">

	<!-- jQuery -->
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	
	<!--JS파일 -->
	<script src="/resources/js/member.js"></script>
	<script src="/resources/js/check.js"></script>

<script>       
 function mypage(){
 	alert("로그인 해주세요");
         location.href="/member/loginForm";     
 }
</script>

</head>

<body>

    <!-- *** NAVBAR ***
 _________________________________________________________ -->

    <div class="navbar navbar-default navbar-fixed-top yamm" role="navigation" id="navbar">
        <div class="container">
            <div class="navbar-header">

                <a class="navbar-brand home" href="/" data-animate-hover="bounce">
                    <img src="/resources/img/logo50.png" alt="Obaju logo" class="hidden-xs">
                    <img src="/resources/img/logo-small.png" alt="Obaju logo" class="visible-xs"><span class="sr-only">Obaju - go to homepage</span>
                </a>
                <div class="navbar-buttons">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navigation">
                        <span class="sr-only">Toggle navigation</span>
                        <i class="fa fa-align-justify"></i>
                    </button>
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#search">
                        <span class="sr-only">Toggle search</span>
                        <i class="fa fa-search"></i>
                    </button>
                    <a class="btn btn-default navbar-toggle" href="basket.html">
                        <i class="fa fa-shopping-cart"></i>  <span class="hidden-xs">3 items in cart</span>
                    </a>
                </div>
            </div>
            <!--/.navbar-header -->

            <div class="navbar-collapse collapse" id="navigation">

                <ul class="nav navbar-nav navbar-left">
                    <li class="dropdown yamm-fw">
                    	<a href="/" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="200">Home <b class="caret"></b></a>
                    </li>
                   
                    <li class="dropdown yamm-fw">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="200">Pinterest? <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                             <%@ include file="/WEB-INF/views/include/navManu.jsp"%>
                                <!-- /.yamm-content -->
                            </li>
                        </ul>
                    </li>
                    
                    <li class="dropdown yamm-fw">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="200">능력자들 <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                             <%@ include file="/WEB-INF/views/include/navManu.jsp"%>
                                <!-- /.yamm-content -->
                            </li>
                        </ul>
                    </li>
                    
                    <li class="dropdown yamm-fw">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="200">게시판 <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                              <%@ include file="/WEB-INF/views/include/navManu.jsp"%>
                                <!-- /.yamm-content -->
                            </li>
                        </ul>
                    </li>
                    
					<c:if test="${sessionScope.MEMBER == null }">
                    <li class="dropdown yamm-fw">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="200">멤버십 <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                              <%@ include file="/WEB-INF/views/include/navManu.jsp"%>
                                <!-- /.yamm-content -->
                            </li>
                        </ul>
                    </li>
                    </c:if>
                    
                    <c:if test="${sessionScope.MEMBER != null }">
                    <li class="dropdown yamm-fw">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="200">${sessionScope.MEMBER.me_name}님 <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                              <%@ include file="/WEB-INF/views/include/navManu.jsp"%>
                                <!-- /.yamm-content -->
                            </li>
                        </ul>
                    </li>
                    </c:if>
                  
                </ul>

            </div>
            <!--/.nav-collapse -->

            <div class="navbar-buttons">
			<c:if test="${sessionScope.MEMBER.me_email != null }">
                <div class="navbar-collapse collapse right" id="basket-overview" style="margin-left:10px;">
                    <a href="/basket/view?me_email=${sessionScope.MEMBER.me_email}" class="btn btn-primary navbar-btn"><i class="fa fa-shopping-cart" ></i><span class="hidden-sm">장바구니</span></a>
                </div>
            </c:if>    
                <!--/.nav-collapse -->

                <div class="navbar-collapse collapse right" id="search-not-mobile">
                    <button type="button" class="btn navbar-btn btn-primary" data-toggle="collapse" data-target="#search">
                        <span class="sr-only">Toggle search</span>
                        <i class="fa fa-search"></i>
                    </button>
                </div>

            </div>

            <div class="collapse clearfix" id="search">

                <form class="navbar-form" role="search">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Search">
                        <span class="input-group-btn">

			<button type="submit" class="btn btn-primary"><i class="fa fa-search"></i></button>

		    </span>
                    </div>
                </form>

            </div>
            <!--/.nav-collapse -->

        </div>
        <!-- /.container -->
    </div>
    <!-- /#navbar -->

    <!-- *** NAVBAR END *** -->


