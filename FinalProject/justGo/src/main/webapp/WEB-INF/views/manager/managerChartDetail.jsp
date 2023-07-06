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



<!-- Template-main 시작 -->
<main class="template--main">



<section class="template--Section">



<!-- 콘텐츠 시작 -->
<div class="manager--chartPopup">
    <section class="dashboard6">
        <canvas id="chartDetail">
        </canvas>
    </section>
</div>
<!-- 콘텐츠 끝 -->



</section>
</main>
<!-- Template-main 끝 -->


    

    

<!-- bootstrap -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
<!-- js -->
    <script src="/resources/js/template/template.js"></script>
    <script src="/resources/js/common/header.js"></script>
    <script src="/resources/js/common/main.js"></script>
    <script src="/resources/js/common/footer.js"></script>
    <script src="/resources/js/manager/managerDashboard.js"></script>
<%-- dashboard6 --%>
    <script>
    /* 디테일 차트(6번) */
    var chartDetail = document.getElementById('chartDetail').getContext('2d');
    new Chart(chartDetail, {
        type: 'radar',
        data: {
            labels: ['일반', '맛집', '꿀팁', '힐링'],
            datasets: [
                {
                    label: '중국게시판',
                    data: [10, 22, 33, 42],
                    backgroundColor: 'rgba(255, 99, 132, 0.5)',
                    borderColor: 'rgba(255, 99, 132, 1)',
                    borderWidth: 1,
                },
                {
                    label: '일본게시판',
                    data: [10, 32, 20, 18],
                    backgroundColor: 'rgba(54, 162, 235, 0.5)',
                    borderColor: 'rgba(54, 162, 235, 1)',
                    borderWidth: 1,
                },
                {
                    label: '베트남게시판',
                    data: [33, 20, 20, 48],
                    backgroundColor: 'rgba(255, 205, 86, 0.5)',
                    borderColor: 'rgba(255, 205, 86, 1)',
                    borderWidth: 1,
                },
                {
                    label: '태국게시판',
                    data: [39, 66, 30, 41],
                    backgroundColor: 'rgba(75, 192, 192, 0.5)',
                    borderColor: 'rgba(75, 192, 192, 1)',
                    borderWidth: 1,
                },
                {
                    label: '호주게시판',
                    data: [33, 45, 22, 11],
                    backgroundColor: 'rgba(153, 102, 255, 0.5)',
                    borderColor: 'rgba(153, 102, 255, 1)',
                    borderWidth: 1,
                },
            ],
        },
        options: {
            // responsive: false, // 반응형 크기 조정 비활성화
            // maintainAspectRatio: false, // 종횡비 유지 비활성화
            // width: 400, // 가로 크기 (픽셀)
            // height: 300, // 세로 크기 (픽셀)
            scale: {
                ticks: {
                    beginAtZero: true,
                    max: 100,
                    stepSize: 20,
                },
            },
        },
    });
    </script>
</body>
</html>