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

    <title>JustGo-header</title>

<!-- bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<!-- fontAwesome -->
    <script src="https://kit.fontawesome.com/ae1a88d4e2.js" crossorigin="anonymous"></script>
</head>
<body class="template--body">



<!-- ----------------------------------------------- -->


<!-- Template-header 시작 -->
<header class="template--header">
<aside class="template--leftAside"></aside>
<section class="template--Section">



<!-- loginNav 시작 -->
<nav class="common--loginNav__container"> <%-- 각종 버튼(임시용) --%>
    <form>
        <a href="/manager/memberManager">
            <button type="button" class="btn btn-secondary btn-sm">관리자페이지</button>
        </a>    
    </form>
    <form action="/html/board/boardNotice.html" method="get">
        <a href="/html/board/boardNotice.html">
            <button type="button" class="btn btn-secondary btn-sm">에러</button>
        </a>
    </form>
    <form action="/html/board/boardNotice.html" method="get">
        <a href="/html/board/boardNotice.html">
            <button type="button" class="btn btn-secondary btn-sm">공지사항</button>
        </a>
    </form>
    <form action="/html/board/boardNotice.html" method="get">
        <a href="/html/board/boardNotice.html">
            <button type="button" class="btn btn-secondary btn-sm">1:1문의</button>
        </a>
    </form>
    <form action="/html/board/boardNotice.html" method="get">
        <a href="/html/board/boardNotice.html">
            <button type="button" class="btn btn-secondary btn-sm">포스트</button>
        </a>
    </form>
    <form action="/html/board/boardNotice.html" method="get">
        <a href="/html/board/boardNotice.html">
            <button type="button" class="btn btn-secondary btn-sm">글쓰기</button>
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
    <form action="/account/login" method="post">
            <input type="hidden" name="memberEmail" value="user@kh.or.kr">
            <input type="hidden" name="memberPw" value="pass01!">
            
            <button class="btn btn-secondary btn-sm">로그인</button>
    </form>

    <form action="#">
        <a href="#">
            ---임시용|||실사용---
        </a>    
    </form>

    <c:choose>
        <c:when test="${empty loginMember}"> <%-- 로그인 안했을 때 --%>
            <form>
                <a href="/account/login">
                    <button type="button" class="btn btn-secondary btn-sm">로그인</button>
                </a>
            </form>
            <form action="/html/account/join.html" method="get">
                <a href="/html/account/join.html">
                    <button type="button" class="btn btn-secondary btn-sm">회원가입</button>
                </a>
            </form>
        </c:when>
        <c:otherwise> <%-- 로그인했을 때 --%>
            <form>
                <a href="/account/logout" id="logoutBtn">
                    <button type="button" class="btn btn-secondary btn-sm">로그아웃</button>
                </a>
            </form>
            <form>
                <a href="/myPage/info">
                    <button type="button" class="btn btn-secondary btn-sm">마이페이지</button>
                </a>
            </form>
            <c:if test="${loginMember.memberRole == 1}"> <%-- 로그인했는데 관리자였을 때 --%>
                <form>
                    <a href="/manager/memberManager">
                        <button type="button" class="btn btn-secondary btn-sm">관리자페이지</button>
                    </a>    
                </form>
            </c:if>
        </c:otherwise>
    </c:choose>
</nav>
<!-- loginNav 끝 -->



<!-- header 시작 -->
<header class="common--header__container">
    <a href="/"> <%-- 메인페이지로 이동 --%>
        <img src="/resources/images/officialImages/JUSTGO_OFFICIAL_LOGO.png" alt="JustGo 로고">
    </a>
    <div class="common--header__searchContainer">
        <form action="#" method="get"> <%-- 전체 게시글 검색 --%>
            <input type="text" placeholder="검색어를 입력해주세요." maxlength="30">
            <button type="button" class="btn btn-secondary">
                <i class="fa-solid fa-magnifying-glass"></i>
            </button>
        </form>
    </div>
    <c:if test="${!empty sessionScope.loginMember}" >
    <div class="common--header__profileContainer">
        <div class="common--header__profileBox">
            <a href="/myPage/info"> <%-- 마이페이지로 이동 --%>
                <img src="/resources/images/officialProfile/KIKI.jpg" alt="프로필 이미지">
                <div>${loginMember.memberNickname}</div>
            </a>
        </div>
    </div>
    </c:if>
