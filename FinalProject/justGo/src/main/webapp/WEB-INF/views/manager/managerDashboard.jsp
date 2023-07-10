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
<%-- sweetAlert2 --%>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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



<!-- 콘텐츠 시작 -->
<div class="manager--contentContainer">
<div class="manager--contentBox">
    <aside class="manager--sideContainer">
        <jsp:include page="/WEB-INF/views/manager/managerMenuBox.jsp"/>
    </aside>
    <div class="manager--mainBox">

        <section class="dashboard__top">
            <section class="dashboard dashboard1">
            <div class="dashboardTitle">사용자 통계</div>
            <div class="dashboard1__content">
                <div class="card stat1">
                    <div class="card-header tt">
                        일반회원 수
                    </div>
                    <div class="card-body numberResult">
                    ${dashboard1[0]}명
                    </div>
                </div>
                <div class="card stat2">
                    <div class="card-header tt">
                        관리자 수
                    </div>
                    <div class="card-body numberResult">
                    ${dashboard1[1]}명
                    </div>
                </div>
                <div class="card stat3">
                    <div class="card-header tt">
                        탈퇴회원 수
                    </div>
                    <div class="card-body numberResult">
                    ${dashboard1[2]}명
                    </div>
                </div>
                <div class="card stat4">
                    <div class="card-header tt">
                        게시글 수
                    </div>
                    <div class="card-body numberResult">
                    ${dashboard1[3]}개
                    </div>
                </div>
            </div>
            </section>
            <section class="dashboard dashboard2">
                <div class="dashboardTitle">게시판별 게시글 통계</div>
                <div class="dashboard2__content">
                    <canvas id="chartDoughnut">
                    </canvas>
                </div>
            </section>
            <section class="dashboard dashboard3">
                <div class="dashboardTitle">태그별 게시글 통계</div>
                <div class="dashboard3__content">
                    <canvas id="chartTag">
                    </canvas>
                </div>
            </section>
        </section>
        <section class="dashboard__bottom">
            <section class="dashboard dashboard4">
                <div class="dashboardTitle">사용자 수 변화 통계</div>
                <div class="dashboard4__content">
                    <canvas id="chartLine">
                    </canvas>
                </div>
            </section>
            <section class="dashboard dashboard5">
                <div class="dashboardTitle">신고 통계</div>
                <div class="dashboard5__content">
                    <canvas id="chartBar">
                    </canvas>
                </div>
            </section>
        </section>
        <button type="button" id="chartDetailBtn" class="btn btn-primary btn-lg" onclick="chartDetail()">게시판별/태그별 게시글 종합 통계 자세히보기</button>
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
        var countFree = ${dashboard2[0]};
        var countQuestion = ${dashboard2[1]};
        var countChina = ${dashboard2[2]};
        var countJapan = ${dashboard2[3]};
        var countVietnam = ${dashboard2[4]};
        var countThai = ${dashboard2[5]};
        var countAustralia = ${dashboard2[6]};

        /* 태그 차트 */
        var countTag1 = ${dashboard3[0]};
        var countTag2 = ${dashboard3[1]};
        var countTag3 = ${dashboard3[2]};
        var countTag4 = ${dashboard3[3]};

        /* 라인 차트 */
        var member6m = ${dashboard4.member6m};
        var member3m = ${dashboard4.member3m};
        var member2m = ${dashboard4.member2m};
        var member1m = ${dashboard4.member1m};
        var member2w = ${dashboard4.member2w};
        var member1w = ${dashboard4.member1w};
        var memberNow = ${dashboard4.memberNow};
        var post6m = ${dashboard4.post6m};
        var post3m = ${dashboard4.post3m};
        var post2m = ${dashboard4.post2m};
        var post1m = ${dashboard4.post1m};
        var post2w = ${dashboard4.post2w};
        var post1w = ${dashboard4.post1w};
        var postNow = ${dashboard4.postNow};
        var out6m = ${dashboard4.out6m};
        var out3m = ${dashboard4.out3m};
        var out2m = ${dashboard4.out2m};
        var out1m = ${dashboard4.out1m};
        var out2w = ${dashboard4.out2w};
        var out1w = ${dashboard4.out1w};
        var outNow = ${dashboard4.outNow};
        var report6m = ${dashboard4.report6m};
        var report3m = ${dashboard4.report3m};
        var report2m = ${dashboard4.report2m};
        var report1m = ${dashboard4.report1m};
        var report2w = ${dashboard4.report2w};
        var report1w = ${dashboard4.report1w};
        var reportNow = ${dashboard4.reportNow};

        /* 바 차트 */
        var report1 = ${dashboard5[0]};
        var report2 = ${dashboard5[1]};
        var report3 = ${dashboard5[2]};
        var report4 = ${dashboard5[3]};
        var report5 = ${dashboard5[4]};
        var report6 = ${dashboard5[5]};
        var report7 = ${dashboard5[6]};
        var report8 = ${dashboard5[7]};
        
    </script>
    <script src="/resources/js/manager/managerDashboard.js"></script>
</body>
</html>