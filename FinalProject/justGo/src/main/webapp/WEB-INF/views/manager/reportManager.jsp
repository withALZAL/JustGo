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
    <link rel="stylesheet" href="/resources/css/common/main.css">
    <link rel="stylesheet" href="/resources/css/common/footer.css">
    <link rel="stylesheet" href="/resources/css/manager/reportManager.css">

    <title>JustGo-reportManager</title>

<!-- bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<!-- fontAwesome -->
    <script src="https://kit.fontawesome.com/ae1a88d4e2.js" crossorigin="anonymous"></script>
</head>
<body class="template--body">


<c:set var="reportPagination" value="${map.reportPagination}" />
<c:set var="reportList" value="${map.reportList}" />

<%-- ${map.reportList} --%>

<!-- ----------------------------------------------- -->
<!-- Template-header 시작 -->
<jsp:include page="/WEB-INF/views/manager/managerHeader.jsp"/>
<!-- Template-header 끝 -->
<!-- ----------------------------------------------- -->

    <!-- Template-main 시작 -->
    <main class="template--main">
    <aside class="template--leftAside"></aside>
    <section class="template--Section">



    <!-- 페이지 제목 시작 -->
    <%-- <div class="template--pageTitleContainer">
        <div class="template--pageTitleBox">
            <img src="/resources/images/officialPageTitle/PAGETITLE_MANAGER.png" alt="관리자">
            <div class="template--overlayedTitle" style="color: black;">
                <a href="/manager/reportManager">
                    관리자_신고
                </a>
            </div>
        </div>
    </div> --%>
    <!-- 페이지 제목 끝 -->



    <!-- 콘텐츠 시작 -->
    <div class="manager--contentContainer">
    <div class="manager--contentBox">
        <aside class="manager--sideContainer">
            <div class="manager--sidebar">
                <jsp:include page="/WEB-INF/views/manager/managerMenuBox.jsp"/>
            </div>
        </aside>
        <div class="manager--mainBox">
            <%-- 타이틀 --%>
            <div class="manager--overlayedTitle">
                <a href="/manager/reportManager">
                    신고관리
                </a>
            </div>

            <div class="manager--content">
                <form action="#" method="post">
                    <table class="manager--reportTable">
                        <thead>
                            <tr>
                                <th>신고번호</th>
                                <th>신고자</th>
                                <th>신고사유</th>
                                <th>글제목</th>
                                <th>글작성자</th>
                                <th>신고일</th>
                                <th>삭제여부</th>
                                <th>처리상태</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:choose>
                                <c:when test="${empty reportList}">
                                    <tr>
                                        <th colspan="9">신고가 존재하지 않습니다.</th>
                                    </tr>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach items="${reportList}" var="report">
                                        <tr>
                                            <td>${report.reportNo}</td>
                                            <td>${report.memberNickname}</td>
                                            <td>${report.reportCategory}</td>
                                            <c:choose>
                                                <c:when test="${report.countryNo == 0 || report.countryNo == null}">
                                                    <td><a href="/board/${report.boardCode}/${report.boardNo}">${report.boardTitle}</a></td>
                                                </c:when>
                                                <c:otherwise>
                                                    <td><a href="/board/${report.boardCode}/${report.countryNo}/${report.boardNo}">${report.boardTitle}</a></td>
                                                </c:otherwise>
                                            </c:choose>


                                            <%-- <td><a href="https://www.naver.com">${report.boardTitle}</a></td> --%>
                                            <td>${report.reportedNickname}</td>
                                            <td>${report.reportDate}</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${report.boardDelete  == 'N'}">
                                                        유지
                                                    </c:when>
                                                    <c:otherwise>
                                                        삭제
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${report.reprot_CF_FL == 'N'}">
                                                        처리중
                                                    </c:when>
                                                    <c:otherwise>
                                                        완료
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${report.reprot_CF_FL == 'N'}">
                                                        <button type="button" class="manager--confirmBtn" id="manager--conBtn" onclick="conbtn(${report.reportNo})">완료</button>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <button type="button" class="manager--disabledBtn" id="manager--conBtn" onclick="conbtn(${report.reportNo})" disabled>완료</button>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
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
                                        <a class="page-link" id="prev" href="/manager/reportManager?cp=1">맨 처음</a>
                                    </li>

                                    <%-- 이전 목록 페이지 이동 --%>
                                    <li class="page-item">
                                        <a class="page-link" id="prev" href="/manager/reportManager?cp=${reportPagination.prevPage}">이전</a>
                                    </li>

                                    <%-- 특정 번호 목록 페이지 이동 --%>
                                    <c:forEach var="i" begin="${reportPagination.startPage}" end="${reportPagination.endPage}" step="1">
                                        <c:choose>
                                            <c:when test="${i==reportPagination.currentPage}">
                                                <li class="page-item active" aria-current="page"><a class="page-link" style="background:cornflowerblue;">${i}</a></li>
                                            </c:when>
                                            <c:otherwise>
                                                <li class="page-item"><a class="page-link" href="/manager/reportManager?cp=${i}">${i}</a></li>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>

                                    <%-- 다음 목록 페이지 이동 --%>
                                    <li class="page-item">
                                        <a class="page-link" id="next" href="/manager/reportManager?cp=${reportPagination.nextPage}">다음</a>
                                    </li>

                                    <%-- 맨 끝 페이지 이동 --%>
                                    <li class="page-item">
                                        <a class="page-link" id="next" href="/manager/memberManager?cp=${reportPagination.endPage}">맨 끝</a>
                                    </li>
                                </ul>
                            </nav>
                        </form>
                    </div>
                </form>
                <form class="manager--contentSearch" action="/manager/reportManager" method="get">
                    <a>
                        <select class="board--searchSelector" name="boardSelect3" id="boardSelect" onchange="changeSecondSelect()" required>
                            <option value="r">신고사유</option>
                            <option value="p">신고자</option>
                            <option value="t">글제목</option>
                            <option value="w">글작성자</option>
                            <%-- <option>처리상태</option> --%>
                        </select>
                        <input type="text" name="query"  maxlength="10" style="width: 300px;" autocomplete="off">
                        <button type="submit" class="btn btn-secondary btn-sm" style="margin-bottom: 8px;">검색</button>
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
    <script src="/resources/js/manager/reportManager.js"></script>
</body>
</html>