</header>
<!-- header 끝 -->



<!-- nav 시작 -->
<nav class="common--navContainer sticky-top">
    <ul class="nav justify-content-around" id="common--boardList">
        <%--<li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="moreDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">여행게시판</a>
            <ul class="dropdown-menu common--tripBoard" aria-labelledby="moreDropdown">
                <li><a class="dropdown-item" href="/html/board/boardChina.html"><img src="/resources/images/officialFlag/CHINAFLAG.png" alt="중국국기">중국게시판</a></li>
                <li><a class="dropdown-item" href="/html/board/boardJapan.html"><img src="/resources/images/officialFlag/JAPANFLAG.png" alt="일본국기">일본게시판</a></li>
                <li><a class="dropdown-item" href="/html/board/boardVietnam.html"><img src="/resources/images/officialFlag/VIETNAMFLAG.png" alt="베트남국기">베트남게시판</a></li>
                <li><a class="dropdown-item" href="/html/board/boardThai.html"><img src="/resources/images/officialFlag/THAIFLAG.png" alt="태국국기">태국게시판</a></li>
                <li><a class="dropdown-item" href="/html/board/boardAustralia.html"><img src="/resources/images/officialFlag/AUSTRALIAFLAG.png" alt="호주국기">호주게시판</a></li>
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
        </li> --%>
        <c:forEach var="boardType" items="${boardTypeList}" >
            <c:if test="${boardType.BOARD_CODE} = 1">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="moreDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">여행게시판</a>
                <ul class="dropdown-menu common--tripBoard" aria-labelledby="moreDropdown">
                    <li><a class="dropdown-item" href="/html/board/boardChina.html"><img src="/resources/images/officialFlag/CHINAFLAG.png" alt="중국국기">중국게시판</a></li>
                    <li><a class="dropdown-item" href="/html/board/boardJapan.html"><img src="/resources/images/officialFlag/JAPANFLAG.png" alt="일본국기">일본게시판</a></li>
                    <li><a class="dropdown-item" href="/html/board/boardVietnam.html"><img src="/resources/images/officialFlag/VIETNAMFLAG.png" alt="베트남국기">베트남게시판</a></li>
                    <li><a class="dropdown-item" href="/html/board/boardThai.html"><img src="/resources/images/officialFlag/THAIFLAG.png" alt="태국국기">태국게시판</a></li>
                    <li><a class="dropdown-item" href="/html/board/boardAustralia.html"><img src="/resources/images/officialFlag/AUSTRALIAFLAG.png" alt="호주국기">호주게시판</a></li>
                </ul>
            </li>
            </c:if>
            <li class="nav-item">
                    <a class="nav-link" href="/board/${boardType.BOARD_CODE}">${boardType.BOARD_NAME}</a>
                
                <%-- <c:if test="${boardType == 1}">
                
                <c:forEach items="country" var="countryList">
                <li class="nav-item dropdown">
                    <ul class="dropdown-menu common--tripBoard" aria-labelledby="moreDropdown">
                        <li><a class="dropdown-item" href="/${country.COUNTRY_CODE}"><img src="/resources/images/officialFlag/CHINAFLAG.png" alt="중국국기">${country.COUNTRY_NAME}</a></li>
                    </ul>
                </li>
                </c:forEach>
                </c:if> --%>
                
            </li>
        </c:forEach>
    </ul>
</nav>
<!-- nav 끝 -->



</section>
<aside class="template--rightAside"></aside>
</header>
<!-- Template-header 끝 -->



<!-- ----------------------------------------------- -->



<!-- bootstrap -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
<!-- js -->
    <script src="/resources/js/template/template.js"></script>
    <script src="/resources/js/common/header.js"></script>
</body>
</html>