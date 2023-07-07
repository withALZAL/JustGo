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
    <link rel="stylesheet" href="/resources/css/manager/memberBoard.css">

    <title>memberBoard</title>

<!-- bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<!-- fontAwesome -->
    <script src="https://kit.fontawesome.com/ae1a88d4e2.js" crossorigin="anonymous"></script>
<%-- sweetAlert2 --%>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body class="template--body">

<c:set var="memberPostPagination" value="${map.memberPostPagination}" /> 
<c:set var="memberPostList" value="${map.memberPostList}" /> 
<c:set var="postMember" value="${map.postMember}" /> 

<%-- ${map.postMemberList}
${map.postMemberPagination}
${map.memberPostList}  
${map.memberPostPagination} --%>




<c:if test="${postMember.memberNo == memberNo}" >
    <c:set var="memberNickname" value="${postMember.memberNickname}"/>
    <c:set var="profileImg" value="${postMember.profileImg}"/>
    <c:set var="memberNo" value="${postMember.memberNo}"/>
</c:if>



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
<%-- <div class="template--pageTitleContainer"> --%>
    <%-- <div class="template--pageTitleBox">
        <div class="manager--overlayedTitle">
        <c:choose>
            <c:when test="${!empty profileImg}">
                <div class="manager--profileImage">
                    <a href="/manager/memberPage/${memberNo}">
                        <img src="${profileImg}" name="profileImage" alt="프로필 이미지" class="board--img">
                    </a>
                </div>
                
            </c:when>
            <c:otherwise>
                    <img src="/resources/images/officialProfile/COMMONPROFILE.png" name="profileImage" alt="기본 프로필 이미지" class="board--img">
            </c:otherwise>
        </c:choose>
        <c:if test="${!empty memberNickname}">
            <a href="/manager/memberPage/${memberNo}">
                '${memberNickname}' 님의 게시판
            </a>
        </c:if>
        </div>
    </div> --%>
<%-- </div> --%>
<!-- 페이지 제목 끝 -->



<!-- 콘텐츠 시작 -->
<div class="board--contentContainer">
    <aside class="manager--sideContainer">
        <jsp:include page="/WEB-INF/views/manager/managerMenuBox.jsp"/>
    </aside>
<div class="board--contentBox">
    <div class="board--contentBox__top">
    <div class="template--pageTitleBox">
        <div class="manager--overlayedTitle">
        <c:choose>
            <c:when test="${!empty profileImg}">
                <div class="manager--profileImage">
                    <a href="/manager/memberPage/${memberNo}">
                        <img src="${profileImg}" name="profileImage" alt="프로필 이미지" class="board--img">
                    </a>
                </div>
                
            </c:when>
            <c:otherwise>
                    <img src="/resources/images/officialProfile/COMMONPROFILE.png" name="profileImage" alt="기본 프로필 이미지" class="board--img">
            </c:otherwise>
        </c:choose>
        <c:if test="${!empty memberNickname}">
            <a href="/manager/memberPage/${memberNo}">
                '${memberNickname}' 님의 게시판
            </a>
        </c:if>
        </div>
    </div>
    <%-- 
        <div style="font-size: 1.5rem; font-weight: bold;"><i class="fa-solid fa-tag"></i>  태그</div>
        <form action="#" method="get">
            <div><a href="#">일반</a></div>
            <div><a href="#">꿀팁</a></div>
            <div><a href="#">맛집</a></div>
            <div><a href="#">힐링</a></div>
            <button type="button" class="btn btn-secondary btn-sm">임시버튼</button>
        </form>--%>
    </div> 



