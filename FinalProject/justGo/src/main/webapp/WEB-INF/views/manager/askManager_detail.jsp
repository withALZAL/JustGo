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

    <title>JustGo-askManager_detail</title>

<!-- bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/resources/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<!-- fontAwesome -->
    <script src="https://kit.fontawesome.com/ae1a88d4e2.js" crossorigin="anonymous"></script>
<%-- sweetAlert2 --%>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body class="template--body">
<c:set var="memberAskList" value="${map.memberAskList}" />
<c:set var="managerAnswerList" value="${map.managerAnswerList}" />

<%-- ${map.memberAskList}
${map.managerAnswerList} --%>

<%-- ${feedbackNo} --%>



<!-- ----------------------------------------------- -->
<!-- Template-header 시작 -->
<jsp:include page="/WEB-INF/views/manager/managerHeader.jsp"/>
<!-- Template-header 끝 -->
<!-- ----------------------------------------------- -->



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
        <%-- 타이틀 --%>
        <div class="manager--overlayedTitle">
            <a href="#">
                '${memberAskList.memberNickname}' 님의 1:1문의
            </a>
        </div>
        <div class="manager--content">
            <div class="manager--inquiryAnswerBox">
                <div class="manager--inquiryLeft">
                    <div class="manager--inquiryAnswerTitle">
                        Q. ${memberAskList.feedbackTitle}
                    </div>
                    <div><a href="/manager/memberPage/${memberAskList.memberNo}">${memberAskList.memberNickname}</a> | ${memberAskList.feedbackDate}</div>
                    <div class="manager--inquiryText">
                        ${memberAskList.feedbackText}
                    </div>
                </div>
            <c:choose>
                <c:when test="${managerAnswerList.feedback_CF_FL == 'N'}">
                    <div class="manager--answerRight" id="manager--answerWrite">
                        <div class="manager--inquiryAnswerTitle" id="manager--answerTitle">
                            A. 답변 준비중입니다.
                        </div>
                        <div class="manager--managerArea" id="manager--answerManager">담당자 배정중</div>
                        <div class="manager--answerTextBefore" id="manager--answerText">빠른시일 내에 답변드리겠습니다. 잠시만 기다려주세요.</div>
                        <div class="manager--answerBtns" id="manager--aBtns">
                            <a href="/manager/askManager">
                                <button type="button" class="manager--askListBTN">목록</button>
                            </a>
                            <button type="button" class="manager--answerStartBTN" id="manager--answerStartBtn">답변하기</button>
                        </div>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="manager--answerRight" id="manager--answerWrite">
                        <div class="manager--inquiryAnswerTitle" id="manager--answerTitle">
                            A. 문의에 대한 답변드립니다.
                        </div>
                        <div class="manager--managerArea" id="manager--answerManager">
                            ${managerAnswerList.managerNickname} | ${managerAnswerList.feedback_CF_Date}
                        </div>
                        <div class="manager--answerTextBefore" id="manager--answerText">${managerAnswerList.adminText}</div>
                        <div class="manager--answerBtns" id="manager--aBtns">
                            <a href="/manager/askManager">
                                <button type="button" class="manager--askListBTN">목록</button>
                            </a>
                        </div>
                    </div>
                </c:otherwise>
            </c:choose>
            </div>
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
    <script src="/resources/js/manager/askManager_detail.js"></script>
    <script>
        const feedbackNo = ${feedbackNo};
    </script>
</body>
</html>