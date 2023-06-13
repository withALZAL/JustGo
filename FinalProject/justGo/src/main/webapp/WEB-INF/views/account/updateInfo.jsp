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

    <title>JustGo-updateInfo</title>

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
<aside class="template--leftAside"></aside>
<section class="template--Section">



<!-- 페이지 제목 시작 -->
<div class="template--pageTitleContainer">
    <div class="template--pageTitleBox">
        <img src="/resources/images/officialPageTitle/PAGETITLE_WELCOME.png" alt="환영">
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
                    <img src="/resources/images/officialProfile/KIKI.jpg" alt="프로필 이미지" style="border: 3px solid black;">
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
                    <button type="button" class="btn btn-secondary btn-sm">수정</button>
                </div>
            </div>
        </form>
    </div>
</div>
<!-- 회원가입창 끝 -->



</section>
<aside class="template--rightAside"></aside>
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