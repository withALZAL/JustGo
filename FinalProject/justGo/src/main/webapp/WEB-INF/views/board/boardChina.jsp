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
    <link rel="stylesheet" href="/resources/css/board/board.css">

    <title>JustGo-boardChina</title>

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
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<!-- Template-header 끝 -->
<!-- ----------------------------------------------- -->


<!-- Template-main 시작 -->
<main class="template--main">
<aside class="template--leftAside"></aside>
<section class="template--Section">



<!-- 페이지 제목 시작 -->
<div class="template--pageTitleContainer">
    <div class="template--pageTitleBox">
        <img src="/resources/images/officialPageTitle/PAGETITLE_CHINA_FOBBIDDENCITY.png" alt="중국_자금성">
        <div class="template--overlayedTitle" style="color: black;">
            <img src="/resources/images/officialFlag/CHINAFLAG.png" alt="중국국기" style="height: 30px; padding-right: 10px;">
            <a href="https://www.naver.com">
                중국게시판
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
            <div><a href="#">꿀팁</a></div>
            <div><a href="#">맛집</a></div>
            <div><a href="#">힐링</a></div>
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
                    <input type="text" maxlength="10" style="width: 300px;" autocomplete="off">
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
    <script src="/resources/js/board/board.js"></script>
</body>
</html>