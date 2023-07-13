<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%-- map에 저장된 값들을 각각 변수에 저장 --%>
<c:set var="pagination" value="${map.pagination}"/>
<c:set var="boardList" value="${map.boardList}"/>

<%-- 
<c:set var="boardName" value="${boardTypeList[boardCode-1].BOARD_NAME}"/>
--%>

<c:forEach items="${boardTypeList}" var="boardType">
    <c:if test="${boardType.BOARD_CODE == boardCode}" >
        <c:set var="boardName" value="${boardType.BOARD_NAME}"/>
    </c:if>
</c:forEach>


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

    <title>${boardName}</title>

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

<c:if test="${not empty param.key}" >
    <c:set var="sp" value="&key=${param.key}&query=${param.query}"/>
</c:if>
<aside class="template--leftAside"></aside>
<section class="template--Section">



<!-- 페이지 제목 시작 -->
<div class="template--pageTitleContainer">
    <div class="template--pageTitleBox">
        <c:if test="${empty param.query}">
            <img src="/resources/images/officialPageTitle/PAGETITLE_FREE.png" alt="자유">
            <div class="template--overlayedTitle" style="color: black;">
                ${boardName}
            </div>
        </c:if>
        <c:if test="${not empty param.query}">
            <img src="/resources/images/officialPageTitle/PAGETITLE_FREE.png" alt="자유">
            <div class="template--overlayedTitle" style="color: black;">
                ${boardName}
            </div>
            <div class="template--overlayedSearch">'${param.query}' <br><i class="fa-solid fa-circle-check fa-shake"></i>&nbsp&nbsp검색결과</div>
        </c:if>
    </div>
</div>
<!-- 페이지 제목 끝 -->



<!-- 콘텐츠 시작 -->
<div class="board--contentContainer">
<div class="board--contentBox">
    <div class="board--contentBox__top">
<c:choose>
    <c:when test="${boardCode == 3}">
        <div style="font-size: 1.5rem; font-weight: bold;"><i class="fa-solid fa-tag"></i>  태그</div>

        <form id="tagForm" action="#" method="get">
        <c:forEach items="${tagAllList}" var="tag">
            <div onclick="basic(${tag.tagNo})">${tag.tagContent}</div>
        </c:forEach>
    </c:when>
</c:choose>
        </form>
    </div>



<!-- 글쓰기 테이블 시작 -->
<c:choose>
    <c:when test="${boardCode == 3}"> <%-- 질문게시판 --%>
    <div class="board--contentBox__main">
        <table class="board--boardTable">
            <thead>
                <tr>
                <th>번호</th>
            <%-- <c:if test="${boardCode == 3}"> --%>
                <th>태그</th>
            <%-- </c:if> --%>
                <th>제목</th>
                <th>글쓴이</th>
                <th>작성일</th>
                <th>조회수</th>
                <th>좋아요</th>
                </tr>
            </thead>
            <tbody id="tagList">
        <c:choose>
            <c:when test="${empty boardList}">
                <%-- 조회된 게시글 목록이 비어있거나 null인 경우 --%>
                
                <!-- 게시글 목록 조회 결과가 비어있다면 -->
                <tr>
                    <th colspan="6">게시글이 존재하지 않습니다.</th>
                </tr>
            </c:when>

            <c:otherwise>
                                <!-- 게시글 목록 조회 결과가 있다면 -->

                <c:forEach items="${boardList}" var="board">
                <!-- 여기에 글 목록을 동적으로 추가할 수 있습니다 -->
                <tr>
                    <td>${board.boardNo}</td>
                    <%-- <c:if test="${boardCode == 3}"> --%>
                            <td>${board.tagContent}</td>
                    <%-- </c:if> --%>
                    <td><a href="/board/${boardCode}/${board.boardNo}?cp=${pagination.currentPage}">${board.boardTitle}</a> [${board.commentCount}]</td>
                    <td>${board.memberNickname}</td>
                    <td>${board.createDate}</td>
                    <td>${board.readCount}</td>
                    <td>${board.likeCount}</td>
                </tr>
                </c:forEach>
            </c:otherwise>
        </c:choose>
            </tbody>
        </table>
    </div>

    </c:when>
    <c:otherwise>   <%-- 자유게시판 --%>
    <div class="boardfree--contentBox__main">
        <table class="board--boardTable">
            <thead>
                <tr>
                <th>번호</th>
                <%-- <th>태그</th> --%>
                <th>제목</th>
                <th>글쓴이</th>
                <th>작성일</th>
                <th>조회수</th>
                <th>좋아요</th>
                </tr>
            </thead>
            <tbody id="tagList">
        <c:choose>
            <c:when test="${empty boardList}">
                <%-- 조회된 게시글 목록이 비어있거나 null인 경우 --%>
                
                <!-- 게시글 목록 조회 결과가 비어있다면 -->
                <tr>
                    <th colspan="6">게시글이 존재하지 않습니다.</th>
                </tr>
            </c:when>

            <c:otherwise>
                                <!-- 게시글 목록 조회 결과가 있다면 -->

                <c:forEach items="${boardList}" var="board">
                <!-- 여기에 글 목록을 동적으로 추가할 수 있습니다 -->
                <tr>
                    <td>${board.boardNo}</td>
                            <%-- <td>${board.tagContent}</td> --%>
                    <td><a href="/board/${boardCode}/${board.boardNo}?cp=${pagination.currentPage}">${board.boardTitle}</a> [${board.commentCount}]</td>
                    <td>${board.memberNickname}</td>
                    <td>${board.createDate}</td>
                    <td>${board.readCount}</td>
                    <td>${board.likeCount}</td>
                </tr>
                </c:forEach>
            </c:otherwise>
        </c:choose>
            </tbody>
        </table>
    </div>
    </c:otherwise>
