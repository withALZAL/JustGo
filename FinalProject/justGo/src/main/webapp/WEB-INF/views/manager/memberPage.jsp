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
    <link rel="stylesheet" href="/resources/css/manager/memberPage.css">

    <title>JustGo-memberPage</title>

<!-- bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<!-- fontAwesome -->
    <script src="https://kit.fontawesome.com/ae1a88d4e2.js" crossorigin="anonymous"></script>
</head>
<body class="template--body">


<!-- ----------------------------------------------- -->
<!-- Template-header 시작 -->
<jsp:include page="/WEB-INF/views/manager/managerHeader.jsp"/>
<!-- Template-header 끝 -->
<!-- ----------------------------------------------- -->


<!-- Template-main 시작 -->
<main class="template--main">
<aside class="template--leftAside"></aside>
<section class="template--Section">


<!-- 마이페이지 시작 -->
<div class="ghostBox">
    <div class="account--joinContainer">
        <div class="account--joinBox">
            <div class="memberPage--left">
                <div class="manager--sideContainer">
                    <div class="manager--sidebar">
                        <jsp:include page="/WEB-INF/views/manager/managerMenuBox.jsp"/>
                    </div>
                </div>
            </div>
            </div>
            <div class="memberPage--right">
                <div class="template--pageTitleContainer">
                    <div class="template--pageTitleBox">
                        <div class="template--overlayedTitle">회원상세페이지</div>
                    </div>
                </div>
                <form action="/myPage/updateProfileImage" method="post" encType="multipart/form-data">
                    <div class="account--inputProfileBox">
                        <div id="previewImage" onclick="triggerFileInput()">
                        <c:if test="${!empty memberP.profileImg}">
                            <img src="${memberP.profileImg}" name="profileImage" alt="프로필 이미지">
                        </c:if>
                        <c:if test="${empty memberP.profileImg}">
                            <img src="/resources/images/officialProfile/COMMONPROFILEPLUS.png" name="profileImage" alt="기본 프로필 이미지">
                        </c:if>
                        </div>
                    </div>
                    <div class="account--inputInfoBox">
                        <table>
                            <tr>
                                <th>닉네임</th>
                                <td>${memberP.memberNickname}</td>
                            </tr>
                            <tr>
                                <th>이메일</th>
                                <td>${memberP.memberEmail}</td>
                            </tr>
                            <tr>
                                <th>가입일</th>
                                <td>${memberP.enrollDate}</td>
                            </tr>
                            <c:if test="${memberP.memberCondition == 'Y'}">
                                <tr>
                                    <th>탈퇴일</th>
                                    <td>${memberP.deleteDate}</td>
                                </tr>
                            </c:if>
                            
                        </table>
                        <div class="account--joinBtnBox">
                            <c:choose>
                                <c:when test="${memberP.memberCondition == 'Y'}">
                                    <button type="button" id="restoreAccount" class="btn btn-secondary btn-sm" style="background-color: cornflowerblue;" data-bs-toggle="modal" data-bs-target="#exampleModal1" data-bs-whatever="@mdo" >계정복구</button>
                                </c:when>
                                <c:otherwise>
                                    <button type="button" id="deleteAccount" class="btn btn-secondary btn-sm" style="background-color: tomato;" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo" >강제탈퇴</button>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- 마이페이지 끝 -->



<%-- 탈퇴 모달창 시작 --%>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">회원강제탈퇴</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                '${memberP.memberNickname}' 님을 강퇴시키겠습니까?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                <button type="submit" class="btn btn-danger" onclick="deleteMemberBtn(${memberP.memberNo})">탈퇴</button>
            </div>
        </div>
    </div>
</div>
<%-- 탈퇴 모달창 끝 --%>

<%-- 계정복구 모달창 시작 --%>
<div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">회원 계정복구</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                '${memberP.memberNickname}' 님의 계정을 복구시키겠습니까?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                <button type="submit" class="btn btn-primary" onclick="restoreMemberBtn(${memberP.memberNo})">복구</button>
            </div>
        </div>
    </div>
</div>
<%-- 계정복구 모달창 끝 --%>




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
    <script src="/resources/js/manager/memberPage.js"></script>
</body>
</html>