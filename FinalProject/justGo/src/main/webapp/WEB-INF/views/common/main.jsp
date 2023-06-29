<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



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
<%-- jQuery 날짜 셀렉터 --%>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script>
    $(function() {
        $( "#datepicker1" ).datepicker({
            dateFormat: 'yy-mm-dd',
            dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
            monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
            monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
        });
        $( "#datepicker2" ).datepicker({
            dateFormat: 'yy-mm-dd',
            dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
            monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
            monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
        });
    });
    </script>
</head>
<body class="template--body">



<!-- ----------------------------------------------- -->
<!-- Template-header 시작 -->
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<!-- Template-header 끝 -->
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
                        <a href="https://zrr.kr/aPUq" target="_blank"> <%-- 호주 울룰루 --%>
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
                        <a href="/myPage/info" target="_blank">
                            <img src="/resources/images/officialBanner/BANNERWELCOME.png" class="d-block w-100" alt="웰컴 배너">
                        </a>
                        <div class="carousel-caption d-none d-md-block">
                <h1 class="common--bannerText" id="welcomeText" style="text-align: center;">${loginMember.memberNickname}님, 환영합니다!</h1>
                            <p class="common--bannerWelcome">JustGo에서 즐거운 시간 보내세요!</p>
                        </div>
                    </div>
                    <div class="carousel-item" data-bs-interval="5000">
                        <a href="https://zrr.kr/aPUq" target="_blank"> <%-- 호주 울룰루 --%>
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
                <a href="https://zrr.kr/MlZe" target="_blank"> <%-- 베이징 만리장성 --%>
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
                <a href="https://zrr.kr/MHQC" target="_blank"> <%-- 교토 청수사 --%>
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
                <a href="https://zrr.kr/Tnki" target="_blank"> <%-- 상하이 와이탄 --%>
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
                <a href="https://zrr.kr/lMyv" target="_blank"> <%-- 방콕 왕궁 --%>
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
                <a href="https://zrr.kr/vQwA" target="_blank"> <%-- 도쿄타워 --%>
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
                <a href="https://zrr.kr/5jh0" target="_blank"> <%-- 호치민 통일궁 --%>
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
            <c:forEach items="${hotBoardList}" var="hotList">
                    <div class="card common--boardCard" style="width: 15rem;">
                    <c:choose>
                        <c:when test="${hotList.boardCode != '1'}">
                            <a href="/board/${hotList.boardCode}/${hotList.boardNo}"  class="common--boardListContent">
                        </c:when>
                        <c:otherwise>
                            <a href="/board/1/${hotList.countryNo}/${hotList.boardNo}"  class="common--boardListContent">
                        </c:otherwise>
                    </c:choose>
                        <%-- <a href="https://www.google.com" class="common--boardListContent"> --%>
                        <div class="common--boardListImageContainer">
                            <img src="${hotList.boardThumbnail}" class="card-img-top" alt="게시글 사진 1">
                        </div>
                        <div class="card-body common--boardCardBottom">
                            <p class="card-text">
                                ${hotList.boardTitle}
                            </p>
                            <nav class="common--boardListLikeBox">
                                <i class="fa-solid fa-eye right-align">&nbsp${hotList.readCount}</i>
                                <i class="fa-solid fa-heart right-align">&nbsp${hotList.likeCount}</i>
                            </nav>
                        </div>
                        </a>
                    </div>
            </c:forEach>
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
            <c:forEach items="${foodBoardList}" var="foodList">
                <div class="card common--boardCard" style="width: 15rem;">
                    <c:choose>
                        <c:when test="${foodList.boardCode != '1'}">
                            <a href="/board/${foodList.boardCode}/${foodList.boardNo}"  class="common--boardListContent">
                        </c:when>
                        <c:otherwise>
                            <a href="/board/1/${foodList.countryNo}/${foodList.boardNo}"  class="common--boardListContent">
                        </c:otherwise>
                    </c:choose>
                    <%-- <a href="https://www.google.com" class="common--boardListContent"> --%>
                    <div class="common--boardListImageContainer">
                        <img src="${foodList.boardThumbnail}" class="card-img-top" alt="게시글 사진 1">
                    </div>
                    <div class="card-body common--boardCardBottom">
                        <p class="card-text">
                            ${foodList.boardTitle}
                        </p>
                        <nav class="common--boardListLikeBox">
                            <i class="fa-solid fa-eye right-align">&nbsp${foodList.readCount}</i>
                            <i class="fa-solid fa-heart right-align">&nbsp${foodList.likeCount}</i>
                        </nav>
                    </div>
                    </a>
                </div>
            </c:forEach>
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
            <c:forEach items="${tipBoardList}" var="tipBoardList">
                <div class="card common--boardCard" style="width: 15rem;">
                    <c:choose>
                        <c:when test="${tipBoardList.boardCode != '1'}">
                            <a href="/board/${tipBoardList.boardCode}/${tipBoardList.boardNo}"  class="common--boardListContent">
                        </c:when>
                        <c:otherwise>
                            <a href="/board/1/${tipBoardList.countryNo}/${tipBoardList.boardNo}"  class="common--boardListContent">
                        </c:otherwise>
                    </c:choose>
                    <%-- <a href="https://www.google.com" class="common--boardListContent"> --%>
                    <div class="common--boardListImageContainer">
                        <img src="${tipBoardList.boardThumbnail}" class="card-img-top" alt="게시글 사진 1">
                    </div>
                    <div class="card-body common--boardCardBottom">
                        <p class="card-text">
                            ${tipBoardList.boardTitle}
                        </p>
                        <nav class="common--boardListLikeBox">
                            <i class="fa-solid fa-eye right-align">&nbsp${tipBoardList.readCount}</i>
                            <i class="fa-solid fa-heart right-align">&nbsp${tipBoardList.likeCount}</i>
                        </nav>
                    </div>
                    </a>
                </div>
            </c:forEach>
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
            <c:forEach items="${healBoardList}" var="healList">
                <div class="card common--boardCard" style="width: 15rem;">
                    <c:choose>
                        <c:when test="${healList.boardCode != '1'}">
                            <a href="/board/${healList.boardCode}/${healList.boardNo}"  class="common--boardListContent">
                        </c:when>
                        <c:otherwise>
                            <a href="/board/1/${healList.countryNo}/${healList.boardNo}"  class="common--boardListContent">
                        </c:otherwise>
                    </c:choose>
                    <%-- <a href="https://www.google.com" class="common--boardListContent"> --%>
                    <div class="common--boardListImageContainer">
                        <img src="${healBoardList.boardThumbnail}" class="card-img-top" alt="게시글 사진 1">
                    </div>
                    <div class="card-body common--boardCardBottom">
                        <p class="card-text">
                            ${healList.boardTitle}
                        </p>
                        <nav class="common--boardListLikeBox">
                            <i class="fa-solid fa-eye right-align">&nbsp${healList.readCount}</i>
                            <i class="fa-solid fa-heart right-align">&nbsp${healList.likeCount}</i>
                        </nav>
                    </div>
                    </a>
                </div>
            </c:forEach>
            </div>
        </div>
    </div>
