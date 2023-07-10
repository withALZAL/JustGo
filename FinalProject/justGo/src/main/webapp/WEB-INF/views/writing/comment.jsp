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
    <link rel="stylesheet" href="/resources/css/writing/post.css"> <%-- comment.jsp는 post.css 같이 사용 --%>

    <title>JustGo-comment</title>

<%-- 댓글 버튼 꾸미기 --%>
    <style>
        .commentBtn {
            color: white;
            background-color: #0D6EFD;
            border: none;
            border-radius: 3px;
        }
        .comment--delete {
            background-color: #DC3545;
        }
    </style>

<!-- bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<!-- fontAwesome -->
    <script src="https://kit.fontawesome.com/ae1a88d4e2.js" crossorigin="anonymous"></script>
<%-- sweetAlert2 --%>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body class="template--body">



<!-- ----------------------------------------------- -->



<!-- 댓글 시작 -->
<div class="writing--commentContainer">
<div class="writing--commentBox">
    
    <table class="writing--commentTable" >
        <tbody id="replyList">
            <c:forEach items="${board.replyList}" var="reply">
            <tr id="re" class="reply-row <c:if test='${reply.parentReplyNo!=0}'>child-reply
            </c:if>">
                <th class="writing--commentProfileBox">
                    <c:if test="${reply.parentReplyNo!=0}" >
                    <span class="writing--commentProfileBox__reply"><i class="fa-solid fa-reply fa-rotate-180"></i></span>
                    </c:if>
                    <span class="writing--commentProfileBox__profileImage">
                        <c:if test="${empty reply.profileImage}" >
                            <img src="/resources/images/officialProfile/COMMONPROFILE.png"  alt="프로필 이미지">
                        </c:if>
                        <c:if test="${!empty reply.profileImage}" >
                            <img src="${reply.profileImage}">
                        </c:if>
                    </span>
                    <span class="writing--commentProfileBox__profileName">${reply.memberNickname}</span>

                    <%-- <div class="replyDropdown" style="display: none;">
                        <a href="#">
                            ${reply.memberNickname}의 작성글 보기
                        </a>
                    </div> --%>

                </th>
                <td class="writing--commentContentBox">${reply.replyContent}</td>
                <c:if test="${reply.updateDate == null}" >
                <td class="writing--commentDateBox">${reply.replyDate}</td>
                </c:if>
                <c:if test="${reply.updateDate != null}" >
                <td class="writing--commentDateBox">${reply.updateDate}에 수정</td>
                </c:if>

                <td class="writing--commentBtnBox">
                    <%-- <form action="#" method="get">
                        <a href="#"> --%>
                            <c:if test="${not empty loginMember}" >
                            <button onclick="showInsertComment(${reply.replyNo},this)" class="btn btn-primary btn-sm">답글</button>
                            </c:if>
                            <c:if test="${loginMember.memberNo == reply.memberNo}">
                            <button onclick="showUpdateComment(${reply.replyNo},this)"  class="btn btn-primary btn-sm">수정</button>
                            </c:if>
                            <c:if test="${loginMember.memberNo == reply.memberNo || loginMember.memberRole==1}" >
                            <button onclick="deleteComment(${reply.replyNo},this)" class="btn btn-danger btn-sm">삭제</button>
                            <button onclick="showUpdateComment(${reply.replyNo},this)"  class="btn btn-primary btn-sm" style="display:none;">수정</button>
                            </c:if>
                        <%-- </a>
                    </form> --%>
                </td>
            </tr>
            </c:forEach>
        </tbody>
        

        <%-- <tr>
            <th class="writing--commentProfileBox">
                <span class="writing--commentProfileBox__reply"><i class="fa-solid fa-reply fa-rotate-180"></i></span>
                <span class="writing--commentProfileBox__profileImage"><img src="/resources/images/officialProfile/GITHUBICON.png" alt="프로필 이미지"></span>
                <span class="writing--commnetProfileBox__profileName">GITCATic</span>
            </th>
            <td class="writing--commentContentBox">
                내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용입니다. 띄어쓰기도 되고 모두 됩니다. 띄어쓰기도 되고 모두 됩니다.정말 되나요? 되네요! 띄어쓰기가 됩ㄴ디ㅏ~~~~~~~우러ㅜㅇ냄러ㅜㅇ내ㅑㅁㄹㅇ
            </td>
            <td class="writing--commentDateBox">
                2023년 3월 3일
            </td>
            <td class="writing--commentBtnBox">
                <form action="#" method="get">
                    <a href="#">
                        <button type="button" class="btn btn-secondary btn-sm">수정</button>
                        <button type="button" class="btn btn-secondary btn-sm">삭제</button>
                    </a>
                </form>
            </td>
        </tr> --%>

        
    </table>
</div>
    <%-- <form action="#" post="get"> --%>
        <div class="writing--commentInput">
            <div style="font-weight: bold;">댓글 달기</div>
            <textarea id="replyContent"></textarea>
            <button  class="btn btn-primary btn-sm" id="addReply">등록</button>
        </div>
    <%-- </form> --%>
</div>
<!-- 댓글 끝 -->



<!-- ----------------------------------------------- -->



<!-- bootstrap -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
<!-- js -->
    <script src="/resources/js/template/template.js"></script>
    <script src="/resources/js/common/header.js"></script>
    <script src="/resources/js/common/main.js"></script>
    <script src="/resources/js/writing/comment.js"></script>
    <script src="/resources/js/common/footer.js"></script>
</body>
</html>