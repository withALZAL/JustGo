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
        
        
        <div class="manager--content">

            

            <%-- statisticsBox--%>
            <div class="manager--statisticsBox1">
                <div class="manager--statisticsBox">
                <div>
                    <div class="manager--statistics">
                        <div><i class="fa-solid fa-user-plus"></i></div>
                        <div>
                            <div>가입자 수</div>
                            <div>12000명</div>
                        </div>
                    </div>
                    <div class="manager--statistics">
                        <div><i class="fa-solid fa-scroll"></i></div>
                        <div>
                            <div>탈퇴회원 수</div>
                            <div>20000개</div>
                        </div>
                    </div>
                </div>
                <div>
                    <div class="manager--statistics">
                        <div><i class="fa-solid fa-user-plus"></i></div>
                        <div>
                            <div>관리자 수</div>
                            <div>12000명</div>
                        </div>
                    </div>
                    <div class="manager--statistics">
                        <div><i class="fa-solid fa-scroll"></i></div>
                        <div>
                            <div>게시글 수</div>
                            <div>20000개</div>
                        </div>
                    </div>
                </div>
                </div>
                <div class="manager--statisticsBox2"></div>
                <div class="manager--statisticsBox3"></div>
            </div>


            <div class="manager--statisticsBox4"></div>
            <div class="manager--statisticsBox5"></div>

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
    <%-- <script src="/resources/js/manager/memberManager.js"></script> --%>
</body>
</html>