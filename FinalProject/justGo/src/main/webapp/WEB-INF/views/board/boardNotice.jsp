<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- css -->
    <link rel="stylesheet" href="/css/template/template.css"> <!-- 문서 기본 화면 배치/기본 폰트 등 기본 설정 -->
    <link rel="stylesheet" href="/css/common/header.css">
    <link rel="stylesheet" href="/css/common/main.css">
    <link rel="stylesheet" href="/css/common/footer.css">
    <link rel="stylesheet" href="/css/board/board.css">

    <title>JustGo-boardNotice</title>

<!-- bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<!-- fontAwesome -->
    <script src="https://kit.fontawesome.com/ae1a88d4e2.js" crossorigin="anonymous"></script>
</head>
<body class="template--body">



<!-- ----------------------------------------------- -->


<!-- Template-header 시작 -->
<header class="template--header">
<aside class="template--leftAside">left</aside>
<section class="template--Section">



<!-- loginNav 시작 -->
<nav class="common--loginNav__container">
    <form action="/html/account/login.html" method="get">
        <a href="/html/account/login.html">
            <button type="button" class="btn btn-secondary btn-sm">로그인</button>
        </a>
    </form>
    <form action="https://www.naver.com" method="get">
        <a href="/html/common/error.html">
            <button type="button" class="btn btn-secondary btn-sm">로그아웃</button>
        </a>
    </form>
    <form action="/html/account/join.html" method="get">
        <a href="/html/account/join.html">
            <button type="button" class="btn btn-secondary btn-sm">회원가입</button>
        </a>
    </form>
    <form action="/html/account/myPage.html" method="get">
        <a href="/html/account/myPage.html">
            <button type="button" class="btn btn-secondary btn-sm">마이페이지</button>
        </a>
    </form>
    <form action="https://www.naver.com" method="get">
        <a href="/html/common/error.html">
            <button type="button" class="btn btn-secondary btn-sm">관리자페이지</button>
        </a>
    </form>
</nav>
<!-- loginNav 끝 -->


<!-- header 시작 -->
<header class="common--header__container">
    <a href="/html/common/main.html">
        <img src="/images/officialImages/JUSTGO_OFFICIAL_LOGO.png" alt="JustGo 로고">
    </a>
    <div class="common--header__searchContainer">
        <form action="https://www.naver.com" method="get">
            <input type="text" placeholder="검색어를 입력해주세요." maxlength="30">
            <button type="button" class="btn btn-secondary">
                <i class="fa-solid fa-magnifying-glass"></i>
            </button>
        </form>
    </div>
    <div class="common--header__profileContainer">
        <div class="common--header__profileBox">
            <a href="https://www.naver.com">
                <img src="/images/officialProfile/KIKI.jpg" alt="프로필 이미지">
                <div>폭탄배달부키키</div>
            </a>
        </div>
    </div>
</header>
<!-- header 끝 -->



<!-- nav 시작 -->
<nav class="common--navContainer">
    <ul class="nav justify-content-around" id="common--boardList">
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="moreDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">여행게시판</a>
            <ul class="dropdown-menu common--tripBoard" aria-labelledby="moreDropdown">
                <li><a class="dropdown-item" href="/html/board/boardChina.html"><img src="/images/officialFlag/CHINAFLAG.png" alt="중국국기">중국게시판</a></li>
                <li><a class="dropdown-item" href="/html/board/boardJapan.html"><img src="/images/officialFlag/JAPANFLAG.png" alt="일본국기">일본게시판</a></li>
                <li><a class="dropdown-item" href="/html/board/boardVietnam.html"><img src="/images/officialFlag/VIETNAMFLAG.png" alt="베트남국기">베트남게시판</a></li>
                <li><a class="dropdown-item" href="/html/board/boardThai.html"><img src="/images/officialFlag/THAIFLAG.png" alt="태국국기">태국게시판</a></li>
                <li><a class="dropdown-item" href="/html/board/boardAustralia.html"><img src="/images/officialFlag/AUSTRALIAFLAG.png" alt="호주국기">호주게시판</a></li>
            </ul>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/html/board/boardFree.html">자유게시판</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/html/board/boardQuestion.html">질문게시판</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="https://www.naver.com" style="color:grey;">예비게시판실험</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="https://www.naver.com" style="color:grey;">예비게시판실험</a>
        </li>
    </ul>
</nav>
<!-- nav 끝 -->



