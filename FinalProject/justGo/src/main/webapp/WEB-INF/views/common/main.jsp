<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- css -->
    <link rel="stylesheet" href="/resources/css/template/template.css"> <!-- 문서 기본 화면 배치/기본 폰트 등 기본 설정 -->
    <link rel="stylesheet" href="/resources/css/common/header.css">
    <link rel="stylesheet" href="/resources/css/common/main.css">
    <link rel="stylesheet" href="/resources/css/common/footer.css">

    <title>JustGo-main</title>

<!-- bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<!-- fontAwesome -->
    <script src="https://kit.fontawesome.com/ae1a88d4e2.js" crossorigin="anonymous"></script>
</head>
<body class="template--body">



<!-- ----------------------------------------------- -->

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<!-- ----------------------------------------------- -->


<!-- Template-main 시작 -->
<main class="template--main">
<aside class="template--leftAside"></aside>
<section class="template--Section">
    


<!-- 배너 시작 -->
<div class="common--bannerContainer">
    <div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-indicators">
        <c:choose>
            <c:when test="${empty loginMember}"> <%-- 로그인 안했을 때 --%>
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="3" aria-label="Slide 4"></button>
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="4" aria-label="Slide 5"></button>
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="5" aria-label="Slide 6"></button>
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="6" aria-label="Slide 7"></button>
            </c:when>
            <c:otherwise> <%-- 로그인했을 때 --%>
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="3" aria-label="Slide 4"></button>
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="4" aria-label="Slide 5"></button>
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="5" aria-label="Slide 6"></button>
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="6" aria-label="Slide 7"></button>
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="7" aria-label="Slide 8"></button>
            </c:otherwise>
        </c:choose>
        </div>
        <div class="carousel-inner">
            <c:choose>
                <c:when test="${empty loginMember}"> <%-- 로그인 안했을 때 --%>
                    <div class="carousel-item active" data-bs-interval="5000">
                        <a href="https://www.australia.com/ko-kr" target="_blank"> <%-- 호주 관광청 --%>
                            <img src="/resources/images/officialBanner/BANNERAUSTRALIA.png" class="d-block w-100" alt="호주 배너">
                        </a>
                        <div class="carousel-caption d-none d-md-block">
                            <h1 class="common--bannerText">AUSTRALIA</h1>
                            <p class="common--bannerWelcome">
                            <c:if test="${!empty sessionScope.loginMember}">
                                ${loginMember.memberNickname}님, 환영합니다.
                            </c:if>
                            즐거운 여행 커뮤니티 JustGo에 어서오세요.</p>
                        </div>
                    </div>
                </c:when>
                <c:otherwise> <%-- 로그인했을 때 --%>
                    <div class="carousel-item active" data-bs-interval="5000">
                        <a href="http://vietnamtourism.or.kr/" target="_blank">
                            <img src="/resources/images/officialBanner/BANNERWELCOME.png" class="d-block w-100" alt="베트남 배너">
                        </a>
                        <div class="carousel-caption d-none d-md-block">
                            <h1 class="common--bannerText" style="text-align: center;">${loginMember.memberNickname}님, 환영합니다!</h1>
                            <p class="common--bannerWelcome">JustGo에서 즐거운 시간 보내세요!</p>
                        </div>
                    </div>
                    <div class="carousel-item" data-bs-interval="5000">
                        <a href="https://www.australia.com/ko-kr" target="_blank"> <%-- 호주 관광청 --%>
                            <img src="/resources/images/officialBanner/BANNERAUSTRALIA.png" class="d-block w-100" alt="호주 배너">
                        </a>
                        <div class="carousel-caption d-none d-md-block">
                            <h1 class="common--bannerText">AUSTRALIA</h1>
                            <p class="common--bannerWelcome">
                            <c:if test="${!empty sessionScope.loginMember}">
                                ${loginMember.memberNickname}님, 환영합니다.
                            </c:if>
                            즐거운 여행 커뮤니티 JustGo에 어서오세요.</p>
                        </div>
                    </div>
                </c:otherwise>
            </c:choose>
            <div class="carousel-item" data-bs-interval="5000">
                <a href="https://www.visitbeijing.or.kr/" target="_blank"> <%-- 베이징 관광청 --%>
                    <img src="/resources/images/officialBanner/BANNERBEIJING.png" class="d-block w-100" alt="베이징 배너">
                </a>
                <div class="carousel-caption d-none d-md-block">
                    <h1 class="common--bannerText">BEIJING</h1>
                    <p class="common--bannerWelcome">
                    <c:if test="${!empty sessionScope.loginMember}">
                        ${loginMember.memberNickname}님, 환영합니다.
                    </c:if>
                    즐거운 여행 커뮤니티 JustGo에 어서오세요.</p>
                </div>
            </div>
            <div class="carousel-item" data-bs-interval="5000">
                <a href="https://www.kyototourism.org/ko/" target="_blank"> <%-- 교토 관광청 --%>
                    <img src="/resources/images/officialBanner/BANNERKYOTO.png" class="d-block w-100" alt="교토 배너">
                </a>
                <div class="carousel-caption d-none d-md-block">
                    <h1 class="common--bannerText">KYOTO</h1>
                    <p class="common--bannerWelcome">
                    <c:if test="${!empty sessionScope.loginMember}">
                        ${loginMember.memberNickname}님, 환영합니다.
                    </c:if>
                    즐거운 여행 커뮤니티 JustGo에 어서오세요.</p>
                </div>
            </div>
            <div class="carousel-item" data-bs-interval="5000">
                <a href="https://ko.meet-in-shanghai.net/" target="_blank"> <%-- 상하이 관광청 --%>
                    <img src="/resources/images/officialBanner/BANNERSHANGHAI.png" class="d-block w-100" alt="상하이 배너">
                </a>
                <div class="carousel-caption d-none d-md-block">
                    <h1 class="common--bannerText">SHANGHAI</h1>
                    <p class="common--bannerWelcome">
                    <c:if test="${!empty sessionScope.loginMember}">
                        ${loginMember.memberNickname}님, 환영합니다.
                    </c:if>
                    즐거운 여행 커뮤니티 JustGo에 어서오세요.</p>
                </div>
            </div>
            <div class="carousel-item" data-bs-interval="5000">
                <a href="http://www.visitthailand.or.kr/thai/" target="_blank"> <%-- 태국 관광청 --%>
                    <img src="/resources/images/officialBanner/BANNERTHAI.png" class="d-block w-100" alt="태국 배너">
                </a>
                <div class="carousel-caption d-none d-md-block">
                    <h1 class="common--bannerText">THAI</h1>
                    <p class="common--bannerWelcome">
                    <c:if test="${!empty sessionScope.loginMember}">
                        ${loginMember.memberNickname}님, 환영합니다.
                    </c:if>
                    즐거운 여행 커뮤니티 JustGo에 어서오세요.</p>
                </div>
            </div>
            <div class="carousel-item" data-bs-interval="5000">
                <a href="https://www.gotokyo.org/kr/index.html" target="_blank"> <%-- 도쿄 관광청 --%>
                    <img src="/resources/images/officialBanner/BANNERTOKYO.png" class="d-block w-100" alt="도쿄 배너">
                </a>
                <div class="carousel-caption d-none d-md-block">
                    <h1 class="common--bannerText">TOKYO</h1>
                    <p class="common--bannerWelcome">
                    <c:if test="${!empty sessionScope.loginMember}">
                        ${loginMember.memberNickname}님, 환영합니다.
                    </c:if>
                    즐거운 여행 커뮤니티 JustGo에 어서오세요.</p>
                </div>
            </div>
            <div class="carousel-item" data-bs-interval="5000">
                <a href="http://vietnamtourism.or.kr/" target="_blank"> <%-- 베트남 관광청 --%>
                    <img src="/resources/images/officialBanner/BANNERVIETNAM.png" class="d-block w-100" alt="베트남 배너">
                </a>
                <div class="carousel-caption d-none d-md-block">
                    <h1 class="common--bannerText">VIETNAM</h1>
                    <p class="common--bannerWelcome">
                    <c:if test="${!empty sessionScope.loginMember}">
                        ${loginMember.memberNickname}님, 환영합니다.
                    </c:if>
                    즐거운 여행 커뮤니티 JustGo에 어서오세요.</p>
                </div>
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
</div>
<!-- 배너 끝 -->



