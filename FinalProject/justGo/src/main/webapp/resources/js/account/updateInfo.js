// 내 정보(수정) 페이지

const checkObj ={
    "currentPw": false,
    "newPw": false,
    "newPwConfirm": false,
    "memberNickname": false
};


const memberNickname = document.getElementById("memberNickname");
const updateInfo = document.getElementById("updateInfo");
const nickMessage = document.getElementById("nickMessage");
const newPwMessage = document.getElementById("newPwMessage");

if(updateInfo != null){

    // 닉네임 유효성 검사
    memberNickname.addEventListener("input", () => {

    
        if(memberNickname.value.trim() == ''){       
            nickMessage.innerText = "닉네임을 입력하세요";
            checkObj.memberNickname = false;
            memberNickname.value = "";
            return;
        } 

        
        const regEx = /^[가-힣\w\d]{2,10}$/;

    if(regEx.test(memberNickname.value)){ 

        fetch("/dupCheck/nickname?nickname="+memberNickname.value)
        .then(resp => resp.text()) 
        .then(count => {
            if(count == 0){ 

        nickMessage.innerText = "사용 가능한 닉네임입니다.";
        checkObj.memberNickname = true;

        } else { // 무효
            nickMessage.innerText = "이미 사용 중인 닉네임입니다.";
            checkObj.memberNickname = false;
        }
    
    })
    nickMessage.innerText = "유효한 닉네임 형식입니다.";
    checkObj.memberNickname = true;

} else {
    nickMessage.innerText = "닉네임 형식이 유효하지 않습니다.";
    checkObj.memberNickname = false;
}
});

newPw.addEventListener("input", () => {
    if(newPw.value.trim().length == ''){
        newPw.value = ""; 
        newPwMessage.innerText = "영문, 숫자, 특수문자(!,@,#,-,_)로 구성된 8~15글자 사이의 비밀번호를 입력해주세요.";
        checkObj.newPw = false; 
        return;
    }

    const regEx = /^[a-zA-Z0-9\!\@\#\-\_]{6,20}$/;
    if(regEx.test(newPw.value)){
        checkObj.newPw = true;

        if(newPwConfirm.value.trim().length == 0){
            newPwMessage.innerText = "유효한 비밀번호 형식입니다.";

        } else {
            if (newPw.value == newPwConfirm.value) {
                newPwConfirmMessage.innerText = "비밀번호가 일치합니다.";
                checkObj.newPwConfirm = true;

            } else { 
                newPwConfirmMessage.innerText = "비밀번호가 일치하지 않습니다.";
                checkObj.newPwConfirm = false;
            }

        }

    } else { 

        newPwMessage.innerText = "비밀번호 형식이 유효하지 않습니다.";
        checkObj.newPw = false;

    }
});

// 비밀번호 확인 유효성 검사
newPwConfirm.addEventListener('input', ()=>{

    if(checkObj.newPw){ 

    if(newPw.value == newPwConfirm.value) {
        newPwConfirmMessage.innerText = "비밀번호가 일치합니다.";
        checkObj.newPwConfirm = true;

    } else { 
        newPwConfirmMessage.innerText = "비밀번호가 일치하지 않습니다.";
        checkObj.newPwConfirm = false;
    }

    } else { 
        checkObj.newPwConfirm = false;
    }
});


   // form태그 제출 시 유효하지 않은 값이 있으면 제출 X
    updateInfo.addEventListener("submit", e => {

    // 닉네임이 유효하지 않을 경우
    if(memberNickname.style.color == "red"){
        alert("닉네임이 유효하지 않습니다.");
        memberNickname.focus();
        e.preventDefault(); // 기본 이벤트 제거
        return;
    }

    if(currentPw.value.trim() == ""){
        alert("현재 비밀번호를 입력해주세요");
        e.preventDefault();
        currentPw.focus();
        return;
}


const currentPw = document.getElementById("currentPw");
const newPw = document.getElementById("newPw");
const newPwConfirm = document.getElementById("newPwConfirm");

newPw.addEventListener("input", () => {
    if(newPw.value.trim().length == ''){
        newPw.value = ""; 
        newPwMessage.innerText = "영문, 숫자, 특수문자(!,@,#,-,_)로 구성된 8~15글자 사이의 비밀번호를 입력해주세요.";
        checkObj.newPw = false; 
        return;
    }

    const regEx = /^[a-zA-Z0-9\!\@\#\-\_]{6,20}$/;
    if(regEx.test(newPw.value)){
        checkObj.newPw = true;

        if(newPwConfirm.value.trim().length == 0){
            newPwMessage.innerText = "유효한 비밀번호 형식입니다.";

        } else {
            if (newPw.value == newPwConfirm.value) {
                newPwConfirmMessage.innerText = "비밀번호가 일치합니다.";
                checkObj.newPwConfirm = true;

            } else { 
                newPwConfirmMessage.innerText = "비밀번호가 일치하지 않습니다.";
                checkObj.newPwConfirm = false;
            }

        }

    } else { 

        newPwMessage.innerText = "비밀번호 형식이 유효하지 않습니다.";
        newPwMessage.classList.add("error");
        newPwMessage.classList.remove("confirm");
        checkObj.newPw = false;

    }
});

// 비밀번호 확인 유효성 검사
newPwConfirm.addEventListener('input', ()=>{

    if(checkObj.newPw){ 

    if(newPw.value == newPwConfirm.value) {
        newPwConfirmMessage.innerText = "비밀번호가 일치합니다.";
        checkObj.newPwConfirm = true;

    } else { 
        newPwConfirmMessage.innerText = "비밀번호가 일치하지 않습니다.";
        checkObj.newPwConfirm = false;
    }

    } else { 
        checkObj.newPwConfirm = false;
    }
});

updateInfo.addEventListener("submit", e => {
// 비밀번호 유효성 검사
const regEx = /^[a-zA-Z0-9\!\@\#\-\_]{6,20}$/;
if(!regEx.test(newPw.value)){
    alert("비밀번호가 유효하지 않습니다");
    e.preventDefault();
    newPw.focus();
    return;
}

// 비밀번호 == 비밀번호 확인
if(newPw.value != newPwConfirm.value){
    alert("비밀번호가 일치하지 않습니다");
    e.preventDefault();
    newPw.focus();
    return;
}

});

})
}
