/* 비밀번호 검사 객체 */
const checkObj ={
    "currentPw": false,
    "newPw": false,
    "newPwConfirm": false,
};

const currentPw = document.getElementById("currentPw");
const currentPwMessage = document.getElementById("currentPwMessage");
const newPw = document.getElementById("newPw");
const newPwMessage = document.getElementById("newPwMessage");
const newPwConfirm = document.getElementById("newPwConfirm");
const newPwConfirmMessage = document.getElementById("newPwConfirmMessage");
const updatePwBtn = document.getElementById("updatePwBtn");

/* ----------------------------------------------------------------------- */

/* 현재 비밀번호 CapsLock 체크 */
currentPw.addEventListener('keyup', e => {
    if(e.getModifierState('CapsLock')) {
        currentPwMessage.textContent = '';
        currentPwMessage.textContent = 'CapsLock이 걸려있습니다.';
        currentPwMessage.classList.add("error");
    } else {
        currentPwMessage.textContent = '';
        currentPwMessage.classList.remove("error");
    }
});

/* 현재 비밀번호 일치 여부 체크 */
currentPw.addEventListener('input', () => {
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
            if(count != 0) { // 비밀번호 일치
                checkObj.currentPw = true;
            } else { // 비밀번호 불일치
                checkObj.currentPw = false;
            }
        });
    } else { // 비밀번호 양식 맞지 않음
        checkObj.currentPw = false;
    }

    console.log(checkObj.currentPw);
});