<!-- 인기게시글 시작 -->
<div class="accordion common--boardListContainer" id="accordionPanelsStayOpenExample">
    <div class="accordion-item">
        <h2 class="accordion-header">
            <button class="accordion-button" type="button" data-bs-toggle="collapse"
                data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true"
                aria-controls="panelsStayOpen-collapseOne">
                <i class="fa-solid fa-fire" style="color:red; font-size:20px; padding-top: 4px;"></i>
                <div class="common--boardListTitle">인기게시글</div>
            </button>
        </h2>
        <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse show">
            <div class="accordion-body common--boardCards">
                <div class="card common--boardCard" style="width: 15rem;">
                    <a href="https://www.google.com" class="common--boardListContent">
                    <div class="common--boardListImageContainer">
                        <img src="/resources/images/officialBanner/BANNERAUSTRALIA.png" class="card-img-top" alt="게시글 사진 1">
                    </div>
                    <div class="card-body common--boardCardBottom">
                        <p class="card-text">
                            사이판에서 생긴 일
                        </p>
                        <nav class="common--boardListLikeBox">
                            <i class="fa-solid fa-eye right-align">&nbsp123</i>
                            <i class="fa-solid fa-heart right-align">&nbsp321</i>
                        </nav>
                    </div>
                    </a>
                </div>
                <div class="card common--boardCard" style="width: 15rem;">
                    <a href="https://www.google.com" class="common--boardListContent">
                    <div class="common--boardListImageContainer">
                        <img src="/resources/images/officialProfile/GITHUBICON.png" class="card-img-top" alt="게시글 사진 2">
                    </div>
                    <div class="card-body common--boardCardBottom">
                        <p class="card-text">
                            이럴 때는 어떻게 처리해야 하나요?
                        </p>
                        <nav class="common--boardListLikeBox">
                            <i class="fa-solid fa-eye right-align">&nbsp123</i>
                            <i class="fa-solid fa-heart right-align">&nbsp321</i>
                        </nav>
                    </div>
                    </a>
                </div>
                <div class="card common--boardCard" style="width: 15rem;">
                    <a href="https://www.google.com" class="common--boardListContent">
                    <div class="common--boardListImageContainer">
                        <img src="/resources/images/officialImages/JUSTGO_OFFICIAL_LOGO.png" class="card-img-top" alt="게시글 사진 3">
                    </div>
                    <div class="card-body common--boardCardBottom">
                        <p class="card-text">
                            [일본 게시판 공식]일본 여행 추천지와 맛집 리스트 정리입니다.
                        </p>
                        <nav class="common--boardListLikeBox">
                            <i class="fa-solid fa-eye right-align">&nbsp123</i>
                            <i class="fa-solid fa-heart right-align">&nbsp321</i>
                        </nav>
                    </div>
                    </a>
                </div>
                <div class="card common--boardCard" style="width: 15rem;">
                    <a href="https://www.google.com" class="common--boardListContent">
                    <div class="common--boardListImageContainer">
                        <img src="/resources/images/officialBanner/BANNERKYOTO.png" class="card-img-top" alt="게시글 사진 4">
                    </div>
                    <div class="card-body common--boardCardBottom">
                        <p class="card-text">
                            여권을 잃어버렸을 때 조치 방법
                        </p>
                        <nav class="common--boardListLikeBox">
                            <i class="fa-solid fa-eye right-align">&nbsp123</i>
                            <i class="fa-solid fa-heart right-align">&nbsp321</i>
                        </nav>
                    </div>
                    </a>
                </div>
                <div class="card common--boardCard" style="width: 15rem;">
                    <a href="https://www.google.com" class="common--boardListContent">
                    <div class="common--boardListImageContainer">
                        <img src="/resources/images/officialFlag/CHINAFLAG.png" class="card-img-top" alt="게시글 사진 5">
                    </div>
                    <div class="card-body common--boardCardBottom">
                        <p class="card-text">
                            방콕행 비행기 세일한다고 하네요
                        </p>
                        <nav class="common--boardListLikeBox">
                            <i class="fa-solid fa-eye right-align">&nbsp123</i>
                            <i class="fa-solid fa-heart right-align">&nbsp321</i>
                        </nav>
                    </div>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 인기게시글 끝 -->



