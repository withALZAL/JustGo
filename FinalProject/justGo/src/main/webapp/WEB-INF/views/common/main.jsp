<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- css -->
    <link rel="stylesheet" href="/css/template/template.css"> <!-- 문서 기본 화면 배치/기본 폰트 등 기본 설정 -->
    <link rel="stylesheet" href="/css/common/header.css">
    <link rel="stylesheet" href="/css/common/main.css">
    <link rel="stylesheet" href="/css/common/footer.css">

    <title>JustGo-main</title>

<!-- bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<!-- fontAwesome -->
    <script src="https://kit.fontawesome.com/ae1a88d4e2.js" crossorigin="anonymous"></script>
</head>
<body class="template--body">



<!-- ----------------------------------------------- -->


<!-- Template-header 시작 -->
<header class="template--header">
<aside class="template--leftAside">left</aside>
<section class="template--Section">



<!-- loginNav 시작 -->
<nav class="common--loginNav__container">
    <form action="/html/board/boardNotice.html" method="get">
        <a href="/html/board/boardNotice.html">
            <button type="button" class="btn btn-secondary btn-sm">공지사항</button>
        </a>
    </form>
    <form action="/html/writing/writingQuestion.html" method="get">
        <a href="/html/writing/writingQuestion.html">
            <button type="button" class="btn btn-secondary btn-sm">1:1문의</button>
        </a>
    </form>
    <form action="/html/writing/post.html" method="get">
        <a href="/html/writing/post.html">
            <button type="button" class="btn btn-secondary btn-sm">포스트</button>
        </a>
    </form>
    <form action="/html/writing/writingBoard.html" method="get">
        <a href="/html/writing/writingBoard.html">
            <button type="button" class="btn btn-secondary btn-sm">글쓰기</button>
        </a>
    </form>
    <form action="/html/account/login.html" method="get">
        <a href="/html/account/login.html">
            <button type="button" class="btn btn-secondary btn-sm">로그인</button>
        </a>
    </form>
    <form action="https://www.naver.com" method="get">
        <a href="/html/common/error.html">
            <button type="button" class="btn btn-secondary btn-sm">로그아웃</button>
        </a>
    </form>
    <form action="/html/account/join.html" method="get">
        <a href="/html/account/join.html">
            <button type="button" class="btn btn-secondary btn-sm">회원가입</button>
        </a>
    </form>
    <form action="/html/account/myPage.html" method="get">
        <a href="/html/account/myPage.html">
            <button type="button" class="btn btn-secondary btn-sm">마이페이지</button>
        </a>
    </form>
    <form action="/html/account/updateInfo.html" method="get">
        <a href="/html/account/updateInfo.html">
            <button type="button" class="btn btn-secondary btn-sm">개인정보수정</button>
        </a>
    </form>
    <form action="https://www.naver.com" method="get">
        <a href="/html/common/error.html">
            <button type="button" class="btn btn-secondary btn-sm">관리자1</button>
        </a>
    </form>
    <form action="https://www.naver.com" method="get">
        <a href="/html/common/error.html">
            <button type="button" class="btn btn-secondary btn-sm">관리자2</button>
        </a>
    </form>
    <form action="https://www.naver.com" method="get">
        <a href="/html/common/error.html">
            <button type="button" class="btn btn-secondary btn-sm">관리자3</button>
        </a>
    </form>
    <form action="https://www.naver.com" method="get">
        <a href="/html/writing/writingQuestion.html">
            <button type="button" class="btn btn-secondary btn-sm">1:1문의</button>
        </a>
    </form>
    <form action="https://www.naver.com" method="get">
        <a href="/html/common/error.html">
            <button type="button" class="btn btn-secondary btn-sm">에러</button>
        </a>
    </form>
    <form action="https://www.naver.com" method="get">
        <button type="button" class="btn btn-secondary btn-sm" data-bs-toggle="modal" data-bs-target="#exampleModal">
            로그인 모달
        </button>
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">로그인</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div style="display: grid; place-items: center; padding: 10px 0 50px 0;">
                        <img src="/images/officialImages/JUSTGO_OFFICIAL_LOGO.png" alt="로그인 로고" style="height: 100px;">
                    </div>
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="basic-addon1" style="width: 80px;">이메일</span>
                        <input type="email" class="form-control" placeholder="이메일을 입력해주세요." aria-label="email" aria-describedby="basic-addon1">
                    </div>
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="basic-addon1" style="width: 80px;">비밀번호</span>
                        <input type="password" class="form-control" placeholder="비밀번호를 입력해주세요." aria-label="password" aria-describedby="basic-addon1">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary">로그인</button>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                </div>
                </div>
            </div>
        </div>
    </form>