</div>
<!-- 힐링게시글 끝 -->



<div class="common--twoDivide">
<!-- 환율 계산기 시작-->
    <div class="card">
        <div class="card-header" style="font-weight: bold; font-size: 20px;">
            <i class="fa-solid fa-money-bill" style="color: green;"></i>
            환율
        </div>
        <div class="card-body common--moneyBox">
            <div class="common--moneyleftBox">
                <div>현재 달러당 환율</div>
                <div>
                    <span id="after1usd2krw"></span>
                    <span>원</span>
                </div>
            </div>
            <span id="resultRate" style="display: none;"></span> <%-- 교환비 숨김 처리 --%>
            <span id="resultRateX" style="display: none;"></span> <%-- 역교환비 숨김 처리 --%>
            <div class="common--moneyRightBox">
                <div class="topMoneyBox">
                    <input id="beforeMoney" type="number" value="1.00">
                    <select id="beforeCurrSelect" onchange="beforeMoneyChange();" class="common--cardExchangeSelector">
                        <option id="USD" selected>달러 | USD</option>
                        <option id="KRW">원 | KRW</option>
                        <option id="JPY">엔 | JPY</option>
                        <option id="CNY">위안 | CNY</option>
                        <option id="VND">동 | VND</option>
                        <option id="THB">바트 | THB</option>
                        <option id="AUD">호주달러 | AUD</option>
                    </select>
                </div>
                <div class="middleMoneyBox">
                    <i class="fa-regular fa-equals" style="display: none;"></i>
                    <i class="fa-solid fa-calculator fa-flip"></i>
                </div>
                <div class="bottomMoneyBox">
                    <input id="afterMoney" type="number">
                    <select id="afterCurrSelect" onchange="resultCurrChange();" class="common--cardExchangeSelector">
                        <option id="USD">달러 | USD</option>
                        <option id="KRW" selected>원 | KRW</option>
                        <option id="JPY">엔 | JPY</option>
                        <option id="CNY">위안 | CNY</option>
                        <option id="VND">동 | VND</option>
                        <option id="THB">바트 | THB</option>
                        <option id="AUD">호주달러 | AUD</option>
                    </select>
                </div>
            </div>
        </div>
    </div>
