const checkObj ={
    "email": false,
    "authKey": false
};

// 인증번호 발송
const authKey = document.getElementById("authKey");
const checkAuthKeyBtn = document.getElementById("checkAuthKeyBtn");
const email = document.getElementById("email");
const emailMessage = document.getElementById("emailMessage");
const sendAuthKeyBtn = document.getElementById("sendAuthKeyBtn");
const authKeyMessage = document.getElementById("authKeyMessage");
let authTimer;
let authMin = 4;
let authSec = 59;

// 인증번호를 발송한 이메일 저장

email.addEventListener("input", () => {

    // 입력된 이메일이 없을 경우
    if(email.value.trim().length == 0){
        email.value = "";

        emailMessage.innerText = "인증번호를 받을 수 있는 이메일을 입력해주세요.";
        emailMessage.classList.remove("confirm", "error");
        checkObj.email = false;
        return;
    }

    // 정규 표현식을 이용해서 유효현 형식인지 판별
    
    // 1) 정규표현식 객체 생성
    const regEx = /^[A-Za-z\d\-\_]{4,}@[가-힣\w\-\_]+(\.\w+){1,3}$/;

    // 2) 입력 받은 이메일과 정규식 일치 여부 판별
    if(  regEx.test(email.value)  ){ // 유효한 경우

        
        /*************************************************************/
        /* fetch() API를 이용한 ajax(비동기 통신) */
        
        // GET 방식 ajax 요청 (파리미터는 쿼리스트링으로......)
        fetch('/dupCheck/email?email=' + email.value)

        .then(response => response.text()) // 응답객체 -> 파싱(parsing, 데이터 형태 변환)

        .then(count => {
            // count : 중복되면 1, 중복 아니면 0
            if(count == 0){
                emailMessage.innerText = "존재하지 않는 이메일입니다.";
                emailMessage.classList.add("error");
                emailMessage.classList.remove("confirm");
                checkObj.memberEmail = true;
            } else {
                emailMessage.innerText = "존재하는 이메일입니다";
                emailMessage.classList.add("confirm");
                emailMessage.classList.remove("error");
                checkObj.memberEmail = false;
            }


        }) // 파싱한 데이터를 이용해서 수행할 코드 작성

        .catch(err => console.log(err))



        emailMessage.innerText = "유효한 이메일 형식입니다.";
        emailMessage.classList.add("confirm"); // css에 .confirm 스타일 적용
        emailMessage.classList.remove("error"); // .error 스타일 제거

        checkObj.email = true; // 유효할 때

    } else { // 유효하지 않은 경우 (무효인 경우)
        emailMessage.innerText = "이메일 형식이 유효하지 않습니다.";
        emailMessage.classList.add("error"); // .error 스타일 적용
        emailMessage.classList.remove("confirm"); // .confirm 스타일 제거

        checkObj.email = false; // 유효 하지 않음
    }
});



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
                console.log("인증번호 발송에 실패했습니다.")
            }
        })
        .catch(err => {
            console.log("이메일 발송 중 에러가 발생했습니다.");
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
        memberEmail.focus();
    }

});


// 인증 확인

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
                location.href="pwConfirm"
            } else{
                alert("인증번호가 일치하지 않습니다.")
                checkObj.authKey = false;
                return;
            }
        })
        .catch(err => console.log(err));


    } else{
        alert("인증 시간이 만료되었습니다. 다시 시도해주세요.")
    }

});



