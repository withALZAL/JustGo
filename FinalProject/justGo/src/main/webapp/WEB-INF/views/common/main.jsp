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
<%-- jQuery --%>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
                            <img src="/resources/images/officialProfile/GITHUBICON.png" class="card-img-top" alt="게시글 사진 1">
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
                        <img src="/resources/images/officialBanner/BANNERAUSTRALIA.png" class="card-img-top" alt="게시글 사진 1">
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
                        <img src="/resources/images/officialBanner/BANNERAUSTRALIA.png" class="card-img-top" alt="게시글 사진 1">
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
                        <img src="/resources/images/officialBanner/BANNERAUSTRALIA.png" class="card-img-top" alt="게시글 사진 1">
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



<div class="common--TwoDivide">
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
            <div class="common--moneyRightBox">
                <div class="what2what" style="border-bottom: 1px solid #D9D9D9;">
                    <input id="beforeMoney" type="number" value="1">
                    <select id="beforeCountry" class="common--cardExchangeSelector">
                        <option id="US" selected>달러 | USD</option>
                        <option id="KR">원 | KRW</option>
                        <option id="JP">엔 | JPY</option>
                        <option id="CN">위안 | CNY</option>
                        <option id="VE">동 | VND</option>
                        <option id="TH">바트 | THB</option>
                        <option id="AU">호주달러 | AUD</option>
                    </select>
                    <i class="fa-solid fa-arrow-right"></i>
                    <select id="afterCountry" class="common--cardExchangeSelector">
                        <option id="US">달러 | USD</option>
                        <option id="KR" selected> 원 | KRW</option>
                        <option id="JP">엔 | JPY</option>
                        <option id="CN">위안 | CNY</option>
                        <option id="VE">동 | VND</option>
                        <option id="TH">바트 | THB</option>
                        <option id="AU">호주달러 | AUD</option>
                    </select>
                </div>
                <div class="moneyResult">
                    <span id="afterMoney">1300</span>
                    <span id="afterCurrency">원</span>
                </div>
            </div>
        </div>
        <%-- <div class="card-body common--cardExchange">
            <div class="common--cardExchange__top">
                <input type="number" placeholder="숫자만 입력해주세요." value="10000" style="width: 120px;"><div style="font-weight: bold; font-size: 1.1rem;">원</div>
                <i class="fa-solid fa-arrow-right"></i>
                <select id="country" class="common--cardExchangeSelector">
                    <option id="US">달러 | USD</option>
                    <option id="KR">원 | KRW</option>
                    <option id="JP">엔 | JPY</option>
                    <option id="CN">위안 | CNY</option>
                    <option id="VE">동 | VND</option>
                    <option id="TH">바트 | THB</option>
                    <option id="AU">호주달러 | AUD</option>
                </select>
                <button type="button" class="btn btn-secondary btn-sm" style="border: none;">변환</button>
            </div>
            <div class="common--cardExchange__bottom">
                <div id="money"></div>
                <div id="do"></div>
            </div>
        </div> --%>
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
                                <option id="Osaka">오사카</option>
                                <option id="Sapporo">삿포로</option>
                                <option id="Okinawa">오키나와</option>
                                <option id="Beijing">베이징</option>
                                <option id="Shanghai">상하이</option>
                                <option id="Hongkong">홍콩</option>
                                <option id="Taipei">타이페이</option>
                                <option id="Hanoi">하노이</option>
                                <option id="Ho Chi Minh City">호치민</option>
                                <option id="Bangkok">방콕</option>
                                <option id="Phuket">푸켓</option>
                                <option id="Singapore">싱가포르</option>
                                <option id="Manila">마닐라</option>
                                <option id="Sydney">시드니</option>
                                <option id="Brisbane">브리즈번</option>
                                <option id="Perth">퍼스</option>
                                <option id="Guam">괌</option>
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
<!-- 날씨 API -->    
    <script>

    /* 날씨 가져오기 함수 */
    function getWeather(cityName) {
        let WeatherUrl = "https://api.openweathermap.org/data/2.5/weather?q="+cityName+"&appid=b690d0fd2f1b2fe624fa0586e5e0d458&units=metric&lang=kr";

        fetch(WeatherUrl)
            .then((response) => { return response.json(); })
            .then((json) => {
                console.log(json);

                let currentTemp = document.getElementById("currentTemp"); /* 온도 */
                let humidity = document.getElementById("humidity"); /* 습도 */
                let wind = document.getElementById("wind"); /* 바람 */
                let city = document.getElementById("city"); /* 도시 */
                let weather = document.getElementById("weather"); /* 날씨 */

                let icon = json.weather[0].icon; /* 아이콘 */
                let iconUrl = document.getElementById('icon'); // img id를 iconUrl이라는 이름으로 받아옴
                // console.log(icon); /* 아이콘 넘버 확인 */

                /* https://openweathermap.org/weather-conditions */
                /* 맑음 */
                if(icon == '01d') weatherIcon = '<i class="fa-solid fa-sun fa-spin" style="color: orange; font-size: 4.5rem;"></i>';
                if(icon == '01n') weatherIcon = '<i class="fa-solid fa-moon fa-beat" style="color: yellow; font-size: 4.5rem;"></i>';
                 /* 구름 약간 */
                if(icon == '02d') weatherIcon = '<i class="fa-solid fa-cloud-sun fa-beat" style="color: grey; font-size: 4.5rem;"></i>';
                if(icon == '02n') weatherIcon = '<i class="fa-solid fa-cloud-moon fa-beat" style="color: grey; font-size: 4.5rem;"></i>';
                 /* 구름 많음 */
                if(icon == '03d') weatherIcon = '<i class="fa-solid fa-cloud fa-beat" style="color: grey; font-size: 4.5rem;"></i>';
                if(icon == '03n') weatherIcon = '<i class="fa-solid fa-cloud fa-beat" style="color: grey; font-size: 4.5rem;"></i>';
                 /* 흐림 */
                if(icon == '04d') weatherIcon = '<i class="fa-solid fa-cloud fa-beat" style="color: grey; font-size: 4.5rem;"></i>';
                if(icon == '04n') weatherIcon = '<i class="fa-solid fa-cloud fa-beat" style="color: grey; font-size: 4.5rem;"></i>';
                 /* 비 */
                if(icon == '09d') weatherIcon = '<i class="fa-solid fa-cloud-sun-rain fa-beat-fade" style="color: lightgrey; font-size: 4.5rem;"></i>';
                if(icon == '19n') weatherIcon = '<i class="fa-solid fa-cloud-moon-rain fa-beat-fade" style="color: lightgrey; font-size: 4.5rem;"></i>';
                 /* 강한 비 */
                if(icon == '10d') weatherIcon = '<i class="fa-solid fa-cloud-showers-heavy fa-beat-fade" style="color: lightgrey; font-size: 4.5rem;"></i>';
                if(icon == '10n') weatherIcon = '<i class="fa-solid fa-cloud-showers-heavy fa-beat-fade" style="color: lightgrey; font-size: 4.5rem;"></i>';
                 /* 강한 비 */
                if(icon == '11d') weatherIcon = '<i class="fa-solid fa-cloud-bolt fa-beat-fade" style="color: lightgrey; font-size: 4.5rem;"></i>';
                if(icon == '11n') weatherIcon = '<i class="fa-solid fa-cloud-bolt fa-beat-fade" style="color: lightgrey; font-size: 4.5rem;"></i>';
                 /* 눈 */
                if(icon == '13d') weatherIcon = '<i class="fa-solid fa-snowflake fa-spin" style="font-size: 4.5rem;"></i>';
                if(icon == '13n') weatherIcon = '<i class="fa-solid fa-snowflake fa-spin" style="font-size: 4.5rem;"></i>';
                 /* 안개 */
                if(icon == '50d') weatherIcon = '<i class="fa-solid fa-smog fa-fade" style="color: lightgrey; font-size: 4.5rem;"></i>';
                if(icon == '50n') weatherIcon = '<i class="fa-solid fa-smog fa-fade" style="color: lightgrey; font-size: 4.5rem;"></i>';

                iconUrl.innerHTML = '';
                iconUrl.innerHTML = weatherIcon;

                currentTemp.innerText = Math.floor(json.main.temp);
                humidity.innerText = json.main.humidity;
                wind.innerText = json.wind.speed;
                city.innerText = json.name;
                weather.innerText = json.weather[0].description;



                // iconUrl.src = "http://openweathermap.org/img/wn/" + icon + ".png"; //iconurl로 src를 설정해줌
            });
    }


