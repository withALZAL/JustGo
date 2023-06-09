<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<c:forEach items="${boardTypeList}" var="boardType">
    <c:if test="${boardType.BOARD_CODE == boardCode}" >
        <c:set var="boardName" value="${boardType.BOARD_NAME}"/>
    </c:if>
</c:forEach>
<c:forEach items="${countryList}" var="boardType">
    <c:if test="${boardType.COUNTRY_NO == countryNo}" >
        <c:set var="countryName" value="${boardType.COUNTRY_NAME}"/>
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
    <link rel="stylesheet" href="/resources/css/writing/post.css">

    <title>${board.boardTitle}</title>

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
<%-- <jsp:include page="/WEB-INF/views/common/header.jsp"/> --%> <%-- post.jsp는 이유는 모르겠지만 header.jsp가 씹히는 문제가 생겨서 긴급하게 이렇게 조치합니다(상준) --%>
<!-- Template-header 끝 -->
<!-- ----------------------------------------------- -->



<!-- ----------------------------------------------- --> <%-- post.jsp는 이유는 모르겠지만 header.jsp가 씹히는 문제가 생겨서 긴급하게 이렇게 조치합니다(상준) --%>
<!-- Template-header 시작 -->
<header class="template--header">
<aside class="template--leftAside"></aside>
<section class="template--Section">



<!-- loginNav 시작 -->
<nav class="common--loginNav__container"> <%-- 각종 버튼(임시용) --%>

    <c:choose>
        <c:when test="${empty loginMember}"> <%-- 로그인 안했을 때 --%>
            <form>
                <a href="/account/login">
                    <button type="button" class="btn btn-secondary btn-sm">로그인</button>
                </a>
            </form>
            <form>
                <a href="/account/join">
                    <button type="button" class="btn btn-secondary btn-sm">회원가입</button>
                </a>
            </form>
        </c:when>
        <c:otherwise> <%-- 로그인했을 때 --%>
            <form>
                <a href="/account/logout" id="logoutBtn">
                    <button type="button" class="btn btn-secondary btn-sm">로그아웃</button>
                </a>
            </form>
            <form>
                <a href="/myPage/info">
                    <button type="button" class="btn btn-secondary btn-sm">마이페이지</button>
                </a>
            </form>
            <c:if test="${loginMember.memberRole == 1}"> <%-- 로그인했는데 관리자였을 때 --%>
                <form>
                    <a href="/manager/memberManager">
                        <button type="button" class="btn btn-secondary btn-sm">관리자페이지</button>
                    </a>    
                </form>
            </c:if>
        </c:otherwise>
    </c:choose>
</nav>
<!-- loginNav 끝 -->



<!-- header 시작 -->
<header class="common--header__container">
    <a href="/"> <%-- 메인페이지로 이동 --%>
        <img src="/resources/images/officialImages/JUSTGO_OFFICIAL_LOGO.png" alt="JustGo 로고">
    </a>
    <div class="common--header__searchContainer">
        <form action="/board/boardSearch" method="GET"> <%-- 전체 게시글 검색 --%>

            <input type="hidden" name="key3" value="t">
            <input type="search" name="query" id="query" placeholder="검색어를 입력해주세요." maxlength="30" value="${param.query}" autocomplete="off">
            <button type="submit" class="btn btn-secondary">
                <i class="fa-solid fa-magnifying-glass"></i>
            </button>
        </form>
    </div>
    <c:if test="${!empty sessionScope.loginMember}" >
    <div class="common--header__profileContainer">
        <div class="common--header__profileBox">
            <a href="/myPage/info"> <%-- 마이페이지로 이동 --%>
            <c:choose>
                <c:when test="${!empty sessionScope.loginMember.profileImg}"> <%-- 프로필 이미지 있을 때 --%>
                    <div class="common--header__profileImageBox">
                        <img src="${sessionScope.loginMember.profileImg}" alt="프로필 이미지">
                    </div>
                </c:when>
                <c:otherwise> <%-- 프로필 이미지 없을 때 --%>
                    <div class="common--header__profileImageBox">
                        <img src="/resources/images/officialProfile/COMMONPROFILE.png" alt="기본 프로필 이미지">
                    </div>
                </c:otherwise>
            </c:choose>
            <div>${loginMember.memberNickname}</div>
            </a>
        </div>
    </div>
    </c:if>
    <c:if test="${empty sessionScope.loginMember}">
    <div class="common--header__profileContainer">
        <div class="common--header__profileBox">
            <a href="/account/join"> <%-- 로그인으로 이동 --%>
                <div class="common--header__profileImageBox">
                    <img src="/resources/images/officialImages/earth.gif" alt="지구본">
                </div>
            <div id="greeting" class="common--greeting" style="font-family: 'Noto Serif KR', serif; color: grey; font-weight: bold;"></div>
            </a>
        </div>
    </div>
    </c:if>
