/* 회원가입 전체 검사 객체 */
const checkObj ={
    "email": false,
    "memberPw": false,
    "memberPwConfirm": false,
    "memberNickname": false,
    "authKey": false
};

// 이메일 유효성 검사
const email = document.getElementById("email");
const emailMessage = document.getElementById("emailMessage"); /* 유효성 검사 메시지 출력 */

// 이메일이 입력될 때마다
email.addEventListener("input", () => {

    // 입력된 이메일이 없을 경우
    if(email.value.trim().length == 0){
        email.value = "";

        emailMessage.innerText = "인증번호를 받을 수 있는 이메일을 입력해주세요.";
        emailMessage.classList.add("error");
        emailMessage.classList.remove("confirm");

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
                emailMessage.innerText = "사용 가능한 이메일 입니다";
                emailMessage.classList.add("confirm");
                emailMessage.classList.remove("error");
                checkObj.memberEmail = true;
            } else {
                emailMessage.innerText = "이미 사용 중인 이메일 입니다";
                emailMessage.classList.add("error");
                emailMessage.classList.remove("confirm");
                checkObj.memberEmail = false;
            }


        }) // 파싱한 데이터를 이용해서 수행할 코드 작성

        .catch(err => console.log(err))



        emailMessage.innerText = "유효한 형식 입니다";
        emailMessage.classList.add("confirm"); // css에 .confirm 스타일 적용
        emailMessage.classList.remove("error"); // .error 스타일 제거

        checkObj.email = true; // 유효할 때

    } else { // 유효하지 않은 경우 (무효인 경우)
        emailMessage.innerText = "이메일 형식이 유효하지 않습니다";
        emailMessage.classList.add("error"); // .error 스타일 적용
        emailMessage.classList.remove("confirm"); // .confirm 스타일 제거

        checkObj.email = false; // 유효 하지 않음
    }
});



// 비밀번호/비밀번호 확인 유효성 검사
const memberPw = document.getElementById("memberPw");
const memberPwConfirm = document.getElementById("memberPwConfirm");
const pwMessage = document.getElementById("pwMessage");