<!-- 맛집게시글 시작 -->
<div class="accordion common--boardListContainer" id="accordionPanelsStayOpenExample">
    <div class="accordion-item">
        <h2 class="accordion-header">
            <button class="accordion-button" type="button" data-bs-toggle="collapse"
                data-bs-target="#panelsStayOpen-collapseTwo" aria-expanded="true"
                aria-controls="panelsStayOpen-collapseTwo">
                <i class="fa-solid fa-burger" style="color:orange; font-size:20px; padding-top: 4px;"></i>
                <div class="common--boardListTitle">맛집 태그 인기게시글</div>
            </button>
        </h2>
        <div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse show">
            <div class="accordion-body common--boardCards">
                <div class="card common--boardCard" style="width: 15rem;">
                    <a href="https://www.google.com" class="common--boardListContent">
                    <div class="common--boardListImageContainer">
                        <img src="/resources/images/officialBanner/BANNERAUSTRALIA.png" class="card-img-top" alt="게시글 사진 1">
                    </div>
                    <div class="card-body common--boardCardBottom">
                        <p class="card-text">
                            사이판에서 생긴 일
                        </p>
                        <nav class="common--boardListLikeBox">
                            <i class="fa-solid fa-eye right-align">&nbsp123</i>
                            <i class="fa-solid fa-heart right-align">&nbsp321</i>
                        </nav>
                    </div>
                    </a>
                </div>
                <div class="card common--boardCard" style="width: 15rem;">
                    <a href="https://www.google.com" class="common--boardListContent">
                    <div class="common--boardListImageContainer">
                        <img src="/resources/images/officialProfile/GITHUBICON.png" class="card-img-top" alt="게시글 사진 2">
                    </div>
                    <div class="card-body common--boardCardBottom">
                        <p class="card-text">
                            이럴 때는 어떻게 처리해야 하나요?
                        </p>
                        <nav class="common--boardListLikeBox">
                            <i class="fa-solid fa-eye right-align">&nbsp123</i>
                            <i class="fa-solid fa-heart right-align">&nbsp321</i>
                        </nav>
                    </div>
                    </a>
                </div>
                <div class="card common--boardCard" style="width: 15rem;">
                    <a href="https://www.google.com" class="common--boardListContent">
                    <div class="common--boardListImageContainer">
                        <img src="/resources/images/officialImages/JUSTGO_OFFICIAL_LOGO.png" class="card-img-top" alt="게시글 사진 3">
                    </div>
                    <div class="card-body common--boardCardBottom">
                        <p class="card-text">
                            [일본 게시판 공식]일본 여행 추천지와 맛집 리스트 정리입니다.
                        </p>
                        <nav class="common--boardListLikeBox">
                            <i class="fa-solid fa-eye right-align">&nbsp123</i>
                            <i class="fa-solid fa-heart right-align">&nbsp321</i>
                        </nav>
                    </div>
                    </a>
                </div>
                <div class="card common--boardCard" style="width: 15rem;">
                    <a href="https://www.google.com" class="common--boardListContent">
                    <div class="common--boardListImageContainer">
                        <img src="/resources/images/officialBanner/BANNERKYOTO.png" class="card-img-top" alt="게시글 사진 4">
                    </div>
                    <div class="card-body common--boardCardBottom">
                        <p class="card-text">
                            여권을 잃어버렸을 때 조치 방법
                        </p>
                        <nav class="common--boardListLikeBox">
                            <i class="fa-solid fa-eye right-align">&nbsp123</i>
                            <i class="fa-solid fa-heart right-align">&nbsp321</i>
                        </nav>
                    </div>
                    </a>
                </div>
                <div class="card common--boardCard" style="width: 15rem;">
                    <a href="https://www.google.com" class="common--boardListContent">
                    <div class="common--boardListImageContainer">
                        <img src="/resources/images/officialFlag/CHINAFLAG.png" class="card-img-top" alt="게시글 사진 5">
                    </div>
                    <div class="card-body common--boardCardBottom">
                        <p class="card-text">
                            방콕행 비행기 세일한다고 하네요
                        </p>
                        <nav class="common--boardListLikeBox">
                            <i class="fa-solid fa-eye right-align">&nbsp123</i>
                            <i class="fa-solid fa-heart right-align">&nbsp321</i>
                        </nav>
                    </div>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 맛집게시글 끝 -->



