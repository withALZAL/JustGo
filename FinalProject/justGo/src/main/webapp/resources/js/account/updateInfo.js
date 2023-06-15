const checkObj ={
    "currentPw": false,
    "newPw": false,
    "newPwConfirm": false,
    "memberNickname": false
};


const memberNickname = document.getElementById("memberNickname");
const nickMessage = document.getElementById("nickMessage");

    // 닉네임 유효성 검사
    memberNickname.addEventListener("input", () => {

    
        if(memberNickname.value.trim() == ''){
            memberNickname.value = "";       
            nickMessage.classList.add("error");
            nickMessage.classList.remove("confirm");
            nickMessage.innerText = "닉네임을 입력하세요";
            checkObj.memberNickname = false;
            
            return;
        } 

        
        const regEx = /^[가-힣\w\d]{2,10}$/;

    if(regEx.test(memberNickname.value)){ 

        fetch("/dupCheck/nickname?nickname="+memberNickname.value)
        .then(resp => resp.text()) 
        .then(count => {
            if(count == 0){ 

        nickMessage.innerText = "사용 가능한 닉네임입니다.";
        nickMessage.classList.add("confirm");
        nickMessage.classList.remove("error");
        checkObj.memberNickname = true;

        } else { // 무효
            nickMessage.innerText = "이미 사용 중인 닉네임입니다.";
            nickMessage.classList.add("error");
            nickMessage.classList.remove("confirm");
            checkObj.memberNickname = false;
        }
    
    })

    nickMessage.innerText = "유효한 닉네임 형식입니다.";
    nickMessage.classList.add("confirm");
    nickMessage.classList.remove("error");
    checkObj.memberNickname = true;

} else {
    nickMessage.innerText = "닉네임 형식이 유효하지 않습니다.";
    nickMessage.classList.add("error");
    nickMessage.classList.remove("confirm");
    checkObj.memberNickname = false;
}
});


// 새 비밀번호 유효성 검사
const newPw = document.getElementById("newPw");
const newPwMessage = document.getElementById("newPwMessage");
const newPwConfirm = document.getElementById("newPwConfirm");
const newPwConfirmMessage = document.getElementById("newPwConfirmMessage");


newPw.addEventListener("input", () => {

    if(newPw.value.trim().length == 0){
        newPw.value = "";
        newPwMessage.innerText = "영문, 숫자, 특수문자(!,@,#,-,_)로 구성된 8~15글자 사이의 비밀번호를 입력해주세요.";
        newPwMessage.classList.remove("confirm", "error"); 
        checkObj.newPw = false;
        return;
    }

    const regEx = /^[a-zA-Z0-9\!\@\#\-\_]{8,15}$/;
    if(regEx.test(newPw.value)){
        checkObj.newPw = true;
            newPwMessage.innerText = "유효한 비밀번호 형식입니다.";
            newPwMessage.classList.add("confirm");
            newPwMessage.classList.remove("error");
            checkObj.newPw = true;
        } else {
            newPwMessage.innerText = "비밀번호 형식이 유효하지 않습니다.";
            newPwMessage.classList.add("error");
            newPwMessage.classList.remove("confirm");
            checkObj.newPw = false;

        }
    

});




// 비밀번호 확인 유효성 검사
newPwConfirm.addEventListener("input", () => {

    if(checkObj.newPw){ 

    if(newPw.value == newPwConfirm.value) {
        newPwConfirmMessage.innerText = "비밀번호가 일치합니다.";
        newPwConfirmMessage.classList.add("confirm");
        newPwConfirmMessage.classList.remove("error");
        checkObj.newPwConfirm = true;
        
    } else { 
        newPwConfirmMessage.innerText = "비밀번호가 일치하지 않습니다.";
        newPwConfirmMessage.classList.add("error");
        newPwConfirmMessage.classList.remove("confirm");
        checkObj.newPwConfirm = false;
    }
    } else { 
        newPwConfirmMessage.innerText = "비밀번호가 유효하지 않습니다.";
        newPwConfirmMessage.classList.add("error");
        newPwConfirmMessage.classList.remove("confirm");
        checkObj.newPwConfirm = false;
    }
});



const currentPw = document.getElementById("currentPw");
const updateInfo = document.getElementById("updateInfo");

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



