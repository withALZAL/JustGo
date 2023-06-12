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
    <link rel="stylesheet" href="/resources/css/manager/manager.css">

    <title>JustGo-inquiryManager</title>

<!-- bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/resources/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<!-- fontAwesome -->
    <script src="https://kit.fontawesome.com/ae1a88d4e2.js" crossorigin="anonymous"></script>
</head>
<body class="template--body">



<!-- ----------------------------------------------- -->
<!-- Template-header 시작 -->
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<!-- Template-header 끝 -->
<!-- ----------------------------------------------- -->



<!-- Template-main 시작 -->
<main class="template--main">
<aside class="template--leftAside">left</aside>
<section class="template--Section">



<!-- 페이지 제목 시작 -->
<div class="template--pageTitleContainer">
    <div class="template--pageTitleBox">
        <img src="/images/officialPageTitle/PAGETITLE_MANAGER.png" alt="관리자">
        <div class="template--overlayedTitle" style="color: black;">
            <a href="https://www.naver.com">
                관리자_1:1문의
            </a>
        </div>
    </div>
</div>
<!-- 페이지 제목 끝 -->



<!-- 콘텐츠 시작 -->
<div class="manager--contentContainer">
<div class="manager--contentBox">
    <aside class="manager--sideContainer">
        <div class="manager--sidebar">
            <a href="https://www.naver.com"><i class="fa-solid fa-paper-plane"></i>공지사항</a>
            <a href="https://www.naver.com"><i class="fa-solid fa-address-book"></i>회원관리</a>
            <a href="https://www.naver.com"><i class="fa-solid fa-comments"></i>1:1문의</a>
            <a href="https://www.naver.com"><i class="fa-solid fa-clipboard"></i>신고</a>
        </div>
    </aside>
    <div class="manager--mainBox">
        <nav class="manager--statisticsBox">
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
                    <div>게시글 수</div>
                    <div>20000개</div>
                </div>
            </div>
            <div class="manager--statistics">
                <div></div>
                <div>예비칸 실험</div>
            </div>
        </nav>
        <div class="manager--content">
            <form action="#" method="post">
                <table class="manager--inquiryTable">
                    <thead>
                        <tr>
                            <th>번호</th>
                            <th>닉네임</th>
                            <th>문의제목</th>
                            <th>문의일</th>
                            <th>처리상태</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>100000</td>
                            <td><form><a href="#">바른말고운말</a></form></td>
                            <td><form><a href="https://www.naver.com">바른말 여행사입니다. 협업하고 싶어 문의드립니다.</a></form></td>
                            <td>2023년 1월 1일</td>
                            <td>미답변</td>
                        </tr>
                        <tr>
                            <td>9</td>
                            <td><form><a href="#">바른말고운말여덟</a></form></td>
                            <td><form><a href="https://www.naver.com">바른말 여행사입니다. 협업하고 싶어 문의드립니다.</a></form></td>
                            <td>2023년 1월 1일</td>
                            <td>미답변</td>
                        </tr>
                        <tr>
                            <td>8</td>
                            <td><form><a href="#">바른말고운말여덟</a></form></td>
                            <td><form><a href="https://www.naver.com">바른말 여행사입니다. 협업하고 싶어 문의드립니다.</a></form></td>
                            <td>2023년 1월 1일</td>
                            <td>답변완료</td>
                        </tr>
                        <tr>
                            <td>7</td>
                            <td><form><a href="#">바른말고운말여덟</a></form></td>
                            <td><form><a href="https://www.naver.com">바른말 여행사입니다. 협업하고 싶어 문의드립니다.</a></form></td>
                            <td>2023년 1월 1일</td>
                            <td>답변완료</td>
                        </tr>
                        <tr>
                            <td>6</td>
                            <td><form><a href="#">바른말고운말여덟</a></form></td>
                            <td><form><a href="https://www.naver.com">바른말 여행사입니다. 협업하고 싶어 문의드립니다.</a></form></td>
                            <td>2023년 1월 1일</td>
                            <td>답변완료</td>
                        </tr>
                        <tr>
                            <td>5</td>
                            <td><form><a href="#">바른말고운말여덟</a></form></td>
                            <td><form><a href="https://www.naver.com">바른말 여행사입니다. 협업하고 싶어 문의드립니다.</a></form></td>
                            <td>2023년 1월 1일</td>
                            <td>답변완료</td>
                        </tr>
                        <tr>
                            <td>4</td>
                            <td><form><a href="#">바른말고운말여덟</a></form></td>
                            <td><form><a href="https://www.naver.com">바른말 여행사입니다. 협업하고 싶어 문의드립니다.</a></form></td>
                            <td>2023년 1월 1일</td>
                            <td>답변완료</td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td><form><a href="#">바른말고운말여덟</a></form></td>
                            <td><form><a href="https://www.naver.com">바른말 여행사입니다. 협업하고 싶어 문의드립니다.</a></form></td>
                            <td>2023년 1월 1일</td>
                            <td>답변완료</td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td><form><a href="#">바른말고운말여덟</a></form></td>
                            <td><form><a href="https://www.naver.com">바른말 여행사입니다. 협업하고 싶어 문의드립니다.</a></form></td>
                            <td>2023년 1월 1일</td>
                            <td>답변완료</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td><form><a href="#">바른말고운말여덟</a></form></td>
                            <td><form><a href="https://www.naver.com">바른말 여행사입니다. 협업하고 싶어 문의드립니다.</a></form></td>
                            <td>2023년 1월 1일</td>
                            <td>답변완료</td>
                        </tr>
                    </tbody>
                </table>
                <div class="manager--contentPagenation">
                    <form action="#" method="get">
                        <nav aria-label="...">
                            <ul class="pagination">
                                <li class="page-item disabled">
                                    <span class="page-link">이전</span>
                                </li>
                                <li class="page-item"><a class="page-link" href="#">1</a></li>
                                <li class="page-item active" aria-current="page"><span class="page-link">2</span></li>
                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                <li class="page-item"><a class="page-link" href="#">4</a></li>
                                <li class="page-item"><a class="page-link" href="#">5</a></li>
                                <li class="page-item"><a class="page-link" href="#">6</a></li>
                                <li class="page-item"><a class="page-link" href="#">7</a></li>
                                <li class="page-item"><a class="page-link" href="#">8</a></li>
                                <li class="page-item"><a class="page-link" href="#">9</a></li>
                                <li class="page-item"><a class="page-link" href="#">10</a></li>
                                <li class="page-item">
                                <a class="page-link" href="#">다음</a>
                                </li>
                            </ul>
                        </nav>
                    </form>
                </div>
            </form>
            <form class="manager--contentSearch" action="#" method="get">
                <a>
                    <select class="board--searchSelector" name="boardSelect" id="boardSelect" onchange="changeSecondSelect()" required>
                        <option>닉네임</option>
                        <option>문의제목</option>
                        <option>처리상태</option>
                    </select>
                    <input type="text" maxlength="10" style="width: 300px;">
                    <button type="button" class="btn btn-secondary btn-sm" style="margin-bottom: 8px;">검색</button>
                </a>
            </form>
        </div>
    </div>
</div>
</div>
<!-- 콘텐츠 끝 -->



</section>
<aside class="template--rightAside">right</aside>
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
    <script src="/resources/js/manager/manager.js"></script>
</body>
</html>