<!-- 꿀팁게시글 시작 -->
<div class="accordion common--boardListContainer" id="accordionPanelsStayOpenExample">
    <div class="accordion-item">
        <h2 class="accordion-header">
            <button class="accordion-button" type="button" data-bs-toggle="collapse"
                data-bs-target="#panelsStayOpen-collapseThree" aria-expanded="true"
                aria-controls="panelsStayOpen-collapseThree">
                <i class="fa-solid fa-bolt" style="color:yellow; font-size:20px; padding-top: 4px;"></i>
                <div class="common--boardListTitle">꿀팁 태그 인기게시글</div>
            </button>
        </h2>
        <div id="panelsStayOpen-collapseThree" class="accordion-collapse collapse show">
            <div class="accordion-body common--boardCards">
                <div class="card common--boardCard" style="width: 15rem;">
                    <a href="https://www.google.com" class="common--boardListContent">
                    <div class="common--boardListImageContainer">
                        <img src="/resources/images/officialBanner/BANNERAUSTRALIA.png" class="card-img-top" alt="게시글 사진 1">
                    </div>
                    <div class="card-body common--boardCardBottom">
                        <p class="card-text">
                            사이판에서 생긴 일
                        </p>
                        <nav class="common--boardListLikeBox">
                            <i class="fa-solid fa-eye right-align">&nbsp123</i>
                            <i class="fa-solid fa-heart right-align">&nbsp321</i>
                        </nav>
                    </div>
                    </a>
                </div>
                <div class="card common--boardCard" style="width: 15rem;">
                    <a href="https://www.google.com" class="common--boardListContent">
                    <div class="common--boardListImageContainer">
                        <img src="/resources/images/officialProfile/GITHUBICON.png" class="card-img-top" alt="게시글 사진 2">
                    </div>
                    <div class="card-body common--boardCardBottom">
                        <p class="card-text">
                            이럴 때는 어떻게 처리해야 하나요?
                        </p>
                        <nav class="common--boardListLikeBox">
                            <i class="fa-solid fa-eye right-align">&nbsp123</i>
                            <i class="fa-solid fa-heart right-align">&nbsp321</i>
                        </nav>
                    </div>
                    </a>
                </div>
                <div class="card common--boardCard" style="width: 15rem;">
                    <a href="https://www.google.com" class="common--boardListContent">
                    <div class="common--boardListImageContainer">
                        <img src="/resources/images/officialImages/JUSTGO_OFFICIAL_LOGO.png" class="card-img-top" alt="게시글 사진 3">
                    </div>
                    <div class="card-body common--boardCardBottom">
                        <p class="card-text">
                            [일본 게시판 공식]일본 여행 추천지와 맛집 리스트 정리입니다.
                        </p>
                        <nav class="common--boardListLikeBox">
                            <i class="fa-solid fa-eye right-align">&nbsp123</i>
                            <i class="fa-solid fa-heart right-align">&nbsp321</i>
                        </nav>
                    </div>
                    </a>
                </div>
                <div class="card common--boardCard" style="width: 15rem;">
                    <a href="https://www.google.com" class="common--boardListContent">
                    <div class="common--boardListImageContainer">
                        <img src="/resources/images/officialBanner/BANNERKYOTO.png" class="card-img-top" alt="게시글 사진 4">
                    </div>
                    <div class="card-body common--boardCardBottom">
                        <p class="card-text">
                            여권을 잃어버렸을 때 조치 방법
                        </p>
                        <nav class="common--boardListLikeBox">
                            <i class="fa-solid fa-eye right-align">&nbsp123</i>
                            <i class="fa-solid fa-heart right-align">&nbsp321</i>
                        </nav>
                    </div>
                    </a>
                </div>
                <div class="card common--boardCard" style="width: 15rem;">
                    <a href="https://www.google.com" class="common--boardListContent">
                    <div class="common--boardListImageContainer">
                        <img src="/resources/images/officialFlag/CHINAFLAG.png" class="card-img-top" alt="게시글 사진 5">
                    </div>
                    <div class="card-body common--boardCardBottom">
                        <p class="card-text">
                            방콕행 비행기 세일한다고 하네요
                        </p>
                        <nav class="common--boardListLikeBox">
                            <i class="fa-solid fa-eye right-align">&nbsp123</i>
                            <i class="fa-solid fa-heart right-align">&nbsp321</i>
                        </nav>
                    </div>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 꿀팁게시글 끝 -->