<!-- 글쓰기 테이블 시작 -->
    <div class="board--contentBox__main">
        <table class="board--boardTable">
            <thead>
                <tr>
                <th>글번호</th>
                <th>태그</th>
                <th>글제목</th>
                <th>작성일</th>
                <th>조회수</th>
                <th>삭제여부</th>
                <th>삭제</th>
                </tr>
            </thead>
            <tbody>
                <!-- 여기에 글 목록을 동적으로 추가할 수 있습니다 -->
                <c:choose>
                    <c:when test="${empty memberPostList}">
                        <tr>
                            <th colspan="7">게시글이 존재하지 않습니다.</th>
                        </tr>
                    </c:when>
                    <c:otherwise>
                        <c:forEach items="${memberPostList}" var="memberPost">
                            <tr>
                                <td>${memberPost.boardNo}</td>
                                <td>${memberPost.tagContent}</td>
                                <c:choose>
                                    <c:when test="${memberPost.countryNo == 0 || memberPost.countryNo == null}">
                                        <td><a href="/board/${memberPost.boardCode}/${memberPost.boardNo}">${memberPost.boardTitle}</a></td>
                                    </c:when>
                                    <c:otherwise>
                                        <td><a href="/board/${memberPost.boardCode}/${memberPost.countryNo}/${memberPost.boardNo}">${memberPost.boardTitle}</a></td>
                                    </c:otherwise>
                                </c:choose>
                                <td>${memberPost.createDate}</td>
                                <td>${memberPost.readCount}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${memberPost.boardDelete =='N'}">
                                            유지
                                        </c:when>
                                        <c:otherwise>
                                            삭제
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>
                                    <c:choose>
                                        <c:when test="${memberPost.boardDelete  == 'N'}">
                                            <button class="manager--deleteBtn" id="manager--delBtn" onclick="nobtn(${memberPost.boardNo})">삭제</button>
                                        </c:when>
                                        <c:otherwise>
                                            <button class="manager--restoreBtn" id="manager--reBtn" onclick="rebtn(${memberPost.boardNo})">복원</button>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
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
            <c:when test="${empty memberPostList}">
                <div>
                    <a href="/manager/memberManager"><button type="button" class="manager--memberListBtn" >목록</button></a>
                </div>
            </c:when>
            <c:otherwise>
                <div class="board--pagenationBox" style="height: 50%; width: 100%;">
                    <form action="#" method="get">
                        <nav aria-label="...">
                            <ul class="pagination">
                                <%-- 맨 처음 페이지로 이동 --%>
                                <li class="page-item">
                                    <a class="page-link" id="prev" href="/manager/memberBoard/${memberNo}?cp=1">맨 처음</a>
                                </li>

                                <%-- 이전 목록 페이지 이동 --%>
                                <li class="page-item">
                                    <a class="page-link" id="prev" href="/manager/memberBoard/${memberNo}?cp=${memberPostPagination.prevPage}">이전</a>
                                </li>

                                <%-- 특정 번호 목록 페이지 이동 --%>
                                <c:forEach var="i" begin="${memberPostPagination.startPage}" end="${memberPostPagination.endPage}" step="1">
                                    <c:choose>
                                        <c:when test="${i==memberPostPagination.currentPage}">
                                            <li class="page-item active" aria-current="page"><a class="page-link" style="background:cornflowerblue; ">${i}</a></li>
                                        </c:when>
                                        <c:otherwise>
                                            <li class="page-item"><a class="page-link" href="/manager/memberBoard/${memberNo}?cp=${i}">${i}</a></li>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>

                                <%-- 다음 목록 페이지 이동 --%>
                                <li class="page-item">
                                    <a class="page-link" id="next" href="/manager/memberBoard/${memberNo}?cp=${memberPostPagination.nextPage}">다음</a>
                                </li>

                                <%-- 맨 끝 페이지 이동 --%>
                                <li class="page-item">
                                    <a class="page-link" id="next" href="/manager/memberBoard/${memberNo}?cp=${memberPostPagination.endPage}">맨 끝</a>
                                </li>
                            </ul>
                        </nav>
                    </form>
                </div>
            </c:otherwise>
        </c:choose>
        
        
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
    <script src="/resources/js/manager/memberBoard.js"></script>
    <script> const postMemberNo= "${memberPost.memberNo}"</script>
</body>
</html>