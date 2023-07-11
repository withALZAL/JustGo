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
        <a href="/manager/managerMain">
            <i class="fa-solid fa-house fa-xl"></i>
        </a>
        <a href="/myPage/info">
            <i class="fa-solid fa-circle-user fa-xl"></i>
        </a>
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