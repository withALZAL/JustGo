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
            <section class="dashboard1" style="border: 1px solid pink;">
            <div class="dashboardTitle">사용자 통계</div>
            <div class="dashboardTitle">회원통계</div>
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
            <section class="dashboard2" style="border: 1px solid pink;">
                <div class="dashboardTitle">게시판별 게시글 통계</div>
                <div class="dashboard2__content">
                    <canvas id="chartDoughnut">
                    </canvas>
                </div>
            </section>
            <section class="dashboard3" style="border: 1px solid pink;">
                <div class="dashboardTitle">태그별 게시글 통계</div>
                <div class="dashboard3__content">
                    <canvas id="chartTag">
                    </canvas>
                </div>
            </section>
        </section>
        <section class="dashboard__bottom">
            <section class="dashboard4" style="border: 1px solid pink;">
                <div class="dashboardTitle">사용자 수 변화 통계</div>
                <div class="dashboardTitle">회원 통계 그래프</div>
                <div class="dashboard4__content">
                    <canvas id="chartLine">
                    </canvas>
                </div>
            </section>
            <section class="dashboard5" style="border: 1px solid pink;">
                <div class="dashboardTitle">신고 통계</div>
                <div class="dashboardTitle">신고 사유 통계</div>
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
    <script src="/resources/js/manager/managerDashboard.js"></script>
    <script>

        const countAllMember = ${countAllMember};
        const countAllManager = ${countAllManager};
        const countOutMember = ${countOutMember};
        const countAllPost = ${countAllPost};

        /* 라인 차트(4번) */
        var chartLine = document.getElementById('chartLine');
        new Chart(chartLine, {
            type: 'line',
            data: {
                labels: [1500, 1600, 1700, 1750, 1800, 1850, 1900, 1950, 1999, 2050],
                datasets: [{
                    data: [86, 114, 106, 106, 107, 111, 133, 221, 783, countAllMember],
                    label: "회원 수",
                    borderColor: "#4ABFD3",
                    fill: false
                },{
                    data: [168, 170, 178, 190, 203, 276, 408, 547, 675, countAllManager],
                    label: "관리자 수",
                    borderColor: "#24A6BD",
                    fill: false
                }, {
                    data: [282, 350, 411, 502, 635, 809, 947, 1402, 3700, countOutMember],
                    label: "퇄퇴회원 수",
                    borderColor: "#008299",
                    fill: false
                }, {
                    data: [40, 20, 10, 16, 24, 38, 74, 167, 508, countAllPost],
                    label: "게시글 수",
                    borderColor: "#004C63",
                    fill: false
                }
                ]
            },
            options: {
                title: {
                    display: true,
                    text: 'World population per region (in millions)'
                }
            }
        });



        const reportAbusive = ${countReportAbusive};
        const reportDisparaging = ${countReportDisparaging_expression};
        const reportImpersonation = ${countReportImpersonation};
        const reportAdvertisement = ${countReportAdvertisement};
        const reportSensationality = ${countReportSensationality};
        const reportIllegal = ${countReportIllegal_information};
        const reportPersonal = ${countReportPersonal};
        const reportEtc = ${countReportEtc};

        /* 바 차트(5번)*/
        var chartBar = document.getElementById('chartBar').getContext('2d');
        new Chart(chartBar, {
            type: 'bar',
            data: {
                
                labels: ["욕설", "차별적 표현", "사칭", "광고성, 도배글", "선정성", "불법정보포함", "개인정보노출", "기타"],
                datasets: [
                    {
                        label: "신고 수",
                        backgroundColor: ["#5CD1E5", "#4ABFD3", "#36B8CF", "#24A6BD", "#1294AB", "#008299", "#007087", "#004C63"],
                        data: [reportAbusive, reportDisparaging, reportImpersonation, reportAdvertisement, reportSensationality, reportIllegal, reportPersonal, reportEtc] /* 여기에 데이터를 넣습니다. */
                    }
                ]
            },
            options: {
                indexAxis: 'y',
                legend: { display: false },
                title: {
                    display: true,
                    // text: 'Predicted world population (millions) in 2050'
                }
            }
        });

    </script>

</body>
</html>