</nav>
<!-- loginNav 끝 -->


<!-- header 시작 -->
<header class="common--header__container">
    <a href="/html/common/main.html">
        <img src="/images/officialImages/JUSTGO_OFFICIAL_LOGO.png" alt="JustGo 로고">
    </a>
    <div class="common--header__searchContainer">
        <form action="https://www.naver.com" method="get">
            <input type="text" placeholder="검색어를 입력해주세요." maxlength="30">
            <button type="button" class="btn btn-secondary">
                <i class="fa-solid fa-magnifying-glass"></i>
            </button>
        </form>
    </div>
    <div class="common--header__profileContainer">
        <div class="common--header__profileBox">
            <a href="https://www.naver.com">
                <img src="/images/officialProfile/KIKI.jpg" alt="프로필 이미지">
                <div>폭탄배달부키키</div>
            </a>
        </div>
    </div>
</header>
<!-- header 끝 -->



<!-- nav 시작 -->
<nav class="common--navContainer">
    <ul class="nav justify-content-around" id="common--boardList">
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="moreDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">여행게시판</a>
            <ul class="dropdown-menu common--tripBoard" aria-labelledby="moreDropdown">
                <li><a class="dropdown-item" href="/html/board/boardChina.html"><img src="/images/officialFlag/CHINAFLAG.png" alt="중국국기">중국게시판</a></li>
                <li><a class="dropdown-item" href="/html/board/boardJapan.html"><img src="/images/officialFlag/JAPANFLAG.png" alt="일본국기">일본게시판</a></li>
                <li><a class="dropdown-item" href="/html/board/boardVietnam.html"><img src="/images/officialFlag/VIETNAMFLAG.png" alt="베트남국기">베트남게시판</a></li>
                <li><a class="dropdown-item" href="/html/board/boardThai.html"><img src="/images/officialFlag/THAIFLAG.png" alt="태국국기">태국게시판</a></li>
                <li><a class="dropdown-item" href="/html/board/boardAustralia.html"><img src="/images/officialFlag/AUSTRALIAFLAG.png" alt="호주국기">호주게시판</a></li>
            </ul>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/html/board/boardFree.html">자유게시판</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/html/board/boardQuestion.html">질문게시판</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="https://www.naver.com" style="color:grey;">예비게시판실험</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="https://www.naver.com" style="color:grey;">예비게시판실험</a>
        </li>
    </ul>
</nav>
<!-- nav 끝 -->



</section>
<aside class="template--rightAside">right</aside>
</header>
<!-- Template-header 끝 -->



<!-- ----------------------------------------------- -->


<!-- Template-main 시작 -->
<main class="template--main">
<aside class="template--leftAside">left</aside>
<section class="template--Section">
    


