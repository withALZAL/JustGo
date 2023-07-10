<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

<%-- css --%>
    <link rel="stylesheet" href="/resources/css/writing/writingView.css">

    <title>JustGo-writingView</title>

<!-- bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/resources/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<!-- fontAwesome -->
    <script src="https://kit.fontawesome.com/ae1a88d4e2.js" crossorigin="anonymous"></script>
<%-- sweetAlert2 --%>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
    <section class="writingView--container">
        <div class="writingView--box">
            <div class="writingView--writer">바른말고운말의 작성글</div>
            <div class="writingView--list">
                <table class="wv-table">
                    <tr class="wv-top">
                        <th class="wv-board">게시판</th>
                        <th class="wv-title">제목</th>
                        <th class="wv-viewCount">조회수</th>
                    </tr>
                    <c:forEach var="item" begin="1" end="10">
                        <tr class="wv">
                            <td class="wv-board">게시판이름</td>
                            <td class="wv-title"><a href="#">제목</a></td>
                            <td class="wv-viewCount">12</td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
            <div class="writingView--pagination">
                <ul class="pagination">
                
                    <!-- 첫 페이지로 이동 -->
                    <li><a href="/board/${boardCode}?cp=1${sp}"><i class="fa-solid fa-forward fa-rotate-180"></i></a></li>

                    <!-- 이전 목록 마지막 번호로 이동 -->
                    <li><a href="/board/${boardCode}?cp=${pagination.prevPage}${sp}"><i class="fa-solid fa-caret-right fa-rotate-180"></i></a></li>

					
                    <!-- 특정 페이지로 이동 -->
                    
                    <c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}" step="1">
                        <c:choose>
                            <c:when test="${i == pagination.currentPage}">
                                <!-- 현재 보고있는 페이지 -->
                                <li><a class="current">${i}</a></li>
                            </c:when>
                        
                            <c:otherwise>
                                <!-- 현재 페이지를 제외한 나머지 -->
                                <li><a href="/board/${boardCode}?cp=${i}${sp}">${i}</a></li>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    
                    <!-- 다음 목록 시작 번호로 이동 -->
                    <li><a href="/board/${boardCode}?cp=${pagination.nextPage}${sp}"><i class="fa-solid fa-caret-right"></i></a></li>

                    <!-- 끝 페이지로 이동 -->
                    <li><a href="/board/${boardCode}?cp=${pagination.maxPage}${sp}"><i class="fa-solid fa-forward"></i></a></li>

                </ul>
            </div>
        </div>
    </section>

<!-- bootstrap -->
    <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</body>
</html>