</section>
<aside class="template--rightAside">right</aside>
</header>
<!-- Template-header 끝 -->



<!-- ----------------------------------------------- -->


<!-- Template-main 시작 -->
<main class="template--main">
<aside class="template--leftAside">left</aside>
<section class="template--Section">



<!-- 페이지 제목 시작 -->
<div class="template--pageTitleContainer">
    <div class="template--pageTitleBox">
        <img src="/images/officialPageTitle/PAGETITLE_MANAGER.png" alt="자유">
        <div class="template--overlayedTitle" style="color: black;">
            <a href="https://www.naver.com">
                공지사항
            </a>
        </div>
    </div>
</div>
<!-- 페이지 제목 끝 -->



<!-- 콘텐츠 시작 -->
<div class="board--contentContainer">
<div class="board--contentBox">
    <div class="board--contentBox__top">
        <div style="font-size: 1.5rem; font-weight: bold;"><i class="fa-solid fa-tag"></i>  태그</div>
        <form action="#" method="get">
            <div><a href="#">일반</a></div>
            <div><a href="#">긴급</a></div>
            <button type="button" class="btn btn-secondary btn-sm">임시버튼</button>
        </form>
    </div>



<!-- 글쓰기 테이블 시작 -->
    <div class="board--contentBox__main">
        <table class="board--boardTable">
            <thead>
                <tr>
                <th>번호</th>
                <th>태그</th>
                <th>제목</th>
                <th>글쓴이</th>
                <th>작성일</th>
                <th>조회수</th>
                <th>좋아요</th>
                </tr>
            </thead>
            <tbody>
                <!-- 여기에 글 목록을 동적으로 추가할 수 있습니다 -->
                <tr>
                    <td>1</td>
                    <td>태그1</td>
                    <td>제목1제목1제목1제목1제목1제목1제목1제목1제목1</td>
                    <td>글쓴이글쓴이글쓴</td>
                    <td>작성일1</td>
                    <td>11</td>
                    <td>11</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>태그2</td>
                    <td>제목2</td>
                    <td>글쓴이2</td>
                    <td>작성일2</td>
                    <td>12</td>
                    <td>12</td>
                </tr>
                <tr>
                    <td>3</td>
                    <td>태그3</td>
                    <td>제목3</td>
                    <td>글쓴이3</td>
                    <td>작성일3</td>
                    <td>13</td>
                    <td>13</td>
                </tr>
                <tr>
                    <td>4</td>
                    <td>태그4</td>
                    <td>제목4</td>
                    <td>글쓴이4</td>
                    <td>작성일4</td>
                    <td>14</td>
                    <td>14</td>
                </tr>
                <tr>
                    <td>5</td>
                    <td>태그5</td>
                    <td>제목5</td>
                    <td>글쓴이5</td>
                    <td>작성일5</td>
                    <td>15</td>
                    <td>15</td>
                </tr>
                <tr>
                    <td>6</td>
                    <td>태그6</td>
                    <td>제목6</td>
                    <td>글쓴이6</td>
                    <td>작성일6</td>
                    <td>16</td>
                    <td>16</td>
                </tr>
                <tr>
                    <td>7</td>
                    <td>태그7</td>
                    <td>제목7</td>
                    <td>글쓴이7</td>
                    <td>작성일7</td>
                    <td>17</td>
                    <td>17</td>
                </tr>
                <tr>
                    <td>8</td>
                    <td>태그8</td>
                    <td>제목8</td>
                    <td>글쓴이8</td>
                    <td>작성일8</td>
                    <td>18</td>
                    <td>18</td>
                </tr>
                <tr>
                    <td>9</td>
                    <td>태그9</td>
                    <td>제목9</td>
                    <td>글쓴이9</td>
                    <td>작성일9</td>
                    <td>19</td>
                    <td>19</td>
                </tr>
                <tr>
                    <td>10</td>
                    <td>태그10</td>
                    <td>제목10</td>
                    <td>글쓴이10</td>
                    <td>작성일10</td>
                    <td>110</td>
                    <td>110</td>
                </tr>
                <tr>
                    <td>11</td>
                    <td>태그11</td>
                    <td>제목11</td>
                    <td>글쓴이11</td>
                    <td>작성일11</td>
                    <td>111</td>
                    <td>111</td>
                </tr>
                <tr>
                    <td>12</td>
                    <td>태그12</td>
                    <td>제목12</td>
                    <td>글쓴이12</td>
                    <td>작성일12</td>
                    <td>112</td>
                    <td>112</td>
                </tr>
                <tr>
                    <td>13</td>
                    <td>태그13</td>
                    <td>제목13</td>
                    <td>글쓴이13</td>
                    <td>작성일13</td>
                    <td>113</td>
                    <td>113</td>
                </tr>
                <tr>
                    <td>14</td>
                    <td>태그14</td>
                    <td>제목14</td>
                    <td>글쓴이14</td>
                    <td>작성일14</td>
                    <td>114</td>
                    <td>114</td>
                </tr>
                <tr>
                    <td>15</td>
                    <td>태그15</td>
                    <td>제목15</td>
                    <td>글쓴이15</td>
                    <td>작성일15</td>
                    <td>115</td>
                    <td>115</td>
                </tr>
                <!-- 추가적인 글 목록을 여기에 추가할 수 있습니다 -->
            </tbody>
        </table>
    </div>
