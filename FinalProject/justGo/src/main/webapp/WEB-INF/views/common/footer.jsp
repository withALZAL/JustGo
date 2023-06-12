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
    <link rel="stylesheet" href="/resources/css/common/footer.css">

    <title>JustGo-footer</title>

<!-- bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<!-- fontAwesome -->
    <script src="https://kit.fontawesome.com/ae1a88d4e2.js" crossorigin="anonymous"></script>
</head>
<body class="template--body">
    
    
<!-- ----------------------------------------------- -->
    

<!-- Template-footer 시작 -->
<footer class="template--footer">
<aside class="template--leftAside"></aside>
<section class="template--Section">



<!-- footer 시작 -->
<footer class="common--footerContainer">
    <img src="/resources/images/officialImages/JUSTGO_OFFICIAL_LOGO_BLACK.png" alt="저스트고로고" class="common--footerLogo">
    <div>
        <b><a href="https://github.com/withALZAL">주식회사 저스트고</a></b> <%-- 팀 github로 이동 --%>
        <i class="fa-solid fa-caret-left" style="color: #D9D9D9;"></i>
        <img src="/resources/images/officialProfile/GITHUBICON.png" alt="깃허브" style="height: 20px; padding-bottom: 2px;">
        <hr>
        서울특별시 중구 남대문로 120 그레이츠 청계(구 대일빌딩) 2F<br>
        사업자등록번호 : 899-89-00001<br>
        <img src="/resources/images/officialProfile/GITHUBICON.png" alt="깃허브" style="height: 20px; padding-bottom: 2px;">
        <i class="fa-solid fa-caret-right" style="color: #D9D9D9;"></i>
        대표: <a href="https://github.com/NewTypeAsuka">이상준</a> | <%-- 개인 github로 이동 --%>
        이사: 
        <a href="https://github.com/pakjongwook">박종욱</a>
        <a href="https://github.com/stane0120">배진현</a>
        <a href="https://github.com/nalsong">정송이</a>
        <a href="https://github.com/jyh1108">정용화</a>
        <a href="https://github.com/WOOJo11">조우형</a>
        <br>
        Copyright © 1998-2023 JustGo All Right Reserved<br>
    </div>
    <div class="common--footerRight">
        <a href="#">공지사항</a> <%-- 공지사항으로 이동 --%>
        <a href="#">1:1문의</a> <%-- 1:1문의로 이동 --%>
    </div>
    <div class="fixed-bottom" id="common--toTopBtn">
        <a href="https://www.naver.com"> <%-- 글쓰기 버튼 --%>
            <button>
                <i class="fa-solid fa-pen-to-square"></i>
            </button>
        </a>
        <a href="#" onclick="scrollToTop()"> <%-- 위로가기버튼 --%>
            <button>
                <i class="fa-solid fa-arrow-up"></i>
            </button>
        </a>
    </div>
</footer>
<!-- footer 끝 -->


    
</section>
<aside class="template--rightAside"></aside>
</footer>
<!-- Template-footer 끝 -->
    
    
    
<!-- ----------------------------------------------- -->

    

<!-- bootstrap -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
<!-- js -->
    <script src="/resources/js/template/template.js"></script>
    <script src="/resources/js/common/footer.js"></script>

<%-- 위로가기버튼 --%>
    <script>
        function scrollToTop() {
            window.scrollTo({
                top: 0,
                behavior: "smooth"
            });
        }
    </script>
</body>
</html>