<!-- 힐링게시글 시작 -->
<div class="accordion common--boardListContainer" id="accordionPanelsStayOpenExample">
    <div class="accordion-item">
        <h2 class="accordion-header">
            <button class="accordion-button" type="button" data-bs-toggle="collapse"
                data-bs-target="#panelsStayOpen-collapseFour" aria-expanded="true"
                aria-controls="panelsStayOpen-collapseFour">
                <i class="fa-solid fa-seedling" style="color:green; font-size:20px; padding-top: 4px;"></i>
                <div class="common--boardListTitle">힐링 태그 인기게시글</div>
            </button>
        </h2>
        <div id="panelsStayOpen-collapseFour" class="accordion-collapse collapse show">
            <div class="accordion-body common--boardCards">
                <div class="card common--boardCard" style="width: 15rem;">
                    <a href="https://www.google.com" class="common--boardListContent">
                    <div class="common--boardListImageContainer">
                        <img src="/resources/images/officialBanner/BANNERAUSTRALIA.png" class="card-img-top" alt="게시글 사진 1">
                    </div>
                    <div class="card-body common--boardCardBottom">
                        <p class="card-text">
                            사이판에서 생긴 일
                        </p>
                        <nav class="common--boardListLikeBox">
                            <i class="fa-solid fa-eye right-align">&nbsp123</i>
                            <i class="fa-solid fa-heart right-align">&nbsp321</i>
                        </nav>
                    </div>
                    </a>
                </div>
                <div class="card common--boardCard" style="width: 15rem;">
                    <a href="https://www.google.com" class="common--boardListContent">
                    <div class="common--boardListImageContainer">
                        <img src="/resources/images/officialProfile/GITHUBICON.png" class="card-img-top" alt="게시글 사진 2">
                    </div>
                    <div class="card-body common--boardCardBottom">
                        <p class="card-text">
                            이럴 때는 어떻게 처리해야 하나요?
                        </p>
                        <nav class="common--boardListLikeBox">
                            <i class="fa-solid fa-eye right-align">&nbsp123</i>
                            <i class="fa-solid fa-heart right-align">&nbsp321</i>
                        </nav>
                    </div>
                    </a>
                </div>
                <div class="card common--boardCard" style="width: 15rem;">
                    <a href="https://www.google.com" class="common--boardListContent">
                    <div class="common--boardListImageContainer">
                        <img src="/resources/images/officialImages/JUSTGO_OFFICIAL_LOGO.png" class="card-img-top" alt="게시글 사진 3">
                    </div>
                    <div class="card-body common--boardCardBottom">
                        <p class="card-text">
                            [일본 게시판 공식]일본 여행 추천지와 맛집 리스트 정리입니다.
                        </p>
                        <nav class="common--boardListLikeBox">
                            <i class="fa-solid fa-eye right-align">&nbsp123</i>
                            <i class="fa-solid fa-heart right-align">&nbsp321</i>
                        </nav>
                    </div>
                    </a>
                </div>
                <div class="card common--boardCard" style="width: 15rem;">
                    <a href="https://www.google.com" class="common--boardListContent">
                    <div class="common--boardListImageContainer">
                        <img src="/resources/images/officialBanner/BANNERKYOTO.png" class="card-img-top" alt="게시글 사진 4">
                    </div>
                    <div class="card-body common--boardCardBottom">
                        <p class="card-text">
                            여권을 잃어버렸을 때 조치 방법
                        </p>
                        <nav class="common--boardListLikeBox">
                            <i class="fa-solid fa-eye right-align">&nbsp123</i>
                            <i class="fa-solid fa-heart right-align">&nbsp321</i>
                        </nav>
                    </div>
                    </a>
                </div>
                <div class="card common--boardCard" style="width: 15rem;">
                    <a href="https://www.google.com" class="common--boardListContent">
                    <div class="common--boardListImageContainer">
                        <img src="/resources/images/officialFlag/CHINAFLAG.png" class="card-img-top" alt="게시글 사진 5">
                    </div>
                    <div class="card-body common--boardCardBottom">
                        <p class="card-text">
                            방콕행 비행기 세일한다고 하네요
                        </p>
                        <nav class="common--boardListLikeBox">
                            <i class="fa-solid fa-eye right-align">&nbsp123</i>
                            <i class="fa-solid fa-heart right-align">&nbsp321</i>
                        </nav>
                    </div>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 힐링게시글 끝 -->



