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
    <link rel="stylesheet" href="/resources/css/manager/managerDashboard.css">

    <title>JustGo-managerDashboard</title>

<!-- bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/resources/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<!-- fontAwesome -->
    <script src="https://kit.fontawesome.com/ae1a88d4e2.js" crossorigin="anonymous"></script>
<%-- chart.js --%>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body class="template--body">

    <%-- <c:set var="memberPagination" value="${map.memberPagination}" />
    <c:set var="memberList" value="${map.memberList}" /> --%>

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
        <section class="dashboard__top">
            <section class="dashboard1">
            <div class="dashboardTitle">사용자 통계</div>
            <div class="dashboard1__content">
                <div class="card stat1">
                    <div class="card-header">
                        회원 수
                    </div>
                    <div class="card-body numberResult">
                    ${countAllMember}명
                    </div>
                </div>
                <div class="card stat2">
                    <div class="card-header">
                        관리자 수
                    </div>
                    <div class="card-body numberResult">
                    ${countAllManager}명
                    </div>
                </div>
                <div class="card stat3">
                    <div class="card-header">
                        탈퇴회원 수
                    </div>
                    <div class="card-body numberResult">
                    ${countOutMember}명
                    </div>
                </div>
                <div class="card stat4">
                    <div class="card-header">
                        게시글 수
                    </div>
                    <div class="card-body numberResult">
                    ${countAllPost}개
                    </div>
                </div>
            </div>
            </section>
            <section class="dashboard2">
                <div class="dashboardTitle">게시판별 게시글 통계</div>
                <div class="dashboard2__content">
                    <canvas id="chartDoughnut">
                    </canvas>
                </div>
            </section>
            <section class="dashboard3">
                <div class="dashboardTitle">태그별 게시글 통계</div>
                <div class="dashboard3__content">
                    <canvas id="chartTag">
                    </canvas>
                </div>
            </section>
        </section>
        <section class="dashboard__bottom">
            <section class="dashboard4">
                <div class="dashboardTitle">사용자 수 변화 통계</div>
                <div class="dashboard4__content">
                    <canvas id="chartLine">
                    </canvas>
                </div>
            </section>
            <section class="dashboard5">
                <div class="dashboardTitle">신고 통계</div>
                <div class="dashboard5__content">
                    <canvas id="chartBar">
                    </canvas>
                </div>
            </section>
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
    <%-- <script src="/resources/js/manager/memberManager.js"></script> --%>
<%-- managerDashboard로 변수 전달 --%>
    <script>
        /* 도넛 차트 */
        var countFree = ${countFree};
        var countQuestion = ${countQuestion};
        var countChina = ${countChina};
        var countJapan = ${countJapan};
        var countVietnam = ${countVietnam};
        var countThai = ${countThai};
        var countAustralia = ${countAustralia};

        /* 태그 차트 */
        var countTag1 = ${countTag1};
        var countTag2 = ${countTag2};
        var countTag3 = ${countTag3};
        var countTag4 = ${countTag4};

        /* 라인 차트 */
        // var g1m0 = ${g1m0}; /* 회원 수 */
        // var g1m1 = ${g1m1};
        // var g1m2 = ${g1m2};
        // var g1m3 = ${g1m3};
        // var g1m4 = ${g1m4};
        // var g1m5 = ${g1m5};
        // var g1m6 = ${g1m6};
        // var g2m0 = ${g2m0}; /* 게시글 수 */
        // var g2m1 = ${g2m1};
        // var g2m2 = ${g2m2};
        // var g2m3 = ${g2m3};
        // var g2m4 = ${g2m4};
        // var g2m5 = ${g2m5};
        // var g2m6 = ${g2m6};
        // var g3m0 = ${g3m0}; /* 탈퇴회원 수 */
        // var g3m1 = ${g3m1};
        // var g3m2 = ${g3m2};
        // var g3m3 = ${g3m3};
        // var g3m4 = ${g3m4};
        // var g3m5 = ${g3m5};
        // var g3m6 = ${g3m6};
        // var g4m0 = ${g4m0}; /* 신고 수 */
        // var g4m1 = ${g4m1};
        // var g4m2 = ${g4m2};
        // var g4m3 = ${g4m3};
        // var g4m4 = ${g4m4};
        // var g4m5 = ${g4m5};
        // var g4m6 = ${g4m6};

        /* 바 차트 */
        var report1 = ${report1};
        var report2 = ${report2};
        var report3 = ${report3};
        var report4 = ${report4};
        var report5 = ${report5};
        var report6 = ${report6};
        var report7 = ${report7};
        var report8 = ${report8};
        
    </script>
    <script src="/resources/js/manager/managerDashboard.js"></script>
</body>
</html>