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

    <title>JustGo-updatePw</title>

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
        <div class="template--overlayedTitle">비밀번호 수정</div>
    </div>
</div>
<!-- 페이지 제목 끝 -->



<!-- 개인정보변경창 시작 -->
<div class="account--joinContainer">
    <div class="account--joinBox">
        <form action="updatePw" method="post" id="updateInfo">
            <div class="account--inputProfileBox">
                <c:choose>
                    <c:when test="${!empty sessionScope.loginMember.profileImg}"> <%-- 프로필 이미지 있을 때 --%>
                        <img src="${sessionScope.loginMember.profileImg}" alt="프로필 이미지">
                    </c:when>
                    <c:otherwise> <%-- 프로필 이미지 없을 때 --%>
                        <img src="/resources/images/officialProfile/COMMONPROFILE.png" alt="기본 프로필 이미지">
                    </c:otherwise>
                </c:choose>
            </div>
            <div class="account--inputInfoBox">
                <table>
                    <tr>
                        <th>현재 비밀번호</th>
                        <td>
                            <input type="password" maxlength="15" placeholder="비밀번호를 입력해주세요." name="currentPw" id="currentPw" >
                            <div style="height: 0.1px; font-size: 0.2rem;" id="capslockCheck"></div>
                        </td>
                        <td></td>
                    </tr>
                    <section class="account--">
                    <tr>
                        <th>변경할 비밀번호</th>
                        <td>
                            <input type="password" maxlength="15" placeholder="비밀번호를 입력해주세요." name="newPw" id="newPw" >
                            <div style="height: 0.1px; font-size: 0.2rem;" class="newPw-message" id="newPwMessage"></div>
                        </td>
                    </tr>
                    <tr>
                        <th>비밀번호 확인</th>
                        <td>
                            <input type="password" maxlength="15" placeholder="비밀번호를 입력해주세요." name="newPwConfirm" id="newPwConfirm">
                            <div style="height: 0.1px; font-size: 0.2rem;" class="newPw-message" id="newPwConfirmMessage"></div>
                        </td>
                    </tr>
                    </section>
                </table>
                <div class="account--joinBtnBox">
                    <button type="submit" class="btn btn-secondary btn-sm" id="updatePwBtn">수정</button>
                </div>
            </div>
        </form>
    </div>
</div>

<!-- 개인정보변경창 끝 -->



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
    <script src="/resources/js/account/updatePw.js"></script>
</body>
</html>



