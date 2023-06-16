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
    <link rel="stylesheet" href="/resources/css/writing/post.css">

    <title>${board.boardTitle}</title>

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
        <img src="/resources/images/officialPageTitle/PAGETITLE_SILVER.png" alt="기본">
        <div class="template--overlayedTitle" style="color: black;">
            <a href="https://www.naver.com">
                ROOT게시판명
            </a>
        </div>
    </div>
</div>
<!-- 페이지 제목 끝 -->



<!-- 포스트 시작 -->
<div class="writing--postContainer">
    <div class="writing--postTitleBox">
        <div class="writing--postTag">[일반]</div>
        <div class="writing--postTitle">${board.boardTitle}</div>
        <div class="writing--postInfoBox">
            <div class="writing--postProfile">
                <img src="/resources/images/officialProfile/KIKI.jpg" alt="프로필 이미지">
                <div>${board.memberNickname}</div>
            </div>
            <div class="writing--postUpdateDate" style="font-size: 0.8rem" style="text-align: center;">
            &nbsp <i class="fa-solid fa-eye"></i> ${board.readCount} &nbsp&nbsp&nbsp
            <a href="#"><i class="fa-solid fa-heart" style="color: red;"></i></a> ${board.likeCount}</div>
            <div class="writing--postEnrollDate" style="font-size: 0.8rem">등록일: <a>${board.createDate}</a></div>
            <c:if test="${not empty board.boardUpdate}" >
            <div class="writing--postUpdateDate" style="font-size: 0.8rem">수정일: <a>${board.boardUpdate}</a></div>
            </c:if>

        </div>
    </div>


<div class="writing--postBox">
    <div class="writing--postContent">${board.boardText}</div>
</div>
<div class="writing--postBottomBox">
    <form action="#" method="post">
    <a href="/resources/html/common/main.html">
        <button type="button" class="btn btn-secondary btn-sm"><i class="fa-solid fa-heart" style="color: red;"></i>  좋아요</button>
    </a>
    <a href="/resources/html/common/main.html">
        <button type="button" class="btn btn-secondary btn-sm">수정</button>
    </a>
    <a href="/resources/html/common/main.html">
        <button type="button" class="btn btn-secondary btn-sm">취소</button>
    </a>
    <a href="/resources/html/common/main.html">
        <button type="button" class="btn btn-secondary btn-sm" style="background-color: red;">삭제</button>
    </a>
    </form>
</div>
</div>
<!-- 포스트 끝 -->



<!-- 댓글 시작 --> <%-- 나중에 안정화 되면 지우기 --%>
<%-- <div class="writing--commentContainer">
<div class="writing--commentBox">
    <table class="writing--commentTable">
        <tr>
            <th class="writing--commentProfileBox">
                <span class="writing--commentProfileBox__profileImage"><img src="/resources/images/officialProfile/MARUKO.jpg" alt="프로필 이미지"></span>
                <span class="writing--commnetProfileBox__profileName">마루코는열여덟살</span>
            </th>
            <td class="writing--commentContentBox">
                내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용
            </td>
            <td class="writing--commentDateBox">
                2023년 3월 3일
            </td>
            <td class="writing--commentBtnBox">
                <form action="#" method="get">
                    <a href="#">
                        <button type="button" class="btn btn-secondary btn-sm">답글</button>
                        <button type="button" class="btn btn-secondary btn-sm">수정</button>
                        <button type="button" class="btn btn-secondary btn-sm">삭제</button>
                    </a>
                </form>
            </td>
        </tr>
        <tr>
            <th class="writing--commentProfileBox">
                <span class="writing--commentProfileBox__reply"><i class="fa-solid fa-reply fa-rotate-180"></i></span>
                <span class="writing--commentProfileBox__profileImage"><img src="/resources/images/officialProfile/KIKI.jpg" alt="프로필 이미지"></span>
                <span class="writing--commnetProfileBox__profileName">댓글돌이키키사마</span>
            </th>
            <td class="writing--commentContentBox">
                내용내용내용내용내용내용내용내용
            </td>
            <td class="writing--commentDateBox">
                2023년 3월 3일
            </td>
            <td class="writing--commentBtnBox">
                <form action="#" method="get">
                    <a href="#">
                        <button type="button" class="btn btn-secondary btn-sm">수정</button>
                        <button type="button" class="btn btn-secondary btn-sm">삭제</button>
                    </a>
                </form>
            </td>
        </tr>
        <tr>
            <th class="writing--commentProfileBox">
                <span class="writing--commentProfileBox__reply"><i class="fa-solid fa-reply fa-rotate-180"></i></span>
                <span class="writing--commentProfileBox__profileImage"><img src="/resources/images/officialProfile/GITHUBICON.png" alt="프로필 이미지"></span>
                <span class="writing--commnetProfileBox__profileName">GITCATic</span>
            </th>
            <td class="writing--commentContentBox">
                내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용입니다. 띄어쓰기도 되고 모두 됩니다. 띄어쓰기도 되고 모두 됩니다.정말 되나요? 되네요! 띄어쓰기가 됩ㄴ디ㅏ~~~~~~~우러ㅜㅇ냄러ㅜㅇ내ㅑㅁㄹㅇ
            </td>
            <td class="writing--commentDateBox">
                2023년 3월 3일
            </td>
            <td class="writing--commentBtnBox">
                <form action="#" method="get">
                    <a href="#">
                        <button type="button" class="btn btn-secondary btn-sm">수정</button>
                        <button type="button" class="btn btn-secondary btn-sm">삭제</button>
                    </a>
                </form>
            </td>
        </tr>
        <tr>
            <th class="writing--commentProfileBox">
                <span class="writing--commentProfileBox__profileImage"><img src="/resources/images/officialProfile/MARUKO.jpg" alt="프로필 이미지"></span>
                <span class="writing--commnetProfileBox__profileName">마루코는열여덟살</span>
            </th>
            <td class="writing--commentContentBox">
                내용내용내용내용내용내용내용내용내용내용내용내용내용내용내
                용내용내용내용내용내용내용내용내용내용내용
            </td>
            <td class="writing--commentDateBox">
                2023년 3월 3일
            </td>
            <td class="writing--commentBtnBox">
                <form action="#" method="get">
                    <a href="#">
                        <button type="button" class="btn btn-secondary btn-sm">답글</button>
                        <button type="button" class="btn btn-secondary btn-sm">수정</button>
                        <button type="button" class="btn btn-secondary btn-sm">삭제</button>
                    </a>
                </form>
            </td>
        </tr>
    </table>
</div>
    <form action="#" post="get">
        <div class="writing--commentInput">
            <div style="font-weight: bold;">댓글 달기</div>
            <textarea></textarea>
            <button type="button" class="btn btn-secondary btn-sm">등록</a></form></button>
        </div>
    </form>
</div> --%>
<!-- 댓글 끝 --> <%-- 나중에 안정화 되면 지우기 --%>



<!-- ----------------------------------------------- -->
<!-- writing-comment 시작 -->
<jsp:include page="/WEB-INF/views/writing/comment.jsp"/>
<!-- writing-comment 끝 -->
<!-- ----------------------------------------------- -->



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
    <script src="/resources/js/writing/post.js"></script>
    <script src="/resources/js/common/footer.js"></script>
</body>
</html>