<!-- 글쓰기 테이블 끝 -->


    
    <div class="board--contentBox__bottom">
        <div class="board--pagenationBox" style="height: 50%; width: 100%;">
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
        <div class="board--pagenationSearchBox" style="height: 50%; width: 100%;">
            <form action="#"></form>
            <form action="#" method="post">
                <a>
                    <select class="board--searchSelector" name="boardSelect" id="boardSelect" onchange="changeSecondSelect()" required>
                        <option>제목+내용</option>
                        <option>제목</option>
                        <option>내용</option>
                        <option>글쓴이</option>
                    </select>
                    <input type="text" maxlength="10" style="width: 300px;">
                    <button type="button" class="btn btn-secondary btn-sm">검색</button>
                </a>
            </form>
            <form action="#" method="post">
                <button type="button" class="btn btn-secondary btn-lg" id="board--writingBtn">글쓰기</button>
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
<footer class="template--footer">
<aside class="template--leftAside">left</aside>
<section class="template--Section">



<!-- footer 시작 -->
<footer class="common--footerContainer">
    <img src="/images/officialImages/JUSTGO_OFFICIAL_LOGO_BLACK.png" alt="저스트고로고" class="common--footerLogo">
    <div>
        <b><a href="https://www.naver.com">주식회사 저스트고</a></b>
        <i class="fa-solid fa-caret-left" style="color: #D9D9D9;"></i>
        <img src="/images/officialProfile/GITHUBICON.png" alt="깃허브" style="height: 20px; padding-bottom: 2px;">
        <hr>
        서울특별시 중구 남대문로 120 그레이츠 청계(구 대일빌딩) 2F<br>
        사업자등록번호 : 899-89-00001<br>
        <img src="/images/officialProfile/GITHUBICON.png" alt="깃허브" style="height: 20px; padding-bottom: 2px;">
        <i class="fa-solid fa-caret-right" style="color: #D9D9D9;"></i>
        대표: <a href="https://www.naver.com">이상준</a> |
        이사: 
        <a href="https://www.naver.com">박종욱</a>
        <a href="https://www.naver.com">배진현</a>
        <a href="https://www.naver.com">정송이</a>
        <a href="https://www.naver.com">정용화</a>
        <a href="https://www.naver.com">조우형</a>
        <br>
        Copyright © 1998-2023 JustGo All Right Reserved<br>
    </div>
    <div class="common--footerRight">
        <a href="/html/board/boardNotice.html">공지사항</a>
        <a href="/html/board/boardNotice.html">1:1문의</a>
    </div>
    <div class="fixed-bottom" id="common--toTopBtn">
        <a href="https://www.naver.com">
            <button>
                <i class="fa-solid fa-pen-to-square"></i>
            </button>
        </a>
        <a href="https://www.google.com">
            <button>
                <i class="fa-solid fa-arrow-up"></i>
            </button>
        </a>
    </div>
</footer>
<!-- footer 끝 -->


    
</section>
<aside class="template--rightAside">right</aside>
</footer>
<!-- Template-footer 끝 -->
    
    
    
<!-- ----------------------------------------------- -->

    

<!-- bootstrap -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
<!-- js -->
    <script src="/js/template/template.js"></script>
    <script src="/js/common/header.js"></script>
    <script src="/js/common/main.js"></script>
    <script src="/js/common/footer.js"></script>
    <script src="/js/board/board.js"></script>
</body>
</html>