<!-- 환율 계산기 끝 -->



<!-- 날씨 검색기 시작 -->
    <div class="card">
        <div class="card-header" style="font-weight: bold; font-size: 20px;">
            <i class="fa-solid fa-sun" style="color: orange;"></i>
            날씨
        </div>
        <form action="#" method="post">
            <div class="card-body common--cardWeather">
                <div class="common--cardWeather__left">
                    <%-- <img id="icon"> --%> <%-- 이전 방식: 화질 구짐 --%>
                    <div id="icon"></div> <%-- 아이콘 방식 --%>
                </div>
                <div class="common--cardWeather__right">
                    <div style="border-bottom: 1px solid #D9D9D9;">
                        <div id="city" style="font-size: 30px;"></div> <%-- 도시 --%>
                        <div class="common--cardWeatherSelectorBox">
                            <select id="citySelect" onchange="change();" class="common--cardWeatherSelector" style="width: 100px;">
                                <option id="Seoul">서울</option>
                                <option id="Tokyo">도쿄</option>
                                <option id="Kyoto">교토</option>
                                <option id="Osaka">오사카</option>
                                <option id="Sapporo">삿포로</option>
                                <option id="Okinawa">오키나와</option>
                                <option id="Fukuoka">후쿠오카</option>
                                <option id="Beijing">베이징</option>
                                <option id="Shanghai">상하이</option>
                                <option id="Shenzhen">선전</option>
                                <option id="Hanoi">하노이</option>
                                <option id="Danang">다낭</option>
                                <option id="Ho Chi Minh City">호치민</option>
                                <option id="Bangkok">방콕</option>
                                <option id="Phuket">푸켓</option>
                                <option id="Chiang Mai, TH">치앙마이</option>
                                <option id="Pattaya">파타야</option>
                                <option id="Sydney">시드니</option>
                                <option id="Brisbane">브리즈번</option>
                                <option id="Melbourne, AU">멜버른</option>
                                <option id="Perth">퍼스</option>
                            </select>
                            
                        </div>
                    </div>
                    <div>
                        <span>
                            <span id="currentTemp" style="font-size: 30px;"></span> <%-- 온도 --%>
                            <span style="font-size: 30px;">°C</span>
                        </span>
                        <span id="weather">                        
                        </span>
                    </div>
                    <div style="font-size: 20px; color: grey;">
                        <span>
                            <i class="fa-solid fa-droplet"></i>
                            <span>습도</span>
                            <span id="humidity"></span> <%-- 습도 --%>
                            <span>%</span>
                        </span>
                        <span>
                            <i class="fa-solid fa-wind"></i>
                            <span>풍속</span>
                            <span id="wind"></span> <%-- 바람 --%>
                            <span>m/s</span>
                        </span>
                    </div>
                </div>
            </div>
        </form>
    </div>
<!-- 날씨 검색기 끝 -->
</div>



<!-- 항공 검색기 시작-->
<div class="common--oneDivide">
    <div class="card">
        <div class="card-header" style="font-weight: bold; font-size: 20px;">
            <i class="fa-solid fa-plane" style="color: blue;"></i>
            항공
        </div>
        <div class="card-body common--airBox">
            <div>어디로 떠나시나요? JustGo가 현재 항공권의 평균 가격을 알려드립니다.</div>
            <div class="common--airContentBox">
                <div class="common--airContent">
                    <div>출발지</div>
                    <div>
                        <div class="countrySelectBox">
                            <select id="countrySelect" onchange="changeAirport()">
                                <option id="Korea" selected>한국</option>
                                <option id="Japan">일본</option>
                                <option id="China">중국</option>
                                <option id="Vietnam">베트남</option>
                                <option id="Thai">태국</option>
                                <option id="Australia">호주</option>
                            </select>
                        </div>
                        <i class="fa-solid fa-caret-up fa-rotate-90"></i>
                        <div class="airportSelectBox">
                            <select id="airportSelect">
                                <option value="ICN" selected>인천(ICN)</option>
                                <option value="GMP">김포(GMP)</option>
                                <option value="CJU">제주(CJU)</option>
                                <option value="PUS">김해(PUS)</option>
                                <option value="CJJ">청주(CJJ)</option>
                                <option value="TAE">대구(TAE)</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="common--airContent">
                    <div>도착지</div>
                    <div>
                        <div class="countrySelectBox">
                            <select id="countrySelect2" onchange="changeAirport2()">
                                <option id="Korea">한국</option>
                                <option id="Japan" selected>일본</option>
                                <option id="China">중국</option>
                                <option id="Vietnam">베트남</option>
                                <option id="Thai">태국</option>
                                <option id="Australia">호주</option>
                            </select>
                        </div>
                        <i class="fa-solid fa-caret-up fa-rotate-90"></i>
                        <div class="airportSelectBox">
                            <select id="airportSelect2">
                                <option value="HND">하네다(HND)</option>
                                <option value="NRT" selected>나리타(NRT)</option>
                                <option value="KIX">간사이(KIX)</option>
                                <option value="ITM">이타미(ITM)</option>
                                <option value="FUK">후쿠오카(FUK)</option>
                                <option value="CTS">신치토세(CTS)</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="common--airContent">
                    <div>가는 날</div>
                    <div>
                        <p><input type="text" id="datepicker1" placeholder="날짜를 선택해주세요."></p>
                    </div>
                </div>
                <div class="common--airContent">
                    <div>오는 날</div>
                    <div>
                        <p><input type="text" id="datepicker2" placeholder="날짜를 선택해주세요."></p>
                    </div>
                </div>
            </div>
            <div class="common--airBoxBottom">
                <button id="searchBtn" type="button" class="btn btn-primary btn-lg" data-bs-toggle="modal" data-bs-target="#airportModal">
                    항공권 검색
                </button>
            </div>
        </div>
    </div>
