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

    <title>JustGo-myPage_profile</title>

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



    <%-- 프로필 시작 --%>
    <div class="account--profile">
        <div class="account--subtitle"><i class="fa-solid fa-user"></i>프로필</div>
        <div class="account--myPageBox">
            <form action="/myPage/updateProfileImage" method="post" encType="multipart/form-data">
                <div class="account--profileImageContainer">
                    <div class="account--profileImageBox">
                        <div id="previewImageBox" onclick="triggerFileInput()">
                            <c:if test="${!empty sessionScope.loginMember.profileImg}">
                                <img src="${sessionScope.loginMember.profileImg}" alt="프로필 이미지">
                            </c:if>
                            <c:if test="${empty sessionScope.loginMember.profileImg}">
                                <img src="/resources/images/officialProfile/COMMONPROFILEPLUS.png" alt="기본 프로필 이미지">
                            </c:if>
                        </div>
                    </div>
                    <div class="account--profileUpdateBtn">
                        <input type="file" name="profileImage" id="uploadImage" accept="image/*" style="display: none;">
                        <button type="submit" id="updateImageBtn" class="btn btn-primary btn-sm" style="display: none;">이미지 변경</button>
                        <button type="button" id="deleteImageBtn" class="btn btn-danger btn-sm" style="display: none;" onclick="cancelImage()">변경 취소</button>
                    </div>
                </div>
            </form>
            <div class="account--profileInfoBox">
                <table>
                    <tr>
                        <th>닉네임</th>
                        <td class="myPage--updateNickname">
                            <form action="/myPage/updateNickname" method="post">
                                <span>
                                    <input type="text" id="memberNickname" name="memberNickname" value="${loginMember.memberNickname}" maxlength="8" autocomplete="off">
                                </span>
                                <button type="submit" class="btn btn-primary btn-sm">수정</button>
                                <button type="button" id="nickCancel" class="btn btn-secondary btn-sm">취소</button>
                            </form>
                            <div style="height: 0.1px; font-size: 0.2rem;" class="signUp-message" id="nickMessage"></div>
                        </td>
                    </tr>
                    <tr>
                        <th>이메일</th>
                        <td>${loginMember.memberEmail}</td>
                    </tr>
                    <tr>
                        <th>가입일</th>
                        <td>${loginMember.enrollDate}</td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    <%-- 프로필 끝 --%>


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
    <script src="/resources/js/account/updateProfileImage.js"></script> <%-- 프로필 이미지 변경 --%>
    <script src="/resources/js/account/updateNickname.js"></script> <%-- 닉네임 변경 --%>
<%-- 이미지 수정 취소 함수 --%>
    <script>
        var profileImageSrc = "${!empty sessionScope.loginMember.profileImg ? sessionScope.loginMember.profileImg : '/resources/images/officialProfile/COMMONPROFILEPLUS.png'}";
    </script>
<%-- 취소 버튼 클릭 시 memberNickname 복귀 --%>
    <script>
        nickCancel.addEventListener("click", () => {
            memberNickname.value = "${loginMember.memberNickname}";
        });
    </script>
</body>
</html>