<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- css -->
    <link rel="stylesheet" href="/resources/css/template/managerTemplate.css"> <!-- 문서 기본 화면 배치/기본 폰트 등 기본 설정 -->
    <link rel="stylesheet" href="/resources/css/manager/managerHeader.css">

    <title>JustGo-header</title>

<!-- bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<!-- fontAwesome -->
    <script src="https://kit.fontawesome.com/ae1a88d4e2.js" crossorigin="anonymous"></script>
<%-- sweetAlert2 --%>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body class="template--body">



<!-- ----------------------------------------------- -->



<!-- Template-header 시작 -->

<header class="template--header">
<aside class="template--leftAside"></aside>
<section class="template--Section">


<!-- loginNav 시작 -->
<nav class="manager--loginNav__container"> <%-- 각종 버튼(임시용) --%>
    <form>
        <a href="/"> 
            <img src="/resources/images/officialImages/JUSTGO_OFFICIAL_LOGO.png" alt="JustGo 로고">
        </a>
    </form> 
    <div class="manager--loginSession"> 
        <form>
            <a href="/myPage/info">
                <i class="fa-solid fa-circle-user fa-xl"></i>
                <%-- <button type="button" class="btn btn-secondary btn-sm">마이페이지</button> --%>
            </a>
        </form>
        <label for="alarmToggle">
            <i class="fa-solid fa-envelope fa-xl"></i>
        </label>
        <input type="checkbox" id="alarmToggle" hidden>
        <div class="alarm-menu">
            알람받는 공간
            <ul id="alarmBox">
            </ul>
        </div>
    </div>
</nav>
<!-- loginNav 끝 -->



<!-- header 시작 -->
<header class="manager--header__container">
        <div class="template--pageTitleContainer">
            <div class="manager--profileBox">
                <c:if test="${!empty sessionScope.loginMember}" >
                <div class="manager--header__profileContainer">
                    <div class="manager--header__profileBox">
                        <a href="/myPage/info"> <%-- 마이페이지로 이동 --%>
                        <c:choose>
                            <c:when test="${!empty sessionScope.loginMember.profileImg}"> <%-- 프로필 이미지 있을 때 --%>
                                <div class="manager--header__profileImageBox">
                                    <img src="${sessionScope.loginMember.profileImg}" alt="프로필 이미지">
                                </div>
                            </c:when>
                            <c:otherwise> <%-- 프로필 이미지 없을 때 --%>
                                <div class="manager--header__profileImageBox">
                                    <img src="/resources/images/officialProfile/managerPROFILE.png" alt="기본 프로필 이미지">
                                </div>
                            </c:otherwise>
                        </c:choose>
                        <div class="manager--memberNickname">${loginMember.memberNickname}</div>
                        </a>
                    </div>
                </div>
                </c:if>
            
            </div> 
        </div>
    
</header>
<!-- header 끝 -->



<!-- nav 시작 -->
<%-- <nav class="manager--navContainer sticky-top">
    <ul class="nav justify-content-around" id="manager--boardList">
        <c:forEach var="boardType" items="${boardTypeList}">
            <c:if test="${boardType.BOARD_CODE == 1}">
                <li class="nav-item">
                    <a class="nav-link dropdown-toggle" id="moreDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false"
                    href="/board/${boardType.BOARD_CODE}">${boardType.BOARD_NAME}</a>
                    <ul class="dropdown-menu manager--tripBoard" aria-labelledby="moreDropdown">
                        <c:forEach items="${countryList}" var="country">
                            <c:choose>
                                <c:when test="${country.COUNTRY_NAME == '중국'}">
                                    <li><a class="dropdown-item" href="/board/1/${country.COUNTRY_NO}">
                                    <img src="/resources/images/officialFlag/CHINAFLAG.png" alt="중국국기">${country.COUNTRY_NAME}게시판</a></li>
                                </c:when>
                                <c:when test="${country.COUNTRY_NAME == '일본'}">
                                    <li><a class="dropdown-item" href="/board/1/${country.COUNTRY_NO}">
                                    <img src="/resources/images/officialFlag/JAPANFLAG.png" alt="일본국기">${country.COUNTRY_NAME}게시판</a></li>
                                </c:when>
                                <c:when test="${country.COUNTRY_NAME == '베트남'}">
                                    <li><a class="dropdown-item" href="/board/1/${country.COUNTRY_NO}">
                                    <img src="/resources/images/officialFlag/VIETNAMFLAG.png" alt="베트남국기">${country.COUNTRY_NAME}게시판</a></li>
                                </c:when>
                                <c:when test="${country.COUNTRY_NAME == '태국'}">
                                    <li><a class="dropdown-item" href="/board/1/${country.COUNTRY_NO}">
                                    <img src="/resources/images/officialFlag/THAIFLAG.png" alt="태국국기">${country.COUNTRY_NAME}게시판</a></li>
                                </c:when>
                                <c:when test="${country.COUNTRY_NAME == '호주'}">
                                    <li><a class="dropdown-item" href="/board/1/${country.COUNTRY_NO}">
                                    <img src="/resources/images/officialFlag/AUSTRALIAFLAG.png" alt="호주국기">${country.COUNTRY_NAME}게시판</a></li>
                                </c:when>
                            </c:choose>
                        </c:forEach>
                    </ul>
                </li>
            </c:if>
            <c:if test="${boardType.BOARD_CODE != 1 && boardType.BOARD_CODE != 4}" >
                <li class="nav-item">
                    <a class="nav-link" href="/board/${boardType.BOARD_CODE}">${boardType.BOARD_NAME}</a>
                </li>
            </c:if>
            <c:if test="${!empty sessionScope.loginMember && boardType.BOARD_CODE == 4}">
                <li class="nav-item">
                    <a class="nav-link" href="/board/${boardType.BOARD_CODE}">${boardType.BOARD_NAME}</a>
                </li>
            </c:if>
        </c:forEach>   
    </ul>
</nav> --%>
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
    
    <%-- <script src="/resources/js/manager/header.js"></script> --%>
    <script>
        const loginMemberNo = "${loginMember.memberNo}";
    </script>
</body>
</html>