<div class="common--TwoDivide">
<!-- 환율 계산기 시작-->
    <div class="card">
        <div class="card-header" style="font-weight: bold; font-size: 20px;">
            <i class="fa-solid fa-money-bill" style="color: green;"></i>
            환율 계산기
        </div>
        <form action="https://www.google.com" method="post">
            <div class="card-body common--cardExchange">
                <div class="common--cardExchange__top">
                    <input type="number" placeholder="숫자만 입력해주세요." value="10000">원
                    <i class="fa-solid fa-arrow-right"></i>
                    <select class="common--cardExchangeSelector">
                        <option value="option1">달러 | USD</option>
                        <option value="option2">엔 | JPY</option>
                        <option value="option3">위안 | CNY</option>
                        <option value="option4">유로 | EUR</option>
                        <option value="option4">파운드 | GBP</option>
                        <option value="option5">동 | VND</option>
                        <option value="option6">바트 | THB</option>
                        <option value="option7">대만달러 | TWD</option>
                        <option value="option8">홍콩달러 | HKD</option>
                        <option value="option9">호주달러 | AUD</option>
                    </select>
                    <button>변환</button>
                </div>
                <div class="common--cardExchange__bottom">
                    <div>100000</div>
                    <div>엔</div>
                </div>
            </div>
        </form>
    </div>
