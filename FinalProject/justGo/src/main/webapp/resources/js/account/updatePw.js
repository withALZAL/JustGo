/* 비밀번호 유효성 검사 객체 */
const checkObj ={
    "currentPw": false,
    "newPw": false,
    "newPwConfirm": false,
};

// 새 비밀번호 유효성 검사
const currentPw = document.getElementById("currentPw");
const newPw = document.getElementById("newPw");
const newPwMessage = document.getElementById("newPwMessage");
const newPwConfirm = document.getElementById("newPwConfirm");
const newPwConfirmMessage = document.getElementById("newPwConfirmMessage");
const updatePwBtn = document.getElementById("updatePwBtn");

currentPw.addEventListener("input", () => {
    if(currentPw.value.trim() == ""){
        currentPw.value == ""
        currentPwMessage.classList.add("error");
        currentPwMessage.classList.remove("confirm");
        currentPwMessage.innerText = "현재 비밀번호를 입력해주세요."
        checkObj.currentPw = false;
        return;
    }
    console.log(memberNo);
    const regEx1 = /^[a-zA-Z0-9\!\@\#\$\%]{8,15}$/;
    if (regEx1.test(currentPw.value)) {
        fetch("/dupCheck/password", {
            method: "POST",
            headers: {"Content-Type": "application/json"},
            body: JSON.stringify({
                password: currentPw.value,
                memberNo: memberNo
            })
        })
        .then(resp => resp.text())
        .then(count => {
            if (count != 0) {
                currentPwMessage.innerText = "현재 비밀번호가 일치합니다.";
                currentPwMessage.classList.add("confirm");
                currentPwMessage.classList.remove("error");
                checkObj.currentPw = true;
            } else {
                currentPwMessage.innerText = "현재 비밀번호가 일치하지 않습니다.";
                currentPwMessage.classList.add("error");
                currentPwMessage.classList.remove("confirm");
                checkObj.currentPw = false;
            }
        });
    } else {
        currentPwMessage.innerText = "비밀번호 형식이 유효하지 않습니다.";
        currentPwMessage.classList.add("error");
        currentPwMessage.classList.remove("confirm");
        checkObj.currentPw = false;
    }

    /* GET 방식 */
    // if(regEx1.test(currentPw.value)){ 
    //     fetch("/dupCheck/password?password="+currentPw.value+"&memberNo="+memberNo)
    //     .then(resp => resp.text())
    //     .then(count => {
    //         if(count != 0){ 
    //             currentPwMessage.innerText = "현재 비밀번호가 일치합니다.";
    //             currentPwMessage.classList.add("confirm");
    //             currentPwMessage.classList.remove("error");
    //             checkObj.currentPw = true;

    //         } else {
    //             currentPwMessage.innerText = "현재 비밀번호가 일치하지 않습니다.";
    //             currentPwMessage.classList.add("error");
    //             currentPwMessage.classList.remove("confirm");
    //             checkObj.currentPw = false;
    //         }
    //     })
    //     } else {
    //             currentPwMessage.innerText = "비밀번호 형식이 유효하지 않습니다.";
    //             currentPwMessage.classList.add("error");
    //             currentPwMessage.classList.remove("confirm");
    //             checkObj.currentPw  = false;
    //     }
});



newPw.addEventListener("input", () => {

    if(newPw.value.trim() == ""){
        newPw.value = "";       
        newPwMessage.classList.add("error");
        newPwMessage.classList.remove("confirm");
        newPwMessage.innerText = "새 비밀번호를 입력하세요.";
        return;
    }

    if(currentPw.value == newPw.value) {
        newPwMessage.classList.add("error");
        newPwMessage.classList.remove("confirm");
        newPwMessage.innerText = "현재 비밀번호와 일치합니다.";
        return;
    }

    const regEx2 = /^[a-zA-Z0-9\!\@\#\$\%]{8,15}$/;
    if(regEx2.test(newPw.value)){
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




updatePwBtn.addEventListener("submit", e => {

    // 현재 비밀번호를 입력하지 않을 경우
    if(currentPw.value.trim() == ""){
        alert("현재 비밀번호를 입력해주세요.");
        e.preventDefault();
        currentPw.focus();
        return;
    }

    // 현재 비밀번호가 유효하지 않을 경우
    if(currentPwMessage.classList.contains("error")){
        alert("현재 비밀번호가 유효하지 않습니다.");
        e.preventDefault();
        currentPwMessage.focus();
        return;
    }

    // 새 비밀번호를 입력하지 않을 경우
    if(newPw.value.trim() == ""){
        alert("새 비밀번호를 입력해주세요.");
        e.preventDefault();
        newPw.focus();
        return;
    }

    // 새 비밀번호가 유효하지 않을 경우
    const regEx3 = /^[a-zA-Z0-9\!\@\#\$\%]{8,15}$/;
    if(!regEx3.test(newPw.value)){
        alert("새 비밀번호가 유효하지 않습니다.");
        e.preventDefault();
        newPw.focus();
        return;
    }

    // 현재 비밀번호 = 새 비밀번호 확인
    if(currentPw.value == newPw.value){
        alert("현재 비밀번호와 동일합니다.");
        e.preventDefault();
        newPw.focus();
        return;
    }

    // 비밀번호 == 비밀번호 확인
    if(newPw.value != newPwConfirm.value){
        alert("현재 비밀번호가 일치하지 않습니다.");
        e.preventDefault();
        newPw.focus();
        return;
    }



});



