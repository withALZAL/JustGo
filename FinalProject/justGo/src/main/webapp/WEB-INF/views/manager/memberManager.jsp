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
    <link rel="stylesheet" href="/resources/css/manager/manager.css">

    <title>JustGo-memberManager</title>

<!-- bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/resources/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<!-- fontAwesome -->
    <script src="https://kit.fontawesome.com/ae1a88d4e2.js" crossorigin="anonymous"></script>
</head>
<body class="template--body">

    <c:set var="memberPagination" value="${map.memberPagination}" />
    <c:set var="memberList" value="${map.memberList}" />

<!-- ----------------------------------------------- -->
<!-- Template-header 시작 -->
<jsp:include page="/WEB-INF/views/manager/managerHeader.jsp"/>
<!-- Template-header 끝 -->
<!-- ----------------------------------------------- -->

<%-- ${map.pagination} --%>
<%-- ${map.memberList} --%>

<!-- Template-main 시작 -->
<main class="template--main">

<c:if test="${not empty param.boardSelect}" >
    <c:set var="sp" value="&boardSelect=${param.boardSelect}&query=${param.query}"/>
</c:if>

<aside class="template--leftAside"></aside>
<section class="template--Section">



<!-- 페이지 제목 시작 -->
<%--
<div class="template--pageTitleContainer">
    <div class="template--pageTitleBox">
        <img src="/resources/images/officialPageTitle/PAGETITLE_MANAGER.png" alt="관리자">
        <div class="template--overlayedTitle" style="color: black;">
            <a href="/manager/memberManager">
                관리자_회원관리
            </a>
        </div>
    </div> 
</div>
--%>
<!-- 페이지 제목 끝 -->



<!-- 콘텐츠 시작 -->
<div class="manager--contentContainer">
<div class="manager--contentBox">
    <aside class="manager--sideContainer">
        <jsp:include page="/WEB-INF/views/manager/managerMenuBox.jsp"/>
    </aside>
    <div class="manager--mainBox">
        <%-- 타이틀 --%>
        <div class="manager--overlayedTitle">
            <a href="/manager/memberManager">
                회원관리
            </a>
        </div>
        
        
        <div class="manager--content">
            <form action="#" method="post">
                <table class="manager--memberTable">
                    <thead>
                        <tr>
                            <th>회원번호</th>
                            <th>닉네임</th>
                            <th>이메일</th>
                            <th>가입일</th>
                            <th>계정상태</th>
                            <th>작성글</th>
                        </tr>
                    </thead>
                    <tbody>

                        <c:choose>
                            <c:when test="${empty memberList}">
                                <tr>
                                    <th colspan="6">회원이 존재하지 않습니다.</th>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <c:forEach items="${memberList}" var="member">
                                    <%-- ${member} --%>
                                    <tr>
                                        <td>${member.memberNo}</td>
                                        <td><form><a href="#">${member.memberNickname}</a></form></td>
                                        <td>${member.memberEmail}</td>
                                        <td>${member.enrollDate}</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${member.memberCondition == 'N'}">
                                                    유지
                                                </c:when>
                                                <c:otherwise>
                                                    탈퇴
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td><a href="/manager/memberBoard/${member.memberNo}"><button type="button" class="manager--memberPostListBTN">작성글</button></a></td>
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
                                    <a class="page-link" id="prev" href="/manager/memberManager?cp=1${sp}">맨 처음</a>
                                </li>

                                <%-- 이전 목록 페이지 이동 --%>
                                <li class="page-item">
                                    <a class="page-link" id="prev" href="/manager/memberManager?cp=${memberPagination.prevPage}${sp}">이전</a>
                                </li>

                                <%-- 특정 번호 목록 페이지 이동 --%>
                                <c:forEach var="i" begin="${memberPagination.startPage}" end="${memberPagination.endPage}" step="1">
                                    <c:choose>
                                        <c:when test="${i==memberPagination.currentPage}">
                                            <li class="page-item active" aria-current="page"><a class="page-link"  style="background:cornflowerblue;">${i}</a></li>
                                        </c:when>
                                        <c:otherwise>
                                            <li class="page-item"><a class="page-link" href="/manager/memberManager?cp=${i}${sp}">${i}</a></li>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>

                                <%-- 다음 목록 페이지 이동 --%>
                                <li class="page-item">
                                    <a class="page-link" id="next" href="/manager/memberManager?cp=${memberPagination.nextPage}${sp}">다음</a>
                                </li>

                                <%-- 맨 끝 페이지 이동 --%>
                                <li class="page-item">
                                    <a class="page-link" id="next" href="/manager/memberManager?cp=${memberPagination.endPage}${sp}">맨 끝</a>
                                </li>
                            </ul>
                        </nav>
                    </form>
                </div>
            </form>
            <form class="manager--contentSearch" action="/manager/memberManager" method="get">
                <a>
                    <select class="board--searchSelector" name="boardSelect" id="boardSelect" onchange="changeSecondSelect()" required>
                        <option value="t">닉네임</option>
                        <option value="c">이메일</option>
                    </select>
                    <input type="text" name="query" maxlength="10" style="width: 300px;">
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
    <script src="/resources/js/manager/memberManager.js"></script>
</body>
</html>