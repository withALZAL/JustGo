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
    <link rel="stylesheet" href="/resources/css/writing/writingBoard.css">

    <title>JustGo-writingQuestion</title>

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
        <img src="/resources/images/officialPageTitle/PAGETITLE_WRITING.png" alt="글쓰기">
        <div class="template--overlayedTitle">1:1문의</div>
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
                    <!-- <select class="writing--boardSelector" name="boardSelect" id="boardSelect" onchange="changeSecondSelect()" required>
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
                    </select> -->
                </div>
            </div>
        <div class="writing--inputContentBox">
        <div class="writing--summernoteBox" style="position: relative;">
            <textarea class="writing--textarea"></textarea>
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
    <script src="/resources/js/writing/writingBoard.js"></script>
</body>
</html>