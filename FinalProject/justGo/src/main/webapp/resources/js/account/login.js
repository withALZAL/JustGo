/* 상준 점검 완료 20230620 */

const loginForm = document.getElementById("loginForm");
const memberEmail = document.querySelector("#loginForm input[name='memberEmail']");
const memberPw = document.querySelector("#loginForm input[name='memberPw']");
const capslockCheck = document.getElementById("capslockCheck");

/* 로그인 체크 */
if (loginForm != null) {
    loginForm.addEventListener("submit", e => {
        
        /* 이메일 체크 */
        if (memberEmail.value.trim().length == 0) {
            e.preventDefault(); /* 제출 방지 */

            const Toast = Swal.mixin({
                toast: true,
                position: 'top-end',
                showConfirmButton: false,
                timer: 3000,
                timerProgressBar: true,
                didOpen: (toast) => {
                    toast.addEventListener('mouseenter', Swal.stopTimer);
                    toast.addEventListener('mouseleave', Swal.resumeTimer);
                },
                didClose: () => {
                    memberEmail.value = "";
                    memberEmail.focus();
                }
            });
            Toast.fire({
                icon: "warning",
                title: "이메일을 입력해주세요."
            });

            return;
        }

        /* 비밀번호 체크 */
        if (memberPw.value.trim().length == 0) {
            e.preventDefault(); /* 제출 방지 */

            const Toast = Swal.mixin({
                toast: true,
                position: 'top-end',
                showConfirmButton: false,
                timer: 3000,
                timerProgressBar: true,
                didOpen: (toast) => {
                    toast.addEventListener('mouseenter', Swal.stopTimer);
                    toast.addEventListener('mouseleave', Swal.resumeTimer);
                },
                didClose: () => {
                    memberPw.value = "";
                    memberPw.focus();
                }
            });

            Toast.fire({
                icon: "warning",
                title: "비밀번호를 입력해주세요."
            });

            return;
        }
    });
}

/* 비밀번호 CapsLock 체크 */
memberPw.addEventListener('keyup', e => {
    if(e.getModifierState('CapsLock')) {
        capslockCheck.textContent = '';
        capslockCheck.textContent = 'CapsLock이 걸려있습니다.';
        capslockCheck.classList.add("error");
    } else {
        capslockCheck.textContent = '';
        capslockCheck.classList.remove("error");
    }
});