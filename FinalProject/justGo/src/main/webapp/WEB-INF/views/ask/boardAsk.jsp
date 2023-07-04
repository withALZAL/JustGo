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
    <link rel="stylesheet" href="/resources/css/board/board.css">

    <title>JustGo-boardAsk</title>

<!-- bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<!-- fontAwesome -->
    <script src="https://kit.fontawesome.com/ae1a88d4e2.js" crossorigin="anonymous"></script>
</head>
<body class="template--body">

<c:set var="askPagination" value="${map.askPagination}" />
<c:set var="askList" value="${map.askList}" />
<%-- ${map.pagination}  --%>
<%--${map.askList} --%>

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
        <img src="/resources/images/officialPageTitle/PAGETITLE_WRITING.png" alt="1:1문의">
        <div class="template--overlayedTitle" style="color: black;">
            <a href="#">
                1:1문의게시판
            </a>
        </div>
    </div>
</div>
<!-- 페이지 제목 끝 -->



<!-- 콘텐츠 시작 -->
<div class="board--contentContainer">
<div class="board--contentBox">
    <div class="board--contentBox__top">
    </div>



<!-- 글쓰기 테이블 시작 -->
    <div class="board--contentBox__boardAsk">
        <table class="board--boardTable">
            <thead>
                <tr>
                    <th>문의번호</th>
                    <th>문의제목</th>
                    <th>문의일</th>
                    <th>처리상태</th>
                </tr>
            </thead>
            <tbody>
                <!-- 여기에 글 목록을 동적으로 추가할 수 있습니다 -->
                <c:choose>
                            <c:when test="${empty askList}">
                                <tr>
                                    <th colspan="4">문의가 존재하지 않습니다.</th>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <c:forEach items="${askList}" var="ask">
                                
                                    <tr>
                                        <td>${ask.feedbackNo}</td>
                                        <td><form><a href="/ask/boardAsk_detail/${ask.feedbackNo}">${ask.feedbackTitle}</a></form></td>
                                        <td>${ask.feedbackDate}</td>
                                        <td>${ask.feedback_CF_FL}</td>
                                    </tr>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                
                <!-- 추가적인 글 목록을 여기에 추가할 수 있습니다 -->
            </tbody>
        </table>
    </div>
<!-- 글쓰기 테이블 끝 -->


    
    <div class="board--contentBox__bottom">
        <c:choose>
            <c:when test="${empty askList}">
                <div>
                    <a href="/"><button type="button" class="board--askListBtn" >메인으로 이동</button></a>
                </div>
            </c:when>
            <c:otherwise>
                <div class="board--pagenationBox" style="height: 50%; width: 100%;">
                    <form action="#" method="get">
                        <nav aria-label="...">
                            <ul class="pagination">

                                <%-- 맨 처음 페이지로 이동 --%>
                                <li class="page-item">
                                    <a class="page-link" id="prev" href="/ask/boardAsk/${loginMember.memberNo}?cp=1">맨 처음</a>
                                </li>

                                <%-- 이전 목록 페이지 이동 --%>
                                <li class="page-item">
                                    <a class="page-link" id="prev" href="/ask/boardAsk/${loginMember.memberNo}?cp=${askPagination.prevPage}">이전</a>
                                </li>

                                <%-- 특정 번호 목록 페이지 이동 --%>
                                <c:forEach var="i" begin="${askPagination.startPage}" end="${askPagination.endPage}" step="1">
                                    <c:choose>
                                        <c:when test="${i==askPagination.currentPage}">
                                            <li class="page-item active" aria-current="page"><a class="page-link">${i}</a></li>
                                        </c:when>
                                        <c:otherwise>
                                            <li class="page-item"><a class="page-link" href="/ask/boardAsk/${loginMember.memberNo}?cp=${i}">${i}</a></li>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>

                                <%-- 다음 목록 페이지 이동 --%>
                                <li class="page-item">
                                    <a class="page-link" id="next" href="/ask/boardAsk/${loginMember.memberNo}?cp=${memberPostPagination.nextPage}">다음</a>
                                </li>

                                <%-- 맨 끝 페이지 이동 --%>
                                <li class="page-item">
                                    <a class="page-link" id="next" href="/ask/boardAsk/${loginMember.memberNo}?cp=${memberPostPagination.endPage}">맨 끝</a>
                                </li>
                                
                            </ul>
                        </nav>
                    </form>
                </div>
            </c:otherwise>
        </c:choose>    
        <div class="board--pagenationSearchBox" style="height: 50%; width: 100%;">
            <form action="#"></form>
            <form action="#" method="post">
                <a>
                    <select class="board--searchSelector" name="boardSelect" id="boardSelect" onchange="changeSecondSelect()" required>
                        <option>제목+내용</option>
                        <option>제목</option>
                        <option>내용</option>
                        <option>글쓴이</option>
                    </select>
                    <input type="text" maxlength="10" style="width: 300px;" autocomplete="off">
                    <button type="button" class="btn btn-secondary btn-sm">검색</button>
                </a>
            </form>
            <a href="/ask/writingAsk">
                <button type="button" class="btn btn-secondary btn-lg" id="board--writingBtn">글쓰기</button>
            </a>
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
    <script src="/resources/js/board/board.js"></script>
</body>
</html>