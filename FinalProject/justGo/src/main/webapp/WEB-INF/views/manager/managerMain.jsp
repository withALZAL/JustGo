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
    <link rel="stylesheet" href="/resources/css/manager/managerMain.css">

    <title>JustGo-managerMain</title>

<!-- bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/resources/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<!-- fontAwesome -->
    <script src="https://kit.fontawesome.com/ae1a88d4e2.js" crossorigin="anonymous"></script>
<%-- chart.js --%>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<%-- sweetAlert2 --%>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body class="template--body">

    <c:set var="newPost" value="${map.newPost}" />
    <c:set var="newFeedback" value="${map.newFeedback}" />

<!-- ----------------------------------------------- -->
<!-- Template-header 시작 -->
<jsp:include page="/WEB-INF/views/manager/managerHeader.jsp"/>
<!-- Template-header 끝 -->
<!-- ----------------------------------------------- -->

<%-- ${map.pagination} --%>
<%-- ${map.memberList} --%>

<!-- Template-main 시작 -->
<main class="template--main">



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
        <section class="manager__top">
            <div class="manager_main1">
                <div class="manager_main_title">
                    <div class="today">Today's</div>
                    <div class="date" id="clock"> </div>
                </div>
                <div class="todaysContnent">
                    <div class="countBox" id="newMember">
                        <div>신규가입</div>
                        <div ><span class="count">${todaysCount.MEMBER_COUNT}</span></div>
                    </div>
                    <div class="countBox" id="newBoard">
                        <div>새 글</div>
                        <div ><span class="count">${todaysCount.BOARD_COUNT}</span></div>
                    </div>
                    <div class="countBox" id="newComment">
                        <div>댓글</div>
                        <div><span class="count">${todaysCount.REPLY_COUNT}</span></div>
                    </div>
                </div>
                <div class="more">
                <a href="/manager/memberManager"><button class="todayBtn">회원관리</button></a>
                <a href="/manager/manager"><button class="todayBtn">운영관리</button></a>
                <a href="/manager/managerDashboard"><button class="todayBtn">대시보드</button></a>
                </div>
            </div>
            <div class="manager_main2">
                <div class="manager_main_title">최신 글</div>
                <div class="postList">
                    <c:choose>
                        <c:when test="${empty newPost}">
                            <div>최신글이 존재하지 않습니다.</div>
                        </c:when>
                        <c:otherwise>
                    <div class="newPostBox" id="newPostBox1">
                        <div class="boxTitle" >글제목</div>
                        
                        <c:forEach begin="0" end="8" items="${newPost}" var="post">
                            <c:choose>
                                    <c:when test="${post.COUNTRY_NO == 0 || post.COUNTRY_NO == null}">
                                        <div class="boxContent1"><a href="/board/${post.BOARD_CODE}/${post.BOARD_NO}">${post.BOARD_TITLE}</a></div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="boxContent1"><a href="/board/${post.BOARD_CODE}/${post.COUNTRY_NO}/${post.BOARD_NO}">${post.BOARD_TITLE}</a></div>
                                    </c:otherwise>
                                </c:choose>

                        </c:forEach>
                        
                    </div>
                    <%-- <div class="newPostBox">
                        <div>닉네임</div>
                        <ul>
                            <c:forEach items="${newPost}" var="post">
                            <li>${post.MEMBER_NICKNAME}</li>
                            </c:forEach>
                        </ul>
                    </div> --%>
                    <div class="newPostBox">
                        <div class="boxTitle">작성일</div>
                        <c:forEach begin="0" end="8" items="${newPost}" var="post">
                        <div class="boxContent2">${post.CREATE_DATE}</div>
                        </c:forEach>
                    </div>
                    </c:otherwise>
                    </c:choose>
                </div>
            </div>
            <div class="manager_main3">
                <div class="manager_main_title">유저 신고 현황</div>
                <div class="reportCount">
                    <a href="/manager/reportManager" class="reportGo">
                    <div class="countBox1" >
                        <div>미해결</div>
                        <div><span class="count1" id="notComplete">${reportCount.UNCONFIRMED_COUNT}</span></div>
                    </div>
                    </a>
                    <div class="countBox1">
                        <div>완료</div>
                        <div ><span class="count1" id="complete">${reportCount.CONFIRMED_COUNT}</span></div>
                    </div>
                    <div class="countBox1">
                        <div>총 신고 건수</div>
                        <div><span class="count1">${reportCount.TOTAL_COUNT}</span></div>
                    </div>
                </div>
                <div class="more">
                <a href="/manager/reportManager"><button class="todayBtn">신고관리</button></a>
                </div>
            </div>
        </section>
        <section class="manager__middle">
            <div class="manager_main4">
                <div class="manager_main_title">1:1문의 현황</div>
                <div class="feedbackCount">
                    <div class="countBox">
                        <div>미답변</div>
                        <div><a href="/manager/askManager"><span class="count">${feedbackCount.UNCONFIRMED_COUNT}</span></a></div>
                    </div>
                    <div class="countBox">
                        <div>총 문의 수</div>
                        <div ><span class="count">${feedbackCount.TOTAL_COUNT}</span></div>
                    </div>
                </div>
            </div>
            <div class="manager_main5">
                <div class="manager_main_title">신규문의 List</div>
                <div class="feedbackList">
                    <c:choose>
                        <c:when test="${empty newFeedback}">
                            <div>신규 문의글이 존재하지 않습니다.</div>
                        </c:when>
                        <c:otherwise>
                    <div class="newFeedbackBox">
                        <div class="boxTitle">문의번호</div>
                            <c:forEach begin="0" end="4" items="${newFeedback}" var="feedback">
                            <div class="boxContent2">${feedback.FEEDBACK_NO}</div>
                            </c:forEach>
                    </div>
                    <div class="newFeedbackBox">
                        <div class="boxTitle">문의제목</div>
                            <c:forEach begin="0" end="4" items="${newFeedback}" var="feedback">
                            <a href="/manager/askManager_detail/${feedback.FEEDBACK_NO}"><div class="boxContent1">${feedback.FEEDBACK_TITLE}</div></a>
                            </c:forEach>
                    </div>
                    <div class="newFeedbackBox">
                        <div class="boxTitle">닉네임</div>
                            <c:forEach begin="0" end="4" items="${newFeedback}" var="feedback">
                            <div class="boxContent2">${feedback.MEMBER_NICKNAME}</div>
                            </c:forEach>
                    </div>
                    <div class="newFeedbackBox">
                        <div class="boxTitle">문의일</div>
                            <c:forEach begin="0" end="4" items="${newFeedback}" var="feedback">
                            <div class="boxContent2">${feedback.FEEDBACK_DATE}</div>
                            </c:forEach>
                    </div>
                    </c:otherwise>
                    </c:choose>
                </div>
                <div class="more">
                <a href="/manager/askManager"><button class="todayBtn">1:1문의</button></a>
                </div>
            </div>
        </section>
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
<%-- managerDashboard로 변수 전달 --%>
    <script>
        let clock = document.getElementById("clock").innnerHtml = new Date();
        // var Target = document.getElementById("clock");
        // function clock() {
        //     // var time = new Date();

        //     // var year = time.getYear();
        //     // var month = time.getMonth();
        //     // var date = time.getDate();
        //     // var day = time.getDay();

        //     // var hours = time.getHours();
        //     // var minutes = time.getMinutes();
        //     // var seconds = time.getSeconds();

        //     // Target.innerText = 
        //     // `${year}년 ${month + 1}월 ${date}일 `
                
        // }
        // clock();
        // setInterval(clock, 1000); // 1초마다 실행
    </script>
    <script src="/resources/js/manager/managerMain.js"></script>
</body>
</html>