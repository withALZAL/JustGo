const checkObj ={
    "currentPw": false,
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

const currentPw = document.getElementById("currentPw");
const updateInfo = document.getElementById("updateInfo");

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
