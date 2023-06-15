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
    <link rel="stylesheet" href="/resources/css/manager/manager.css">

    <title>JustGo-askManager</title>

<!-- bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/resources/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<!-- fontAwesome -->
    <script src="https://kit.fontawesome.com/ae1a88d4e2.js" crossorigin="anonymous"></script>
</head>
<body class="template--body">

<c:set var="pagination" value="${map.pagination}" />
<c:set var="askList" value="${map.askList}" />
<%-- ${map.pagination} --%>
<%-- ${map.askList} --%>

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
        <img src="/resources/images/officialPageTitle/PAGETITLE_MANAGER.png" alt="관리자">
        <div class="template--overlayedTitle" style="color: black;">
            <a href="/manager/askManager">
                관리자_1:1문의
            </a>
        </div>
    </div>
</div>
<!-- 페이지 제목 끝 -->



<!-- 콘텐츠 시작 -->
<div class="manager--contentContainer">
<div class="manager--contentBox">
    <aside class="manager--sideContainer">
        <div class="manager--sidebar">
            <a href="/board/boardNotice"><i class="fa-solid fa-paper-plane"></i>공지사항</a>
            <a href="/manager/memberManager"><i class="fa-solid fa-address-book"></i>회원관리</a>
            <a href="/manager/askManager"><i class="fa-solid fa-comments"></i>1:1문의</a>
            <a href="/manager/reportManager"><i class="fa-solid fa-clipboard"></i>신고</a>
        </div>
    </aside>
    <div class="manager--mainBox">

        <%-- statisticsBox.jsp --%>
        <jsp:include page="/WEB-INF/views/manager/statisticsBox.jsp"/>

        <div class="manager--content">
            <form action="#" method="post">
                <table class="manager--inquiryTable">
                    <thead>
                        <tr>
                            <th>번호</th>
                            <th>닉네임</th>
                            <th>문의제목</th>
                            <th>문의일</th>
                            <th>처리상태</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:choose>
                            <c:when test="${empty askList}">
                                <tr>
                                    <th colspan="6">문의가 존재하지 않습니다.</th>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <c:forEach items="${askList}" var="ask">
                                
                                    <tr>
                                        <td>${ask.feedbackNo}</td>
                                        <td><form><a href="#">${ask.memberNickname}</a></form></td>
                                        <td><form><a href="https://www.naver.com">${ask.feedbackText}</a></form></td>
                                        <td>${ask.feedbackDate}</td>
                                        <td>${ask.feedback_CF_FL}</td>
                                    </tr>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                        
                    </tbody>
                </table>
                <div class="manager--contentPagenation">
                    <form action="#" method="get">
                        <nav aria-label="...">
                            <ul class="pagination">
                                <%-- 맨 처음 페이지로 이동 --%>
                                <li class="page-item">
                                    <a class="page-link" id="prev" href="/manager/memberManager?cp=1">맨 처음</a>
                                </li>

                                <%-- 이전 목록 페이지 이동 --%>
                                <li class="page-item">
                                    <a class="page-link" id="prev" href="/manager/memberManager?cp=${pagination.prevPage}">이전</a>
                                </li>

                                <%-- 특정 번호 목록 페이지 이동 --%>
                                <c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}" step="1">
                                    <c:choose>
                                        <c:when test="${i==pagination.currentPage}">
                                            <li class="page-item"><a class="page-link">${i}</a></li>
                                        </c:when>
                                        <c:otherwise>
                                            <li class="page-item"><a class="page-link" href="/manager/memberManager?cp=${i}">${i}</a></li>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>

                                <%-- 다음 목록 페이지 이동 --%>
                                <li class="page-item">
                                    <a class="page-link" id="next" href="/manager/memberManager?cp=${pagination.nextPage}">다음</a>
                                </li>

                                <%-- 맨 끝 페이지 이동 --%>
                                <li class="page-item">
                                    <a class="page-link" id="next" href="/manager/memberManager?cp=${pagination.endPage}">맨 끝</a>
                                </li>
                            </ul>
                        </nav>
                    </form>
                </div>
            </form>
            <form class="manager--contentSearch" action="#" method="get">
                <a>
                    <select class="board--searchSelector" name="boardSelect" id="boardSelect" onchange="changeSecondSelect()" required>
                        <option>닉네임</option>
                        <option>문의제목</option>
                        <option>처리상태</option>
                    </select>
                    <input type="text" maxlength="10" style="width: 300px;">
                    <button type="button" class="btn btn-secondary btn-sm" style="margin-bottom: 8px;">검색</button>
                </a>
            </form>
        </div>
    </div>
</div>
</div>
<!-- 콘텐츠 끝 -->



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
    <script src="/resources/js/manager/askManager.js"></script>
</body>
</html>