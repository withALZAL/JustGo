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
    <link rel="stylesheet" href="/css/writing/writingBoard.css">

    <title>JustGo-writingBoard</title>

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
    <form action="https://www.naver.com" method="get">
        <a href="/html/common/error.html">
            <button type="button" class="btn btn-secondary btn-sm">관리자페이지</button>
        </a>
    </form>
</nav>
<!-- loginNav 끝 -->


<!-- header 시작 -->
<header class="common--header__container">
    <a href="https://www.naver.com">
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



<!-- 페이지 제목 시작 -->
<div class="template--pageTitleContainer">
    <div class="template--pageTitleBox">
        <img src="/images/officialPageTitle/PAGETITLE_WRITING.png" alt="글쓰기">
        <div class="template--overlayedTitle">글쓰기</div>
    </div>
</div>
<!-- 페이지 제목 끝 -->



<!-- 콘텐츠 시작 -->
<form action="#" method="post">
    <div class="writing--contentContainer">
        <div class="writing--contentBox">
            <div class="writing--inputTitle">
                <div>제목</div>
                <div><input type="text" placeholder="제목을 입력해주세요." maxlength="50"></div>
                <div class="writing--selectorBox">
                    <select class="writing--boardSelector" name="boardSelect" id="boardSelect" onchange="changeSecondSelect()" required>
                        <!-- db조회해서 forEach문 돌려서 값 출력  -->
                        <option value="BoardFree">자유게시판</option>
                        <option value="boardQuestion">질문게시판</option>
                        <option value="BoardJapan">일본게시판</option>
                        <option value="BoardChina">중국게시판</option>
                        <option value="BoardVietname">베트남게시판</option>
                        <option value="BoardThai">태국게시판</option>
                        <option value="BoardAustraila">호주게시판</option>
                    </select>
                    <select class="writing--tagSelector" name="tagSelector" id="tagSelector" required>
                        <option value="TagCommon">일반</option>
                        <option value="TagTip">꿀팁</option>
                        <option value="TagFood">맛집</option>
                        <option value="TagHealing">힐링</option>
                    </select>
                </div>
            </div>
        <div class="writing--inputContentBox">
        <div class="writing--summernoteBox">
            여기에 썸머노트를 넣습니다.
        </div>
        <div class="writing--ButtonBox">
            <a href="/html/common/main.html">
                <button type="button" class="btn btn-secondary btn-sm" style="background-color: blueviolet;">게시</button>
            </a>
            <a href="/html/common/main.html">
                <button type="button" class="btn btn-secondary btn-sm">취소</button>
            </a>
        </div>
    </div>
</div>
</div>
</form>
<!-- 콘텐츠 끝 -->



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
    <script src="/js/writing/writingBoard.js"></script>
</body>
</html>