</header>
<!-- header 끝 -->



<!-- nav 시작 -->
<nav class="common--navContainer sticky-top">
    <ul class="nav justify-content-around" id="common--boardList">
        <c:forEach var="boardType" items="${boardTypeList}">
            <c:if test="${boardType.BOARD_CODE == 1}">
                <li class="nav-item">
                    <a class="nav-link dropdown-toggle" id="moreDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false"
                    href="/board/${boardType.BOARD_CODE}">${boardType.BOARD_NAME}</a>
                    <ul class="dropdown-menu common--tripBoard" aria-labelledby="moreDropdown">
                        <c:forEach items="${countryList}" var="country">
                            <c:choose>
                                <c:when test="${country.COUNTRY_NAME == '중국'}">
                                    <li><a class="dropdown-item" href="/board/1/${country.COUNTRY_NO}">
                                    <img src="/resources/images/officialFlag/CHINAFLAG.png" alt="중국국기">${country.COUNTRY_NAME}게시판</a></li>
                                </c:when>
                                <c:when test="${country.COUNTRY_NAME == '일본'}">
                                    <li><a class="dropdown-item" href="/board/1/${country.COUNTRY_NO}">
                                    <img src="/resources/images/officialFlag/JAPANFLAG.png" alt="일본국기">${country.COUNTRY_NAME}게시판</a></li>
                                </c:when>
                                <c:when test="${country.COUNTRY_NAME == '베트남'}">
                                    <li><a class="dropdown-item" href="/board/1/${country.COUNTRY_NO}">
                                    <img src="/resources/images/officialFlag/VIETNAMFLAG.png" alt="베트남국기">${country.COUNTRY_NAME}게시판</a></li>
                                </c:when>
                                <c:when test="${country.COUNTRY_NAME == '태국'}">
                                    <li><a class="dropdown-item" href="/board/1/${country.COUNTRY_NO}">
                                    <img src="/resources/images/officialFlag/THAIFLAG.png" alt="태국국기">${country.COUNTRY_NAME}게시판</a></li>
                                </c:when>
                                <c:when test="${country.COUNTRY_NAME == '호주'}">
                                    <li><a class="dropdown-item" href="/board/1/${country.COUNTRY_NO}">
                                    <img src="/resources/images/officialFlag/AUSTRALIAFLAG.png" alt="호주국기">${country.COUNTRY_NAME}게시판</a></li>
                                </c:when>
                            </c:choose>
                        </c:forEach>
                    </ul>
                </li>
            </c:if>
            <c:if test="${boardType.BOARD_CODE != 1 && boardType.BOARD_CODE != 4}" >
                <li class="nav-item">
                    <a class="nav-link" href="/board/${boardType.BOARD_CODE}">${boardType.BOARD_NAME}</a>
                </li>
            </c:if>
            <c:if test="${!empty sessionScope.loginMember && sessionScope.loginMember.memberRole == 2 && boardType.BOARD_CODE == 4}">
                <li class="nav-item">
                    <a class="nav-link" href="/ask/boardAsk/${loginMember.memberNo}">${boardType.BOARD_NAME}</a>
                </li>
            </c:if>
        </c:forEach>   
    </ul>
</nav>
<!-- nav 끝 -->



</section>
<aside class="template--rightAside"></aside>
</header>
<!-- Template-header 끝 -->
<!-- ----------------------------------------------- -->



<!-- Template-main 시작 -->
<main class="template--main">
<aside class="template--leftAside"></aside>
<section class="template--Section">