function change(){
    let selectElement = document.getElementById("citySelect");
    let cityName = selectElement.options[selectElement.selectedIndex].id;
    getWeather(cityName);
}
    getWeather("Seoul"); // 초기값 서울

    // // 검색 버튼 클릭 시 선택한 도시의 날씨 정보를 가져오기
    // let searchButton = document.querySelector(".common--cardWeatherSelectorBox button");
    // searchButton.addEventListener("click", () => {
    //     let selectElement = document.getElementById("citySelect");
    //     let cityName = selectElement.options[selectElement.selectedIndex].id;
    //     getWeather(cityName);
    // });

    </script>
<%-- 환율 API --%>
    <script>
    // 환율 API
    // var today = new Date();

    // var year = today.getFullYear();
    // var month = ('0' + (today.getMonth() + 1)).slice(-2);
    // var day = ('0' + today.getDate()).slice(-2);

    // var currentDate = year+month+day;

        let after1usd2krw = document.getElementById("after1usd2krw"); // 1달러 원화로 얼마?
        let beforeCountry = document.getElementById("beforeCountry");
        let inputCountry = beforeCountry.options[beforeCountry.selectedIndex].id;
        let currency = null;

        /* 왼쪽 고정 1달러 환율 */
        let korUrl = "https://v6.exchangerate-api.com/v6/718bd98ce2ddeba87417536d/latest/KRW";
        fetch(korUrl)
        .then(response => {return response.json();})
        .then(resultLeft => {
            console.log(resultLeft);

            let after1usd2krw = document.getElementById("after1usd2krw");
            let calc1 = resultLeft.conversion_rates.USD; // 1296.8883
            let calc2 = Math.round(calc1); // 1297
            after1usd2krw.innerText = calc2; // 1297원
        });
        

        if(inputCountry == 'KR') currency = 'KRW';
        if(inputCountry == 'US') currency = 'USD';
        if(inputCountry == 'JP') currency = 'JPY';
        if(inputCountry == 'CN') currency = 'CNY';
        if(inputCountry == 'AU') currency = 'AUD';
        if(inputCountry == 'VN') currency = 'VND';
        if(inputCountry == 'TH') currency = 'THB';

        /* 오른쪽 환율 계산 */
        let url = "https://v6.exchangerate-api.com/v6/718bd98ce2ddeba87417536d/latest/"+ currency;

        fetch(url)
        .then(response => {return response.json();})
        .then(result => {
            console.log(result);

            let money = document.getElementById("money");
            money.innerText = result.conversion_rates.KRW;


        });

    </script>


</body>
</html>