</c:choose>
<!-- 글쓰기 테이블 끝 -->


    
    <div class="board--contentBox__bottom">
        <div class="board--pagenationBox" style="height: 50%; width: 100%;">
            <form action="#" method="get">
                <nav aria-label="...">
                    <ul class="pagination" id="page">
                        <li class="page-item">
                            <a href="/board/${boardCode}?cp=1${sp}" class="page-link">맨처음</a>
                            
                        </li>
                        <li class="page-item">
                            <a href="/board/${boardCode}?cp=${pagination.prevPage}${sp}" class="page-link">이전</a>
                        </li>

                        <c:forEach var="i" begin="${pagination.startPage}"
                        end="${pagination.endPage}" step="1">

                            <c:choose>
                                <c:when test="${i == pagination.currentPage}">
                                    <!-- 현재 보고있는 페이지 -->
                                <li class="page-item active" aria-current="page"><a class="page-link">${i}</a></li>
                                
                                </c:when>

                                <c:otherwise>
                                    <!-- 현재 페이지를 제외한 나머지 -->
                                    <li class="page-item"><a class="page-link" href="/board/${boardCode}?cp=${i}${sp}">${i}</a></li>
                                    
                                </c:otherwise>
                            </c:choose>

                        </c:forEach>

                        <li class="page-item">
                        <a class="page-link" href="/board/${boardCode}?cp=${pagination.nextPage}${sp}">다음</a>
                        </li>
                        <li class="page-item">
                        <a class="page-link" href="/board/${boardCode}?cp=${pagination.maxPage}${sp}">마지막</a>
                        </li>


                    </ul>
                </nav>
            </form>
        </div>
        <div class="board--pagenationSearchBox" style="height: 50%; width: 100%;">
            <form action="#"></form>
            <form action="${boardCode}" method="get" id="boardSearch">
                    <a>
                    <select class="board--searchSelector" name="key" id="boardSelect"> 
                    <option value="tc">제목+내용</option>
                    <option value="t">제목</option>
                    <option value="c">내용</option>
                    <option value="w">글쓴이</option>
                    </select>
                    <input type="text"  name="query" maxlength="10" style="width: 300px;" autocomplete="off">
                    <button type="submit" class="btn btn-secondary btn-sm">검색</button>
                    </a>
                    </form>
            <c:if test="${not empty loginMember}" >
                <form action="/writing/writingBoard">
                    <button type="submit" class="btn btn-secondary btn-lg" id="board--writingBtn">글쓰기</button>
                    <input type="hidden" name="boardCode" value="${boardCode}"> <%-- value = 화면에 보이게 하기 위해서 value 값 설정 --%>
                    <input type="hidden" name="countryNo" value="${countryNo}">
                    <input type="hidden" name="footerCheck" value="0"> <%-- 상준 --%>
                </form> 
            </c:if>
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

    <script>
        const boardCode = "${boardCode}";
    </script>
<!-- js -->
    <script src="/resources/js/template/template.js"></script>
    <script src="/resources/js/common/header.js"></script>
    <script src="/resources/js/common/main.js"></script>
    <script src="/resources/js/common/footer.js"></script>
    <script src="/resources/js/board/board.js"></script>
    <script src="/resources/js/board/boardFree.js"></script>
</body>
</html>