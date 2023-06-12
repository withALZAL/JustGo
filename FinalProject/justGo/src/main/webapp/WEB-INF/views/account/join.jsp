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
    <link rel="stylesheet" href="/resources/css/account/account.css">

    <title>JustGo-join</title>

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
<aside class="template--leftAside">left</aside>
<section class="template--Section">



<!-- 페이지 제목 시작 -->
<div class="template--pageTitleContainer">
    <div class="template--pageTitleBox">
        <img src="/resources/images/officialPageTitle/PAGETITLE_WELCOME.png" alt="환영">
        <div class="template--overlayedTitle">회원가입</div>
    </div>
</div>
<!-- 페이지 제목 끝 -->



<!-- 회원가입창 시작 -->
<div class="account--joinContainer">
    <div class="account--joinBox">
        <form action="/account/join" method="post" id="signUpFrm">
            <div class="account--inputProfileBox">
                <a href="https://www.google.com">
                    <img src="/resources/images/officialProfile/COMMONPROFILE.png" alt="프로필 이미지" style="border: 3px solid black;">
                    <!-- <input type="file"> -->
                </a>
            </div>
            <div class="account--inputInfoBox">
                <table>
                    <tr>
                        <th>이메일</th>
                        <td>
                            <input type="email" placeholder="이메일을 입력해주세요.">
                            <div style="height: 0.1px; font-size: 0.2rem; color: green;">사용할 수 있는 이메일입니다.</div>
                        </td>
                        <td><button type="button" class="btn btn-secondary btn-sm" id="sendAuthKeyBtn">인증</button></td>
                    </tr>
                    <span class="signUp-message" id="emailMessage">메일을 받을 수 있는 이메일을 입력해주세요.</span>
                    <tr>
                        <th>인증번호</th>
                        <td>
                            <input type="text" placeholder="이메일로 발송된 인증번호를 입력해주세요." name="authKey" id="authKey">
<!--                             <div style="height: 5px; font-size: 0.2rem; color: green;">인증되었습니다.</div> -->
                            <div style="height: 0.1px; font-size: 0.2rem; color: red;">인증번호가 일치하지 않습니다.</div>
                        </td>
                        <td><button type="button" class="btn btn-secondary btn-sm" id="checkAuthKeyBtn">확인</button></td>
                    </tr>
                    <span class="signUp-message" id="authKeyMessage"></span>
                    <tr>
                        <th>비밀번호</th>
                        <td>
                            <input type="password" maxlength="15" placeholder="비밀번호를 입력해주세요.">
                            <div style="height: 0.1px; font-size: 0.2rem; color: black;">15자 이내의 영문 소/대문자, 숫자, 특수문자(!, @, #, $, %)로 입력해주세요.</div>
<!--                             <div style="height: 5px; font-size: 0.2rem; color: green;">사용할 수 있는 비밀번호입니다.</div>
                            <div style="height: 5px; font-size: 0.2rem; color: red;">사용할 수 없는 비밀번호입니다.</div> -->
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>비밀번호 확인</th>
                        <td>
                            <input type="password" maxlength="15" placeholder="비밀번호를 입력해주세요.">
<!--                             <div style="height: 5px; font-size: 0.2rem; color: green;">비밀번호가 일치합니다.</div> -->
                            <div style="height: 0.1px; font-size: 0.2rem; color: red;">비밀번호가 일치하지 않습니다.</div>
                        </td>
                    </tr>
                    <tr>
                        <th>닉네임</th>
                        <td>
                            <input type="text" maxlength="8" placeholder="닉네임을 입력해주세요.">
                            <div style="height: 0.1px; font-size: 0.2rem; color: black;">8자 이내로 한글, 영문 소/대문자를 입력해주세요.</div>
<!--                             <div style="height: 5px; font-size: 0.2rem; color: green;">사용할 수 있는 닉네임입니다.</div>
                            <div style="height: 5px; font-size: 0.2rem; color: red;">사용할 수 없는 닉네임입니다.</div> -->
                        </td>
                    </tr>
                </table>
                <div class="account--joinBtnBox">
                    <button type="button" class="btn btn-secondary btn-sm" style="background-color: blueviolet;">회원가입</button>
                    <button type="button" class="btn btn-secondary btn-sm">취소</button>
                </div>
            </div>
        </form>
    </div>
</div>
<!-- 회원가입창 끝 -->



</section>
<aside class="template--rightAside">right</aside>
</main>
<!-- Template-main 끝 -->

<script>

const checkObj ={
    "email" : false,
    "memberPw" : false,
    "memberPwConfirm" : false,
    "memberNickname" : false,
    "authKey" : false
};


// 인증번호 발송
const sendAuthKeyBtn = document.getElementById("sendAuthKeyBtn");
const authKeyMessage = document.getElementById("authKeyMessage");
let authTimer;
let authMin = 4;
let authSec = 59;

// 인증번호를 발송한 이메일 저장
let tempEmail;

sendAuthKeyBtn.addEventListener("click", function(){
    authMin = 4;
    authSec = 59;

    checkObj.authKey = false;

    if(checkObj.email){ // 중복이 아닌 이메일인 경우


        /* fetch() API 방식 ajax */
        fetch("/sendEmail/join?email="+email.value)
        .then(resp => resp.text())
        .then(result => {
            if(result > 0){
                console.log("인증 번호가 발송되었습니다.")
                tempEmail = email.value;
            }else{
                console.log("인증번호 발송 실패")
            }
        })
        .catch(err => {
            console.log("이메일 발송 중 에러 발생");
            console.log(err);
        });
        

        alert("인증번호가 발송 되었습니다.");

        
        authKeyMessage.innerText = "05:00";
        authKeyMessage.classList.remove("confirm");

        authTimer = window.setInterval(()=>{

            authKeyMessage.innerText = "0" + authMin + ":" + (authSec<10 ? "0" + authSec : authSec);
            
            // 남은 시간이 0분 0초인 경우
            if(authMin == 0 && authSec == 0){
                checkObj.authKey = false;
                clearInterval(authTimer);
                return;
            }

            // 0초인 경우
            if(authSec == 0){
                authSec = 60;
                authMin--;
            }


            authSec--; // 1초 감소

        }, 1000)

    } else{
        alert("중복되지 않은 이메일을 작성해주세요.");
        email.focus();
    }

});


// 인증 확인
const authKey = document.getElementById("authKey");
const checkAuthKeyBtn = document.getElementById("checkAuthKeyBtn");

checkAuthKeyBtn.addEventListener("click", function(){

    if(authMin > 0 || authSec > 0){ // 시간 제한이 지나지 않은 경우에만 인증번호 검사 진행
        /* fetch API */
        const obj = {"inputKey":authKey.value, "email":tempEmail}
        const query = new URLSearchParams(obj).toString()
        fetch("/sendEmail/checkAuthKey?" + query)
        .then(resp => resp.text())
        .then(result => {
            if(result > 0){
                clearInterval(authTimer);
                authKeyMessage.innerText = "인증되었습니다.";
                authKeyMessage.classList.add("confirm");
                checkObj.authKey = true;

            } else{
                alert("인증번호가 일치하지 않습니다.")
                checkObj.authKey = false;
            }
        })
        .catch(err => console.log(err));


    } else{
        alert("인증 시간이 만료되었습니다. 다시 시도해주세요.")
    }

});

</script>

    
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
    <script src="/resources/js/account/join.js"></script>
</body>
</html>