// 비밀번호 입력 시 유효성 검사
memberPw.addEventListener("input", () => {

    // 비밀번호가 입력되지 않은 경우
    if(memberPw.value.trim().length == 0){
        memberPw.value = ""; // 띄어쓰기 못넣게 하기
        
        pwMessage.innerText = "영어,숫자,특수문자(!,@,#,-,_) 8~15글자 사이로 입력해주세요.";
        pwMessage.classList.add("error"); // .error 스타일 적용
        pwMessage.classList.remove("confirm"); // .confirm 스타일 제거

        checkObj.memberPw = false; // 빈칸 == 유효 X
        return;
    }


    // 정규 표현식을 이용한 비밀번호 유효성 검사

    // 영어,숫자,특수문자(!,@,#,-,_) 8~15글자 사이
    const regEx = /^[a-zA-Z0-9\!\@\#\-\_]{6,20}$/;

    // 입력한 비밀번호가 유효한 경우
    if(regEx.test(memberPw.value)){
        checkObj.memberPw = true;


        // 비밀번호가 유효하게 작성된 상태에서
        // 비밀번호 확인이 입력되지 않았을 때
        if(memberPwConfirm.value.trim().length == 0){
        pwMessage.innerText = "유효한 비밀번호 형식입니다";
        pwMessage.classList.add("confirm");
        pwMessage.classList.remove("error");
        
        } else {
            // 비밀번호가 유효하게 작성된 상태에서
            // 비밀번호 확인이 입력되어 있을 때

            // 비밀번호 == 비밀번호 확인 (같을 경우)
            if (memberPw.value == memberPwConfirm.value) {
                pwMessage.innerText = "비밀번호가 일치합니다";
                pwMessage.classList.add("confirm");
                pwMessage.classList.remove("error");
                checkObj.memberPwConfirm = true;

            } else { // 다를 경우
                pwMessage.innerText = "비밀번호가 일치하지 않습니다";
                pwMessage.classList.add("error");
                pwMessage.classList.remove("confirm");
                checkObj.memberPwConfirm = false;
            }

        }

    } else { // 유효하지 않은 경우

        pwMessage.innerText = "비밀번호 형식이 유효하지 않습니다";
        pwMessage.classList.add("error");
        pwMessage.classList.remove("confirm");
        checkObj.memberPw = false;

    }
});

// 비밀번호 확인 유효성 검사
memberPwConfirm.addEventListener('input', ()=>{

    if(checkObj.memberPw){ // 비밀번호가 유효하게 작성된 경우에
    
    // 비밀번호 == 비밀번호 확인 (같을 경우)
    if(memberPw.value == memberPwConfirm.value) {
        pwMessage.innerText = "비밀번호가 일치합니다";
        pwMessage.classList.add("confirm");
        pwMessage.classList.remove("error");
        checkObj.memberPwConfirm = true;

    } else { // 다를 경우
        pwMessage.innerText = "비밀번호가 일치하지 않습니다";
        pwMessage.classList.add("error");
        pwMessage.classList.remove("confirm");
        checkObj.memberPwConfirm = false;
    }

    } else { // 비밀번호가 유효하지 않은 경우
        checkObj.memberPwConfirm = false;
    }
});



// 닉네임 유효성 검사
const memberNickname = document.getElementById("memberNickname");
const nickMessage = document.getElementById('nickMessage');

// 닉네임이 입력이 되었을 때
memberNickname.addEventListener("input", () => {
    
    // 닉네임에 입력이 되지 않은 경우
    if(memberNickname.value.trim() == ''){
        nickMessage.innerText = "한글,영어,숫자로만 2~10글자";

        nickMessage.classList.remove("confirm", "error");
        checkObj.memberNickname = false;
        memberNickname.value = "";
        return;
    }
    
    // 정규표현식으로 유효성 검사
    const regEx = /^[가-힣\w\d]{2,10}$/;

    if(regEx.test(memberNickname.value)){ // 유효
        
        fetch("/dupCheck/nickname?nickname="+memberNickname.value)
        .then(resp => resp.text()) // 응답 객체를 text로 파싱(변환)
        .then(count => {
            if(count == 0){ // 중복이 아닌 경우
                nickMessage.innerText = "사용 가능한 닉네임 입니다.";
                nickMessage.classList.add("confirm");
                nickMessage.classList.remove("error");
                checkObj.memberNickname = true;

            } else { // 중복인 경우
                nickMessage.innerText = "이미 사용중인 닉네임 입니다";
                nickMessage.classList.add("error");
                nickMessage.classList.remove("confirm");
                checkObj.memberNickname = false;
                
            }
        })
        .catch(err => console.log(err));
        
        
        nickMessage.innerText = "유효한 닉네임 형식입니다";
        nickMessage.classList.add("confirm");
        nickMessage.classList.remove("error");
        checkObj.memberNickname = true;



    } else { // 무효
        nickMessage.innerText = "닉네임 형식이 유효하지 않습니다";
        nickMessage.classList.add("error");
        nickMessage.classList.remove("confirm");
        checkObj.memberNickname = false;
    }


});


// ------------------------------ 이메일 인증 -------------------------------------------

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
        memberEmail.focus();
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









// 회원 가입 form태그가 제출 되었을 때
document.getElementById("signUpFrm").addEventListener("submit", e => {

    // checkObj에 모든 value가 true인지 검사
    
    // (배열용 for문)
    // for ... of : 향상된 for문
    //        -> iterator(반복자) 속성을 지닌 배열, 유사 배열 사용 가능

    // (객체용 for문)
    // ** for ... in 구문 ***
    // -> Js 객체가 가지고있는 key를 순서대로 하나씩 꺼내는 반복문

    for(let key in checkObj){ 

        if(!checkObj[key]){ // 각 key에 대한 value(true/false)를 얻어와
                            // false인 경우 == 유효하지 않다!

            switch(key){
                case "email" : 
                alert("이메일이 유효하지 않습니다"); break;

                case "memberPw" : 
                alert("비밀번호가 유효하지 않습니다"); break;

                case "memberPwConfirm" :
                alert("비밀번호가 확인되지 않았습니다"); break;

                case "memberNickname" :
                alert("닉네임이 유효하지 않습니다"); break;
            }

            // 유효하지 않은 input 태그로 focus 이동
            // key를 input의 id와 똑같이 설정
            document.getElementById(key).focus();

            e.preventDefault(); // form 태그 기본 이벤트 제거

            

            return; // 함수 종료

        }
    }
});