<!-- 환율 계산기 끝 -->



<!-- 날씨 검색기 시작 -->
    <div class="card">
        <div class="card-header" style="font-weight: bold; font-size: 20px;">
            <i class="fa-solid fa-sun" style="color: orange;"></i>
            날씨 검색기
        </div>
        <form action="https://www.naver.com" method="post">
            <div class="card-body common--cardWeather">
                <div class="common--cardWeather__left">
                    <i class="fa-solid fa-sun" style="color:orange; font-size: 100px;"></i>
                    <!-- <i class="fa-solid fa-cloud-sun" style="color: yellowgreen; font-size: 100px;"></i> -->
                    <!-- <i class="fa-solid fa-cloud" style="color:orange; font-size: 100px;"></i> -->
                    <!-- <i class="fa-solid fa-cloud-showers-heavy" style="color:orange; font-size: 100px;"></i> -->
                    <!-- <i class="fa-solid fa-cloud-bolt" style="color:orange; font-size: 100px;"></i> -->
                    <!-- <i class="fa-solid fa-snowflake" style="color:orange; font-size: 100px;"></i> -->
                </div>
                <div class="common--cardWeather__right">
                    <div style="border-bottom: 1px solid #D9D9D9;">
                        <div style="font-size: 30px;">현재 방콕 날씨</div>
                        <div class="common--cardWeatherSelectorBox">
                            <select class="common--cardWeatherSelector">
                                <option value="option1">도쿄</option>
                                <option value="option2">교토</option>
                                <option value="option3">삿포로</option>
                                <option value="option4">오키나와</option>
                                <option value="option5">베이징</option>
                                <option value="option6">상하이</option>
                                <option value="option7">홍콩</option>
                                <option value="option8">타이페이</option>
                                <option value="option9">하노이</option>
                                <option value="option10">호치민</option>
                                <option value="option11">방콕</option>
                                <option value="option12">푸켓</option>
                                <option value="option13">싱가포르</option>
                                <option value="option14">마닐라</option>
                                <option value="option15">보라카이</option>
                                <option value="option16">시드니</option>
                                <option value="option17">브리즈번</option>
                                <option value="option18">퍼스</option>
                            </select>
                            <button style="border: none; border-radius: 10%;">검색</button>
                        </div>
                    </div>
                    <div style="font-size: 30px;">맑음 30˚C</div>
                    <div style="font-size: 20px; color: grey;">
                        <span>습도 50%</span>
                        <span>강수 5%</span>
                        <span>바람 4m/s</span>
                    </div>
                </div>
            </div>
        </form>
    </div>
    <!-- 날씨 검색기 끝 -->
</div>



</section>
<aside class="template--rightAside"></aside>
</main>
<!-- Template-main 끝 -->
    
    
<!-- ----------------------------------------------- -->
<!-- Template-footer 시작 -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<!-- Template-footer 끝 -->
<!-- ----------------------------------------------- -->
    

<!-- bootstrap -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
<!-- js -->
    <script src="/resources/js/template/template.js"></script>
    <%-- <script src="/resources/js/common/header.js"></script> --%>
    <script src="/resources/js/common/main.js"></script>
    <script src="/resources/js/common/footer.js"></script>
</body>
</html>