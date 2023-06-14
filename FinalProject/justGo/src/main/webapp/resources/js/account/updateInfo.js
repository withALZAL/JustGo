// 내 정보(수정) 페이지

const memberNickname = document.getElementById("memberNickname");
const updateInfo = document.getElementById("updateInfo");
const currentPw = document.getElementById("currentPw");
const newPw = document.getElementById("newPw");
const newPwConfirm = document.getElementById("newPwConfirm");

if(updateInfo != null){

    initNickname = memberNickname.ariaValueMax;

    // 닉네임 유효성 검사
    memberNickname.addEventListener("input", () => {

        // 변경 전 닉네임과 입력 값이 같을 경우
        if(memberNickname.value == initNickname){
            memberNickname.removeAttribute("style");
            return;
        } 

        // 정규 표현식으로 유효성 검사
        const regEx = /^[가-힣\w\d]{2,10}$/;

    if(regEx.test(memberNickname.value)){ // 유효
        memberNickname.style.color = "green";

        } else { // 무효
        memberNickname.style.color = "red";
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

}