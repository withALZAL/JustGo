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
    <link rel="stylesheet" href="/css/account/account.css">

    <title>JustGo-updateInfo</title>

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
    <form action="https://www.naver.com" method="get">
        <a href="/html/common/error.html">
            <button type="button" class="btn btn-secondary btn-sm">관리자페이지</button>
        </a>
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



<!-- 페이지 제목 시작 -->
<div class="template--pageTitleContainer">
    <div class="template--pageTitleBox">
        <img src="/images/officialPageTitle/PAGETITLE_WELCOME.png" alt="환영">
        <div class="template--overlayedTitle">개인정보수정</div>
    </div>
</div>
<!-- 페이지 제목 끝 -->



<!-- 회원가입창 시작 -->
<div class="account--joinContainer">
    <div class="account--joinBox">
        <form action="https://www.naver.com" method="post">
            <div class="account--inputProfileBox">
                <a href="https://www.google.com">
                    <img src="/images/officialProfile/KIKI.jpg" alt="프로필 이미지" style="border: 3px solid black;">
                </a>
                <!-- <input type="file"> -->
            </div>
            <div class="account--inputInfoBox">
                <table>
                    <tr>
                        <th>현재 비밀번호</th>
                        <td>
                            <input type="password" maxlength="15" placeholder="비밀번호를 입력해주세요.">
<!--                             <div style="height: 5px; font-size: 0.2rem; color: green;">비밀번호가 일치합니다.</div> -->
                            <div style="height: 0.1px; font-size: 0.2rem; color: red;">비밀번호가 일치하지 않습니다.</div>
                        </td>
                        <td></td>
                    </tr>
                    <section class="account--">
                    <tr>
                        <th>변경할 비밀번호</th>
                        <td>
                            <input type="password" maxlength="15" placeholder="비밀번호를 입력해주세요.">
                            <div style="height: 0.1px; font-size: 0.2rem; color: black;">15자 이내의 영문 소/대문자, 숫자, 특수문자(!, @, #, $, %)로 입력해주세요.</div>
<!--                             <div style="height: 5px; font-size: 0.2rem; color: green;">사용할 수 있는 비밀번호입니다.</div>
                            <div style="height: 5px; font-size: 0.2rem; color: red;">사용할 수 없는 비밀번호입니다.</div> -->
                        </td>
                    </tr>
                    <tr>
                        <th>비밀번호 확인</th>
                        <td>
                            <input type="password" maxlength="15" placeholder="비밀번호를 입력해주세요.">
<!--                             <div style="height: 5px; font-size: 0.2rem; color: green;">비밀번호가 일치합니다.</div> -->
                            <div style="height: 0.1px; font-size: 0.2rem; color: red;">비밀번호가 일치하지 않습니다.</div>
                        </td>
                    </tr>
                    <tr>
                        <th>변경할 닉네임</th>
                        <td>
                            <input type="text" maxlength="8" placeholder="닉네임을 입력해주세요." value="폭탄배달부키키">
                            <div style="height: 0.1px; font-size: 0.2rem; color: black;">8자 이내로 한글, 영문 소/대문자를 입력해주세요.</div>
<!--                             <div style="height: 5px; font-size: 0.2rem; color: green;">사용할 수 있는 닉네임입니다.</div>
                            <div style="height: 5px; font-size: 0.2rem; color: red;">사용할 수 없는 닉네임입니다.</div> -->
                        </td>
                    </tr>
                    </section>
                </table>
                <div class="account--joinBtnBox">
                    <button type="button" class="btn btn-secondary btn-sm">개인정보 수정</button>
                    <button type="button" class="btn btn-secondary btn-sm">게시글 조회</button>
                    <button type="button" class="btn btn-secondary btn-sm">비밀번호 찾기</button>
                    <button type="button" class="btn btn-secondary btn-sm" style="background-color: red;">회원탈퇴</button>
                </div>
            </div>
        </form>
    </div>
</div>
<!-- 회원가입창 끝 -->



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
    <script src="/js/account/join.js"></script>
</body>
</html>