<!-- 배너 시작 -->
<div class="common--bannerContainer">
    <div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="3" aria-label="Slide 4"></button>
            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="4" aria-label="Slide 5"></button>
            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="5" aria-label="Slide 6"></button>
            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="6" aria-label="Slide 7"></button>
        </div>
        <div class="carousel-inner">
            <div class="carousel-item active" data-bs-interval="5000">
                <a href="https://www.google.com" target="_blank">
                    <img src="/images/officialBanner/BANNERAUSTRALIA.png" class="d-block w-100" alt="호주 배너">
                </a>
                <div class="carousel-caption d-none d-md-block">
                    <h1 class="common--bannerText">AUSTRALIA</h1>
                    <p class="common--bannerWelcome">즐거운 여행 커뮤니티 JustGo에 어서오세요.</p>
                </div>
            </div>
            <div class="carousel-item" data-bs-interval="5000">
                <a href="https://www.google.com" target="_blank">
                    <img src="/images/officialBanner/BANNERBEIJING.png" class="d-block w-100" alt="베이징 배너">
                </a>
                <div class="carousel-caption d-none d-md-block">
                    <h1 class="common--bannerText">BEIJING</h1>
                    <p class="common--bannerWelcome">즐거운 여행 커뮤니티 JustGo에 어서오세요.</p>
                </div>
            </div>
            <div class="carousel-item" data-bs-interval="5000">
                <a href="https://www.google.com" target="_blank">
                    <img src="/images/officialBanner/BANNERKYOTO.png" class="d-block w-100" alt="교토 배너">
                </a>
                <div class="carousel-caption d-none d-md-block">
                    <h1 class="common--bannerText">KYOTO</h1>
                    <p class="common--bannerWelcome">즐거운 여행 커뮤니티 JustGo에 어서오세요.</p>
                </div>
            </div>
            <div class="carousel-item" data-bs-interval="5000">
                <a href="https://www.google.com" target="_blank">
                    <img src="/images/officialBanner/BANNERSHANGHAI.png" class="d-block w-100" alt="상하이 배너">
                </a>
                <div class="carousel-caption d-none d-md-block">
                    <h1 class="common--bannerText">SHANGHAI</h1>
                    <p class="common--bannerWelcome">즐거운 여행 커뮤니티 JustGo에 어서오세요.</p>
                </div>
            </div>
            <div class="carousel-item" data-bs-interval="5000">
                <a href="https://www.google.com" target="_blank">
                    <img src="/images/officialBanner/BANNERTHAI.png" class="d-block w-100" alt="태국 배너">
                </a>
                <div class="carousel-caption d-none d-md-block">
                    <h1 class="common--bannerText">THAI</h1>
                    <p class="common--bannerWelcome">즐거운 여행 커뮤니티 JustGo에 어서오세요.</p>
                </div>
            </div>
            <div class="carousel-item" data-bs-interval="5000">
                <a href="https://www.google.com" target="_blank">
                    <img src="/images/officialBanner/BANNERTOKYO.png" class="d-block w-100" alt="도쿄 배너">
                </a>
                <div class="carousel-caption d-none d-md-block">
                    <h1 class="common--bannerText">TOKYO</h1>
                    <p class="common--bannerWelcome">즐거운 여행 커뮤니티 JustGo에 어서오세요.</p>
                </div>
            </div>
            <div class="carousel-item" data-bs-interval="5000">
                <a href="https://www.google.com" target="_blank">
                    <img src="/images/officialBanner/BANNERVIETNAM.png" class="d-block w-100" alt="베트남 배너">
                </a>
                <div class="carousel-caption d-none d-md-block">
                    <h1 class="common--bannerText">VIETNAM</h1>
                    <p class="common--bannerWelcome">즐거운 여행 커뮤니티 JustGo에 어서오세요.</p>
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
                        <img src="/images/officialBanner/BANNERAUSTRALIA.png" class="card-img-top" alt="게시글 사진 1">
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
                        <img src="/images/officialProfile/GITHUBICON.png" class="card-img-top" alt="게시글 사진 2">
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
                        <img src="/images/officialImages/JUSTGO_OFFICIAL_LOGO.png" class="card-img-top" alt="게시글 사진 3">
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
                        <img src="/images/officialBanner/BANNERKYOTO.png" class="card-img-top" alt="게시글 사진 4">
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
                        <img src="/images/officialFlag/CHINAFLAG.png" class="card-img-top" alt="게시글 사진 5">
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
                        <img src="/images/officialBanner/BANNERAUSTRALIA.png" class="card-img-top" alt="게시글 사진 1">
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
                        <img src="/images/officialProfile/GITHUBICON.png" class="card-img-top" alt="게시글 사진 2">
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
                        <img src="/images/officialImages/JUSTGO_OFFICIAL_LOGO.png" class="card-img-top" alt="게시글 사진 3">
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
                        <img src="/images/officialBanner/BANNERKYOTO.png" class="card-img-top" alt="게시글 사진 4">
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
                        <img src="/images/officialFlag/CHINAFLAG.png" class="card-img-top" alt="게시글 사진 5">
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
                        <img src="/images/officialBanner/BANNERAUSTRALIA.png" class="card-img-top" alt="게시글 사진 1">
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
                        <img src="/images/officialProfile/GITHUBICON.png" class="card-img-top" alt="게시글 사진 2">
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
                        <img src="/images/officialImages/JUSTGO_OFFICIAL_LOGO.png" class="card-img-top" alt="게시글 사진 3">
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
                        <img src="/images/officialBanner/BANNERKYOTO.png" class="card-img-top" alt="게시글 사진 4">
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
                        <img src="/images/officialFlag/CHINAFLAG.png" class="card-img-top" alt="게시글 사진 5">
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
                        <img src="/images/officialBanner/BANNERAUSTRALIA.png" class="card-img-top" alt="게시글 사진 1">
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
                        <img src="/images/officialProfile/GITHUBICON.png" class="card-img-top" alt="게시글 사진 2">
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
                        <img src="/images/officialImages/JUSTGO_OFFICIAL_LOGO.png" class="card-img-top" alt="게시글 사진 3">
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
                        <img src="/images/officialBanner/BANNERKYOTO.png" class="card-img-top" alt="게시글 사진 4">
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
                        <img src="/images/officialFlag/CHINAFLAG.png" class="card-img-top" alt="게시글 사진 5">
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
<aside class="template--rightAside">right</aside>
</main>
<!-- Template-main 끝 -->
    
    
    
