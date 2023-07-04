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
    <link rel="stylesheet" href="/resources/css/account/myPage.css">

    <title>JustGo-myPage_updatePw</title>

<!-- bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
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
<aside class="template--leftAside"></aside>
<section class="template--Section">



<!-- 페이지 제목 시작 -->
<div class="template--pageTitleContainer">
    <div class="template--pageTitleBox">
        <img src="/resources/images/officialPageTitle/PAGETITLE_WELCOME.png" alt="환영">
        <div class="template--overlayedTitle">마이페이지</div>
    </div>
</div>
<!-- 페이지 제목 끝 -->



<!-- 마이페이지 시작 -->
<div class="account--myPageContainer">
    <div class="account--leftBox">
        <a href="/myPage/info">
            <button type="button" class="btn btn-primary btn-lg">프로필</button>
        </a>
        <a href="/myPage/myWriting">
            <button type="button" class="btn btn-primary btn-lg">작성글 보기</button>
        </a>
        <a href="/myPage/updatePw">
            <button type="button" class="btn btn-primary btn-lg">비밀번호 변경</button>
        </a>
        <a>
            <button type="button" id="deleteAccount" class="btn btn-danger btn-lg" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo">회원탈퇴</button>
        </a>
    </div>
    <div class="account--rightBox">



        <%-- 비밀번호 변경 시작 --%>
        <div class="account--profile">
            <div class="account--subtitle"><i class="fa-solid fa-key"></i>비밀번호 변경</div>
            <form action="updatePw" method="post" id="updateInfo">
                <div class="account--updatePwBox">
                    <table>
                        <tr>
                            <th>현재 비밀번호</th>
                            <td>
                                <input type="password" maxlength="15" placeholder="현재 비밀번호를 입력해주세요." name="currentPw" id="currentPw" autocomplete="off">
                                <div style="height: 0.1px; font-size: 0.2rem;" id="capslockCheck"></div>
                            </td>
                        </tr>
                        <tr>
                            <th>새 비밀번호</th>
                            <td>
                                <input type="password" maxlength="15" placeholder="새 비밀번호를 입력해주세요." name="newPw" id="newPw" autocomplete="off">
                                <div style="height: 0.1px; font-size: 0.2rem;" class="newPw-message" id="newPwMessage"></div>
                            </td>
                        </tr>
                        <tr>
                            <th>새 비밀번호 확인</th>
                            <td>
                                <input type="password" maxlength="15" placeholder="새 비밀번호를 입력해주세요." name="newPwConfirm" id="newPwConfirm" autocomplete="off">
                                <div style="height: 0.1px; font-size: 0.2rem;" class="newPw-message" id="newPwConfirmMessage"></div>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="account--BtnBox">
                    <button type="submit" id="updatePwBtn" class="btn btn-primary btn-lg">수정</button>
                </div>
            </form>
        </div>
        <%-- 비밀번호 변경 끝 --%>
    </div>
</div>
<!-- 마이페이지 끝 -->



<%-- 탈퇴 모달창 시작 --%>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">회원탈퇴</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="/account/delete" method="post">
                <div class="modal-body">
                    <div class="mb-3">
                        <label for="recipient-name" class="col-form-label">현재 비밀번호 입력</label>
                        <input type="password" name="memberPw" class="form-control" id="recipient-password" maxlength="20" placeholder="비밀번호를 입력해주세요." required>
                    </div>
                    <div class="mb-3">
                        <label for="message-text" class="col-form-label">JustGo에 마지막으로 할 말이 있으신가요?</label>
                        <textarea type="text" name="lastWord" class="form-control" id="message-text" style="resize: none;" maxlength="100"
                        placeholder="좋은 제언을 귀담아 듣겠습니다."></textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-danger">탈퇴</button>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                </div>
            </form>
        </div>
    </div>
</div>
<%-- 탈퇴 모달창 끝 --%>



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
    <script src="/resources/js/account/updatePw.js"></script>
<%-- 파일 업로드 --%>
    <script>
        function triggerFileInput() {
            var fileInput = document.getElementById("imageUpload");
            fileInput.click();
        }
    </script>
<%-- memberNo 추출 --%>
    <script>
        let memberNo = ${loginMember.memberNo};
    </script>
</body>
</html>