<!-- 페이지 제목 시작 -->
<div class="template--pageTitleContainer">
    <div class="template--pageTitleBox">
        <%-- <img src="/resources/images/officialPageTitle/PAGETITLE_SILVER.png" alt="기본">
        <div class="template--overlayedTitle" style="color: black;"> --%>
            <c:if test="${board.boardCode != 1}" >
                <img src="/resources/images/officialPageTitle/PAGETITLE_FREE.png" alt="자유">
                <div class="template--overlayedTitle" style="color: black;">
                    ${boardName}
                </div>
            </c:if>
            <c:if test="${board.boardCode == 1}" >
                <c:if test="${countryNo == 1}" >
                    <img src="/resources/images/officialPageTitle/PAGETITLE_CHINA_FOBBIDDENCITY.png" alt="중국_자금성">
                    <div class="template--overlayedTitle" style="color: black;">
                        <img class="template--flag" src="/resources/images/officialFlag/CHINAFLAG.png" alt="중국국기" style="height: 30px; padding-right: 10px;">
                        ${countryName}게시판
                    </div>
                </c:if>
                <c:if test="${countryNo == 2}" >
                    <img src="/resources/images/officialPageTitle/PAGETITLE_JAPAN_CHERRYBLOSSOM.png" alt="일본_벚꽃">
                    <div class="template--overlayedTitle" style="color: black;">
                        <img class="template--flag" src="/resources/images/officialFlag/JAPANFLAG_BLACKBORDER.png" alt="일본국기" style="height: 30px; padding-right: 10px;">
                        ${countryName}게시판
                    </div>
                </c:if>
                <c:if test="${countryNo == 3}" >
                    <img src="/resources/images/officialPageTitle/PAGETITLE_VIETNAM_HALONGBAY.png" alt="베트남_하롱베이">
                    <div class="template--overlayedTitle" style="color: black;">
                        <img class="template--flag" src="/resources/images/officialFlag/VIETNAMFLAG.png" alt="베트남국기" style="height: 30px; padding-right: 10px;">
                        ${countryName}게시판
                    </div>
                </c:if>
                <c:if test="${countryNo == 4}" >
                    <img src="/resources/images/officialPageTitle/PAGETITLE_THAI_CASTLE.png" alt="태국_왕궁">
                    <div class="template--overlayedTitle" style="color: black;">
                        <img class="template--flag" src="/resources/images/officialFlag/THAIFLAG.png" alt="태국국기" style="height: 30px; padding-right: 10px;">
                        ${countryName}게시판
                    </div>
                </c:if>
                <c:if test="${countryNo == 5}" >
                    <img src="/resources/images/officialPageTitle/PAGETITLE_AUSTRALIA_OCEAN.png" alt="호주_그레이프베리어리프">
                    <div class="template--overlayedTitle" style="color: black;">
                        <img class="template--flag" src="/resources/images/officialFlag/AUSTRALIAFLAG.png" alt="호주국기" style="height: 30px; padding-right: 10px;">
                        ${countryName}게시판
                    </div>
                </c:if>
            </c:if>
        </div>
    </div>
</div>
<!-- 페이지 제목 끝 -->



<!-- 포스트 시작 -->
<div class="writing--postContainer">
    <div class="writing--postTitleBox">
        <div class="writing--postTag">${board.tagContent}</div>
        <div class="writing--postTitle">${board.boardTitle}</div>
        <div class="writing--postInfoBox">
            <div class="writing--postProfile">
                <div class="tempImageBox">
                <c:if test="${!empty board.profileImage}">
                    <img src="${board.profileImage}" name="profileImage" alt="프로필 이미지">
                </c:if>
                <c:if test="${empty board.profileImage}">
                    <img src="/resources/images/officialProfile/COMMONPROFILE.png" name="profileImage" alt="기본 프로필 이미지">
                </c:if>
                </div>
                <div>${board.memberNickname}</div>
            </div>
            <div class="writing--postUpdateDate" style="font-size: 0.8rem" style="text-align: center;">
            &nbsp <i class="fa-solid fa-eye"></i> ${board.readCount} &nbsp&nbsp&nbsp
            

            <a>
            

            <%-- <c:if test="${empty likeCheck}" >
            <i class="fa-regular fa-heart" id="boardLike" style="color: red;"></i>
            </c:if> --%>

            <%-- 로그인이 되어있고 나의 게시물에 좋아요를 누른적이 있을 때  --%>
            <%-- <c:if test="${not empty likeCheck}" >
            <i class="fa-solid fa-heart" id="boardLike" style="color: red;"></i>
            </c:if>
            --%>
            

    
            </a> </div>
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
    <div class="writing--like">
        <a>
            <c:if test="${empty likeCheck}" >
            <i class="fa-regular fa-heart" id="boardLike" style="color: red;"></i> 
            </c:if>

            <%-- 로그인이 되어있고 나의 게시물에 좋아요를 누른적이 있을 때  --%>
            <c:if test="${not empty likeCheck}" >
            <i class="fa-solid fa-heart" id="boardLike" style="color: red;"></i> 
            </c:if>
        </a> <span>${board.likeCount}</span>
    </div>
    <div class="writing--postBtn">
            <c:if test="${loginMember.memberRole == 2 && board.memberRole == 2 && loginMember.memberNo != board.memberNo}">
                <button type="button" id="reportBtn" class="btn btn-primary btn-lg" data-bs-toggle="modal" data-bs-target="#exampleModal2" data-bs-whatever="@mdo">신고</button>
            </c:if>
            <c:choose>
                <c:when test="${loginMember.memberNo == board.memberNo}">
                    <button type="button" id="updateBtn" class="btn btn-primary btn-lg">수정</button>
                    <button type="button" id="deleteBtn" class="btn btn-danger btn-lg">삭제</button>
                </c:when>
                <c:when test="${loginMember.memberRole == 1}">
                    <button type="button" id="deleteBtn1" class="btn btn-danger btn-lg">삭제</button>
                </c:when>
            </c:choose> <%-- 상준 수정 --%>
    </div>