<!-- ----------------------------------------------- -->
    

<!-- Template-footer 시작 -->
<footer class="template--footer">
<aside class="template--leftAside">left</aside>
<section class="template--Section">



<!-- footer 시작 -->
<footer class="common--footerContainer">
    <img src="/images/officialImages/JUSTGO_OFFICIAL_LOGO_BLACK.png" alt="저스트고로고" class="common--footerLogo">
    <div>
        <b><a href="https://www.naver.com">주식회사 저스트고</a></b>
        <i class="fa-solid fa-caret-left" style="color: #D9D9D9;"></i>
        <img src="/images/officialProfile/GITHUBICON.png" alt="깃허브" style="height: 20px; padding-bottom: 2px;">
        <hr>
        서울특별시 중구 남대문로 120 그레이츠 청계(구 대일빌딩) 2F<br>
        사업자등록번호 : 899-89-00001<br>
        <img src="/images/officialProfile/GITHUBICON.png" alt="깃허브" style="height: 20px; padding-bottom: 2px;">
        <i class="fa-solid fa-caret-right" style="color: #D9D9D9;"></i>
        대표: <a href="https://www.naver.com">이상준</a> |
        이사: 
        <a href="https://www.naver.com">박종욱</a>
        <a href="https://www.naver.com">배진현</a>
        <a href="https://www.naver.com">정송이</a>
        <a href="https://www.naver.com">정용화</a>
        <a href="https://www.naver.com">조우형</a>
        <br>
        Copyright © 1998-2023 JustGo All Right Reserved<br>
    </div>
    <div class="common--footerRight">
        <a href="/html/board/boardNotice.html">공지사항</a>
        <a href="/html/board/boardNotice.html">1:1문의</a>
    </div>
    <div class="fixed-bottom" id="common--toTopBtn">
        <a href="https://www.naver.com">
            <button>
                <i class="fa-solid fa-pen-to-square"></i>
            </button>
        </a>
        <a href="https://www.google.com">
            <button>
                <i class="fa-solid fa-arrow-up"></i>
            </button>
        </a>
    </div>
</footer>
<!-- footer 끝 -->


    
</section>
<aside class="template--rightAside">right</aside>
</footer>
<!-- Template-footer 끝 -->
    
    
    
<!-- ----------------------------------------------- -->

    

<!-- bootstrap -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
<!-- js -->
    <script src="/js/template/template.js"></script>
    <script src="/js/common/header.js"></script>
    <script src="/js/common/main.js"></script>
    <script src="/js/common/footer.js"></script>
</body>
</html>