</div>
<!-- 항공 검색기 끝 -->



<!-- 항공 검색기 모달창 시작 -->
<div class="modal fade modal-xl" id="airportModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">항공권 검색결과</h1>
                <button  type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body airportBody">

            <div class="loadingMessage">
                <br>
                <i class="fa-solid fa-plane-departure fa-beat-fade" style="font-size: 4.0rem;"></i>
                <br><br>
                인천(ICN)에서 시드니(SYD)까지 가는<br>
                가장 싼 항공권을 검색 중입니다.
            </div>

            <c:forEach begin="1" end="10" varStatus="loop">
                <div class="card airportCard">
                    <div class="card-header" style="font-weight: bold; font-size: 20px;">
                        <i class="fa-solid fa-plane" style="color: blue;"></i>
                        <span class="airName"></span>
                        <span> - </span>
                        <span class="deName"></span>
                        <span>왕복권</span>
                    </div>
                    <div class="card-body airportTicketBox">
                        <div class="airplaneTicket">
                            <div class="goto">
                                <div class="goto__departure">
                                    <div class="airportCity departureCity"></div>
                                    <div class="departTime"></div>
                                    <div class="departCity"></div>
                                </div>
                                <div class="goto__icon">
                                    <i class="fa-solid fa-plane-departure"></i>
                                    <div class="airInfo">
                                    
                                        
                                        <div class="duration"></div>
                                        
                                        
                                    </div>
                                </div>
                                <div class="goto__arrival">
                                    <div class="airportCity arrivalCity"></div>
                                    <div class="arrivalTime"></div>
                                    <div class="arrCity"></div>
                                </div>
                            </div>
                            <div class="from">
                                <div class="from__departure">
                                    <div class="airportCity departureCity departureCity1"></div>
                                    <div class="departTime1"></div>
                                    <div></div>
                                </div>
                                <div class="from__icon">
                                    <i class="fa-solid fa-plane-arrival"></i>
                                    <div class="airInfo">

                                        
                                        <div class="duration1"></div>

                                       
                                    </div>
                                </div>
                                <div class="from__arrival">
                                    <div class="airportCity arrivalCity arrivalCity1"></div>
                                    <div class="arrivalTime1"></div>
                                    <div></div>
                                </div>
                            </div>
                        </div>
                        <div class="airPrice" id="airPrice"></div>
                    </div>
                </div>
            </c:forEach>

            <div class='wave -one'></div> <%-- 애니메이션 효과 --%>
            <div class='wave -two'></div>
            <div class='wave -three'></div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>
<!-- 항공 검색기 모달창 끝 -->



</section>
<aside class="template--rightAside"></aside>
</main>
<!-- Template-main 끝 -->



<!-- ----------------------------------------------- -->
<!-- Template-footer 시작 -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<!-- Template-footer 끝 -->
<!-- ----------------------------------------------- -->



<!-- js -->
    <script src="/resources/js/template/template.js"></script>
    <%-- <script src="/resources/js/common/header.js"></script> --%>
    <script src="/resources/js/common/main.js"></script>
    <script src="/resources/js/common/footer.js"></script>
<!-- bootstrap -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</body>
</html>