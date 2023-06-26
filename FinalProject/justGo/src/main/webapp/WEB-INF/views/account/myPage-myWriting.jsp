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
    <link rel="stylesheet" href="/resources/css/account/myPage.css">

    <title>JustGo-myPage_myWriting</title>

<!-- bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<!-- fontAwesome -->
    <script src="https://kit.fontawesome.com/ae1a88d4e2.js" crossorigin="anonymous"></script>
</head>
<body class="template--body">

<%-- <c:set var="memberPost" value="${memberPostList}"/>
<c:set var="loginMember" value="${memberPostList.loginMember}" />
<c:set var="myPostList" value="${memberPostList.myPostList}" /> --%>
<%-- ${map.loginMember} --%>
<%-- ${memberPost}
${myPostList} --%>






<!-- ----------------------------------------------- -->
<!-- Template-header 시작 -->
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<!-- Template-header 끝 -->
<!-- ----------------------------------------------- -->



<%-- map에 저장된 값 변수에 저장 --%>
<c:set var="pagination" value="${map.pagination}"/>
<c:set var="myPostList" value="${map.myPostList}"/>



<!-- Template-main 시작 -->
<main class="template--main">
<aside class="template--leftAside"></aside>
<section class="template--Section">



<!-- 페이지 제목 시작 -->
<div class="template--pageTitleContainer">
    <div class="template--pageTitleBox">
        <img src="/resources/images/officialPageTitle/PAGETITLE_WELCOME.png" alt="환영">
        <div class="template--overlayedTitle">마이페이지</div>
    </div>
</div>
<!-- 페이지 제목 끝 -->



<!-- 마이페이지 시작 -->
<div class="account--myPageContainer">
    <div class="account--leftBox">
        <a href="/myPage/info">
            <button type="button" class="btn btn-primary btn-lg">프로필</button>
        </a>
        <a href="/myPage/myWriting">
            <button type="button" class="btn btn-primary btn-lg">작성글 보기</button>
        </a>
        <a href="/myPage/updatePw">
            <button type="button" class="btn btn-primary btn-lg">비밀번호 변경</button>
        </a>
        <a>
            <button type="button" id="deleteAccount" class="btn btn-danger btn-lg" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo">회원탈퇴</button>
        </a>
    </div>
    <div class="account--rightBox">



    <%-- 내가 쓴 글 시작 --%>
    <div class="account--profile">
        <div class="account--subtitle"><i class="fa-solid fa-pen-to-square"></i>작성글</div>
        <form>
            <div class="account--myWritingBox">
                <table class="account--myWritingTable">
                    <thead>
                        <tr>
                        <th>글번호</th>
                        <th>태그</th>
                        <th>글제목</th>
                        <th>작성일</th>
                        <th>조회수</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- 여기에 글 목록을 동적으로 추가할 수 있습니다 -->
                        <c:choose>
                            <c:when test="${empty myPostList}">
                                <tr>
                                    <th colspan="5" style="text-align: center;">게시글이 존재하지 않습니다.</th>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <c:forEach items="${myPostList}" var="post">
                                    <tr>
                                        <td>${post.boardNo}</td>
                                        <td>${post.tagContent}</td>
                                        <c:choose>
                                            <c:when test="${post.countryNo == 0 || post.countryNo == null}">
                                                <td><form><a href="/board/${post.boardCode}/${post.boardNo}">${post.boardTitle}</a></form></td>
                                            </c:when>
                                            <c:otherwise>
                                                <td><form><a href="/board/${post.boardCode}/${post.countryNo}/${post.boardNo}">${post.boardTitle}</a></form></td>
                                            </c:otherwise>
                                        </c:choose>
                                        <%-- <td><form><a href="/board/${post.boardCode}/${post.boardNo}">${post.boardTitle}</a></form></td> --%>
                                        <td>${post.createDate}</td>
                                        <td>${post.readCount}</td>
                                    </tr>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                        <!-- 추가적인 글 목록을 여기에 추가할 수 있습니다 -->
                    </tbody>
                </table>
            </div>
            <c:if test="${!empty myPostList}"> <%-- 페이지 없으면 페이지네이션도 없음 --%>
            <div class="account--PaginationBox">
                <form action="#" method="get">
                    <nav aria-label="...">
                        <ul class="pagination">
                            <%-- 맨 처음 페이지로 이동 --%>
                            <li class="page-item">
                                <a class="page-link" id="prev" href="/myPage/myWriting?cp=1">처음</a>
                            </li>

                            <%-- 이전 목록 페이지 이동 --%>
                            <li class="page-item">
                                <a class="page-link" id="prev" href="/myPage/myWriting?cp=${pagination.prevPage}">이전</a>
                            </li>

                            <%-- 특정 번호 목록 페이지 이동 --%>
                            <c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}" step="1">
                                <c:choose>
                                    <c:when test="${i==pagination.currentPage}">
                                        <li class="page-item"><a class="page-link active">${i}</a></li> <%-- 현재 보고 있는 페이지 --%>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="page-item"><a class="page-link" href="/myPage/myWriting?cp=${i}">${i}</a></li>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>

                            <%-- 다음 목록 페이지 이동 --%>
                            <li class="page-item">
                                <a class="page-link" id="next" href="/myPage/myWriting?cp=${pagination.nextPage}">다음</a>
                            </li>

                            <%-- 맨 끝 페이지 이동 --%>
                            <li class="page-item">
                                <a class="page-link" id="next" href="/myPage/myWriting?cp=${pagination.maxPage}">끝</a>
                            </li>
                        </ul>
                    </nav>
                </form>
            </div>
            </c:if>
        </form>
    </div>
    <%-- 내가 쓴 글 끝 --%>


    </div>
</div>
<!-- 마이페이지 끝 -->



<%-- 탈퇴 모달창 시작 --%>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">회원탈퇴</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="/account/delete" method="post">
                <div class="modal-body">
                    <div class="mb-3">
                        <label for="recipient-name" class="col-form-label">현재 비밀번호 입력</label>
                        <input type="password" name="memberPw" class="form-control" id="recipient-password" maxlength="20" placeholder="비밀번호를 입력해주세요." required>
                    </div>
                    <div class="mb-3">
                        <label for="message-text" class="col-form-label">JustGo에 마지막으로 할 말이 있으신가요?</label>
                        <textarea type="text" name="lastWord" class="form-control" id="message-text" style="resize: none;" maxlength="100"
                        placeholder="좋은 제언을 귀담아 듣겠습니다."></textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-danger">탈퇴</button>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                </div>
            </form>
        </div>
    </div>
</div>
<%-- 탈퇴 모달창 끝 --%>



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
    <script src="/resources/js/account/myPage.js"></script>
<%-- 파일 업로드 --%>
    <script>
        function triggerFileInput() {
            var fileInput = document.getElementById("imageUpload");
            fileInput.click();
        }
    </script>
</body>
</html>