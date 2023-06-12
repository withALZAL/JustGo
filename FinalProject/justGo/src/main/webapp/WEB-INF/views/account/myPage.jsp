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
    <link rel="stylesheet" href="/resources/css/account/account.css">

    <title>JustGo-myPage</title>

<!-- bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<!-- fontAwesome -->
    <script src="https://kit.fontawesome.com/ae1a88d4e2.js" crossorigin="anonymous"></script>
</head>
<body class="template--body">



<!-- ----------------------------------------------- -->
<!-- Template-header 시작 -->
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<!-- Template-header 끝 -->
<!-- ----------------------------------------------- -->


<!-- Template-main 시작 -->
<main class="template--main">
<aside class="template--leftAside">left</aside>
<section class="template--Section">



<!-- 페이지 제목 시작 -->
<div class="template--pageTitleContainer">
    <div class="template--pageTitleBox">
        <img src="/resources/images/officialPageTitle/PAGETITLE_WELCOME.png" alt="환영">
        <div class="template--overlayedTitle">마이페이지</div>
    </div>
</div>
<!-- 페이지 제목 끝 -->



<!-- 회원가입창 시작 -->
<div class="account--joinContainer">
    <div class="account--joinBox">
        <form action="https://www.naver.com" method="post">
            <div class="account--inputProfileBox">
                <a href="https://www.google.com">
                    <img src="/resources/images/officialProfile/KIKI.jpg" alt="프로필 이미지" style="border: 3px solid black;">
                </a>
                <!-- <input type="file"> -->
            </div>
            <div class="account--inputInfoBox">
                <table>
                    <tr>
                        <th>닉네임</th>
                        <td>폭탄배달부키키</td>
                    </tr>
                    <tr>
                        <th>이메일</th>
                        <td>kikitheterrorist@naver.com</td>
                    </tr>
                    <tr>
                        <th>가입일</th>
                        <td>2023년 5월 30일</td>
                    </tr>
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
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<!-- Template-footer 끝 -->
<!-- ----------------------------------------------- -->

<!-- bootstrap -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
<!-- js -->
    <script src="/resources/js/template/template.js"></script>
    <script src="/resources/js/common/header.js"></script>
    <script src="/resources/js/common/main.js"></script>
    <script src="/resources/js/common/footer.js"></script>
    <script src="/resources/js/account/join.js"></script>
</body>
</html>