</div>
<!-- 포스트 끝 -->





<%-- 신고 모달창 --%>
<div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">게시글 신고</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                해당 게시물을 신고 하시겠습니까?<br>
                <br>
                신고 사유를 선택해주세요.<br>
                <input type="radio" id="abusive" name="reportCategory" value="욕설"> <label for="abusive">&nbsp욕설</label><br>
                <input type="radio" id="disparaging_expression" name="reportCategory" value="차별적표현"> <label for="disparaging_expression">&nbsp차별적표현</label><br>
                <input type="radio" id="impersonation" name="reportCategory" value="사칭"> <label for="impersonation">&nbsp사칭</label><br>
                <input type="radio" id="advertisement" name="reportCategory" value="광고성, 도배글"> <label for="advertisement">&nbsp광고성, 도배글</label><br>
                <input type="radio" id="sensationality" name="reportCategory" value="선정성"> <label for="sensationality">&nbsp선정성</label><br>
                <input type="radio" id="illegal_information" name="reportCategory" value="불법정보포함"> <label for="illegal_information">&nbsp불법정보포함</label><br>
                <input type="radio" id="personal" name="reportCategory" value="개인정보 노출"> <label for="personal">&nbsp개인정보 노출</label><br>
                <input type="radio" id="etc" name="reportCategory" value="기타">&nbsp기타&nbsp<input type="text" id="reportReason" placeholder="신고 사유를 입력해주세요." maxlength=10><label for="etc"></label>  <br>
                <br>
                <br>
                허위 신고 시 사이트 이용에 제한이 생길 수 있습니다.
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                <button type="button" class="btn btn-danger" onclick="reportBoardBtn(${board.boardNo})">신고</button>
            </div>
        </div>
    </div>
</div>
<%-- 신고 모달창 끝--%>










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
    <script>
    // JSP에서 작성 가능한 언어/ 라이브러리
    // html,css,js,java,EL,JSTL
    
    // JSP 해석 우선순위 : Java/EL/JSTL > HTML,CSS,JS
    
    // 게시글 번호 전역 변수로 선언
    const boardNo = "${board.boardNo}";
    const boardTitle = "${board.boardTitle}";


    // 로그인한 회원 번호를 전역 변수로 선언
    // -> 작성한 EL구문이 null일 경우 빈칸으로 출력되어
    //    변수에 값이 대입되지 않는 문제가 발생할 수 있음!
    // 해결방법 : EL구문을 '',""문자열로 감싸는 것 
    //          -> EL값이 null이여도 "" 빈문자열로 출력
    const loginMemberNo = "${loginMember.memberNo}";
    const loginMemberRole = "${loginMember.memberRole}"
    const memberNickname = "${loginMember.memberNickname}"
    console.log(boardNo);
    console.log(loginMemberNo);

    </script>

<!-- bootstrap -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
<!-- js -->
    <script src="/resources/js/template/template.js"></script>
    <script src="/resources/js/common/header.js"></script>
    <script src="/resources/js/common/main.js"></script>
    <script src="/resources/js/writing/post.js"></script>
    <script src="/resources/js/writing/post2.js"></script>
    <script src="/resources/js/writing/writing.js"></script>
    <script src="/resources/js/common/footer.js"></script>
    <%-- 알람 --%>
    <script src="/resources/js/manager/alarm.js"></script>
</body>
</html>