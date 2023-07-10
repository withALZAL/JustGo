<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

<%-- css --%>
    <link rel="stylesheet" href="/resources/css/chatting/chatting.css">

    <title>JustGo-chatting</title>

<!-- bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/resources/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<!-- fontAwesome -->
    <script src="https://kit.fontawesome.com/ae1a88d4e2.js" crossorigin="anonymous"></script>
<%-- sweetAlert2 --%>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
    <section class="chatting--container">
        <div class="chatting--box">
            <section class="chatting--top">
            <%-- 채팅 박스 시작 --%>
                <section class="chatting--chatBox">
                    <div class="chattingTitle">채팅</div>
                    <div class="chattingList">
                    <c:forEach var="i" begin="1" end="10">
                        <div class="yourChattingCard">
                            <div class="chatProfile">
                                <div class="chatProflieImageBox">
                                    <img src="/resources/images/memberImage/1/profile/20230617172703_78762.jpg" alt="프로필 이미지">
                                </div>
                                <span class="nick">닉네임입니다만1</span>
                            </div>
                            <div class="yourChattingContent">
                            채팅 내용
                            </div>
                            <div class="timeLog">15시 30분 30초</div>
                        </div>
                        <div class="myChattingCard">
                            <div class="myChattingContent_temp">
                                <div class="myChattingContent">
                                채팅 내용채팅 내용채팅 내용
                                </div>
                            </div>
                            <div class="timeLog">15시 30분 30초</div>
                        </div>
                    </c:forEach>
                    </div>
                </section>
            <%-- 채팅 박스 끝 --%>
            <%-- 참여자 박스 시작 --%>
                <section class="chatting--memberBox">
                    <div class="memberListTitle">채팅 참여자 목록(000명)</div>
                    <div class="memberList">
                    <c:forEach items="${memberList}" var="member">
                        <div class="memberCard">
                            <div class="memberProflieImageBox">
                                <c:if test="${empty member.profileImg}" >
                                    <img src="/resources/images/officialProfile/COMMONPROFILE.png"  alt="프로필 이미지">
                                </c:if>
                                <c:if test="${!empty member.profileImg}" >
                                    <img src="${member.profileImg}">
                                </c:if>
                            </div>
                            <div class="memberNickname">${member.memberNickname}</div>
                        </div>
                    </c:forEach>
                    </div>
                </section>
            <%-- 참여자 박스 끝 --%>
            </section>
            <%-- 채팅 인풋 박스 시작 --%>
            <section class="chatting--inputBox">
                <div class="inputBox--temp">
                    <textarea class="inputMessage" max="500" id="inputChatting">${paramMap}</textarea>
                    <div class="btnBox">
                        <button  id ="send" class="btn btn-primary btn-sm">전송</button>
                        <button type="button" class="btn btn-primary btn-sm">취소</button>
                    </div>
                </div>
            </section>
            <%-- 채팅 인풋 박스 끝 --%>
        </div>
    </section>

<!-- bootstrap -->
    <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
    <script>
        const chattingRoomNo = "${map.chattingNo}";
        const loginMemberNo = "${loginMember.memberNo}";
        const senderNo = "${map.senderNo}";
        const receiverNo = "${map.receiverNo}";
        const profileImage = "${loginMember.profileImg}";
        const nickName = "${loginMember.memberNickname}";
    </script>

    <script src="/resources/js/chatting/chatting.js"></script>

</body>
</html>