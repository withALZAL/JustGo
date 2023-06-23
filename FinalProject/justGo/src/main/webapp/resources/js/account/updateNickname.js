const checkObj ={
    "memberNickname": false
};

const memberNickname = document.getElementById("memberNickname");
const nickMessage = document.getElementById("nickMessage");
const updateNickBtn = document.getElementById("updateNickBtn");
const nickCancel = document.getElementById("nickCancel");
const updateForm = document.getElementById("updateForm");


// 닉네임 유효성 검사
memberNickname.addEventListener("input", () => {

    if(memberNickname.value.trim() == ""){
        memberNickname.value = "";       
        nickMessage.classList.add("error");
        nickMessage.classList.remove("confirm");
        nickMessage.innerText = "닉네임을 입력하세요.";
        checkObj.memberNickname = false;
        return;
    } 

    const regEx2 = /^[가-힣\w\d]{2,8}$/;
    if(regEx2.test(memberNickname.value)){ 

                    console.log(memberNickname.value); /* 오키 */
                    console.log(regEx2.test(memberNickname.value)); /* 오키 */

        fetch("/dupCheck/nickname?nickname="+memberNickname.value)

        .then(resp => resp.text()) 
        .then(count => {

                    console.log(count); /* 오키 */

            if(count == 0){ 
                nickMessage.innerText = "사용 가능한 닉네임입니다.";
                nickMessage.classList.add("confirm");
                nickMessage.classList.remove("error");
                checkObj.memberNickname = true;
            } else {
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






updateNickBtn.addEventListener("click", e => {

    // 닉네임을 입력하지 않았을 경우
    if(memberNickname.value.trim() == ""){
        // alert("변경할 닉네임을 입력해 주세요");
        const Toast = Swal.mixin({
            toast: true,
            position: 'top-end',
            showConfirmButton: false,
            timer: 3000,
            timerProgressBar: true,
            showCloseButton: true,
            didOpen: (toast) => {
                toast.addEventListener('mouseenter', Swal.stopTimer);
                toast.addEventListener('mouseleave', Swal.resumeTimer);
            },
            didClose: () => {
                memberEmail.focus();
            }
        });
        Toast.fire({
            icon: "warning",
            title: "변경할 닉네임을 입력해 주세요."
        });

        memberNickname.focus();
        e.preventDefault();
        return;
    }

    // 닉네임이 유효하지 않을 경우
    if(nickMessage.classList.contains("error")){
        // alert("닉네임이 유효하지 않습니다.");
        const Toast = Swal.mixin({
            toast: true,
            position: 'top-end',
            showConfirmButton: false,
            timer: 3000,
            timerProgressBar: true,
            showCloseButton: true,
            didOpen: (toast) => {
                toast.addEventListener('mouseenter', Swal.stopTimer);
                toast.addEventListener('mouseleave', Swal.resumeTimer);
            },
            didClose: () => {
                memberEmail.focus();
            }
        });
        Toast.fire({
            icon: "warning",
            title: "닉네임이 유효하지 않습니다."
        });

        nickMessage.focus();
        e.preventDefault();
        return;
    }
});


